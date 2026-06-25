import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../api/api_client.dart';

const proExportProductId = 'fury_note_pro_export';

class PurchaseReceipt {
  const PurchaseReceipt({required this.platform, required this.receiptData});

  final String platform;
  final String receiptData;
}

abstract interface class PurchaseApiClient {
  Future<Object?> get(String path);

  Future<Object?> post(String path, Map<String, dynamic> body);
}

class ApiPurchaseApiClient implements PurchaseApiClient {
  const ApiPurchaseApiClient({this.apiClient});

  final ApiClient? apiClient;

  ApiClient get _client => apiClient ?? ApiClient.instance;

  @override
  Future<Object?> get(String path) => _client.get(path);

  @override
  Future<Object?> post(String path, Map<String, dynamic> body) {
    return _client.post(path, body);
  }
}

class BackendPurchaseVerifier {
  const BackendPurchaseVerifier({this.client = const ApiPurchaseApiClient()});

  final PurchaseApiClient client;

  Future<bool> status() async {
    final data = await client.get('/v1/purchase/status');
    final map = Map<String, dynamic>.from(data as Map);
    return map['is_pro'] == true;
  }

  Future<bool> verify(PurchaseReceipt receipt) async {
    final data = await client.post('/v1/purchase/verify', {
      'platform': receipt.platform,
      'receipt_data': receipt.receiptData,
    });
    final map = Map<String, dynamic>.from(data as Map);
    return map['pro_activated'] == true;
  }
}

class ProExportPurchaseController extends ChangeNotifier {
  ProExportPurchaseController({
    InAppPurchase? inAppPurchase,
    BackendPurchaseVerifier? verifier,
    this.productId = proExportProductId,
    this.isDebugMode = kDebugMode,
  }) : _inAppPurchase = inAppPurchase ?? InAppPurchase.instance,
       _verifier = verifier ?? const BackendPurchaseVerifier();

  final InAppPurchase _inAppPurchase;
  final BackendPurchaseVerifier _verifier;
  final String productId;
  final bool isDebugMode;

  StreamSubscription<List<PurchaseDetails>>? _subscription;
  ProductDetails? _product;
  bool _initialized = false;
  bool _loading = false;
  bool _purchasing = false;
  bool _storeAvailable = false;
  bool _isPro = false;
  String? _errorMessage;

  bool get loading => _loading;
  bool get purchasing => _purchasing;
  bool get storeAvailable => _storeAvailable;
  bool get isPro => _isPro || isDebugMode;
  bool get canExport => isPro;
  String? get errorMessage => _errorMessage;
  ProductDetails? get product => _product;
  String get displayPrice =>
      isDebugMode ? 'DEBUG' : _product?.price ?? '₩2,900';

  Future<void> initialize() async {
    if (_initialized) return;
    _initialized = true;
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    if (isDebugMode) {
      _isPro = true;
      _storeAvailable = true;
      _loading = false;
      notifyListeners();
      return;
    }

    _subscription = _inAppPurchase.purchaseStream.listen(
      _handlePurchaseUpdates,
      onError: (Object error) {
        _purchasing = false;
        _errorMessage = '결제 업데이트를 처리하지 못했어요.';
        notifyListeners();
      },
    );

    try {
      _isPro = await _verifier.status();
    } catch (_) {
      _errorMessage = '구매 상태를 확인하지 못했어요.';
    }

    try {
      _storeAvailable = await _inAppPurchase.isAvailable();
      if (_storeAvailable) {
        final response = await _inAppPurchase.queryProductDetails({productId});
        if (response.productDetails.isNotEmpty) {
          _product = response.productDetails.first;
        } else if (response.notFoundIDs.contains(productId)) {
          _errorMessage = '스토어 상품을 찾지 못했어요.';
        } else if (response.error != null) {
          _errorMessage = response.error!.message;
        }
      } else {
        _errorMessage = '스토어에 연결할 수 없어요.';
      }
    } catch (_) {
      _errorMessage = '스토어 상품 정보를 불러오지 못했어요.';
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> buy() async {
    if (isDebugMode) {
      _isPro = true;
      notifyListeners();
      return;
    }

    final product = _product;
    if (product == null) {
      _errorMessage = '구매할 상품 정보가 아직 없어요.';
      notifyListeners();
      return;
    }

    _purchasing = true;
    _errorMessage = null;
    notifyListeners();

    final purchaseParam = PurchaseParam(productDetails: product);
    final started = await _inAppPurchase.buyNonConsumable(
      purchaseParam: purchaseParam,
    );
    if (!started) {
      _purchasing = false;
      _errorMessage = '결제를 시작하지 못했어요.';
      notifyListeners();
    }
  }

  Future<void> restore() async {
    if (isDebugMode) {
      _isPro = true;
      notifyListeners();
      return;
    }

    _purchasing = true;
    _errorMessage = null;
    notifyListeners();
    await _inAppPurchase.restorePurchases();
  }

  Future<void> _handlePurchaseUpdates(
    List<PurchaseDetails> purchaseDetailsList,
  ) async {
    for (final purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.productID != productId) continue;

      if (purchaseDetails.status == PurchaseStatus.pending) {
        _purchasing = true;
        notifyListeners();
        continue;
      }

      if (purchaseDetails.status == PurchaseStatus.error) {
        _purchasing = false;
        _errorMessage = purchaseDetails.error?.message ?? '결제가 취소되었어요.';
      } else if (purchaseDetails.status == PurchaseStatus.purchased ||
          purchaseDetails.status == PurchaseStatus.restored) {
        await _verifyAndActivate(purchaseDetails);
      } else if (purchaseDetails.status == PurchaseStatus.canceled) {
        _purchasing = false;
      }

      if (purchaseDetails.pendingCompletePurchase) {
        await _inAppPurchase.completePurchase(purchaseDetails);
      }
      notifyListeners();
    }
  }

  Future<void> _verifyAndActivate(PurchaseDetails purchaseDetails) async {
    try {
      final verified = await _verifier.verify(
        PurchaseReceipt(
          platform: _storePlatform(),
          receiptData: purchaseDetails.verificationData.serverVerificationData,
        ),
      );
      _isPro = verified;
      _purchasing = false;
      if (!verified) {
        _errorMessage = '구매 영수증을 확인하지 못했어요.';
      }
    } catch (_) {
      _purchasing = false;
      _errorMessage = '구매 영수증 검증에 실패했어요.';
    }
  }

  String _storePlatform() {
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS || TargetPlatform.macOS => 'ios',
      _ => 'android',
    };
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:fury_note/src/purchase/pro_export_purchase_service.dart';

void main() {
  test('backend verifier checks status and verifies receipts', () async {
    final client = _FakePurchaseApiClient();
    final verifier = BackendPurchaseVerifier(client: client);

    client.nextGetResponse = {'is_pro': true};
    final isPro = await verifier.status();

    client.nextPostResponse = {'pro_activated': true};
    final verified = await verifier.verify(
      const PurchaseReceipt(platform: 'android', receiptData: 'receipt-token'),
    );

    expect(isPro, isTrue);
    expect(verified, isTrue);
    expect(client.getPaths, ['/v1/purchase/status']);
    expect(client.postCalls.single.path, '/v1/purchase/verify');
    expect(client.postCalls.single.body, {
      'platform': 'android',
      'receipt_data': 'receipt-token',
    });
  });
}

class _FakePurchaseApiClient implements PurchaseApiClient {
  Object? nextGetResponse;
  Object? nextPostResponse;
  final getPaths = <String>[];
  final postCalls = <_PostCall>[];

  @override
  Future<Object?> get(String path) async {
    getPaths.add(path);
    return nextGetResponse;
  }

  @override
  Future<Object?> post(String path, Map<String, dynamic> body) async {
    postCalls.add(_PostCall(path, body));
    return nextPostResponse;
  }
}

class _PostCall {
  const _PostCall(this.path, this.body);

  final String path;
  final Map<String, dynamic> body;
}

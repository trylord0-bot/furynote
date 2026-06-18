import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:fury_note/src/notifications/push_notification_service.dart';

void main() {
  late FakePushGateway gateway;
  late FakePushDeviceRegistrar registrar;
  late FakeForegroundNotificationPresenter presenter;
  late PushNotificationService service;

  setUp(() {
    gateway = FakePushGateway();
    registrar = FakePushDeviceRegistrar();
    presenter = FakeForegroundNotificationPresenter();
    service = PushNotificationService(
      gateway: gateway,
      registrar: registrar,
      foregroundPresenter: presenter,
    );
  });

  tearDown(() async {
    await gateway.dispose();
    service.dispose();
  });

  test(
    'initializes Firebase messaging and registers the current FCM token',
    () async {
      gateway.token = 'token-a';

      await service.initialize();

      expect(gateway.permissionRequested, isTrue);
      expect(gateway.foregroundPresentationConfigured, isTrue);
      expect(registrar.registeredTokens, ['token-a']);
    },
  );

  test('updates the backend when Firebase rotates the FCM token', () async {
    await service.initialize();

    gateway.emitToken('token-b');
    await pumpEventQueue();

    expect(registrar.updatedTokens, ['token-b']);
  });

  test('shows a local notification for foreground push messages', () async {
    await service.initialize();

    gateway.emitMessage(
      const PushMessage(
        title: '새 댓글',
        body: '누군가 댓글을 남겼어요',
        data: {'type': 'comment'},
      ),
    );
    await pumpEventQueue();

    expect(presenter.presentedMessages, [
      const PushMessage(
        title: '새 댓글',
        body: '누군가 댓글을 남겼어요',
        data: {'type': 'comment'},
      ),
    ]);
  });
}

class FakePushGateway implements PushGateway {
  final StreamController<String> _tokenController =
      StreamController<String>.broadcast();
  final StreamController<PushMessage> _messageController =
      StreamController<PushMessage>.broadcast();

  bool permissionRequested = false;
  bool foregroundPresentationConfigured = false;
  String? token;

  @override
  Stream<PushMessage> get foregroundMessages => _messageController.stream;

  @override
  Stream<String> get tokenRefreshes => _tokenController.stream;

  @override
  Future<String?> getToken() async => token;

  @override
  Future<void> requestPermission() async {
    permissionRequested = true;
  }

  @override
  Future<void> configureForegroundPresentation() async {
    foregroundPresentationConfigured = true;
  }

  void emitToken(String token) {
    _tokenController.add(token);
  }

  void emitMessage(PushMessage message) {
    _messageController.add(message);
  }

  Future<void> dispose() async {
    await _tokenController.close();
    await _messageController.close();
  }
}

class FakePushDeviceRegistrar implements PushDeviceRegistrar {
  final List<String?> registeredTokens = [];
  final List<String> updatedTokens = [];

  @override
  Future<void> registerDevice({String? fcmToken}) async {
    registeredTokens.add(fcmToken);
  }

  @override
  Future<void> updateFcmToken(String fcmToken) async {
    updatedTokens.add(fcmToken);
  }
}

class FakeForegroundNotificationPresenter
    implements ForegroundNotificationPresenter {
  final List<PushMessage> presentedMessages = [];

  @override
  Future<void> show(PushMessage message) async {
    presentedMessages.add(message);
  }
}

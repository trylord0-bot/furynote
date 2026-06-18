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

  test('emits a comment tap when a push notification opens the app', () async {
    await service.initialize();
    final taps = <CommentPushTap>[];
    final subscription = service.commentPushTaps.listen(taps.add);

    gateway.emitOpenedMessage(
      const PushMessage(
        title: '새 댓글',
        body: '누군가 댓글을 남겼어요',
        data: {'type': 'comment', 'post_id': 'post-1'},
      ),
    );
    await pumpEventQueue();

    expect(taps.map((tap) => tap.postId), ['post-1']);
    await subscription.cancel();
  });

  test(
    'stores the initial comment tap when the app starts from push',
    () async {
      gateway.initialMessage = const PushMessage(
        title: '새 댓글',
        body: '누군가 댓글을 남겼어요',
        data: {'type': 'comment', 'post_id': 'post-2'},
      );

      await service.initialize();

      expect(service.takeInitialCommentPushTap()?.postId, 'post-2');
      expect(service.takeInitialCommentPushTap(), isNull);
    },
  );

  test(
    'emits the initial comment tap to listeners already waiting during startup',
    () async {
      gateway.initialMessage = const PushMessage(
        title: '새 댓글',
        body: '누군가 댓글을 남겼어요',
        data: {'type': 'comment', 'post_id': 'post-3'},
      );
      final taps = <CommentPushTap>[];
      final subscription = service.commentPushTaps.listen(taps.add);

      await service.initialize();
      await pumpEventQueue();

      expect(taps.map((tap) => tap.postId), ['post-3']);
      await subscription.cancel();
    },
  );
}

class FakePushGateway implements PushGateway {
  final StreamController<String> _tokenController =
      StreamController<String>.broadcast();
  final StreamController<PushMessage> _messageController =
      StreamController<PushMessage>.broadcast();
  final StreamController<PushMessage> _openedMessageController =
      StreamController<PushMessage>.broadcast();

  bool permissionRequested = false;
  bool foregroundPresentationConfigured = false;
  String? token;
  PushMessage? initialMessage;

  @override
  Stream<PushMessage> get foregroundMessages => _messageController.stream;

  @override
  Stream<PushMessage> get openedMessages => _openedMessageController.stream;

  @override
  Stream<String> get tokenRefreshes => _tokenController.stream;

  @override
  Future<String?> getToken() async => token;

  @override
  Future<PushMessage?> getInitialMessage() async => initialMessage;

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

  void emitOpenedMessage(PushMessage message) {
    _openedMessageController.add(message);
  }

  Future<void> dispose() async {
    await _tokenController.close();
    await _messageController.close();
    await _openedMessageController.close();
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
  bool initialized = false;

  @override
  Future<void> initialize() async {
    initialized = true;
  }

  @override
  Future<void> show(PushMessage message) async {
    presentedMessages.add(message);
  }
}

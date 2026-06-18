import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fury_note/firebase_options.dart';
import 'package:fury_note/src/api/device_service.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}

class PushMessage {
  const PushMessage({
    required this.title,
    required this.body,
    required this.data,
  });

  final String? title;
  final String? body;
  final Map<String, String> data;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is PushMessage &&
        other.title == title &&
        other.body == body &&
        _mapEquals(other.data, data);
  }

  @override
  int get hashCode => Object.hash(title, body, Object.hashAll(data.entries));
}

abstract class PushGateway {
  Stream<String> get tokenRefreshes;

  Stream<PushMessage> get foregroundMessages;

  Future<void> requestPermission();

  Future<void> configureForegroundPresentation();

  Future<String?> getToken();
}

abstract class PushDeviceRegistrar {
  Future<void> registerDevice({String? fcmToken});

  Future<void> updateFcmToken(String fcmToken);
}

abstract class ForegroundNotificationPresenter {
  Future<void> show(PushMessage message);
}

class PushNotificationService {
  PushNotificationService({
    required PushGateway gateway,
    required PushDeviceRegistrar registrar,
    required ForegroundNotificationPresenter foregroundPresenter,
    bool registerBackgroundHandler = false,
  }) : _gateway = gateway,
       _registrar = registrar,
       _foregroundPresenter = foregroundPresenter,
       _registerBackgroundHandler = registerBackgroundHandler;

  static final PushNotificationService instance = PushNotificationService(
    gateway: FirebasePushGateway(FirebaseMessaging.instance),
    registrar: DeviceServicePushRegistrar(DeviceService.instance),
    foregroundPresenter: LocalForegroundNotificationPresenter(),
    registerBackgroundHandler: true,
  );

  final PushGateway _gateway;
  final PushDeviceRegistrar _registrar;
  final ForegroundNotificationPresenter _foregroundPresenter;
  final bool _registerBackgroundHandler;
  StreamSubscription<String>? _tokenSubscription;
  StreamSubscription<PushMessage>? _foregroundMessageSubscription;
  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) {
      return;
    }

    try {
      if (_registerBackgroundHandler) {
        FirebaseMessaging.onBackgroundMessage(
          firebaseMessagingBackgroundHandler,
        );
      }
      await _gateway.requestPermission();
      await _gateway.configureForegroundPresentation();

      final token = await _gateway.getToken();
      await _registrar.registerDevice(fcmToken: token);

      _tokenSubscription = _gateway.tokenRefreshes.listen((token) {
        unawaited(_registrar.updateFcmToken(token));
      });
      _foregroundMessageSubscription = _gateway.foregroundMessages.listen((
        message,
      ) {
        unawaited(_foregroundPresenter.show(message));
      });
      _initialized = true;
    } on MissingPluginException {
      await _registrar.registerDevice();
    }
  }

  void dispose() {
    unawaited(_tokenSubscription?.cancel());
    unawaited(_foregroundMessageSubscription?.cancel());
    _initialized = false;
  }
}

class DeviceServicePushRegistrar implements PushDeviceRegistrar {
  const DeviceServicePushRegistrar(this._deviceService);

  final DeviceService _deviceService;

  @override
  Future<void> registerDevice({String? fcmToken}) {
    return _deviceService.registerDevice(fcmToken: fcmToken);
  }

  @override
  Future<void> updateFcmToken(String fcmToken) {
    return _deviceService.updateFcmToken(fcmToken);
  }
}

class FirebasePushGateway implements PushGateway {
  FirebasePushGateway(this._messaging);

  final FirebaseMessaging _messaging;

  @override
  Stream<PushMessage> get foregroundMessages =>
      FirebaseMessaging.onMessage.map(_fromRemoteMessage);

  @override
  Stream<String> get tokenRefreshes => _messaging.onTokenRefresh;

  @override
  Future<void> requestPermission() async {
    await _messaging.requestPermission(alert: true, badge: true, sound: true);
  }

  @override
  Future<void> configureForegroundPresentation() async {
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  @override
  Future<String?> getToken() => _messaging.getToken();

  PushMessage _fromRemoteMessage(RemoteMessage message) {
    return PushMessage(
      title: message.notification?.title,
      body: message.notification?.body,
      data: Map<String, String>.from(message.data),
    );
  }
}

class LocalForegroundNotificationPresenter
    implements ForegroundNotificationPresenter {
  LocalForegroundNotificationPresenter({
    FlutterLocalNotificationsPlugin? plugin,
  }) : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;
  bool _initialized = false;

  @override
  Future<void> show(PushMessage message) async {
    final title = message.title;
    final body = message.body;
    if ((title == null || title.isEmpty) && (body == null || body.isEmpty)) {
      return;
    }

    try {
      await _initialize();
      await _plugin.show(
        id: message.hashCode,
        title: title ?? 'Fury Note',
        body: body,
        notificationDetails: const NotificationDetails(
          android: AndroidNotificationDetails(
            'comment_push',
            'Comment push',
            channelDescription: 'Comment notifications from Fury Note',
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        payload: message.data['post_id'],
      );
    } on MissingPluginException {
      return;
    }
  }

  Future<void> _initialize() async {
    if (_initialized) {
      return;
    }

    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await _plugin.initialize(settings: settings);
    _initialized = true;
  }
}

bool _mapEquals(Map<String, String> left, Map<String, String> right) {
  if (left.length != right.length) {
    return false;
  }
  for (final entry in left.entries) {
    if (right[entry.key] != entry.value) {
      return false;
    }
  }
  return true;
}

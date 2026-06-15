import 'api_client.dart';
import 'device_id_service.dart';

class DeviceService {
  static final DeviceService instance = DeviceService._();
  DeviceService._();

  bool _registered = false;

  /// 디바이스를 백엔드에 등록한다.
  /// FCM 토큰이 없을 경우 디바이스 UUID를 placeholder로 사용하고,
  /// Firebase 설정 완료 후 [updateFcmToken]으로 실제 토큰을 업데이트한다.
  Future<void> registerDevice({String? fcmToken}) async {
    if (_registered) return;

    try {
      final deviceId = await DeviceIdService.instance.getOrCreate();
      await ApiClient.instance.postAnonymous('/v1/device/register', {
        'device_id': deviceId,
        'fcm_token': fcmToken ?? deviceId,
      });
      _registered = true;
    } catch (_) {
      // 네트워크 실패 시 다음 실행 때 재시도
    }
  }

  Future<void> updateFcmToken(String fcmToken) async {
    try {
      await ApiClient.instance.patch('/v1/device/token', {'fcm_token': fcmToken});
    } catch (_) {}
  }

  Future<void> updateNotification({required bool notifyComment}) async {
    try {
      await ApiClient.instance.patch('/v1/device/notification', {
        'notify_comment': notifyComment,
      });
    } catch (_) {}
  }

  Future<void> updateAvatar(String avatarBase64) async {
    await ApiClient.instance.patch('/v1/device/avatar', {
      'avatar_base64': avatarBase64,
    });
  }

  Future<void> clearAvatar() async {
    await ApiClient.instance.patch('/v1/device/avatar', {
      'avatar_base64': null,
    });
  }
}

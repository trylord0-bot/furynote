import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class DeviceIdService {
  static const String _key = 'device.id';

  static final DeviceIdService instance = DeviceIdService._();
  DeviceIdService._();

  String? _deviceId;

  String? get cached => _deviceId;

  Future<String> getOrCreate() async {
    if (_deviceId != null) return _deviceId!;

    final prefs = await SharedPreferences.getInstance();
    var id = prefs.getString(_key);
    if (id == null) {
      id = const Uuid().v4();
      await prefs.setString(_key, id);
    }
    _deviceId = id;
    return id;
  }

  Future<void> restore(String deviceId) async {
    final restoredId = deviceId.trim();
    if (restoredId.isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, restoredId);
    _deviceId = restoredId;
  }
}

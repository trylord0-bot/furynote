abstract class FuryVoiceRecorder {
  Future<bool> hasPermission();

  Future<void> startNew();

  Future<String?> stop();

  Future<void> dispose();
}

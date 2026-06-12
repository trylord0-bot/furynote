import 'voice_recorder_contract.dart';

FuryVoiceRecorder createVoiceRecorder() => _UnsupportedVoiceRecorder();

class _UnsupportedVoiceRecorder implements FuryVoiceRecorder {
  @override
  Future<void> dispose() async {}

  @override
  Future<bool> hasPermission() async => false;

  @override
  Future<void> startNew() {
    throw UnsupportedError(
      'Voice recording is not supported on this platform.',
    );
  }

  @override
  Future<String?> stop() async => null;
}

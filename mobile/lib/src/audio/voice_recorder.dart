import 'voice_recorder_contract.dart';
import 'voice_recorder_stub.dart'
    if (dart.library.io) 'voice_recorder_io.dart'
    as platform;

export 'voice_recorder_contract.dart';

FuryVoiceRecorder createVoiceRecorder() => platform.createVoiceRecorder();

import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import 'voice_recorder_contract.dart';

FuryVoiceRecorder createVoiceRecorder() => _LocalVoiceRecorder();

class _LocalVoiceRecorder implements FuryVoiceRecorder {
  final AudioRecorder _recorder = AudioRecorder();

  String? _currentPath;

  @override
  Future<bool> hasPermission() => _recorder.hasPermission();

  @override
  Future<void> startNew() async {
    await _recorder.cancel();
    final directory = await getApplicationDocumentsDirectory();
    final recordingDirectory = Directory(
      p.join(directory.path, 'voice_recordings'),
    );
    await recordingDirectory.create(recursive: true);
    _currentPath = p.join(
      recordingDirectory.path,
      'rage_${DateTime.now().millisecondsSinceEpoch}.m4a',
    );
    await _recorder.start(
      const RecordConfig(
        encoder: AudioEncoder.aacLc,
        bitRate: 96000,
        sampleRate: 44100,
        numChannels: 1,
      ),
      path: _currentPath!,
    );
  }

  @override
  Future<String?> stop() => _recorder.stop();

  @override
  Future<void> dispose() => _recorder.dispose();
}

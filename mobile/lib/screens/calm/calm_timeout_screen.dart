import 'dart:async';
import 'package:flutter/material.dart';
import '../../main.dart';

class CalmTimeoutScreen extends StatefulWidget {
  const CalmTimeoutScreen({super.key});

  @override
  State<CalmTimeoutScreen> createState() => _CalmTimeoutScreenState();
}

class _CalmTimeoutScreenState extends State<CalmTimeoutScreen> {
  static const _totalSeconds = 10 * 60; // 10 minutes
  int _remaining = _totalSeconds;
  Timer? _timer;
  bool _running = false;

  void _toggleTimer() {
    if (_running) {
      _timer?.cancel();
      setState(() => _running = false);
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (_remaining <= 1) {
          _timer?.cancel();
          setState(() {
            _remaining = 0;
            _running = false;
          });
        } else {
          setState(() => _remaining--);
        }
      });
      setState(() => _running = true);
    }
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _remaining = _totalSeconds;
      _running = false;
    });
  }

  String get _timeText {
    final minutes = (_remaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remaining % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  double get _progress => 1.0 - (_remaining / _totalSeconds);

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FuryColors.phone,
      appBar: AppBar(
        backgroundColor: FuryColors.chrome,
        title: const Text('타임아웃'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 180,
                    height: 180,
                    child: CircularProgressIndicator(
                      value: _progress,
                      strokeWidth: 8,
                      strokeCap: StrokeCap.round,
                      backgroundColor: FuryColors.border,
                      color: FuryColors.orange,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _timeText,
                        style: const TextStyle(
                          color: FuryColors.text,
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          fontFeatures: [FontFeature.tabularFigures()],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _running ? '진행 중' : '일시정지',
                        style: TextStyle(
                          color:
                              _running ? FuryColors.orange : FuryColors.faint,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: _resetTimer,
                  child: const Text('초기화'),
                ),
                const SizedBox(width: 16),
                FilledButton.icon(
                  onPressed: _toggleTimer,
                  icon: Icon(_running ? Icons.pause : Icons.play_arrow),
                  label: Text(_running ? '일시정지' : '시작'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

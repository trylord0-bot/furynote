import 'package:flutter/material.dart';
import '../../main.dart';

class CalmBreathingScreen extends StatefulWidget {
  const CalmBreathingScreen({super.key});

  @override
  State<CalmBreathingScreen> createState() => _CalmBreathingScreenState();
}

class _CalmBreathingScreenState extends State<CalmBreathingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  int _phaseIndex = 0;
  int _cycleCount = 0;

  static const _phases = [
    ('들이마시기', 4.0),
    ('참기', 7.0),
    ('내쉬기', 8.0),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _phases[0].$2.toInt()),
    )..addStatusListener(_onStatus);
    _startCycle();
  }

  void _onStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(() {
        _phaseIndex = (_phaseIndex + 1) % 3;
        if (_phaseIndex == 0) {
          _cycleCount++;
        }
      });
      _controller.duration = Duration(
        seconds: _phases[_phaseIndex].$2.toInt(),
      );
      _controller.reset();
      _controller.forward();
    }
  }

  void _startCycle() {
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final phase = _phases[_phaseIndex];
    final maxScale = 1.0;
    final minScale = 0.35;

    return Scaffold(
      backgroundColor: FuryColors.phone,
      appBar: AppBar(
        backgroundColor: FuryColors.chrome,
        title: const Text('호흡 운동'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final isInhale = _phaseIndex == 0;
                final scale = isInhale
                    ? minScale +
                        (maxScale - minScale) *
                            _controller.value
                    : maxScale -
                        (maxScale - minScale) *
                            _controller.value;
                return Transform.scale(
                  scale: scale,
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: FuryColors.red
                          .withValues(alpha: 0.12 + _controller.value * 0.2),
                      border: Border.all(
                        color: FuryColors.red.withValues(
                          alpha: 0.3 + _controller.value * 0.4,
                        ),
                        width: 3,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        phase.$1,
                        style: TextStyle(
                          color: FuryColors.text,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            Text(
              '${phase.$2.toInt()}초',
              style: const TextStyle(
                color: FuryColors.muted,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${_cycleCount + 1}회차',
              style: const TextStyle(
                color: FuryColors.faint,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

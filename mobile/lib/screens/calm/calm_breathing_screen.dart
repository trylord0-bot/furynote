import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
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

  static const _phaseDurations = [4, 7, 8];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _phaseDurations[0]),
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
      _controller.duration = Duration(seconds: _phaseDurations[_phaseIndex]);
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
    final l10n = AppLocalizations.of(context);
    final phaseLabel = switch (_phaseIndex) {
      0 => l10n.breathPhaseInhale,
      1 => l10n.breathPhaseHold,
      _ => l10n.breathPhaseExhale,
    };
    final phaseSeconds = _phaseDurations[_phaseIndex];
    final maxScale = 1.0;
    final minScale = 0.35;

    return Scaffold(
      backgroundColor: FuryColors.phone,
      appBar: AppBar(
        backgroundColor: FuryColors.chrome,
        title: Text(l10n.calmBreathingTitle),
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
                    ? minScale + (maxScale - minScale) * _controller.value
                    : maxScale - (maxScale - minScale) * _controller.value;
                return Transform.scale(
                  scale: scale,
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: FuryColors.red.withValues(
                        alpha: 0.12 + _controller.value * 0.2,
                      ),
                      border: Border.all(
                        color: FuryColors.red.withValues(
                          alpha: 0.3 + _controller.value * 0.4,
                        ),
                        width: 3,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        phaseLabel,
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
              l10n.durationSeconds(phaseSeconds),
              style: const TextStyle(color: FuryColors.muted, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.cycleCount(_cycleCount + 1),
              style: const TextStyle(color: FuryColors.faint, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

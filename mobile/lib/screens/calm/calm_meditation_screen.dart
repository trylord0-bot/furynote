import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import '../../main.dart';

class CalmMeditationScreen extends StatefulWidget {
  const CalmMeditationScreen({super.key});

  @override
  State<CalmMeditationScreen> createState() => _CalmMeditationScreenState();
}

class _CalmMeditationScreenState extends State<CalmMeditationScreen> {
  int _imageIndex = 0;
  Timer? _timer;
  Timer? _tickTimer;
  bool _running = false;
  double _elapsed = 0;

  static const _intervalSeconds = 60;
  static const _tickMs = 100;

  static const _imageEmojis = ['🌊', '🌲', '🌅', '🏔️', '🌸', '🌌'];

  @override
  void dispose() {
    _timer?.cancel();
    _tickTimer?.cancel();
    super.dispose();
  }

  void _toggleSlideshow() {
    if (_running) {
      _timer?.cancel();
      _tickTimer?.cancel();
      setState(() {
        _running = false;
        _elapsed = 0;
      });
    } else {
      _tickTimer = Timer.periodic(const Duration(milliseconds: _tickMs), (_) {
        final tickFraction = _tickMs / (_intervalSeconds * 1000);
        setState(() {
          _elapsed = (_elapsed + tickFraction).clamp(0.0, 1.0);
        });
      });
      _timer = Timer.periodic(const Duration(seconds: _intervalSeconds), (_) {
        setState(() {
          _imageIndex = (_imageIndex + 1) % _imageEmojis.length;
          _elapsed = 0;
        });
      });
      setState(() => _running = true);
    }
  }

  void _previous() {
    setState(() {
      _imageIndex =
          (_imageIndex - 1 + _imageEmojis.length) % _imageEmojis.length;
      _elapsed = 0;
    });
  }

  void _next() {
    setState(() {
      _imageIndex = (_imageIndex + 1) % _imageEmojis.length;
      _elapsed = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final imageLabels = [
      l10n.calmMeditationSceneWave,
      l10n.calmMeditationSceneForest,
      l10n.calmMeditationSceneSunset,
      l10n.calmMeditationSceneMountain,
      l10n.calmMeditationSceneCherryBlossom,
      l10n.calmMeditationSceneNightSky,
    ];

    return Scaffold(
      backgroundColor: FuryColors.phone,
      appBar: AppBar(
        backgroundColor: FuryColors.chrome,
        title: Text(l10n.meditation),
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              child: Container(
                key: ValueKey(_imageIndex),
                decoration: const BoxDecoration(
                  color: FuryColors.panel,
                  border: Border(
                    top: BorderSide(color: FuryColors.border),
                    bottom: BorderSide(color: FuryColors.border),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _imageEmojis[_imageIndex],
                        style: const TextStyle(fontSize: 80),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        imageLabels[_imageIndex],
                        style: const TextStyle(
                          color: FuryColors.text,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.calmMeditationPrompt,
                        style: const TextStyle(
                          color: FuryColors.faint,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (_running)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: LinearProgressIndicator(
                  value: _elapsed,
                  minHeight: 3,
                  backgroundColor: FuryColors.border,
                  color: FuryColors.orange,
                ),
              ),
            ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            decoration: const BoxDecoration(
              color: FuryColors.chrome,
              border: Border(top: BorderSide(color: FuryColors.border)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _previous,
                  icon: const Icon(Icons.chevron_left),
                  color: FuryColors.text,
                ),
                const SizedBox(width: 24),
                FilledButton.icon(
                  onPressed: _toggleSlideshow,
                  icon: Icon(_running ? Icons.pause : Icons.play_arrow),
                  label: Text(_running ? l10n.pause : l10n.autoplay),
                ),
                const SizedBox(width: 24),
                IconButton(
                  onPressed: _next,
                  icon: const Icon(Icons.chevron_right),
                  color: FuryColors.text,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

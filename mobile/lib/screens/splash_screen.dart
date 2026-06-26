import 'dart:math';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({required this.onDone, super.key});

  final VoidCallback onDone;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _ashController;
  late final AnimationController _logoController;
  late final Animation<double> _logoFade;
  late final Animation<double> _logoScale;

  double _screenOpacity = 0.0;
  bool _exiting = false;

  @override
  void initState() {
    super.initState();

    _ashController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _logoFade = CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeOut,
    );

    _logoScale = Tween<double>(begin: 0.82, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOutCubic),
    );

    // 첫 프레임에서 화면 페이드인 시작
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _screenOpacity = 1.0);
    });

    // 화면이 어느 정도 나타난 뒤 로고 등장
    Future<void>.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _logoController.forward();
    });

    // 페이드아웃 시작
    Future<void>.delayed(const Duration(milliseconds: 3000), () {
      if (!mounted) return;
      setState(() {
        _exiting = true;
        _screenOpacity = 0.0;
      });
    });
  }

  @override
  void dispose() {
    _ashController.dispose();
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedOpacity(
        opacity: _screenOpacity,
        duration: _exiting
            ? const Duration(milliseconds: 700)
            : const Duration(milliseconds: 450),
        curve: Curves.easeInOut,
        onEnd: () {
          if (_exiting && mounted) widget.onDone();
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 불꽃 재 파티클 배경
            AnimatedBuilder(
              animation: _ashController,
              builder: (context, _) {
                return CustomPaint(
                  painter: _AshParticlePainter(_ashController.value),
                );
              },
            ),
            // 하단 불색 → 상단 배경색 그라디언트
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.0, 0.28, 0.58, 1.0],
                  colors: [
                    Color(0xFFCC2200),
                    Color(0x99550A00),
                    Color(0x331A0500),
                    Color(0x000A0000),
                  ],
                ),
              ),
            ),
            // 로고
            Center(
              child: FadeTransition(
                opacity: _logoFade,
                child: ScaleTransition(
                  scale: _logoScale,
                  child: Image.asset(
                    'assets/icon/logo_1024.png',
                    width: 180,
                    height: 180,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AshParticle {
  _AshParticle({required this.seed}) {
    final rng = Random(seed);
    x = rng.nextDouble();
    startY = 1.0 + rng.nextDouble() * 0.3;
    speed = 0.18 + rng.nextDouble() * 0.28;
    size = 1.2 + rng.nextDouble() * 3.5;
    opacity = 0.25 + rng.nextDouble() * 0.65;
    phaseOffset = rng.nextDouble();
    swayAmplitude = 0.012 + rng.nextDouble() * 0.025;
    swayFrequency = 1.2 + rng.nextDouble() * 2.2;
    isEmber = rng.nextDouble() < 0.28;
    colorSeed = rng.nextDouble();
    rotationSpeed = (rng.nextDouble() - 0.5) * 4.0;
  }

  final int seed;
  late double x;
  late double startY;
  late double speed;
  late double size;
  late double opacity;
  late double phaseOffset;
  late double swayAmplitude;
  late double swayFrequency;
  late bool isEmber;
  late double colorSeed;
  late double rotationSpeed;

  Offset position(double t) {
    final progress = ((t + phaseOffset) % 1.0);
    final cy = startY - progress * (startY + 0.1) / speed;
    final cx = x + sin(progress * swayFrequency * pi * 2) * swayAmplitude;
    return Offset(cx, cy);
  }

  double alpha(double t) {
    final progress = ((t + phaseOffset) % 1.0);
    if (progress < 0.12) return opacity * (progress / 0.12);
    if (progress > 0.82) return opacity * (1.0 - (progress - 0.82) / 0.18);
    return opacity;
  }

  double rotation(double t) {
    final progress = ((t + phaseOffset) % 1.0);
    return progress * rotationSpeed * pi;
  }
}

class _AshParticlePainter extends CustomPainter {
  _AshParticlePainter(this.t) {
    _particles = List.generate(
      _kParticleCount,
      (i) => _AshParticle(seed: i * 31 + 7),
    );
  }

  final double t;
  static const int _kParticleCount = 140;
  late final List<_AshParticle> _particles;

  static final _emberColors = [
    const Color(0xFFFF6B35),
    const Color(0xFFFF8C42),
    const Color(0xFFFFD93D),
    const Color(0xFFE63946),
    const Color(0xFFFF4500),
  ];

  static final _ashColors = [
    const Color(0xFF888888),
    const Color(0xFFAA8870),
    const Color(0xFF998877),
    const Color(0xFF6B6060),
    const Color(0xFFCCBBAA),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (final p in _particles) {
      final pos = p.position(t);
      final cx = pos.dx * size.width;
      final cy = pos.dy * size.height;
      final alpha = p.alpha(t);

      if (alpha <= 0) continue;

      final colors = p.isEmber ? _emberColors : _ashColors;
      final colorIdx = (p.colorSeed * colors.length).floor().clamp(
        0,
        colors.length - 1,
      );
      final baseColor = colors[colorIdx];

      paint.color = baseColor.withValues(alpha: alpha);

      if (p.isEmber) {
        // 불씨 - 작은 원형 + 글로우
        final glowPaint = Paint()
          ..color = baseColor.withValues(alpha: alpha * 0.35)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
        canvas.drawCircle(Offset(cx, cy), p.size * 2.2, glowPaint);
        canvas.drawCircle(Offset(cx, cy), p.size * 0.9, paint);
      } else {
        // 재 - 불규칙한 작은 조각
        canvas.save();
        canvas.translate(cx, cy);
        canvas.rotate(p.rotation(t));

        final s = p.size;
        final path = Path()
          ..moveTo(0, -s)
          ..lineTo(s * 0.6, -s * 0.2)
          ..lineTo(s * 0.4, s * 0.8)
          ..lineTo(-s * 0.3, s * 0.9)
          ..lineTo(-s * 0.7, s * 0.1)
          ..close();
        canvas.drawPath(path, paint);

        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(_AshParticlePainter old) => old.t != t;
}

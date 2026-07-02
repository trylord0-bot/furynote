import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../main.dart';
import '../src/config/ad_config.dart';

/// 피드 리스트 카드 스타일에 맞춘 배너 광고 위젯.
///
/// [FuryPostCard]와 동일한 배경/테두리/라운드를 사용해 피드 사이에
/// 자연스럽게 녹아들도록 한다.
class FeedAdCard extends StatefulWidget {
  const FeedAdCard({super.key});

  @override
  State<FeedAdCard> createState() => _FeedAdCardState();
}

class _FeedAdCardState extends State<FeedAdCard> {
  BannerAd? _bannerAd;
  int? _requestedWidth;
  bool _failed = false;

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  Future<void> _loadAd(int width) async {
    if (_requestedWidth == width) return;
    _requestedWidth = width;

    if (AdConfig.isWidgetTestEnvironment) {
      if (mounted) setState(() => _failed = true);
      return;
    }

    final size = await AdSize.getLargeAnchoredAdaptiveBannerAdSize(width);
    if (size == null) {
      if (mounted) setState(() => _failed = true);
      return;
    }

    final ad = BannerAd(
      adUnitId: AdConfig.feedBannerAdUnitId,
      size: size,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (loadedAd) {
          if (!mounted) {
            loadedAd.dispose();
            return;
          }
          setState(() {
            _bannerAd = loadedAd as BannerAd;
            _failed = false;
          });
        },
        onAdFailedToLoad: (failedAd, error) {
          failedAd.dispose();
          if (mounted) setState(() => _failed = true);
        },
      ),
    );
    unawaited(ad.load());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.truncate();
        if (_bannerAd == null && !_failed) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            unawaited(_loadAd(width));
          });
        }

        if (_failed || _bannerAd == null) {
          return const SizedBox.shrink();
        }

        final ad = _bannerAd!;
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.04),
            border: Border.all(color: FuryColors.border),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 16,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Center(
            child: SizedBox(
              width: ad.size.width.toDouble(),
              height: ad.size.height.toDouble(),
              child: AdWidget(ad: ad),
            ),
          ),
        );
      },
    );
  }
}

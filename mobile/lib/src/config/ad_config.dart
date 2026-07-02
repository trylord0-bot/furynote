import 'dart:io';

import 'package:flutter/foundation.dart';

/// AdMob 광고 단위 ID 설정.
///
/// 디버그/프로필 빌드에서는 항상 Google 공식 테스트 광고 단위 ID를 사용한다.
/// (자신의 실제 광고를 클릭/노출시키면 AdMob 계정 정지 사유가 될 수 있음)
/// 릴리즈 빌드용 ID는 아래 `_release*` 상수에서 관리하며, 정식 출시 전에는
/// 실제 AdMob 콘솔에서 발급받은 광고 단위 ID로 교체해야 한다.
class AdConfig {
  const AdConfig._();

  // Google 공식 테스트 배너 광고 단위 ID.
  // https://developers.google.com/admob/flutter/test-ads
  static const _testBannerAndroid = 'ca-app-pub-3940256099942544/6300978111';
  static const _testBannerIOS = 'ca-app-pub-3940256099942544/2934735716';

  // TODO(admob): 정식 출시 전 실제 AdMob 배너 광고 단위 ID로 교체.
  // 현재는 정책 위반(테스트 트래픽) 방지를 위해 테스트 ID를 그대로 사용한다.
  static const _releaseBannerAndroid =
      'ca-app-pub-3940256099942544/6300978111';
  static const _releaseBannerIOS = 'ca-app-pub-3940256099942544/2934735716';

  /// 피드 리스트에 삽입할 배너 광고 단위 ID.
  static String get feedBannerAdUnitId {
    if (kReleaseMode) {
      return Platform.isIOS ? _releaseBannerIOS : _releaseBannerAndroid;
    }
    return Platform.isIOS ? _testBannerIOS : _testBannerAndroid;
  }

  /// `flutter test`로 실행 중인지 여부. 위젯 테스트 환경에는 AdMob 플랫폼
  /// 채널 구현체가 없으므로, 이 경우 광고 로드를 시도하지 않는다.
  static bool get isWidgetTestEnvironment =>
      Platform.environment['FLUTTER_TEST'] == 'true';
}

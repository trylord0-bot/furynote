import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ko'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In ko, this message translates to:
  /// **'Fury Note'**
  String get appTitle;

  /// No description provided for @appKoreanName.
  ///
  /// In ko, this message translates to:
  /// **'분노의노트'**
  String get appKoreanName;

  /// No description provided for @record.
  ///
  /// In ko, this message translates to:
  /// **'기록'**
  String get record;

  /// No description provided for @feed.
  ///
  /// In ko, this message translates to:
  /// **'피드'**
  String get feed;

  /// No description provided for @stats.
  ///
  /// In ko, this message translates to:
  /// **'통계'**
  String get stats;

  /// No description provided for @calm.
  ///
  /// In ko, this message translates to:
  /// **'진정'**
  String get calm;

  /// No description provided for @settings.
  ///
  /// In ko, this message translates to:
  /// **'설정'**
  String get settings;

  /// No description provided for @drawerGuide.
  ///
  /// In ko, this message translates to:
  /// **'앱 가이드'**
  String get drawerGuide;

  /// No description provided for @drawerCalmGuide.
  ///
  /// In ko, this message translates to:
  /// **'진정 가이드'**
  String get drawerCalmGuide;

  /// No description provided for @drawerVersion.
  ///
  /// In ko, this message translates to:
  /// **'Fury Note v1.0.0'**
  String get drawerVersion;

  /// No description provided for @recordTitle.
  ///
  /// In ko, this message translates to:
  /// **'분노 기록'**
  String get recordTitle;

  /// No description provided for @stepIntensity.
  ///
  /// In ko, this message translates to:
  /// **'지금 얼마나 화났나요?'**
  String get stepIntensity;

  /// No description provided for @stepIntensitySub.
  ///
  /// In ko, this message translates to:
  /// **'이모지를 선택해주세요'**
  String get stepIntensitySub;

  /// No description provided for @stepCategory.
  ///
  /// In ko, this message translates to:
  /// **'무엇 때문인가요?'**
  String get stepCategory;

  /// No description provided for @stepCategorySub.
  ///
  /// In ko, this message translates to:
  /// **'카테고리를 선택해주세요'**
  String get stepCategorySub;

  /// No description provided for @stepText.
  ///
  /// In ko, this message translates to:
  /// **'무슨 일이 있었나요?'**
  String get stepText;

  /// No description provided for @stepTextSub.
  ///
  /// In ko, this message translates to:
  /// **'건너뛰어도 괜찮아요'**
  String get stepTextSub;

  /// No description provided for @stepReminder.
  ///
  /// In ko, this message translates to:
  /// **'나중에 다시 볼까요?'**
  String get stepReminder;

  /// No description provided for @stepReminderSub.
  ///
  /// In ko, this message translates to:
  /// **'건너뛰어도 괜찮아요'**
  String get stepReminderSub;

  /// No description provided for @stepSave.
  ///
  /// In ko, this message translates to:
  /// **'기록을 저장할까요?'**
  String get stepSave;

  /// No description provided for @stepSaveSub.
  ///
  /// In ko, this message translates to:
  /// **'저장 후 피드에 포스팅할 수도 있어요'**
  String get stepSaveSub;

  /// No description provided for @stepPost.
  ///
  /// In ko, this message translates to:
  /// **'이 감정을 나눠볼까요?'**
  String get stepPost;

  /// No description provided for @stepPostSub.
  ///
  /// In ko, this message translates to:
  /// **'익명으로 포스팅돼요'**
  String get stepPostSub;

  /// No description provided for @voiceInput.
  ///
  /// In ko, this message translates to:
  /// **'음성 녹음'**
  String get voiceInput;

  /// No description provided for @next.
  ///
  /// In ko, this message translates to:
  /// **'다음'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In ko, this message translates to:
  /// **'건너뛰기'**
  String get skip;

  /// No description provided for @saveNote.
  ///
  /// In ko, this message translates to:
  /// **'기록하기'**
  String get saveNote;

  /// No description provided for @postIt.
  ///
  /// In ko, this message translates to:
  /// **'포스팅하기'**
  String get postIt;

  /// No description provided for @saveOnly.
  ///
  /// In ko, this message translates to:
  /// **'그냥 저장만 할게요'**
  String get saveOnly;

  /// No description provided for @feedPostedToast.
  ///
  /// In ko, this message translates to:
  /// **'피드에 전송했어요'**
  String get feedPostedToast;

  /// No description provided for @reminderNotification.
  ///
  /// In ko, this message translates to:
  /// **'리마인드 알림'**
  String get reminderNotification;

  /// No description provided for @noReminder.
  ///
  /// In ko, this message translates to:
  /// **'설정 안 함'**
  String get noReminder;

  /// No description provided for @summaryIntensity.
  ///
  /// In ko, this message translates to:
  /// **'분노 강도'**
  String get summaryIntensity;

  /// No description provided for @summaryCategory.
  ///
  /// In ko, this message translates to:
  /// **'카테고리'**
  String get summaryCategory;

  /// No description provided for @summaryText.
  ///
  /// In ko, this message translates to:
  /// **'내용'**
  String get summaryText;

  /// No description provided for @summaryReminder.
  ///
  /// In ko, this message translates to:
  /// **'리마인드'**
  String get summaryReminder;

  /// No description provided for @none.
  ///
  /// In ko, this message translates to:
  /// **'없음'**
  String get none;

  /// No description provided for @family.
  ///
  /// In ko, this message translates to:
  /// **'가족'**
  String get family;

  /// No description provided for @romance.
  ///
  /// In ko, this message translates to:
  /// **'연애'**
  String get romance;

  /// No description provided for @work.
  ///
  /// In ko, this message translates to:
  /// **'직장'**
  String get work;

  /// No description provided for @people.
  ///
  /// In ko, this message translates to:
  /// **'사람'**
  String get people;

  /// No description provided for @driving.
  ///
  /// In ko, this message translates to:
  /// **'운전'**
  String get driving;

  /// No description provided for @custom.
  ///
  /// In ko, this message translates to:
  /// **'직접 입력'**
  String get custom;

  /// No description provided for @annoyed.
  ///
  /// In ko, this message translates to:
  /// **'살짝 짜증'**
  String get annoyed;

  /// No description provided for @angry.
  ///
  /// In ko, this message translates to:
  /// **'화가 남'**
  String get angry;

  /// No description provided for @mad.
  ///
  /// In ko, this message translates to:
  /// **'꽤 화남'**
  String get mad;

  /// No description provided for @furious.
  ///
  /// In ko, this message translates to:
  /// **'매우 화남'**
  String get furious;

  /// No description provided for @rage.
  ///
  /// In ko, this message translates to:
  /// **'폭발'**
  String get rage;

  /// No description provided for @calmed.
  ///
  /// In ko, this message translates to:
  /// **'진정됨'**
  String get calmed;

  /// No description provided for @feedTitle.
  ///
  /// In ko, this message translates to:
  /// **'피드'**
  String get feedTitle;

  /// No description provided for @feedSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'최신순으로 비슷한 분노를 둘러봐요'**
  String get feedSubtitle;

  /// No description provided for @like.
  ///
  /// In ko, this message translates to:
  /// **'공감'**
  String get like;

  /// No description provided for @comment.
  ///
  /// In ko, this message translates to:
  /// **'댓글'**
  String get comment;

  /// No description provided for @statsTitle.
  ///
  /// In ko, this message translates to:
  /// **'분노 통계'**
  String get statsTitle;

  /// No description provided for @statsSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'이번 주 감정 흐름을 살펴봐요'**
  String get statsSubtitle;

  /// No description provided for @week.
  ///
  /// In ko, this message translates to:
  /// **'1주일'**
  String get week;

  /// No description provided for @month.
  ///
  /// In ko, this message translates to:
  /// **'1달'**
  String get month;

  /// No description provided for @all.
  ///
  /// In ko, this message translates to:
  /// **'전체'**
  String get all;

  /// No description provided for @totalRecords.
  ///
  /// In ko, this message translates to:
  /// **'총 기록'**
  String get totalRecords;

  /// No description provided for @highestLevel.
  ///
  /// In ko, this message translates to:
  /// **'최고 강도'**
  String get highestLevel;

  /// No description provided for @dailyAverage.
  ///
  /// In ko, this message translates to:
  /// **'일평균'**
  String get dailyAverage;

  /// No description provided for @decreaseRate.
  ///
  /// In ko, this message translates to:
  /// **'감소율'**
  String get decreaseRate;

  /// No description provided for @noContent.
  ///
  /// In ko, this message translates to:
  /// **'내용없음'**
  String get noContent;

  /// No description provided for @voicePlayback.
  ///
  /// In ko, this message translates to:
  /// **'음성 재생'**
  String get voicePlayback;

  /// No description provided for @deleteConfirm.
  ///
  /// In ko, this message translates to:
  /// **'삭제할까요?'**
  String get deleteConfirm;

  /// No description provided for @delete.
  ///
  /// In ko, this message translates to:
  /// **'삭제'**
  String get delete;

  /// No description provided for @cancel.
  ///
  /// In ko, this message translates to:
  /// **'취소'**
  String get cancel;

  /// No description provided for @calmTitle.
  ///
  /// In ko, this message translates to:
  /// **'진정 도구'**
  String get calmTitle;

  /// No description provided for @calmSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'아직 남은 감정을 천천히 낮춰봐요'**
  String get calmSubtitle;

  /// No description provided for @reminderNotes.
  ///
  /// In ko, this message translates to:
  /// **'리마인드 노트'**
  String get reminderNotes;

  /// No description provided for @breathing.
  ///
  /// In ko, this message translates to:
  /// **'호흡운동'**
  String get breathing;

  /// No description provided for @timeout.
  ///
  /// In ko, this message translates to:
  /// **'타임아웃'**
  String get timeout;

  /// No description provided for @meditation.
  ///
  /// In ko, this message translates to:
  /// **'이미지 명상'**
  String get meditation;

  /// No description provided for @feedSupport.
  ///
  /// In ko, this message translates to:
  /// **'포스팅으로 위로받기'**
  String get feedSupport;

  /// No description provided for @profileName.
  ///
  /// In ko, this message translates to:
  /// **'화난 호랑이 #4827'**
  String get profileName;

  /// No description provided for @notificationSettings.
  ///
  /// In ko, this message translates to:
  /// **'알림'**
  String get notificationSettings;

  /// No description provided for @commentNotification.
  ///
  /// In ko, this message translates to:
  /// **'댓글 알림'**
  String get commentNotification;

  /// No description provided for @weeklyReport.
  ///
  /// In ko, this message translates to:
  /// **'주간 리포트'**
  String get weeklyReport;

  /// No description provided for @proPlan.
  ///
  /// In ko, this message translates to:
  /// **'PRO 데이터 내보내기'**
  String get proPlan;

  /// No description provided for @backupImport.
  ///
  /// In ko, this message translates to:
  /// **'데이터 가져오기'**
  String get backupImport;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ko':
      return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

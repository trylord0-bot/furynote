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
  /// **'분노노트'**
  String get appTitle;

  /// No description provided for @appKoreanName.
  ///
  /// In ko, this message translates to:
  /// **'분노노트'**
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

  /// No description provided for @menuTooltip.
  ///
  /// In ko, this message translates to:
  /// **'메뉴'**
  String get menuTooltip;

  /// No description provided for @drawerRecordCount.
  ///
  /// In ko, this message translates to:
  /// **'🔥 분노 기록 {count}회'**
  String drawerRecordCount(String count);

  /// No description provided for @drawerSettingsSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'닉네임 변경 · 알림 설정'**
  String get drawerSettingsSubtitle;

  /// No description provided for @drawerGuideSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'Fury Note 사용 방법'**
  String get drawerGuideSubtitle;

  /// No description provided for @drawerCalmGuideSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'감정 조절 카드 · 오늘의 팁'**
  String get drawerCalmGuideSubtitle;

  /// No description provided for @relativeTimeJustNow.
  ///
  /// In ko, this message translates to:
  /// **'방금 전'**
  String get relativeTimeJustNow;

  /// No description provided for @relativeTimeMinutesAgo.
  ///
  /// In ko, this message translates to:
  /// **'{count}분 전'**
  String relativeTimeMinutesAgo(int count);

  /// No description provided for @relativeTimeHoursAgo.
  ///
  /// In ko, this message translates to:
  /// **'{count}시간 전'**
  String relativeTimeHoursAgo(int count);

  /// No description provided for @relativeTimeDaysAgo.
  ///
  /// In ko, this message translates to:
  /// **'{count}일 전'**
  String relativeTimeDaysAgo(int count);

  /// No description provided for @dataSizeBytes.
  ///
  /// In ko, this message translates to:
  /// **'{value} B'**
  String dataSizeBytes(String value);

  /// No description provided for @dataSizeKilobytes.
  ///
  /// In ko, this message translates to:
  /// **'{value} KB'**
  String dataSizeKilobytes(String value);

  /// No description provided for @dataSizeMegabytes.
  ///
  /// In ko, this message translates to:
  /// **'{value} MB'**
  String dataSizeMegabytes(String value);

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

  /// No description provided for @previous.
  ///
  /// In ko, this message translates to:
  /// **'이전'**
  String get previous;

  /// No description provided for @skip.
  ///
  /// In ko, this message translates to:
  /// **'건너뛰기'**
  String get skip;

  /// No description provided for @save.
  ///
  /// In ko, this message translates to:
  /// **'저장'**
  String get save;

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

  /// No description provided for @recordPostedToast.
  ///
  /// In ko, this message translates to:
  /// **'포스팅했어요'**
  String get recordPostedToast;

  /// No description provided for @recordSavedToast.
  ///
  /// In ko, this message translates to:
  /// **'기록됐어요'**
  String get recordSavedToast;

  /// No description provided for @commentPostedToast.
  ///
  /// In ko, this message translates to:
  /// **'댓글이 등록되었어요'**
  String get commentPostedToast;

  /// No description provided for @commentSendFailedToast.
  ///
  /// In ko, this message translates to:
  /// **'댓글 전송에 실패했어요. 다시 시도해주세요.'**
  String get commentSendFailedToast;

  /// No description provided for @commentDeleteTitle.
  ///
  /// In ko, this message translates to:
  /// **'댓글 삭제'**
  String get commentDeleteTitle;

  /// No description provided for @commentDeleteContent.
  ///
  /// In ko, this message translates to:
  /// **'이 댓글을 삭제할까요?'**
  String get commentDeleteContent;

  /// No description provided for @commentsCount.
  ///
  /// In ko, this message translates to:
  /// **'댓글 {count}개'**
  String commentsCount(int count);

  /// No description provided for @commentsEmpty.
  ///
  /// In ko, this message translates to:
  /// **'아직 댓글이 없어요\n첫 번째 댓글을 남겨보세요 💬'**
  String get commentsEmpty;

  /// No description provided for @commentInputHint.
  ///
  /// In ko, this message translates to:
  /// **'댓글을 입력하세요...'**
  String get commentInputHint;

  /// No description provided for @apiErrorContentBlockedUrl.
  ///
  /// In ko, this message translates to:
  /// **'링크가 포함된 글은 등록할 수 없어요.'**
  String get apiErrorContentBlockedUrl;

  /// No description provided for @apiErrorContentBlockedSpam.
  ///
  /// In ko, this message translates to:
  /// **'광고성 문구가 포함되어 있어요.'**
  String get apiErrorContentBlockedSpam;

  /// No description provided for @apiErrorContentBlockedProfanity.
  ///
  /// In ko, this message translates to:
  /// **'비속어가 포함되어 있어 등록할 수 없어요.'**
  String get apiErrorContentBlockedProfanity;

  /// No description provided for @apiErrorContentBlockedModeration.
  ///
  /// In ko, this message translates to:
  /// **'부적절한 내용이 포함되어 있어요.'**
  String get apiErrorContentBlockedModeration;

  /// No description provided for @apiErrorRateLimitExceeded.
  ///
  /// In ko, this message translates to:
  /// **'잠시 후 다시 시도해주세요.'**
  String get apiErrorRateLimitExceeded;

  /// No description provided for @apiErrorInternal.
  ///
  /// In ko, this message translates to:
  /// **'서버 오류가 발생했어요. 잠시 후 다시 시도해주세요.'**
  String get apiErrorInternal;

  /// No description provided for @apiErrorInvalidRequest.
  ///
  /// In ko, this message translates to:
  /// **'잘못된 요청이에요.'**
  String get apiErrorInvalidRequest;

  /// No description provided for @apiErrorForbidden.
  ///
  /// In ko, this message translates to:
  /// **'권한이 없어요.'**
  String get apiErrorForbidden;

  /// No description provided for @apiErrorPostNotFound.
  ///
  /// In ko, this message translates to:
  /// **'포스팅을 찾을 수 없어요.'**
  String get apiErrorPostNotFound;

  /// No description provided for @apiErrorCommentNotFound.
  ///
  /// In ko, this message translates to:
  /// **'댓글을 찾을 수 없어요.'**
  String get apiErrorCommentNotFound;

  /// No description provided for @apiErrorSignatureRequired.
  ///
  /// In ko, this message translates to:
  /// **'요청 서명이 필요해요.'**
  String get apiErrorSignatureRequired;

  /// No description provided for @apiErrorSignatureInvalid.
  ///
  /// In ko, this message translates to:
  /// **'잘못된 요청이에요.'**
  String get apiErrorSignatureInvalid;

  /// No description provided for @apiErrorSignatureExpired.
  ///
  /// In ko, this message translates to:
  /// **'요청 유효 시간이 지났어요. 다시 시도해주세요.'**
  String get apiErrorSignatureExpired;

  /// No description provided for @apiErrorSignatureReplay.
  ///
  /// In ko, this message translates to:
  /// **'이미 처리된 요청이에요.'**
  String get apiErrorSignatureReplay;

  /// No description provided for @apiErrorUnknown.
  ///
  /// In ko, this message translates to:
  /// **'알 수 없는 오류가 발생했어요.'**
  String get apiErrorUnknown;

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

  /// No description provided for @other.
  ///
  /// In ko, this message translates to:
  /// **'기타'**
  String get other;

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

  /// No description provided for @recordCustomCategoryHint.
  ///
  /// In ko, this message translates to:
  /// **'카테고리를 입력하세요'**
  String get recordCustomCategoryHint;

  /// No description provided for @recordTextHint.
  ///
  /// In ko, this message translates to:
  /// **'여기에 적어보세요'**
  String get recordTextHint;

  /// No description provided for @recordMicPermissionRequired.
  ///
  /// In ko, this message translates to:
  /// **'마이크 권한이 필요합니다.'**
  String get recordMicPermissionRequired;

  /// No description provided for @recordVoiceStartFailed.
  ///
  /// In ko, this message translates to:
  /// **'{label}을 시작할 수 없습니다.'**
  String recordVoiceStartFailed(String label);

  /// No description provided for @recordVoiceStopRecording.
  ///
  /// In ko, this message translates to:
  /// **'녹음 중지'**
  String get recordVoiceStopRecording;

  /// No description provided for @recordVoiceRecordAgain.
  ///
  /// In ko, this message translates to:
  /// **'다시 녹음'**
  String get recordVoiceRecordAgain;

  /// No description provided for @recordVoiceSaved.
  ///
  /// In ko, this message translates to:
  /// **'음성 녹음이 저장됐어요.'**
  String get recordVoiceSaved;

  /// No description provided for @recordAudioSummaryLabel.
  ///
  /// In ko, this message translates to:
  /// **'음성'**
  String get recordAudioSummaryLabel;

  /// No description provided for @recordAudioIncluded.
  ///
  /// In ko, this message translates to:
  /// **'녹음 포함'**
  String get recordAudioIncluded;

  /// No description provided for @recordSavingInProgress.
  ///
  /// In ko, this message translates to:
  /// **'저장 중...'**
  String get recordSavingInProgress;

  /// No description provided for @recordPostingInProgress.
  ///
  /// In ko, this message translates to:
  /// **'전송 중...'**
  String get recordPostingInProgress;

  /// No description provided for @recordSaveFailedToast.
  ///
  /// In ko, this message translates to:
  /// **'기록을 저장하지 못했습니다. 다시 시도해주세요.'**
  String get recordSaveFailedToast;

  /// No description provided for @recordProgressSemantics.
  ///
  /// In ko, this message translates to:
  /// **'기록 진행 상황'**
  String get recordProgressSemantics;

  /// No description provided for @hourSuffix.
  ///
  /// In ko, this message translates to:
  /// **'시'**
  String get hourSuffix;

  /// No description provided for @minuteSuffix.
  ///
  /// In ko, this message translates to:
  /// **'분'**
  String get minuteSuffix;

  /// No description provided for @reminderCustom.
  ///
  /// In ko, this message translates to:
  /// **'직접 설정'**
  String get reminderCustom;

  /// No description provided for @reminderIn30Minutes.
  ///
  /// In ko, this message translates to:
  /// **'30분 후'**
  String get reminderIn30Minutes;

  /// No description provided for @reminderIn1Hour.
  ///
  /// In ko, this message translates to:
  /// **'1시간 후'**
  String get reminderIn1Hour;

  /// No description provided for @reminderIn2Hours.
  ///
  /// In ko, this message translates to:
  /// **'2시간 후'**
  String get reminderIn2Hours;

  /// No description provided for @reminderIn6Hours.
  ///
  /// In ko, this message translates to:
  /// **'6시간 후'**
  String get reminderIn6Hours;

  /// No description provided for @reminderTomorrow.
  ///
  /// In ko, this message translates to:
  /// **'내일'**
  String get reminderTomorrow;

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

  /// No description provided for @feedAllTab.
  ///
  /// In ko, this message translates to:
  /// **'전체 피드'**
  String get feedAllTab;

  /// No description provided for @feedMineTab.
  ///
  /// In ko, this message translates to:
  /// **'내가 쓴 피드'**
  String get feedMineTab;

  /// No description provided for @feedLoadFailed.
  ///
  /// In ko, this message translates to:
  /// **'피드를 불러오지 못했어요.'**
  String get feedLoadFailed;

  /// No description provided for @feedEmptyMine.
  ///
  /// In ko, this message translates to:
  /// **'아직 작성한 피드가 없어요.\n첫 번째 분노를 공유해보세요!'**
  String get feedEmptyMine;

  /// No description provided for @feedEmptyAll.
  ///
  /// In ko, this message translates to:
  /// **'아직 피드가 없어요.\n첫 번째로 분노를 공유해보세요!'**
  String get feedEmptyAll;

  /// No description provided for @feedPostFailedToast.
  ///
  /// In ko, this message translates to:
  /// **'피드 전송에 실패했어요. 다시 시도해주세요.'**
  String get feedPostFailedToast;

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

  /// No description provided for @retry.
  ///
  /// In ko, this message translates to:
  /// **'다시 시도'**
  String get retry;

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

  /// No description provided for @statsIntensityTrend.
  ///
  /// In ko, this message translates to:
  /// **'분노 강도 추이'**
  String get statsIntensityTrend;

  /// No description provided for @statsCategoryDistribution.
  ///
  /// In ko, this message translates to:
  /// **'원인별 분포'**
  String get statsCategoryDistribution;

  /// No description provided for @statsNoRecords.
  ///
  /// In ko, this message translates to:
  /// **'표시할 기록이 없습니다.'**
  String get statsNoRecords;

  /// No description provided for @statsCalendarButtonTitle.
  ///
  /// In ko, this message translates to:
  /// **'달력으로 기록 보기'**
  String get statsCalendarButtonTitle;

  /// No description provided for @statsCalendarButtonSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'날짜별 분노 기록을 확인하고 관리해요'**
  String get statsCalendarButtonSubtitle;

  /// No description provided for @statsCalendarTitle.
  ///
  /// In ko, this message translates to:
  /// **'달력으로 기록 보기'**
  String get statsCalendarTitle;

  /// No description provided for @statsOtherCategory.
  ///
  /// In ko, this message translates to:
  /// **'기타'**
  String get statsOtherCategory;

  /// No description provided for @selectedDateRecordsTitle.
  ///
  /// In ko, this message translates to:
  /// **'{date} 기록'**
  String selectedDateRecordsTitle(String date);

  /// No description provided for @noRecordsOnSelectedDate.
  ///
  /// In ko, this message translates to:
  /// **'선택한 날짜에 작성된 기록이 없습니다.'**
  String get noRecordsOnSelectedDate;

  /// No description provided for @reminderAction.
  ///
  /// In ko, this message translates to:
  /// **'리마인더'**
  String get reminderAction;

  /// No description provided for @play.
  ///
  /// In ko, this message translates to:
  /// **'재생'**
  String get play;

  /// No description provided for @statsSummaryButtonTitle.
  ///
  /// In ko, this message translates to:
  /// **'분노 보고서 보기'**
  String get statsSummaryButtonTitle;

  /// No description provided for @statsSummaryButtonSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'카테고리별로 내 분노 패턴을 넘겨봐요'**
  String get statsSummaryButtonSubtitle;

  /// No description provided for @statsSummaryTitle.
  ///
  /// In ko, this message translates to:
  /// **'분노 보고서'**
  String get statsSummaryTitle;

  /// No description provided for @statsSummaryClose.
  ///
  /// In ko, this message translates to:
  /// **'닫기'**
  String get statsSummaryClose;

  /// No description provided for @statsSummaryEmptyTitle.
  ///
  /// In ko, this message translates to:
  /// **'아직 요약할 기록이 없어요'**
  String get statsSummaryEmptyTitle;

  /// No description provided for @statsSummaryEmptyBody.
  ///
  /// In ko, this message translates to:
  /// **'분노 기록을 남기면 카테고리별 패턴을 여기서 볼 수 있어요.'**
  String get statsSummaryEmptyBody;

  /// No description provided for @statsSummaryTopHeadline.
  ///
  /// In ko, this message translates to:
  /// **'나를 가장 화나게 하는 건 \"{category}\"이었네요'**
  String statsSummaryTopHeadline(String category);

  /// No description provided for @statsSummaryCategoryHeadline.
  ///
  /// In ko, this message translates to:
  /// **'\"{category}\" 기록을 살펴봤어요'**
  String statsSummaryCategoryHeadline(String category);

  /// No description provided for @statsSummaryComfortGeneric.
  ///
  /// In ko, this message translates to:
  /// **'괜찮아요. 그럴 수도 있어요.'**
  String get statsSummaryComfortGeneric;

  /// No description provided for @statsSummaryComfortFamily.
  ///
  /// In ko, this message translates to:
  /// **'가까운 사람일수록 마음이 더 크게 흔들릴 때가 있어요.'**
  String get statsSummaryComfortFamily;

  /// No description provided for @statsSummaryComfortRomance.
  ///
  /// In ko, this message translates to:
  /// **'소중한 관계라서 더 예민하게 느껴졌을 수 있어요.'**
  String get statsSummaryComfortRomance;

  /// No description provided for @statsSummaryComfortWork.
  ///
  /// In ko, this message translates to:
  /// **'일이 마음의 속도를 너무 밀어붙였나 봐요.'**
  String get statsSummaryComfortWork;

  /// No description provided for @statsSummaryComfortPeople.
  ///
  /// In ko, this message translates to:
  /// **'사람 사이의 말과 표정은 생각보다 오래 남죠.'**
  String get statsSummaryComfortPeople;

  /// No description provided for @statsSummaryComfortDriving.
  ///
  /// In ko, this message translates to:
  /// **'도로 위 긴장은 몸에 먼저 쌓이곤 해요.'**
  String get statsSummaryComfortDriving;

  /// No description provided for @statsSummaryMetricCount.
  ///
  /// In ko, this message translates to:
  /// **'횟수'**
  String get statsSummaryMetricCount;

  /// No description provided for @statsSummaryMetricCategory.
  ///
  /// In ko, this message translates to:
  /// **'카테고리'**
  String get statsSummaryMetricCategory;

  /// No description provided for @statsSummaryMetricFeed.
  ///
  /// In ko, this message translates to:
  /// **'피드 공유'**
  String get statsSummaryMetricFeed;

  /// No description provided for @statsSummaryMetricCalm.
  ///
  /// In ko, this message translates to:
  /// **'진정 시도'**
  String get statsSummaryMetricCalm;

  /// No description provided for @statsSummaryMetricAverage.
  ///
  /// In ko, this message translates to:
  /// **'평균 강도'**
  String get statsSummaryMetricAverage;

  /// No description provided for @statsSummaryMetricPeak.
  ///
  /// In ko, this message translates to:
  /// **'최고 강도'**
  String get statsSummaryMetricPeak;

  /// No description provided for @statsSummaryConclusion.
  ///
  /// In ko, this message translates to:
  /// **'결론'**
  String get statsSummaryConclusion;

  /// No description provided for @statsSummaryRecordsUnit.
  ///
  /// In ko, this message translates to:
  /// **'{count}회'**
  String statsSummaryRecordsUnit(int count);

  /// No description provided for @statsSummaryAverageValue.
  ///
  /// In ko, this message translates to:
  /// **'{value}/5'**
  String statsSummaryAverageValue(String value);

  /// No description provided for @statsSummaryConclusionTop.
  ///
  /// In ko, this message translates to:
  /// **'가장 자주 반복된 감정 신호예요. 다음 기록에서는 화가 올라오기 전 몸의 긴장을 먼저 확인해봐요.'**
  String get statsSummaryConclusionTop;

  /// No description provided for @statsSummaryConclusionCategory.
  ///
  /// In ko, this message translates to:
  /// **'이 카테고리는 아직 작은 불씨일 때 적어두면 패턴을 더 빨리 알아차릴 수 있어요.'**
  String get statsSummaryConclusionCategory;

  /// No description provided for @statsSummaryPageIndicator.
  ///
  /// In ko, this message translates to:
  /// **'{current}/{total}'**
  String statsSummaryPageIndicator(int current, int total);

  /// No description provided for @statsSummaryCategoryShare.
  ///
  /// In ko, this message translates to:
  /// **'카테고리 비중'**
  String get statsSummaryCategoryShare;

  /// No description provided for @statsSummaryCalmRate.
  ///
  /// In ko, this message translates to:
  /// **'진정 비율'**
  String get statsSummaryCalmRate;

  /// No description provided for @statsSummaryShareRate.
  ///
  /// In ko, this message translates to:
  /// **'공유 비율'**
  String get statsSummaryShareRate;

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
  /// **'진정'**
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

  /// No description provided for @calmReminderEmpty.
  ///
  /// In ko, this message translates to:
  /// **'리마인드가 도착하면 여기 표시돼요'**
  String get calmReminderEmpty;

  /// No description provided for @calmReminderFallbackText.
  ///
  /// In ko, this message translates to:
  /// **'아까 그 분노, 지금은 어때요?'**
  String get calmReminderFallbackText;

  /// No description provided for @calmCheckTitle.
  ///
  /// In ko, this message translates to:
  /// **'지금 분노는 어때요?'**
  String get calmCheckTitle;

  /// No description provided for @calmCheckSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'{emoji} {label} · 아까의 그 분노'**
  String calmCheckSubtitle(String emoji, String label);

  /// No description provided for @calmSavedCalmedToast.
  ///
  /// In ko, this message translates to:
  /// **'잘 진정됐네요!'**
  String get calmSavedCalmedToast;

  /// No description provided for @calmSavedUpdatedToast.
  ///
  /// In ko, this message translates to:
  /// **'기록됐어요'**
  String get calmSavedUpdatedToast;

  /// No description provided for @profileName.
  ///
  /// In ko, this message translates to:
  /// **'화난 호랑이'**
  String get profileName;

  /// No description provided for @nicknameAdjectives.
  ///
  /// In ko, this message translates to:
  /// **'화난,격분한,분노한,폭발하는,사나운,으르렁대는,날카로운,뿔난,열받은,거친,맹렬한,폭주하는,불같은,천둥같은,씩씩대는,부글부글한,울분한,불꽃같은,폭풍같은,독기품은'**
  String get nicknameAdjectives;

  /// No description provided for @nicknameAnimals.
  ///
  /// In ko, this message translates to:
  /// **'호랑이,사자,늑대,곰,독수리,상어,표범,치타,악어,코브라,황소,멧돼지,코뿔소,하이에나,불곰,까마귀,매,고슴도치,재규어,퓨마'**
  String get nicknameAnimals;

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

  /// No description provided for @settingsNotificationsSection.
  ///
  /// In ko, this message translates to:
  /// **'알림'**
  String get settingsNotificationsSection;

  /// No description provided for @settingsReminderSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'설정한 시간에 분노 노트 알림'**
  String get settingsReminderSubtitle;

  /// No description provided for @settingsCommentSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'내 포스팅에 댓글이 달리면 알림'**
  String get settingsCommentSubtitle;

  /// No description provided for @settingsDataSection.
  ///
  /// In ko, this message translates to:
  /// **'데이터'**
  String get settingsDataSection;

  /// No description provided for @settingsDataImportSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'백업 파일로 기록 복원'**
  String get settingsDataImportSubtitle;

  /// No description provided for @settingsSupportSection.
  ///
  /// In ko, this message translates to:
  /// **'지원'**
  String get settingsSupportSection;

  /// No description provided for @settingsPrivacySubtitle.
  ///
  /// In ko, this message translates to:
  /// **'수집 정보 및 이용 목적 안내'**
  String get settingsPrivacySubtitle;

  /// No description provided for @settingsFeedbackTitle.
  ///
  /// In ko, this message translates to:
  /// **'피드백 보내기'**
  String get settingsFeedbackTitle;

  /// No description provided for @settingsFeedbackSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'불편한 점이나 개선 아이디어'**
  String get settingsFeedbackSubtitle;

  /// No description provided for @settingsRecordCountUnit.
  ///
  /// In ko, this message translates to:
  /// **'기록'**
  String get settingsRecordCountUnit;

  /// No description provided for @settingsPostCountUnit.
  ///
  /// In ko, this message translates to:
  /// **'포스팅'**
  String get settingsPostCountUnit;

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

  /// No description provided for @settingsDataExportSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'백업 파일 생성 · 히스토리 · 공유'**
  String get settingsDataExportSubtitle;

  /// No description provided for @dataExportTitle.
  ///
  /// In ko, this message translates to:
  /// **'데이터 내보내기'**
  String get dataExportTitle;

  /// No description provided for @dataExportProTitle.
  ///
  /// In ko, this message translates to:
  /// **'PRO 데이터 내보내기'**
  String get dataExportProTitle;

  /// No description provided for @dataExportDescription.
  ///
  /// In ko, this message translates to:
  /// **'앱의 모든 로컬 데이터를 하나의 백업 파일로 만들고 메일이나 메신저로 공유할 수 있어요.'**
  String get dataExportDescription;

  /// No description provided for @dataExportOneTimePurchase.
  ///
  /// In ko, this message translates to:
  /// **'1회 결제 · 영구 사용'**
  String get dataExportOneTimePurchase;

  /// No description provided for @dataExportDebugPrice.
  ///
  /// In ko, this message translates to:
  /// **'DEBUG'**
  String get dataExportDebugPrice;

  /// No description provided for @dataExportInProgress.
  ///
  /// In ko, this message translates to:
  /// **'내보내는 중'**
  String get dataExportInProgress;

  /// No description provided for @dataExportPaymentChecking.
  ///
  /// In ko, this message translates to:
  /// **'결제 확인 중'**
  String get dataExportPaymentChecking;

  /// No description provided for @dataExportCreateButton.
  ///
  /// In ko, this message translates to:
  /// **'내보내기 생성'**
  String get dataExportCreateButton;

  /// No description provided for @dataExportPayAndCreateButton.
  ///
  /// In ko, this message translates to:
  /// **'결제 후 내보내기'**
  String get dataExportPayAndCreateButton;

  /// No description provided for @dataExportRestorePurchase.
  ///
  /// In ko, this message translates to:
  /// **'구매 복원'**
  String get dataExportRestorePurchase;

  /// No description provided for @dataExportCreatedToast.
  ///
  /// In ko, this message translates to:
  /// **'내보내기 파일을 만들었어요.'**
  String get dataExportCreatedToast;

  /// No description provided for @dataExportFailedToast.
  ///
  /// In ko, this message translates to:
  /// **'내보내기 파일을 만들지 못했어요.'**
  String get dataExportFailedToast;

  /// No description provided for @dataExportShareSubject.
  ///
  /// In ko, this message translates to:
  /// **'Fury Note 데이터 백업'**
  String get dataExportShareSubject;

  /// No description provided for @dataExportShareText.
  ///
  /// In ko, this message translates to:
  /// **'Fury Note 데이터 백업 파일입니다.'**
  String get dataExportShareText;

  /// No description provided for @dataExportShareFailedToast.
  ///
  /// In ko, this message translates to:
  /// **'공유 화면을 열지 못했어요.'**
  String get dataExportShareFailedToast;

  /// No description provided for @dataExportAllDataIncluded.
  ///
  /// In ko, this message translates to:
  /// **'앱의 모든 로컬 데이터가 백업에 포함돼요'**
  String get dataExportAllDataIncluded;

  /// No description provided for @dataExportHistoryTitle.
  ///
  /// In ko, this message translates to:
  /// **'내보내기 히스토리'**
  String get dataExportHistoryTitle;

  /// No description provided for @dataExportHistoryCount.
  ///
  /// In ko, this message translates to:
  /// **'{count}개'**
  String dataExportHistoryCount(int count);

  /// No description provided for @dataExportShareTooltip.
  ///
  /// In ko, this message translates to:
  /// **'공유'**
  String get dataExportShareTooltip;

  /// No description provided for @dataExportEmptyHistory.
  ///
  /// In ko, this message translates to:
  /// **'아직 만든 내보내기 파일이 없어요.'**
  String get dataExportEmptyHistory;

  /// No description provided for @purchaseUpdateFailed.
  ///
  /// In ko, this message translates to:
  /// **'결제 업데이트를 처리하지 못했어요.'**
  String get purchaseUpdateFailed;

  /// No description provided for @purchaseStatusFailed.
  ///
  /// In ko, this message translates to:
  /// **'구매 상태를 확인하지 못했어요.'**
  String get purchaseStatusFailed;

  /// No description provided for @purchaseProductNotFound.
  ///
  /// In ko, this message translates to:
  /// **'스토어 상품을 찾지 못했어요.'**
  String get purchaseProductNotFound;

  /// No description provided for @purchaseStoreUnavailable.
  ///
  /// In ko, this message translates to:
  /// **'스토어에 연결할 수 없어요.'**
  String get purchaseStoreUnavailable;

  /// No description provided for @purchaseProductInfoFailed.
  ///
  /// In ko, this message translates to:
  /// **'스토어 상품 정보를 불러오지 못했어요.'**
  String get purchaseProductInfoFailed;

  /// No description provided for @purchaseProductUnavailable.
  ///
  /// In ko, this message translates to:
  /// **'구매할 상품 정보가 아직 없어요.'**
  String get purchaseProductUnavailable;

  /// No description provided for @purchaseStartFailed.
  ///
  /// In ko, this message translates to:
  /// **'결제를 시작하지 못했어요.'**
  String get purchaseStartFailed;

  /// No description provided for @purchaseCanceled.
  ///
  /// In ko, this message translates to:
  /// **'결제가 취소되었어요.'**
  String get purchaseCanceled;

  /// No description provided for @purchaseReceiptInvalid.
  ///
  /// In ko, this message translates to:
  /// **'구매 영수증을 확인하지 못했어요.'**
  String get purchaseReceiptInvalid;

  /// No description provided for @purchaseReceiptVerifyFailed.
  ///
  /// In ko, this message translates to:
  /// **'구매 영수증 검증에 실패했어요.'**
  String get purchaseReceiptVerifyFailed;

  /// No description provided for @dataImportTitle.
  ///
  /// In ko, this message translates to:
  /// **'데이터 가져오기'**
  String get dataImportTitle;

  /// No description provided for @dataImportPickTitle.
  ///
  /// In ko, this message translates to:
  /// **'백업 파일 선택'**
  String get dataImportPickTitle;

  /// No description provided for @dataImportPickDescription.
  ///
  /// In ko, this message translates to:
  /// **'Fury Note에서 내보낸\n.fnbackup 파일을 선택하세요'**
  String get dataImportPickDescription;

  /// No description provided for @dataImportPickButton.
  ///
  /// In ko, this message translates to:
  /// **'파일 선택하기'**
  String get dataImportPickButton;

  /// No description provided for @dataImportInProgress.
  ///
  /// In ko, this message translates to:
  /// **'가져오는 중'**
  String get dataImportInProgress;

  /// No description provided for @dataImportSuccessToast.
  ///
  /// In ko, this message translates to:
  /// **'백업 데이터로 교체했어요. ({count}개 기록)'**
  String dataImportSuccessToast(int count);

  /// No description provided for @dataImportNoNewDataToast.
  ///
  /// In ko, this message translates to:
  /// **'백업 데이터로 교체했어요. (0개 기록)'**
  String get dataImportNoNewDataToast;

  /// No description provided for @dataImportFailedToast.
  ///
  /// In ko, this message translates to:
  /// **'백업 파일을 가져오지 못했어요.'**
  String get dataImportFailedToast;

  /// No description provided for @dataImportInvalidFileToast.
  ///
  /// In ko, this message translates to:
  /// **'.fnbackup 파일만 가져올 수 있어요.'**
  String get dataImportInvalidFileToast;

  /// No description provided for @dataImportNoticeTitle.
  ///
  /// In ko, this message translates to:
  /// **'가져오기 전 주의사항'**
  String get dataImportNoticeTitle;

  /// No description provided for @dataImportNoticeBody.
  ///
  /// In ko, this message translates to:
  /// **'기존 데이터는 모두 삭제되고 백업 파일의 데이터로 교체돼요.'**
  String get dataImportNoticeBody;

  /// No description provided for @dataImportTransferTitle.
  ///
  /// In ko, this message translates to:
  /// **'기기 이전 시'**
  String get dataImportTransferTitle;

  /// No description provided for @dataImportTransferBody.
  ///
  /// In ko, this message translates to:
  /// **'새 기기에서 앱 설치 후 백업 파일을 가져오면 현재 로컬 데이터를 백업 데이터로 교체해요.'**
  String get dataImportTransferBody;

  /// No description provided for @feedDeleteTitle.
  ///
  /// In ko, this message translates to:
  /// **'피드 삭제'**
  String get feedDeleteTitle;

  /// No description provided for @feedDeleteContent.
  ///
  /// In ko, this message translates to:
  /// **'이 피드를 삭제할까요?'**
  String get feedDeleteContent;

  /// No description provided for @calmBreathingTitle.
  ///
  /// In ko, this message translates to:
  /// **'호흡 운동'**
  String get calmBreathingTitle;

  /// No description provided for @breathPhaseInhale.
  ///
  /// In ko, this message translates to:
  /// **'들이마시기'**
  String get breathPhaseInhale;

  /// No description provided for @breathPhaseHold.
  ///
  /// In ko, this message translates to:
  /// **'참기'**
  String get breathPhaseHold;

  /// No description provided for @breathPhaseExhale.
  ///
  /// In ko, this message translates to:
  /// **'내쉬기'**
  String get breathPhaseExhale;

  /// No description provided for @durationSeconds.
  ///
  /// In ko, this message translates to:
  /// **'{count}초'**
  String durationSeconds(int count);

  /// No description provided for @cycleCount.
  ///
  /// In ko, this message translates to:
  /// **'{count}회차'**
  String cycleCount(int count);

  /// No description provided for @calmTimeoutRunning.
  ///
  /// In ko, this message translates to:
  /// **'진행 중'**
  String get calmTimeoutRunning;

  /// No description provided for @calmTimeoutPaused.
  ///
  /// In ko, this message translates to:
  /// **'일시정지'**
  String get calmTimeoutPaused;

  /// No description provided for @reset.
  ///
  /// In ko, this message translates to:
  /// **'초기화'**
  String get reset;

  /// No description provided for @start.
  ///
  /// In ko, this message translates to:
  /// **'시작'**
  String get start;

  /// No description provided for @pause.
  ///
  /// In ko, this message translates to:
  /// **'일시정지'**
  String get pause;

  /// No description provided for @calmMeditationSceneWave.
  ///
  /// In ko, this message translates to:
  /// **'파도'**
  String get calmMeditationSceneWave;

  /// No description provided for @calmMeditationSceneForest.
  ///
  /// In ko, this message translates to:
  /// **'숲'**
  String get calmMeditationSceneForest;

  /// No description provided for @calmMeditationSceneSunset.
  ///
  /// In ko, this message translates to:
  /// **'일몰'**
  String get calmMeditationSceneSunset;

  /// No description provided for @calmMeditationSceneMountain.
  ///
  /// In ko, this message translates to:
  /// **'산'**
  String get calmMeditationSceneMountain;

  /// No description provided for @calmMeditationSceneCherryBlossom.
  ///
  /// In ko, this message translates to:
  /// **'벚꽃'**
  String get calmMeditationSceneCherryBlossom;

  /// No description provided for @calmMeditationSceneNightSky.
  ///
  /// In ko, this message translates to:
  /// **'밤하늘'**
  String get calmMeditationSceneNightSky;

  /// No description provided for @calmMeditationPrompt.
  ///
  /// In ko, this message translates to:
  /// **'깊게 숨을 들이마시고 내쉬세요'**
  String get calmMeditationPrompt;

  /// No description provided for @autoplay.
  ///
  /// In ko, this message translates to:
  /// **'자동 재생'**
  String get autoplay;

  /// No description provided for @profileEditTitle.
  ///
  /// In ko, this message translates to:
  /// **'프로필 수정'**
  String get profileEditTitle;

  /// No description provided for @nicknameLabel.
  ///
  /// In ko, this message translates to:
  /// **'닉네임'**
  String get nicknameLabel;

  /// No description provided for @nicknameHint.
  ///
  /// In ko, this message translates to:
  /// **'닉네임을 입력하세요'**
  String get nicknameHint;

  /// No description provided for @nicknameRequiredError.
  ///
  /// In ko, this message translates to:
  /// **'닉네임을 입력해주세요'**
  String get nicknameRequiredError;

  /// No description provided for @nicknameCodeAutomaticError.
  ///
  /// In ko, this message translates to:
  /// **'고유번호는 자동으로 붙어요'**
  String get nicknameCodeAutomaticError;

  /// No description provided for @nicknameTooShortError.
  ///
  /// In ko, this message translates to:
  /// **'2자 이상 입력해주세요'**
  String get nicknameTooShortError;

  /// No description provided for @profileSavedToast.
  ///
  /// In ko, this message translates to:
  /// **'✅ \"{name}\"으로 변경됐어요!'**
  String profileSavedToast(String name);

  /// No description provided for @profileSaveFailedToast.
  ///
  /// In ko, this message translates to:
  /// **'저장 중 오류가 발생했어요.'**
  String get profileSaveFailedToast;

  /// No description provided for @avatarPickGallery.
  ///
  /// In ko, this message translates to:
  /// **'앨범에서 선택'**
  String get avatarPickGallery;

  /// No description provided for @avatarPickCamera.
  ///
  /// In ko, this message translates to:
  /// **'카메라로 촬영'**
  String get avatarPickCamera;

  /// No description provided for @avatarReset.
  ///
  /// In ko, this message translates to:
  /// **'기본 아바타로 변경'**
  String get avatarReset;

  /// No description provided for @avatarResetToast.
  ///
  /// In ko, this message translates to:
  /// **'기본 아바타로 변경됐어요.'**
  String get avatarResetToast;

  /// No description provided for @avatarAppliedToast.
  ///
  /// In ko, this message translates to:
  /// **'프로필 사진이 적용됐어요.'**
  String get avatarAppliedToast;

  /// No description provided for @avatarTooLargeToast.
  ///
  /// In ko, this message translates to:
  /// **'5MB 이하의 사진만 사용할 수 있어요.'**
  String get avatarTooLargeToast;

  /// No description provided for @avatarLoadFailedToast.
  ///
  /// In ko, this message translates to:
  /// **'사진을 불러오지 못했어요.'**
  String get avatarLoadFailedToast;

  /// No description provided for @profileCodeLabel.
  ///
  /// In ko, this message translates to:
  /// **'고유번호 (변경 불가)'**
  String get profileCodeLabel;

  /// No description provided for @profileSaveButton.
  ///
  /// In ko, this message translates to:
  /// **'변경 저장'**
  String get profileSaveButton;

  /// No description provided for @avatarChangeLabel.
  ///
  /// In ko, this message translates to:
  /// **'프로필 사진 변경'**
  String get avatarChangeLabel;

  /// No description provided for @avatarChangeHint.
  ///
  /// In ko, this message translates to:
  /// **'사진을 탭해서 변경'**
  String get avatarChangeHint;

  /// No description provided for @avatarSizeHint.
  ///
  /// In ko, this message translates to:
  /// **'JPG, PNG, GIF · 최대 5MB'**
  String get avatarSizeHint;

  /// No description provided for @reminderNotificationFallbackBody.
  ///
  /// In ko, this message translates to:
  /// **'아까 그 분노, 지금은 어떤가요?'**
  String get reminderNotificationFallbackBody;

  /// No description provided for @calmGuideTitle.
  ///
  /// In ko, this message translates to:
  /// **'화가 올라올 때,\n먼저 몸을 안전하게 낮춰요'**
  String get calmGuideTitle;

  /// No description provided for @calmGuideSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'Fury Note의 진정 가이드는 분노를 없애라고 말하지 않습니다. 지금의 감정을 다치지 않게 지나가도록 돕는 짧은 안내입니다.'**
  String get calmGuideSubtitle;

  /// No description provided for @calmGuideNotice.
  ///
  /// In ko, this message translates to:
  /// **'**지금 당장 위험하다면** 앱을 계속 보기보다 주변 사람에게 도움을 요청하거나 긴급 신고를 먼저 해주세요.'**
  String get calmGuideNotice;

  /// No description provided for @calmGuideMomentTitle.
  ///
  /// In ko, this message translates to:
  /// **'분노가 올라오는 순간'**
  String get calmGuideMomentTitle;

  /// No description provided for @calmGuideMomentBody1.
  ///
  /// In ko, this message translates to:
  /// **'분노는 “내가 중요하게 여기는 것이 침해됐다”는 신호일 수 있습니다. 하지만 강한 분노 상태에서는 판단 속도가 빨라지고, 말과 행동이 평소보다 거칠어질 수 있습니다.'**
  String get calmGuideMomentBody1;

  /// No description provided for @calmGuideMomentBody2.
  ///
  /// In ko, this message translates to:
  /// **'지금 필요한 목표는 **이성적으로 완벽해지는 것**이 아니라 **30초라도 반응을 늦추는 것**입니다.'**
  String get calmGuideMomentBody2;

  /// No description provided for @calmGuideRoutineTitle.
  ///
  /// In ko, this message translates to:
  /// **'60초 진정 루틴'**
  String get calmGuideRoutineTitle;

  /// No description provided for @calmGuideStep1Title.
  ///
  /// In ko, this message translates to:
  /// **'멈추기'**
  String get calmGuideStep1Title;

  /// No description provided for @calmGuideStep1Desc.
  ///
  /// In ko, this message translates to:
  /// **'답장, 전화, 댓글, 이동을 잠깐 멈춥니다. 손에 힘을 빼고 화면에서 눈을 한 번 떼세요.'**
  String get calmGuideStep1Desc;

  /// No description provided for @calmGuideStep2Title.
  ///
  /// In ko, this message translates to:
  /// **'숨 고르기'**
  String get calmGuideStep2Title;

  /// No description provided for @calmGuideStep2Desc.
  ///
  /// In ko, this message translates to:
  /// **'4초 들이마시고, 7초 멈추고, 8초 내쉽니다. 완벽하지 않아도 괜찮습니다.'**
  String get calmGuideStep2Desc;

  /// No description provided for @calmGuideStep3Title.
  ///
  /// In ko, this message translates to:
  /// **'몸 확인하기'**
  String get calmGuideStep3Title;

  /// No description provided for @calmGuideStep3Desc.
  ///
  /// In ko, this message translates to:
  /// **'턱, 어깨, 주먹, 배에 힘이 들어갔는지 확인하고 한 곳만 풀어주세요.'**
  String get calmGuideStep3Desc;

  /// No description provided for @calmGuideStep4Title.
  ///
  /// In ko, this message translates to:
  /// **'기록하기'**
  String get calmGuideStep4Title;

  /// No description provided for @calmGuideStep4Desc.
  ///
  /// In ko, this message translates to:
  /// **'“지금 나는 ___ 때문에 화가 났다” 한 문장만 적어도 충분합니다.'**
  String get calmGuideStep4Desc;

  /// No description provided for @calmGuideBreathTitle.
  ///
  /// In ko, this message translates to:
  /// **'4-7-8 호흡법'**
  String get calmGuideBreathTitle;

  /// No description provided for @calmGuideBreathStep1.
  ///
  /// In ko, this message translates to:
  /// **'코로 4초 동안 숨을 들이마십니다.'**
  String get calmGuideBreathStep1;

  /// No description provided for @calmGuideBreathStep2.
  ///
  /// In ko, this message translates to:
  /// **'7초 동안 숨을 잠깐 멈춥니다.'**
  String get calmGuideBreathStep2;

  /// No description provided for @calmGuideBreathStep3.
  ///
  /// In ko, this message translates to:
  /// **'입으로 8초 동안 천천히 내쉽니다.'**
  String get calmGuideBreathStep3;

  /// No description provided for @calmGuideBreathStep4.
  ///
  /// In ko, this message translates to:
  /// **'가능하면 3번 반복합니다.'**
  String get calmGuideBreathStep4;

  /// No description provided for @calmGuideBreathNote.
  ///
  /// In ko, this message translates to:
  /// **'숨을 오래 참기 어렵다면 **3-3-5**처럼 편한 길이로 줄여도 됩니다. 중요한 것은 “천천히 내쉬는 시간”입니다.'**
  String get calmGuideBreathNote;

  /// No description provided for @calmGuideTimeoutTitle.
  ///
  /// In ko, this message translates to:
  /// **'10분 타임아웃'**
  String get calmGuideTimeoutTitle;

  /// No description provided for @calmGuideTimeoutBody.
  ///
  /// In ko, this message translates to:
  /// **'분노가 강할수록 바로 해결하려는 마음이 커집니다. 하지만 지금 대화하면 상처 주는 말이 먼저 나올 수 있습니다.'**
  String get calmGuideTimeoutBody;

  /// No description provided for @calmGuideTimeoutExamplesTitle.
  ///
  /// In ko, this message translates to:
  /// **'타임아웃 문장 예시'**
  String get calmGuideTimeoutExamplesTitle;

  /// No description provided for @calmGuideTimeoutExample1.
  ///
  /// In ko, this message translates to:
  /// **'“지금은 화가 커서 10분 뒤에 다시 말할게.”'**
  String get calmGuideTimeoutExample1;

  /// No description provided for @calmGuideTimeoutExample2.
  ///
  /// In ko, this message translates to:
  /// **'“상처 주는 말이 나올 것 같아서 잠깐 멈출게.”'**
  String get calmGuideTimeoutExample2;

  /// No description provided for @calmGuideTimeoutExample3.
  ///
  /// In ko, this message translates to:
  /// **'“도망가는 게 아니라 진정하고 다시 이야기하려는 거야.”'**
  String get calmGuideTimeoutExample3;

  /// No description provided for @calmGuideSensoryTitle.
  ///
  /// In ko, this message translates to:
  /// **'빠른 감각 안정법'**
  String get calmGuideSensoryTitle;

  /// No description provided for @calmGuideSensory1Title.
  ///
  /// In ko, this message translates to:
  /// **'차가운 물'**
  String get calmGuideSensory1Title;

  /// No description provided for @calmGuideSensory1Desc.
  ///
  /// In ko, this message translates to:
  /// **'손목이나 얼굴에 차가운 물을 10초 정도 대기'**
  String get calmGuideSensory1Desc;

  /// No description provided for @calmGuideSensory2Title.
  ///
  /// In ko, this message translates to:
  /// **'발바닥 느끼기'**
  String get calmGuideSensory2Title;

  /// No description provided for @calmGuideSensory2Desc.
  ///
  /// In ko, this message translates to:
  /// **'발이 바닥에 닿는 감각을 천천히 확인하기'**
  String get calmGuideSensory2Desc;

  /// No description provided for @calmGuideSensory3Title.
  ///
  /// In ko, this message translates to:
  /// **'주변 보기'**
  String get calmGuideSensory3Title;

  /// No description provided for @calmGuideSensory3Desc.
  ///
  /// In ko, this message translates to:
  /// **'보이는 물건 5개를 조용히 이름 붙이기'**
  String get calmGuideSensory3Desc;

  /// No description provided for @calmGuideSensory4Title.
  ///
  /// In ko, this message translates to:
  /// **'어깨 내리기'**
  String get calmGuideSensory4Title;

  /// No description provided for @calmGuideSensory4Desc.
  ///
  /// In ko, this message translates to:
  /// **'숨을 내쉬며 어깨를 1cm만 낮추기'**
  String get calmGuideSensory4Desc;

  /// No description provided for @calmGuideQuestionsTitle.
  ///
  /// In ko, this message translates to:
  /// **'기록할 때 도움이 되는 질문'**
  String get calmGuideQuestionsTitle;

  /// No description provided for @calmGuideQuestion1.
  ///
  /// In ko, this message translates to:
  /// **'내가 정말 화난 지점은 무엇이었나?'**
  String get calmGuideQuestion1;

  /// No description provided for @calmGuideQuestion2.
  ///
  /// In ko, this message translates to:
  /// **'내가 기대했지만 받지 못한 것은 무엇인가?'**
  String get calmGuideQuestion2;

  /// No description provided for @calmGuideQuestion3.
  ///
  /// In ko, this message translates to:
  /// **'지금 당장 하면 후회할 행동은 무엇인가?'**
  String get calmGuideQuestion3;

  /// No description provided for @calmGuideQuestion4.
  ///
  /// In ko, this message translates to:
  /// **'내일의 내가 고마워할 선택은 무엇인가?'**
  String get calmGuideQuestion4;

  /// No description provided for @calmGuideTag1.
  ///
  /// In ko, this message translates to:
  /// **'감정 기록'**
  String get calmGuideTag1;

  /// No description provided for @calmGuideTag2.
  ///
  /// In ko, this message translates to:
  /// **'분노 거리두기'**
  String get calmGuideTag2;

  /// No description provided for @calmGuideTag3.
  ///
  /// In ko, this message translates to:
  /// **'리마인드 확인'**
  String get calmGuideTag3;

  /// No description provided for @calmGuideDangerTitle.
  ///
  /// In ko, this message translates to:
  /// **'이런 경우에는 도움을 먼저 요청하세요'**
  String get calmGuideDangerTitle;

  /// No description provided for @calmGuideDanger1.
  ///
  /// In ko, this message translates to:
  /// **'나 자신이나 타인을 해치고 싶은 충동이 강할 때'**
  String get calmGuideDanger1;

  /// No description provided for @calmGuideDanger2.
  ///
  /// In ko, this message translates to:
  /// **'물건을 던지거나 부수고 싶은 충동이 멈추지 않을 때'**
  String get calmGuideDanger2;

  /// No description provided for @calmGuideDanger3.
  ///
  /// In ko, this message translates to:
  /// **'상대방을 찾아가거나 위협하고 싶은 생각이 들 때'**
  String get calmGuideDanger3;

  /// No description provided for @calmGuideDanger4.
  ///
  /// In ko, this message translates to:
  /// **'술, 약물, 극심한 수면 부족으로 통제가 어렵다고 느껴질 때'**
  String get calmGuideDanger4;

  /// No description provided for @calmGuideDangerBody.
  ///
  /// In ko, this message translates to:
  /// **'이 경우 진정 루틴만으로 버티려 하지 말고, 주변 사람·전문기관·긴급 서비스의 도움을 요청하세요.'**
  String get calmGuideDangerBody;

  /// No description provided for @calmGuideFooterTitle.
  ///
  /// In ko, this message translates to:
  /// **'Fury Note Calm Guide'**
  String get calmGuideFooterTitle;

  /// No description provided for @calmGuideFooterDisclaimer.
  ///
  /// In ko, this message translates to:
  /// **'이 문서는 의료적 진단이나 치료를 대체하지 않습니다.'**
  String get calmGuideFooterDisclaimer;

  /// No description provided for @privacyTitle.
  ///
  /// In ko, this message translates to:
  /// **'개인정보처리방침'**
  String get privacyTitle;

  /// No description provided for @privacyLastUpdated.
  ///
  /// In ko, this message translates to:
  /// **'시행일: 2026년 6월 16일'**
  String get privacyLastUpdated;

  /// No description provided for @privacySection1Title.
  ///
  /// In ko, this message translates to:
  /// **'1. 수집하는 개인정보의 항목'**
  String get privacySection1Title;

  /// No description provided for @privacySection1Body.
  ///
  /// In ko, this message translates to:
  /// **'Fury Note는 별도의 회원가입 절차 없이 이용할 수 있으며, 다음과 같은 정보를 수집합니다.\n\n· 기기 식별자 — 회원가입 없이 이용자를 식별하기 위하여 발급되는 임의의 값(부정 이용 방지 목적)\n· 분노 기록 데이터 — 강도, 카테고리, 텍스트(기기 내부에만 저장)\n· 익명 피드 게시물 — 닉네임, 아바타 이미지, 강도, 카테고리, 텍스트\n· 댓글 — 닉네임, 댓글 내용\n· 좋아요(공감) 처리 내역 — 게시물별 공감 여부\n· 푸시 알림 토큰 — 알림 발송 목적(선택 사항)'**
  String get privacySection1Body;

  /// No description provided for @privacySection2Title.
  ///
  /// In ko, this message translates to:
  /// **'2. 개인정보의 처리 목적'**
  String get privacySection2Title;

  /// No description provided for @privacySection2Body.
  ///
  /// In ko, this message translates to:
  /// **'· 익명 피드, 댓글, 좋아요 등 커뮤니티 기능의 제공\n· 동일 게시물에 대한 중복 공감 방지 등 부정 이용 탐지\n· 댓글 알림 등 푸시 알림의 발송\n· 서비스 운영 및 오류 분석'**
  String get privacySection2Body;

  /// No description provided for @privacySection3Title.
  ///
  /// In ko, this message translates to:
  /// **'3. 회원가입 및 개인정보 미보관에 관한 사항'**
  String get privacySection3Title;

  /// No description provided for @privacySection3Body.
  ///
  /// In ko, this message translates to:
  /// **'Fury Note는 회원가입 절차를 두지 아니하며, 성명, 이메일, 전화번호 등 실명 확인이 가능한 개인정보를 수집하지 아니합니다.\n\n닉네임은 자동으로 생성되거나 이용자가 직접 입력한 것으로 실명과 연계되지 아니하며, 기기 식별자 또한 특정 개인을 식별할 수 없는 임의의 값입니다.'**
  String get privacySection3Body;

  /// No description provided for @privacySection4Title.
  ///
  /// In ko, this message translates to:
  /// **'4. 개인정보의 제3자 제공'**
  String get privacySection4Title;

  /// No description provided for @privacySection4Body.
  ///
  /// In ko, this message translates to:
  /// **'수집한 정보는 제3자에게 제공하거나 판매하지 아니합니다.'**
  String get privacySection4Body;

  /// No description provided for @privacySection5Title.
  ///
  /// In ko, this message translates to:
  /// **'5. 개인정보의 보유 및 이용 기간'**
  String get privacySection5Title;

  /// No description provided for @privacySection5Body.
  ///
  /// In ko, this message translates to:
  /// **'· 저장만 한 분노 기록은 기기 내부에만 보관되며, 앱 삭제 시 함께 삭제됩니다.\n· 익명 피드에 게시한 게시물, 아바타, 댓글은 이용자가 삭제할 때까지 서버에 보관되며, 삭제를 요청하는 경우 즉시 삭제합니다.\n· 좋아요 처리 내역은 해당 게시물이 삭제되는 경우 함께 삭제됩니다.'**
  String get privacySection5Body;

  /// No description provided for @privacySection6Title.
  ///
  /// In ko, this message translates to:
  /// **'6. 문의처'**
  String get privacySection6Title;

  /// No description provided for @privacySection6Body.
  ///
  /// In ko, this message translates to:
  /// **'개인정보와 관련한 문의는 아래 이메일로 연락하여 주시기 바랍니다.\nlunlu.co.kr@gmail.com'**
  String get privacySection6Body;

  /// No description provided for @appGuideTitle.
  ///
  /// In ko, this message translates to:
  /// **'Fury Note 사용 가이드'**
  String get appGuideTitle;

  /// No description provided for @appGuideSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'분노를 기록하고, 통계로 패턴을 파악하고, 피드에서 공감받는 방법을 안내합니다.'**
  String get appGuideSubtitle;

  /// No description provided for @appGuideRecordTitle.
  ///
  /// In ko, this message translates to:
  /// **'분노 기록하기'**
  String get appGuideRecordTitle;

  /// No description provided for @appGuideRecordBody.
  ///
  /// In ko, this message translates to:
  /// **'화가 날 때 화면 하단 🔥 버튼을 탭해 기록을 시작하세요.'**
  String get appGuideRecordBody;

  /// No description provided for @appGuideRecordStep1.
  ///
  /// In ko, this message translates to:
  /// **'강도 선택: 이모지로 지금 화남 정도를 고르세요'**
  String get appGuideRecordStep1;

  /// No description provided for @appGuideRecordStep2.
  ///
  /// In ko, this message translates to:
  /// **'카테고리 선택: 원인을 하나 고르세요'**
  String get appGuideRecordStep2;

  /// No description provided for @appGuideRecordStep3.
  ///
  /// In ko, this message translates to:
  /// **'내용 작성: 무슨 일인지 적어요 (건너뛰기 가능)'**
  String get appGuideRecordStep3;

  /// No description provided for @appGuideRecordStep4.
  ///
  /// In ko, this message translates to:
  /// **'리마인드: 나중에 다시 보고 싶다면 시간을 설정하세요'**
  String get appGuideRecordStep4;

  /// No description provided for @appGuideRecordStep5.
  ///
  /// In ko, this message translates to:
  /// **'저장 또는 포스팅: 기록만 남기거나 피드에 공유하세요'**
  String get appGuideRecordStep5;

  /// No description provided for @appGuideFeedTitle.
  ///
  /// In ko, this message translates to:
  /// **'피드에서 공감받기'**
  String get appGuideFeedTitle;

  /// No description provided for @appGuideFeedBody.
  ///
  /// In ko, this message translates to:
  /// **'분노를 공유하면 비슷한 감정의 사람들과 연결될 수 있어요.'**
  String get appGuideFeedBody;

  /// No description provided for @appGuideFeedItem1.
  ///
  /// In ko, this message translates to:
  /// **'기록 저장 후 **익명**으로 피드에 포스팅할 수 있어요'**
  String get appGuideFeedItem1;

  /// No description provided for @appGuideFeedItem2.
  ///
  /// In ko, this message translates to:
  /// **'다른 사람의 포스팅에 공감하거나 댓글을 달 수 있어요'**
  String get appGuideFeedItem2;

  /// No description provided for @appGuideFeedItem3.
  ///
  /// In ko, this message translates to:
  /// **'내 포스팅은 언제든 삭제할 수 있어요'**
  String get appGuideFeedItem3;

  /// No description provided for @appGuideStatsTitle.
  ///
  /// In ko, this message translates to:
  /// **'내 감정 패턴 파악하기'**
  String get appGuideStatsTitle;

  /// No description provided for @appGuideStatsBody.
  ///
  /// In ko, this message translates to:
  /// **'통계 탭에서 내 분노 패턴을 돌아볼 수 있어요.'**
  String get appGuideStatsBody;

  /// No description provided for @appGuideStatsItem1.
  ///
  /// In ko, this message translates to:
  /// **'기간별 분노 강도 추이 그래프'**
  String get appGuideStatsItem1;

  /// No description provided for @appGuideStatsItem2.
  ///
  /// In ko, this message translates to:
  /// **'카테고리별 원인 분포 확인'**
  String get appGuideStatsItem2;

  /// No description provided for @appGuideStatsItem3.
  ///
  /// In ko, this message translates to:
  /// **'달력으로 날짜별 기록 보기'**
  String get appGuideStatsItem3;

  /// No description provided for @appGuideStatsItem4.
  ///
  /// In ko, this message translates to:
  /// **'분노 보고서로 카테고리별 패턴 분석'**
  String get appGuideStatsItem4;

  /// No description provided for @appGuideCalmTitle.
  ///
  /// In ko, this message translates to:
  /// **'감정 진정시키기'**
  String get appGuideCalmTitle;

  /// No description provided for @appGuideCalmBody.
  ///
  /// In ko, this message translates to:
  /// **'분노 기록 후 진정 탭에서 감정을 낮추는 방법을 시도해보세요.'**
  String get appGuideCalmBody;

  /// No description provided for @appGuideCalmItem1.
  ///
  /// In ko, this message translates to:
  /// **'리마인드 노트: 예약한 기록을 다시 확인해요'**
  String get appGuideCalmItem1;

  /// No description provided for @appGuideCalmItem2.
  ///
  /// In ko, this message translates to:
  /// **'호흡운동: 4-7-8 호흡법으로 마음을 안정시켜요'**
  String get appGuideCalmItem2;

  /// No description provided for @appGuideCalmItem3.
  ///
  /// In ko, this message translates to:
  /// **'타임아웃: 10분 타이머로 반응을 잠시 늦춰요'**
  String get appGuideCalmItem3;

  /// No description provided for @appGuideCalmItem4.
  ///
  /// In ko, this message translates to:
  /// **'이미지 명상: 자연 이미지로 감정을 전환해요'**
  String get appGuideCalmItem4;

  /// No description provided for @appGuideProfileTitle.
  ///
  /// In ko, this message translates to:
  /// **'닉네임과 프로필'**
  String get appGuideProfileTitle;

  /// No description provided for @appGuideProfileBody.
  ///
  /// In ko, this message translates to:
  /// **'햄버거 메뉴 > 설정에서 닉네임과 아바타를 바꿀 수 있어요.'**
  String get appGuideProfileBody;

  /// No description provided for @appGuideProfileItem1.
  ///
  /// In ko, this message translates to:
  /// **'닉네임: 직접 입력하거나 랜덤 생성'**
  String get appGuideProfileItem1;

  /// No description provided for @appGuideProfileItem2.
  ///
  /// In ko, this message translates to:
  /// **'아바타: 이모지로 나를 표현해요'**
  String get appGuideProfileItem2;

  /// No description provided for @appGuideNotificationTitle.
  ///
  /// In ko, this message translates to:
  /// **'알림 설정'**
  String get appGuideNotificationTitle;

  /// No description provided for @appGuideNotificationItem1.
  ///
  /// In ko, this message translates to:
  /// **'리마인드 알림: 설정한 시간에 분노 노트를 다시 확인해요'**
  String get appGuideNotificationItem1;

  /// No description provided for @appGuideNotificationItem2.
  ///
  /// In ko, this message translates to:
  /// **'댓글 알림: 내 포스팅에 댓글이 달리면 알림을 받아요'**
  String get appGuideNotificationItem2;

  /// No description provided for @appGuideNotificationHint.
  ///
  /// In ko, this message translates to:
  /// **'설정 > 알림에서 켜거나 끌 수 있어요'**
  String get appGuideNotificationHint;

  /// No description provided for @appGuideFooterTitle.
  ///
  /// In ko, this message translates to:
  /// **'Fury Note App Guide'**
  String get appGuideFooterTitle;
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

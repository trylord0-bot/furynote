// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Fury Note';

  @override
  String get appKoreanName => 'Fury Note';

  @override
  String get record => 'Record';

  @override
  String get feed => 'Feed';

  @override
  String get stats => 'Stats';

  @override
  String get calm => 'Calm';

  @override
  String get settings => 'Settings';

  @override
  String get drawerGuide => 'App guide';

  @override
  String get drawerCalmGuide => 'Calm guide';

  @override
  String get drawerVersion => 'Fury Note v1.0.0';

  @override
  String get menuTooltip => 'Menu';

  @override
  String drawerRecordCount(String count) {
    return '🔥 $count rage notes';
  }

  @override
  String get drawerSettingsSubtitle => 'Nickname · notifications';

  @override
  String get drawerGuideSubtitle => 'How to use Fury Note';

  @override
  String get drawerCalmGuideSubtitle => 'Calm cards · today\'s tips';

  @override
  String get relativeTimeJustNow => 'Just now';

  @override
  String relativeTimeMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes ago',
      one: '1 minute ago',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours ago',
      one: '1 hour ago',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days ago',
      one: '1 day ago',
    );
    return '$_temp0';
  }

  @override
  String dataSizeBytes(String value) {
    return '$value B';
  }

  @override
  String dataSizeKilobytes(String value) {
    return '$value KB';
  }

  @override
  String dataSizeMegabytes(String value) {
    return '$value MB';
  }

  @override
  String get recordTitle => 'Rage Record';

  @override
  String get stepIntensity => 'How angry are you now?';

  @override
  String get stepIntensitySub => 'Pick an emoji';

  @override
  String get stepCategory => 'What caused it?';

  @override
  String get stepCategorySub => 'Pick one category';

  @override
  String get stepText => 'What happened?';

  @override
  String get stepTextSub => 'You can skip this';

  @override
  String get stepReminder => 'Want to revisit later?';

  @override
  String get stepReminderSub => 'You can skip this';

  @override
  String get stepSave => 'Save this note?';

  @override
  String get stepSaveSub => 'You can post it after saving';

  @override
  String get stepPost => 'Share this feeling?';

  @override
  String get stepPostSub => 'It will be anonymous';

  @override
  String get voiceInput => 'Voice recording';

  @override
  String get next => 'Next';

  @override
  String get previous => 'Previous';

  @override
  String get skip => 'Skip';

  @override
  String get save => 'Save';

  @override
  String get saveNote => 'Save note';

  @override
  String get postIt => 'Post';

  @override
  String get saveOnly => 'Just save it';

  @override
  String get feedPostedToast => 'Sent to feed';

  @override
  String get recordPostedToast => 'Posted';

  @override
  String get recordSavedToast => 'Saved';

  @override
  String get commentPostedToast => 'Comment posted';

  @override
  String get commentSendFailedToast =>
      'Could not send the comment. Please try again.';

  @override
  String get commentDeleteTitle => 'Delete comment';

  @override
  String get commentDeleteContent => 'Delete this comment?';

  @override
  String commentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count comments',
      one: '1 comment',
    );
    return '$_temp0';
  }

  @override
  String get commentsEmpty => 'No comments yet\nBe the first to leave one 💬';

  @override
  String get commentInputHint => 'Write a comment...';

  @override
  String get apiErrorContentBlockedUrl =>
      'Posts with links cannot be submitted.';

  @override
  String get apiErrorContentBlockedSpam =>
      'Promotional text cannot be submitted.';

  @override
  String get apiErrorContentBlockedProfanity =>
      'Content containing profanity cannot be submitted.';

  @override
  String get apiErrorContentBlockedModeration =>
      'This content cannot be submitted.';

  @override
  String get apiErrorRateLimitExceeded => 'Please try again in a moment.';

  @override
  String get apiErrorInternal =>
      'A server error occurred. Please try again in a moment.';

  @override
  String get apiErrorInvalidRequest => 'Invalid request.';

  @override
  String get apiErrorForbidden => 'You do not have permission.';

  @override
  String get apiErrorPostNotFound => 'Post not found.';

  @override
  String get apiErrorCommentNotFound => 'Comment not found.';

  @override
  String get apiErrorSignatureRequired => 'Request signature is required.';

  @override
  String get apiErrorSignatureInvalid => 'Invalid request.';

  @override
  String get apiErrorSignatureExpired =>
      'The request expired. Please try again.';

  @override
  String get apiErrorSignatureReplay =>
      'This request has already been processed.';

  @override
  String get apiErrorUnknown => 'An unknown error occurred.';

  @override
  String get reminderNotification => 'Reminder notification';

  @override
  String get noReminder => 'Not set';

  @override
  String get summaryIntensity => 'Rage level';

  @override
  String get summaryCategory => 'Category';

  @override
  String get summaryText => 'Text';

  @override
  String get summaryReminder => 'Reminder';

  @override
  String get none => 'None';

  @override
  String get other => 'Other';

  @override
  String get family => 'Family';

  @override
  String get romance => 'Romance';

  @override
  String get work => 'Work';

  @override
  String get people => 'People';

  @override
  String get driving => 'Driving';

  @override
  String get custom => 'Custom';

  @override
  String get recordCustomCategoryHint => 'Enter a category';

  @override
  String get recordTextHint => 'Write it here';

  @override
  String get recordMicPermissionRequired =>
      'Microphone permission is required.';

  @override
  String recordVoiceStartFailed(String label) {
    return 'Could not start $label.';
  }

  @override
  String get recordVoiceStopRecording => 'Stop recording';

  @override
  String get recordVoiceRecordAgain => 'Record again';

  @override
  String get recordVoiceSaved => 'Voice recording saved.';

  @override
  String get recordAudioSummaryLabel => 'Voice';

  @override
  String get recordAudioIncluded => 'Recording included';

  @override
  String get recordSavingInProgress => 'Saving...';

  @override
  String get recordPostingInProgress => 'Sending...';

  @override
  String get recordSaveFailedToast =>
      'Could not save the note. Please try again.';

  @override
  String get recordProgressSemantics => 'Record progress';

  @override
  String get hourSuffix => 'h';

  @override
  String get minuteSuffix => 'm';

  @override
  String get reminderCustom => 'Custom';

  @override
  String get reminderIn30Minutes => 'In 30 minutes';

  @override
  String get reminderIn1Hour => 'In 1 hour';

  @override
  String get reminderIn2Hours => 'In 2 hours';

  @override
  String get reminderIn6Hours => 'In 6 hours';

  @override
  String get reminderTomorrow => 'Tomorrow';

  @override
  String get annoyed => 'Annoyed';

  @override
  String get angry => 'Angry';

  @override
  String get mad => 'Mad';

  @override
  String get furious => 'Furious';

  @override
  String get rage => 'Rage';

  @override
  String get calmed => 'Calm';

  @override
  String get feedTitle => 'Feed';

  @override
  String get feedSubtitle => 'Browse recent anger stories';

  @override
  String get feedAllTab => 'All feed';

  @override
  String get feedMineTab => 'My feed';

  @override
  String get feedLoadFailed => 'Could not load the feed.';

  @override
  String get feedEmptyMine =>
      'You have not posted to the feed yet.\nShare your first rage note!';

  @override
  String get feedEmptyAll =>
      'No feed posts yet.\nBe the first to share your anger!';

  @override
  String get feedPostFailedToast => 'Could not send to feed. Please try again.';

  @override
  String get like => 'Like';

  @override
  String get comment => 'Comment';

  @override
  String get retry => 'Try again';

  @override
  String get statsTitle => 'Rage Stats';

  @override
  String get statsSubtitle => 'See this week\'s emotional pattern';

  @override
  String get week => '1 week';

  @override
  String get month => '1 month';

  @override
  String get all => 'All';

  @override
  String get totalRecords => 'Records';

  @override
  String get highestLevel => 'Highest';

  @override
  String get dailyAverage => 'Daily avg.';

  @override
  String get decreaseRate => 'Decrease';

  @override
  String get statsIntensityTrend => 'Rage intensity trend';

  @override
  String get statsCategoryDistribution => 'Cause distribution';

  @override
  String get statsNoRecords => 'No records to show.';

  @override
  String get statsCalendarButtonTitle => 'View records by calendar';

  @override
  String get statsCalendarButtonSubtitle =>
      'Check and manage rage notes by date';

  @override
  String get statsCalendarTitle => 'View records by calendar';

  @override
  String get statsOtherCategory => 'Other';

  @override
  String selectedDateRecordsTitle(String date) {
    return '$date records';
  }

  @override
  String get noRecordsOnSelectedDate =>
      'No records were written on the selected date.';

  @override
  String get reminderAction => 'Reminder';

  @override
  String get play => 'Play';

  @override
  String get statsSummaryButtonTitle => 'View rage report';

  @override
  String get statsSummaryButtonSubtitle =>
      'Flip through your anger patterns by category';

  @override
  String get statsSummaryTitle => 'Rage Report';

  @override
  String get statsSummaryClose => 'Close';

  @override
  String get statsSummaryEmptyTitle => 'No records to summarize yet';

  @override
  String get statsSummaryEmptyBody =>
      'Once you add rage notes, category patterns will appear here.';

  @override
  String statsSummaryTopHeadline(String category) {
    return '\"$category\" made you angry most often';
  }

  @override
  String statsSummaryCategoryHeadline(String category) {
    return 'Looking at \"$category\"';
  }

  @override
  String get statsSummaryComfortGeneric => 'It\'s okay. That can happen.';

  @override
  String get statsSummaryComfortFamily =>
      'The closer someone is, the harder it can land.';

  @override
  String get statsSummaryComfortRomance =>
      'A precious relationship can make small moments feel sharper.';

  @override
  String get statsSummaryComfortWork =>
      'Work may have pushed your mind faster than it wanted to go.';

  @override
  String get statsSummaryComfortPeople =>
      'Words and expressions from others can linger longer than expected.';

  @override
  String get statsSummaryComfortDriving =>
      'Tension on the road often reaches the body first.';

  @override
  String get statsSummaryMetricCount => 'Count';

  @override
  String get statsSummaryMetricCategory => 'Category';

  @override
  String get statsSummaryMetricFeed => 'Feed posts';

  @override
  String get statsSummaryMetricCalm => 'Calm tries';

  @override
  String get statsSummaryMetricAverage => 'Avg. level';

  @override
  String get statsSummaryMetricPeak => 'Peak level';

  @override
  String get statsSummaryConclusion => 'Conclusion';

  @override
  String statsSummaryRecordsUnit(int count) {
    return '$count times';
  }

  @override
  String statsSummaryAverageValue(String value) {
    return '$value/5';
  }

  @override
  String get statsSummaryConclusionTop =>
      'This is your most repeated anger signal. Next time, try checking body tension before the anger rises fully.';

  @override
  String get statsSummaryConclusionCategory =>
      'Writing this category down while it is still small can help you notice the pattern sooner.';

  @override
  String statsSummaryPageIndicator(int current, int total) {
    return '$current/$total';
  }

  @override
  String get statsSummaryCategoryShare => 'Category share';

  @override
  String get statsSummaryCalmRate => 'Calm rate';

  @override
  String get statsSummaryShareRate => 'Share rate';

  @override
  String get noContent => 'No content';

  @override
  String get voicePlayback => 'Play voice';

  @override
  String get deleteConfirm => 'Delete?';

  @override
  String get delete => 'Delete';

  @override
  String get cancel => 'Cancel';

  @override
  String get calmTitle => 'Calm';

  @override
  String get calmSubtitle => 'Lower what is still lingering';

  @override
  String get reminderNotes => 'Reminder notes';

  @override
  String get breathing => 'Breathing';

  @override
  String get timeout => 'Timeout';

  @override
  String get meditation => 'Image meditation';

  @override
  String get feedSupport => 'Feed support';

  @override
  String get calmReminderEmpty => 'Reminders will appear here when they arrive';

  @override
  String get calmReminderFallbackText => 'How does that anger feel now?';

  @override
  String get calmCheckTitle => 'How angry are you now?';

  @override
  String calmCheckSubtitle(String emoji, String label) {
    return '$emoji $label · that earlier anger';
  }

  @override
  String get calmSavedCalmedToast => 'Glad you calmed down.';

  @override
  String get calmSavedUpdatedToast => 'Saved';

  @override
  String get profileName => 'Angry Tiger';

  @override
  String get nicknameAdjectives =>
      'angry,furious,raging,explosive,ferocious,growling,sharp,horned,heated,rough,fierce,rampaging,fiery,thunderous,huffing,boiling,resentful,blazing,stormy,venomous';

  @override
  String get nicknameAnimals =>
      'tiger,lion,wolf,bear,eagle,shark,leopard,cheetah,crocodile,cobra,bull,boar,rhino,hyena,grizzly,raven,hawk,hedgehog,jaguar,puma';

  @override
  String get notificationSettings => 'Notifications';

  @override
  String get commentNotification => 'Comment alerts';

  @override
  String get settingsNotificationsSection => 'Notifications';

  @override
  String get settingsReminderSubtitle =>
      'Rage note reminder at the time you set';

  @override
  String get settingsCommentSubtitle =>
      'Alert when someone comments on your post';

  @override
  String get settingsDataSection => 'Data';

  @override
  String get settingsDataImportSubtitle => 'Restore records from a backup file';

  @override
  String get settingsSupportSection => 'Support';

  @override
  String get settingsPrivacySubtitle =>
      'Collected information and purpose of use';

  @override
  String get settingsFeedbackTitle => 'Send feedback';

  @override
  String get settingsFeedbackSubtitle => 'Problems or improvement ideas';

  @override
  String get settingsRecordCountUnit => 'records';

  @override
  String get settingsPostCountUnit => 'posts';

  @override
  String get proPlan => 'PRO data export';

  @override
  String get backupImport => 'Import data';

  @override
  String get settingsDataExportSubtitle => 'Backup file · history · sharing';

  @override
  String get dataExportTitle => 'Export data';

  @override
  String get dataExportProTitle => 'PRO data export';

  @override
  String get dataExportDescription =>
      'Create one backup file with all local app data and share it by email or messenger.';

  @override
  String get dataExportOneTimePurchase => 'One-time purchase · lifetime access';

  @override
  String get dataExportDebugPrice => 'DEBUG';

  @override
  String get dataExportInProgress => 'Exporting';

  @override
  String get dataExportPaymentChecking => 'Checking payment';

  @override
  String get dataExportCreateButton => 'Create export';

  @override
  String get dataExportPayAndCreateButton => 'Pay and export';

  @override
  String get dataExportRestorePurchase => 'Restore purchase';

  @override
  String get dataExportCreatedToast => 'Export file created.';

  @override
  String get dataExportFailedToast => 'Could not create the export file.';

  @override
  String get dataExportShareSubject => 'Fury Note data backup';

  @override
  String get dataExportShareText => 'This is a Fury Note data backup file.';

  @override
  String get dataExportShareFailedToast => 'Could not open the share sheet.';

  @override
  String get dataExportAllDataIncluded =>
      'All local app data is included in the backup';

  @override
  String get dataExportHistoryTitle => 'Export history';

  @override
  String dataExportHistoryCount(int count) {
    return '$count';
  }

  @override
  String get dataExportShareTooltip => 'Share';

  @override
  String get dataExportEmptyHistory => 'No export files yet.';

  @override
  String get purchaseUpdateFailed => 'Could not process the purchase update.';

  @override
  String get purchaseStatusFailed => 'Could not check purchase status.';

  @override
  String get purchaseProductNotFound => 'Store product not found.';

  @override
  String get purchaseStoreUnavailable => 'Could not connect to the store.';

  @override
  String get purchaseProductInfoFailed =>
      'Could not load store product information.';

  @override
  String get purchaseProductUnavailable =>
      'Product information is not ready yet.';

  @override
  String get purchaseStartFailed => 'Could not start the purchase.';

  @override
  String get purchaseCanceled => 'Purchase was canceled.';

  @override
  String get purchaseReceiptInvalid => 'Could not verify the purchase receipt.';

  @override
  String get purchaseReceiptVerifyFailed =>
      'Purchase receipt verification failed.';

  @override
  String get dataImportTitle => 'Import data';

  @override
  String get dataImportPickTitle => 'Select backup file';

  @override
  String get dataImportPickDescription =>
      'Select a .fnbackup file\nexported from Fury Note';

  @override
  String get dataImportPickButton => 'Choose file';

  @override
  String get dataImportInProgress => 'Importing';

  @override
  String dataImportSuccessToast(int count) {
    return 'Replaced data from backup. ($count records)';
  }

  @override
  String get dataImportNoNewDataToast =>
      'Replaced data from backup. (0 records)';

  @override
  String get dataImportFailedToast => 'Could not import the backup file.';

  @override
  String get dataImportInvalidFileToast =>
      'Only .fnbackup files can be imported.';

  @override
  String get dataImportNoticeTitle => 'Before importing';

  @override
  String get dataImportNoticeBody =>
      'Existing data will be deleted and replaced with the data in the backup file.';

  @override
  String get dataImportTransferTitle => 'Moving devices';

  @override
  String get dataImportTransferBody =>
      'After installing the app on a new device, import a backup file to replace current local data with the backup data.';

  @override
  String get feedDeleteTitle => 'Delete Feed';

  @override
  String get feedDeleteContent => 'Delete this feed?';

  @override
  String get calmBreathingTitle => 'Breathing';

  @override
  String get breathPhaseInhale => 'Inhale';

  @override
  String get breathPhaseHold => 'Hold';

  @override
  String get breathPhaseExhale => 'Exhale';

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seconds',
      one: '1 second',
    );
    return '$_temp0';
  }

  @override
  String cycleCount(int count) {
    return 'Cycle $count';
  }

  @override
  String get calmTimeoutRunning => 'Running';

  @override
  String get calmTimeoutPaused => 'Paused';

  @override
  String get reset => 'Reset';

  @override
  String get start => 'Start';

  @override
  String get pause => 'Pause';

  @override
  String get stop => 'Stop';

  @override
  String get calmMeditationSceneWave => 'Waves';

  @override
  String get calmMeditationSceneForest => 'Forest';

  @override
  String get calmMeditationSceneSunset => 'Sunset';

  @override
  String get calmMeditationSceneMountain => 'Mountain';

  @override
  String get calmMeditationSceneCherryBlossom => 'Cherry blossoms';

  @override
  String get calmMeditationSceneNightSky => 'Night sky';

  @override
  String get calmMeditationPrompt => 'Breathe in deeply, then breathe out';

  @override
  String get autoplay => 'Auto play';

  @override
  String get profileEditTitle => 'Edit profile';

  @override
  String get nicknameLabel => 'Nickname';

  @override
  String get nicknameHint => 'Enter a nickname';

  @override
  String get nicknameRequiredError => 'Please enter a nickname';

  @override
  String get nicknameCodeAutomaticError => 'Your code is added automatically';

  @override
  String get nicknameTooShortError => 'Use at least 2 characters';

  @override
  String profileSavedToast(String name) {
    return '✅ Changed to \"$name\"!';
  }

  @override
  String get profileSaveFailedToast => 'An error occurred while saving.';

  @override
  String get avatarPickGallery => 'Choose from library';

  @override
  String get avatarPickCamera => 'Take a photo';

  @override
  String get avatarReset => 'Use default avatar';

  @override
  String get avatarResetToast => 'Default avatar restored.';

  @override
  String get avatarAppliedToast => 'Profile photo applied.';

  @override
  String get avatarTooLargeToast => 'Only photos up to 5 MB can be used.';

  @override
  String get avatarLoadFailedToast => 'Could not load the photo.';

  @override
  String get profileCodeLabel => 'Profile code (cannot be changed)';

  @override
  String get profileSaveButton => 'Save changes';

  @override
  String get avatarChangeLabel => 'Change profile photo';

  @override
  String get avatarChangeHint => 'Tap the photo to change it';

  @override
  String get avatarSizeHint => 'JPG, PNG, GIF · up to 5 MB';

  @override
  String get reminderNotificationFallbackBody =>
      'How does that anger feel now?';

  @override
  String get calmGuideTitle =>
      'When anger rises,\nlower your body safely first';

  @override
  String get calmGuideSubtitle =>
      'Fury Note\'s calm guide doesn\'t tell you to get rid of anger. It\'s a short guide to help the feeling pass without anyone getting hurt.';

  @override
  String get calmGuideNotice =>
      '**If you\'re in immediate danger**, please ask people around you for help or contact emergency services first, instead of staying on this app.';

  @override
  String get calmGuideMomentTitle => 'The moment anger rises';

  @override
  String get calmGuideMomentBody1 =>
      'Anger can be a signal that something you care about has been violated. But in a strong anger state, judgment speeds up, and words and actions can become rougher than usual.';

  @override
  String get calmGuideMomentBody2 =>
      'What\'s needed right now isn\'t to be **perfectly rational**, but to **delay your reaction by even 30 seconds**.';

  @override
  String get calmGuideRoutineTitle => '60-second calm routine';

  @override
  String get calmGuideStep1Title => 'Stop';

  @override
  String get calmGuideStep1Desc =>
      'Pause replying, calling, commenting, or moving. Relax your hands and look away from the screen for a moment.';

  @override
  String get calmGuideStep2Title => 'Breathe';

  @override
  String get calmGuideStep2Desc =>
      'Inhale for 4 seconds, hold for 7, exhale for 8. It\'s okay if it isn\'t perfect.';

  @override
  String get calmGuideStep3Title => 'Check your body';

  @override
  String get calmGuideStep3Desc =>
      'Check whether your jaw, shoulders, fists, or stomach are tense, and release just one spot.';

  @override
  String get calmGuideStep4Title => 'Write it down';

  @override
  String get calmGuideStep4Desc =>
      'Even one sentence like \"Right now I\'m angry because ___\" is enough.';

  @override
  String get calmGuideBreathTitle => '4-7-8 breathing';

  @override
  String get calmGuideBreathStep1 =>
      'Breathe in through your nose for 4 seconds.';

  @override
  String get calmGuideBreathStep2 => 'Hold your breath for 7 seconds.';

  @override
  String get calmGuideBreathStep3 =>
      'Slowly exhale through your mouth for 8 seconds.';

  @override
  String get calmGuideBreathStep4 => 'Repeat 3 times if you can.';

  @override
  String get calmGuideBreathNote =>
      'If holding your breath that long is hard, shorten it to a comfortable count like **3-3-5**. What matters most is a slow, long exhale.';

  @override
  String get calmGuideTimeoutTitle => '10-minute timeout';

  @override
  String get calmGuideTimeoutBody =>
      'The stronger the anger, the stronger the urge to resolve it right away. But talking now may bring out hurtful words first.';

  @override
  String get calmGuideTimeoutExamplesTitle => 'Example timeout phrases';

  @override
  String get calmGuideTimeoutExample1 =>
      '\"I\'m too angry right now, let\'s talk again in 10 minutes.\"';

  @override
  String get calmGuideTimeoutExample2 =>
      '\"I\'m pausing for a moment because I might say something hurtful.\"';

  @override
  String get calmGuideTimeoutExample3 =>
      '\"I\'m not running away, I just need to calm down before we talk again.\"';

  @override
  String get calmGuideSensoryTitle => 'Quick sensory grounding';

  @override
  String get calmGuideSensory1Title => 'Cold water';

  @override
  String get calmGuideSensory1Desc =>
      'Hold cold water on your wrists or face for about 10 seconds';

  @override
  String get calmGuideSensory2Title => 'Feel your feet';

  @override
  String get calmGuideSensory2Desc =>
      'Slowly notice the feeling of your feet touching the floor';

  @override
  String get calmGuideSensory3Title => 'Look around';

  @override
  String get calmGuideSensory3Desc => 'Quietly name 5 objects you can see';

  @override
  String get calmGuideSensory4Title => 'Drop your shoulders';

  @override
  String get calmGuideSensory4Desc =>
      'Exhale and lower your shoulders by just 1cm';

  @override
  String get calmGuideQuestionsTitle => 'Questions that help while writing';

  @override
  String get calmGuideQuestion1 => 'What exactly made me angry?';

  @override
  String get calmGuideQuestion2 => 'What did I expect but not receive?';

  @override
  String get calmGuideQuestion3 =>
      'What action would I regret if I did it right now?';

  @override
  String get calmGuideQuestion4 =>
      'What choice will tomorrow\'s me be grateful for?';

  @override
  String get calmGuideTag1 => 'Emotion log';

  @override
  String get calmGuideTag2 => 'Anger distancing';

  @override
  String get calmGuideTag3 => 'Reminder check';

  @override
  String get calmGuideDangerTitle => 'Ask for help first in these cases';

  @override
  String get calmGuideDanger1 =>
      'When the urge to hurt yourself or others feels strong';

  @override
  String get calmGuideDanger2 =>
      'When the urge to throw or break things won\'t stop';

  @override
  String get calmGuideDanger3 =>
      'When you feel like confronting or threatening the other person';

  @override
  String get calmGuideDanger4 =>
      'When alcohol, drugs, or severe sleep deprivation make it hard to stay in control';

  @override
  String get calmGuideDangerBody =>
      'In these cases, don\'t try to get through it with the calm routine alone — ask people around you, professional services, or emergency services for help.';

  @override
  String get calmGuideFooterTitle => 'Fury Note Calm Guide';

  @override
  String get calmGuideFooterDisclaimer =>
      'This document does not replace medical diagnosis or treatment.';

  @override
  String get privacyTitle => 'Privacy Policy';

  @override
  String get privacyLastUpdated => 'Effective Date: June 16, 2026';

  @override
  String get privacySection1Title => '1. Categories of Information Collected';

  @override
  String get privacySection1Body =>
      'Fury Note may be used without any membership registration. The Company collects only the following information.\n\n· Device identifier — a randomly issued value used to identify the user without registration, for the purpose of preventing fraudulent use\n· Rage record data — intensity, category, and text (stored on the device only)\n· Anonymous feed posts — nickname, avatar image, intensity, category, and text\n· Comments — nickname and comment text\n· Like records — whether the user has liked a given post\n· Push notification token — for the purpose of sending notifications (optional)';

  @override
  String get privacySection2Title => '2. Purpose of Processing';

  @override
  String get privacySection2Body =>
      '· Provision of community features, including the anonymous feed, comments, and likes\n· Detection of fraudulent use, including prevention of duplicate likes on the same post\n· Sending of push notifications, including comment alerts\n· Operation of the service and analysis of errors';

  @override
  String get privacySection3Title =>
      '3. No Membership Registration and No Retention of Personal Information';

  @override
  String get privacySection3Body =>
      'Fury Note does not require membership registration and does not collect identity-verifiable personal information such as name, email address, or phone number.\n\nThe nickname is either automatically generated or entered directly by the user and is not linked to the user\'s real identity. The device identifier is likewise a randomly generated value that cannot be used to identify a specific individual.';

  @override
  String get privacySection4Title =>
      '4. Provision of Information to Third Parties';

  @override
  String get privacySection4Body =>
      'The Company does not provide or sell collected information to third parties.';

  @override
  String get privacySection5Title =>
      '5. Retention and Use Period of Information';

  @override
  String get privacySection5Body =>
      '· Rage records that have only been saved are retained on the device only and are deleted together upon deletion of the app.\n· Posts, avatars, and comments shared to the anonymous feed are retained on the server until deleted by the user, and are deleted immediately upon such request.\n· Like records are deleted together upon deletion of the related post.';

  @override
  String get privacySection6Title => '6. Contact';

  @override
  String get privacySection6Body =>
      'For inquiries regarding personal information, please contact the email address below.\nlunlu.co.kr@gmail.com';

  @override
  String get appGuideTitle => 'How to use Fury Note';

  @override
  String get appGuideSubtitle =>
      'A guide to logging anger, tracking patterns, and getting support on the feed.';

  @override
  String get appGuideRecordTitle => 'Log your anger';

  @override
  String get appGuideRecordBody =>
      'When you\'re angry, tap the 🔥 button at the bottom to start a record.';

  @override
  String get appGuideRecordStep1 =>
      'Pick intensity: choose an emoji that matches how angry you are';

  @override
  String get appGuideRecordStep2 => 'Pick a category: choose one cause';

  @override
  String get appGuideRecordStep3 =>
      'Write it out: describe what happened (you can skip this)';

  @override
  String get appGuideRecordStep4 =>
      'Reminder: set a time if you want to revisit this later';

  @override
  String get appGuideRecordStep5 =>
      'Save or post: keep the record private or share it to the feed';

  @override
  String get appGuideFeedTitle => 'Find support on the feed';

  @override
  String get appGuideFeedBody =>
      'Sharing your anger can connect you with others feeling the same way.';

  @override
  String get appGuideFeedItem1 =>
      'After saving, you can post **anonymously** to the feed';

  @override
  String get appGuideFeedItem2 => 'Like or comment on other people\'s posts';

  @override
  String get appGuideFeedItem3 => 'You can delete your own post anytime';

  @override
  String get appGuideStatsTitle => 'Track your emotional patterns';

  @override
  String get appGuideStatsBody =>
      'The stats tab helps you look back at your anger patterns.';

  @override
  String get appGuideStatsItem1 => 'Rage intensity trend graph by period';

  @override
  String get appGuideStatsItem2 => 'Cause distribution by category';

  @override
  String get appGuideStatsItem3 => 'Calendar view to browse records by date';

  @override
  String get appGuideStatsItem4 =>
      'Rage report to analyze patterns by category';

  @override
  String get appGuideCalmTitle => 'Lower your anger';

  @override
  String get appGuideCalmBody =>
      'After logging, head to the calm tab to try bringing your emotion down.';

  @override
  String get appGuideCalmItem1 =>
      'Reminder notes: revisit records you flagged for later';

  @override
  String get appGuideCalmItem2 =>
      'Breathing: settle your mind with the 4-7-8 technique';

  @override
  String get appGuideCalmItem3 =>
      'Timeout: slow your reaction with a 10-minute timer';

  @override
  String get appGuideCalmItem4 =>
      'Image meditation: shift your mood with nature imagery';

  @override
  String get appGuideProfileTitle => 'Nickname and profile';

  @override
  String get appGuideProfileBody =>
      'Go to menu > Settings to change your nickname and avatar.';

  @override
  String get appGuideProfileItem1 =>
      'Nickname: type your own or generate one randomly';

  @override
  String get appGuideProfileItem2 => 'Avatar: represent yourself with an emoji';

  @override
  String get appGuideNotificationTitle => 'Notification settings';

  @override
  String get appGuideNotificationItem1 =>
      'Reminder alerts: get reminded of a rage note at the time you set';

  @override
  String get appGuideNotificationItem2 =>
      'Comment alerts: get notified when someone comments on your post';

  @override
  String get appGuideNotificationHint =>
      'Toggle these in Settings > Notifications';

  @override
  String get appGuideFooterTitle => 'Fury Note App Guide';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'Fury Note';

  @override
  String get appKoreanName => 'Fury Note';

  @override
  String get record => 'रिकॉर्ड';

  @override
  String get feed => 'फ़ीड';

  @override
  String get stats => 'आँकड़े';

  @override
  String get calm => 'शांत';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get drawerGuide => 'ऐप गाइड';

  @override
  String get drawerCalmGuide => 'शांत गाइड';

  @override
  String get drawerVersion => 'Fury Note v1.0.0';

  @override
  String get menuTooltip => 'मेन्यू';

  @override
  String drawerRecordCount(String count) {
    return '🔥 $count क्रोध नोट';
  }

  @override
  String get drawerSettingsSubtitle => 'उपनाम · सूचनाएं';

  @override
  String get drawerGuideSubtitle => 'Fury Note का उपयोग कैसे करें';

  @override
  String get drawerCalmGuideSubtitle => 'शांत कार्ड · आज की युक्तियाँ';

  @override
  String get relativeTimeJustNow => 'अभी अभी';

  @override
  String relativeTimeMinutesAgo(int count) {
    return '$count मिनट पहले';
  }

  @override
  String relativeTimeHoursAgo(int count) {
    return '$count घंटे पहले';
  }

  @override
  String relativeTimeDaysAgo(int count) {
    return '$count दिन पहले';
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
  String get recordTitle => 'गुस्से का रिकॉर्ड';

  @override
  String get stepIntensity => 'अब आप कितने गुस्से में हैं?';

  @override
  String get stepIntensitySub => 'एक इमोजी चुनें';

  @override
  String get stepCategory => 'इसका क्या कारण है?';

  @override
  String get stepCategorySub => 'एक श्रेणी चुनें';

  @override
  String get stepText => 'क्या हुआ?';

  @override
  String get stepTextSub => 'आप इसे छोड़ सकते हैं';

  @override
  String get stepReminder => 'क्या आप बाद में दोबारा आना चाहेंगे?';

  @override
  String get stepReminderSub => 'आप इसे छोड़ सकते हैं';

  @override
  String get stepSave => 'यह नोट सहेजें?';

  @override
  String get stepSaveSub => 'सेव करने के बाद आप इसे पोस्ट कर सकते हैं';

  @override
  String get stepPost => 'इस भावना को साझा करें?';

  @override
  String get stepPostSub => 'यह गुमनाम होगा';

  @override
  String get voiceInput => 'आवाज रिकार्डिंग';

  @override
  String get next => 'अगला';

  @override
  String get previous => 'पिछला';

  @override
  String get skip => 'छोड़ें';

  @override
  String get save => 'सहेजें';

  @override
  String get saveNote => 'नोट सहेजें';

  @override
  String get postIt => 'पोस्ट करें';

  @override
  String get saveOnly => 'केवल सहेजें';

  @override
  String get feedPostedToast => 'खिलाने के लिए भेजा';

  @override
  String get recordPostedToast => 'पोस्ट किया गया';

  @override
  String get recordSavedToast => 'सहेजा गया';

  @override
  String get commentPostedToast => 'टिप्पणी पोस्ट की गई';

  @override
  String get commentSendFailedToast =>
      'टिप्पणी नहीं भेज सका. कृपया पुन: प्रयास करें।';

  @override
  String get commentDeleteTitle => 'टिप्पणी हटाएँ';

  @override
  String get commentDeleteContent => 'यह टिप्पणी हटाएं?';

  @override
  String commentsCount(int count) {
    return '$count टिप्पणियाँ';
  }

  @override
  String get commentsEmpty =>
      'अभी तक कोई टिप्पणी नहीं\nकिसी को छोड़ने वाले पहले व्यक्ति बनें 💬';

  @override
  String get commentInputHint => 'एक टिप्पणी लिखें...';

  @override
  String get apiErrorContentBlockedUrl =>
      'लिंक वाले पोस्ट सबमिट नहीं किए जा सकते.';

  @override
  String get apiErrorContentBlockedSpam =>
      'प्रचार पाठ सबमिट नहीं किया जा सकता.';

  @override
  String get apiErrorContentBlockedProfanity =>
      'अपवित्रता वाली सामग्री प्रस्तुत नहीं की जा सकती।';

  @override
  String get apiErrorContentBlockedModeration =>
      'यह सामग्री सबमिट नहीं की जा सकती.';

  @override
  String get apiErrorRateLimitExceeded => 'कृपया एक क्षण में पुनः प्रयास करें.';

  @override
  String get apiErrorInternal =>
      'एक सर्वर त्रुटि उत्पन्न हुई. कृपया एक क्षण में पुनः प्रयास करें.';

  @override
  String get apiErrorInvalidRequest => 'अमान्य अनुरोध.';

  @override
  String get apiErrorForbidden => 'आपके पास अनुमति नहीं है.';

  @override
  String get apiErrorPostNotFound => 'पोस्ट नहीं मिली.';

  @override
  String get apiErrorCommentNotFound => 'टिप्पणी नहीं मिली.';

  @override
  String get apiErrorSignatureRequired => 'अनुरोध पर हस्ताक्षर आवश्यक है.';

  @override
  String get apiErrorSignatureInvalid => 'अमान्य अनुरोध.';

  @override
  String get apiErrorSignatureExpired =>
      'अनुरोध समाप्त हो गया. कृपया पुन: प्रयास करें।';

  @override
  String get apiErrorSignatureReplay =>
      'यह अनुरोध पहले ही संसाधित किया जा चुका है.';

  @override
  String get apiErrorUnknown => 'एक अज्ञात त्रुटि उत्पन्न हुई.';

  @override
  String get reminderNotification => 'अनुस्मारक अधिसूचना';

  @override
  String get noReminder => 'सेट नहीं';

  @override
  String get summaryIntensity => 'क्रोध का स्तर';

  @override
  String get summaryCategory => 'श्रेणी';

  @override
  String get summaryText => 'पाठ';

  @override
  String get summaryReminder => 'अनुस्मारक';

  @override
  String get none => 'कोई नहीं';

  @override
  String get other => 'अन्य';

  @override
  String get family => 'परिवार';

  @override
  String get romance => 'रोमांस';

  @override
  String get work => 'काम';

  @override
  String get people => 'लोग';

  @override
  String get driving => 'ड्राइविंग';

  @override
  String get custom => 'कस्टम';

  @override
  String get recordCustomCategoryHint => 'एक श्रेणी दर्ज करें';

  @override
  String get recordTextHint => 'इसे यहां लिखें';

  @override
  String get recordMicPermissionRequired => 'माइक्रोफ़ोन अनुमति आवश्यक है.';

  @override
  String recordVoiceStartFailed(String label) {
    return '$label प्रारंभ नहीं हो सका.';
  }

  @override
  String get recordVoiceStopRecording => 'रिकॉर्डिंग बंद करो';

  @override
  String get recordVoiceRecordAgain => 'फिर से रिकॉर्ड करें';

  @override
  String get recordVoiceSaved => 'ध्वनि रिकॉर्डिंग सहेजी गई.';

  @override
  String get recordAudioSummaryLabel => 'आवाज';

  @override
  String get recordAudioIncluded => 'रिकॉर्डिंग शामिल है';

  @override
  String get recordSavingInProgress => 'सहेजा जा रहा है...';

  @override
  String get recordPostingInProgress => 'भेजा जा रहा है...';

  @override
  String get recordSaveFailedToast =>
      'नोट सहेजा नहीं जा सका. कृपया पुन: प्रयास करें।';

  @override
  String get recordProgressSemantics => 'प्रगति रिकॉर्ड करें';

  @override
  String get hourSuffix => 'ज';

  @override
  String get minuteSuffix => 'एम';

  @override
  String get reminderCustom => 'कस्टम';

  @override
  String get reminderIn30Minutes => '30 मिनट में';

  @override
  String get reminderIn1Hour => '1 घंटे में';

  @override
  String get reminderIn2Hours => '2 घंटे में';

  @override
  String get reminderIn6Hours => '6 घंटे में';

  @override
  String get reminderTomorrow => 'कल';

  @override
  String get annoyed => 'नाराज़';

  @override
  String get angry => 'क्रोधित';

  @override
  String get mad => 'पागल';

  @override
  String get furious => 'उग्र';

  @override
  String get rage => 'क्रोध';

  @override
  String get calmed => 'शांत';

  @override
  String get feedTitle => 'फ़ीड';

  @override
  String get feedSubtitle => 'हाल की गुस्से वाली कहानियाँ देखें';

  @override
  String get feedAllTab => 'सभी फ़ीड';

  @override
  String get feedMineTab => 'मेरी फ़ीड';

  @override
  String get feedLoadFailed => 'फ़ीड लोड नहीं किया जा सका.';

  @override
  String get feedEmptyMine =>
      'आपने अभी तक फ़ीड पर पोस्ट नहीं किया है.\nअपना पहला क्रोध नोट साझा करें!';

  @override
  String get feedEmptyAll =>
      'अभी तक कोई फ़ीड पोस्ट नहीं.\nअपना गुस्सा साझा करने वाले पहले व्यक्ति बनें!';

  @override
  String get feedPostFailedToast =>
      'फ़ीड के लिए नहीं भेजा जा सका. कृपया पुन: प्रयास करें।';

  @override
  String get like => 'सहमति';

  @override
  String get comment => 'टिप्पणी';

  @override
  String get retry => 'फिर कोशिश करें';

  @override
  String get statsTitle => 'गुस्से के आँकड़े';

  @override
  String get statsSubtitle => 'देखिए इस हफ्ते का भावनात्मक पैटर्न';

  @override
  String get week => '1 सप्ताह';

  @override
  String get month => '1 महीना';

  @override
  String get all => 'सब';

  @override
  String get totalRecords => 'अभिलेख';

  @override
  String get highestLevel => 'उच्चतम';

  @override
  String get dailyAverage => 'दैनिक औसत.';

  @override
  String get decreaseRate => 'कमी';

  @override
  String get statsIntensityTrend => 'क्रोध की तीव्रता की प्रवृत्ति';

  @override
  String get statsCategoryDistribution => 'कारण वितरण';

  @override
  String get statsNoRecords => 'दिखाने के लिए कोई रिकॉर्ड नहीं.';

  @override
  String get statsCalendarButtonTitle => 'कैलेंडर के अनुसार रिकॉर्ड देखें';

  @override
  String get statsCalendarButtonSubtitle =>
      'दिनांक के अनुसार क्रोध नोट्स की जाँच करें और प्रबंधित करें';

  @override
  String get statsCalendarTitle => 'कैलेंडर के अनुसार रिकॉर्ड देखें';

  @override
  String get statsOtherCategory => 'अन्य';

  @override
  String selectedDateRecordsTitle(String date) {
    return '$date रिकॉर्ड';
  }

  @override
  String get noRecordsOnSelectedDate =>
      'चयनित तिथि पर कोई रिकार्ड नहीं लिखा गया।';

  @override
  String get reminderAction => 'अनुस्मारक';

  @override
  String get play => 'चलाएँ';

  @override
  String get statsSummaryButtonTitle => 'रोष रिपोर्ट देखें';

  @override
  String get statsSummaryButtonSubtitle =>
      'श्रेणी के अनुसार अपने गुस्से के पैटर्न को पलटें';

  @override
  String get statsSummaryTitle => 'रोष रिपोर्ट';

  @override
  String get statsSummaryClose => 'बंद करें';

  @override
  String get statsSummaryEmptyTitle =>
      'सारांशित करने के लिए अभी तक कोई रिकॉर्ड नहीं है';

  @override
  String get statsSummaryEmptyBody =>
      'एक बार जब आप क्रोध नोट्स जोड़ देंगे, तो श्रेणी पैटर्न यहां दिखाई देंगे।';

  @override
  String statsSummaryTopHeadline(String category) {
    return '\"$category\" ने आपको सबसे अधिक बार क्रोधित किया';
  }

  @override
  String statsSummaryCategoryHeadline(String category) {
    return '\"$category\" देख रहे हैं';
  }

  @override
  String get statsSummaryComfortGeneric => 'यह ठीक है. ऐसा हो सकता है.';

  @override
  String get statsSummaryComfortFamily =>
      'कोई व्यक्ति जितना करीब होगा, वह उतनी ही मजबूती से जमीन पर उतर सकता है।';

  @override
  String get statsSummaryComfortRomance =>
      'एक अनमोल रिश्ता छोटे-छोटे पलों को और भी मधुर बना सकता है।';

  @override
  String get statsSummaryComfortWork =>
      'हो सकता है कि काम ने आपके दिमाग को उसकी इच्छा से कहीं अधिक तेज़ कर दिया हो।';

  @override
  String get statsSummaryComfortPeople =>
      'दूसरों के शब्द और अभिव्यक्तियाँ अपेक्षा से अधिक समय तक टिक सकती हैं।';

  @override
  String get statsSummaryComfortDriving =>
      'सड़क पर तनाव अक्सर सबसे पहले शरीर तक पहुंचता है।';

  @override
  String get statsSummaryMetricCount => 'गिनती';

  @override
  String get statsSummaryMetricCategory => 'श्रेणी';

  @override
  String get statsSummaryMetricFeed => 'फ़ीड पोस्ट';

  @override
  String get statsSummaryMetricCalm => 'शांत प्रयास करता है';

  @override
  String get statsSummaryMetricAverage => 'औसत स्तर';

  @override
  String get statsSummaryMetricPeak => 'चरम स्तर';

  @override
  String get statsSummaryConclusion => 'निष्कर्ष';

  @override
  String statsSummaryRecordsUnit(int count) {
    return '$count बार';
  }

  @override
  String statsSummaryAverageValue(String value) {
    return '$value/5';
  }

  @override
  String get statsSummaryConclusionTop =>
      'यह आपका सबसे अधिक बार दोहराया जाने वाला क्रोध संकेत है। अगली बार, गुस्सा पूरी तरह बढ़ने से पहले शरीर का तनाव जाँचने का प्रयास करें।';

  @override
  String get statsSummaryConclusionCategory =>
      'इस श्रेणी को तब लिखने से जब यह अभी भी छोटी है, आपको पैटर्न पर जल्द ध्यान देने में मदद मिल सकती है।';

  @override
  String statsSummaryPageIndicator(int current, int total) {
    return '$current/$total';
  }

  @override
  String get statsSummaryCategoryShare => 'श्रेणी शेयर';

  @override
  String get statsSummaryCalmRate => 'शांत गति';

  @override
  String get statsSummaryShareRate => 'शेयर दर';

  @override
  String get noContent => 'कोई सामग्री नहीं';

  @override
  String get voicePlayback => 'आवाज बजाओ';

  @override
  String get deleteConfirm => 'हटाएं?';

  @override
  String get delete => 'हटाएँ';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get calmTitle => 'शांत';

  @override
  String get calmSubtitle => 'जो अभी भी बाकी है उसे कम करो';

  @override
  String get reminderNotes => 'अनुस्मारक नोट्स';

  @override
  String get breathing => 'साँस लेना';

  @override
  String get timeout => 'समयबाह्य';

  @override
  String get meditation => 'छवि ध्यान';

  @override
  String get feedSupport => 'फ़ीड समर्थन';

  @override
  String get calmReminderEmpty => 'उनके आने पर अनुस्मारक यहां दिखाई देंगे';

  @override
  String get calmReminderFallbackText => 'अब वह गुस्सा कैसा लगता है?';

  @override
  String get calmCheckTitle => 'अब आप कितने गुस्से में हैं?';

  @override
  String calmCheckSubtitle(String emoji, String label) {
    return '$emoji $label · वो पहले वाला गुस्सा';
  }

  @override
  String get calmSavedCalmedToast => 'ख़ुशी है कि आप शांत हो गये।';

  @override
  String get calmSavedUpdatedToast => 'सहेजा गया';

  @override
  String get profileName => 'गुस्से में टाइगर';

  @override
  String get nicknameAdjectives =>
      'क्रोधित, क्रुद्ध, प्रचंड, विस्फोटक, क्रूर, गुर्राता हुआ, तीखा, सींग वाला, गर्म, खुरदुरा, प्रचंड, प्रचंड, प्रचंड, गरजनेवाला, आवेशपूर्ण, उबलता हुआ, क्रोधित, धधकता हुआ, तूफ़ानी, विषैला';

  @override
  String get nicknameAnimals =>
      'बाघ, शेर, भेड़िया, भालू, ईगल, शार्क, तेंदुआ, चीता, मगरमच्छ, कोबरा, बैल, सूअर, गैंडा, लकड़बग्घा, ग्रिजली, रेवेन, बाज़, हेजहोग, जगुआर, प्यूमा';

  @override
  String get notificationSettings => 'सूचनाएं';

  @override
  String get commentNotification => 'टिप्पणी अलर्ट';

  @override
  String get settingsNotificationsSection => 'सूचनाएं';

  @override
  String get settingsReminderSubtitle =>
      'आपके द्वारा निर्धारित समय पर क्रोध नोट अनुस्मारक';

  @override
  String get settingsCommentSubtitle =>
      'जब कोई आपकी पोस्ट पर टिप्पणी करे तो अलर्ट करें';

  @override
  String get settingsDataSection => 'डेटा';

  @override
  String get settingsDataImportSubtitle =>
      'बैकअप फ़ाइल से रिकॉर्ड पुनर्स्थापित करें';

  @override
  String get settingsSupportSection => 'समर्थन';

  @override
  String get settingsPrivacySubtitle => 'एकत्रित जानकारी और उपयोग का उद्देश्य';

  @override
  String get settingsFeedbackTitle => 'प्रतिक्रिया भेजें';

  @override
  String get settingsFeedbackSubtitle => 'समस्याएँ या सुधार के विचार';

  @override
  String get settingsRecordCountUnit => 'अभिलेख';

  @override
  String get settingsPostCountUnit => 'पोस्ट';

  @override
  String get proPlan => 'प्रो डेटा निर्यात';

  @override
  String get backupImport => 'डेटा आयात करें';

  @override
  String get settingsDataExportSubtitle => 'बैकअप फ़ाइल · इतिहास · साझाकरण';

  @override
  String get dataExportTitle => 'डेटा निर्यात करें';

  @override
  String get dataExportProTitle => 'प्रो डेटा निर्यात';

  @override
  String get dataExportDescription =>
      'सभी स्थानीय ऐप डेटा के साथ एक बैकअप फ़ाइल बनाएं और इसे ईमेल या मैसेंजर द्वारा साझा करें।';

  @override
  String get dataExportOneTimePurchase => 'एक बार की खरीदारी · आजीवन पहुंच';

  @override
  String get dataExportDebugPrice => 'DEBUG';

  @override
  String get dataExportInProgress => 'निर्यात करना';

  @override
  String get dataExportPaymentChecking => 'भुगतान की जाँच की जा रही है';

  @override
  String get dataExportCreateButton => 'निर्यात बनाएं';

  @override
  String get dataExportPayAndCreateButton => 'भुगतान करें और निर्यात करें';

  @override
  String get dataExportRestorePurchase => 'खरीदारी बहाल करें';

  @override
  String get dataExportCreatedToast => 'निर्यात फ़ाइल बनाई गई.';

  @override
  String get dataExportFailedToast => 'निर्यात फ़ाइल नहीं बनाई जा सकी.';

  @override
  String get dataExportShareSubject => 'फ्यूरी नोट डेटा बैकअप';

  @override
  String get dataExportShareText => 'यह एक फ़्यूरी नोट डेटा बैकअप फ़ाइल है।';

  @override
  String get dataExportShareFailedToast => 'शेयर शीट नहीं खुल सकी.';

  @override
  String get dataExportAllDataIncluded =>
      'सभी स्थानीय ऐप डेटा बैकअप में शामिल है';

  @override
  String get dataExportHistoryTitle => 'निर्यात इतिहास';

  @override
  String dataExportHistoryCount(int count) {
    return '$count';
  }

  @override
  String get dataExportShareTooltip => 'साझा करें';

  @override
  String get dataExportEmptyHistory => 'अभी तक कोई निर्यात फ़ाइल नहीं.';

  @override
  String get purchaseUpdateFailed => 'खरीदारी अद्यतन संसाधित नहीं किया जा सका.';

  @override
  String get purchaseStatusFailed => 'खरीद स्थिति की जांच नहीं की जा सकी.';

  @override
  String get purchaseProductNotFound => 'स्टोर उत्पाद नहीं मिला.';

  @override
  String get purchaseStoreUnavailable => 'स्टोर से कनेक्ट नहीं हो सका.';

  @override
  String get purchaseProductInfoFailed =>
      'स्टोर उत्पाद जानकारी लोड नहीं की जा सकी.';

  @override
  String get purchaseProductUnavailable => 'उत्पाद जानकारी अभी तैयार नहीं है.';

  @override
  String get purchaseStartFailed => 'खरीदारी प्रारंभ नहीं हो सकी.';

  @override
  String get purchaseCanceled => 'खरीद रद्द कर दी गई.';

  @override
  String get purchaseReceiptInvalid => 'खरीद रसीद का सत्यापन नहीं किया जा सका.';

  @override
  String get purchaseReceiptVerifyFailed => 'खरीद रसीद सत्यापन विफल रहा.';

  @override
  String get dataImportTitle => 'डेटा आयात करें';

  @override
  String get dataImportPickTitle => 'बैकअप फ़ाइल का चयन करें';

  @override
  String get dataImportPickDescription =>
      'एक .fnbackup फ़ाइल चुनें\nफ्यूरी नोट से निर्यात किया गया';

  @override
  String get dataImportPickButton => 'फ़ाइल चुनें';

  @override
  String get dataImportInProgress => 'आयात करना';

  @override
  String dataImportSuccessToast(int count) {
    return 'बैकअप से बदला गया डेटा. ($count रिकॉर्ड)';
  }

  @override
  String get dataImportNoNewDataToast => 'बैकअप से बदला गया डेटा. (0 रिकॉर्ड)';

  @override
  String get dataImportFailedToast => 'बैकअप फ़ाइल आयात नहीं किया जा सका.';

  @override
  String get dataImportInvalidFileToast =>
      'केवल .fnbackup फ़ाइलें आयात की जा सकती हैं।';

  @override
  String get dataImportNoticeTitle => 'आयात करने से पहले';

  @override
  String get dataImportNoticeBody =>
      'मौजूदा डेटा हटा दिया जाएगा और बैकअप फ़ाइल में डेटा से बदल दिया जाएगा।';

  @override
  String get dataImportTransferTitle => 'चलती डिवाइस';

  @override
  String get dataImportTransferBody =>
      'किसी नए डिवाइस पर ऐप इंस्टॉल करने के बाद, वर्तमान स्थानीय डेटा को बैकअप डेटा से बदलने के लिए एक बैकअप फ़ाइल आयात करें।';

  @override
  String get feedDeleteTitle => 'फ़ीड हटाएँ';

  @override
  String get feedDeleteContent => 'यह फ़ीड हटाएं?';

  @override
  String get calmBreathingTitle => 'साँस लेना';

  @override
  String get breathPhaseInhale => 'श्वास लें';

  @override
  String get breathPhaseHold => 'पकड़ो';

  @override
  String get breathPhaseExhale => 'साँस छोड़ें';

  @override
  String durationSeconds(int count) {
    return '$count सेकंड';
  }

  @override
  String cycleCount(int count) {
    return 'साइकिल $count';
  }

  @override
  String get calmTimeoutRunning => 'चल रहा है';

  @override
  String get calmTimeoutPaused => 'रुका हुआ';

  @override
  String get reset => 'रीसेट';

  @override
  String get start => 'शुरू करें';

  @override
  String get pause => 'रोकें';

  @override
  String get stop => 'बंद करें';

  @override
  String get calmMeditationSceneWave => 'लहरें';

  @override
  String get calmMeditationSceneForest => 'वन';

  @override
  String get calmMeditationSceneSunset => 'सूर्यास्त';

  @override
  String get calmMeditationSceneMountain => 'पहाड़';

  @override
  String get calmMeditationSceneCherryBlossom => 'चेरी फूल';

  @override
  String get calmMeditationSceneNightSky => 'रात का आसमान';

  @override
  String get calmMeditationPrompt => 'गहरी सांस लें, फिर सांस छोड़ें';

  @override
  String get autoplay => 'ऑटो प्ले';

  @override
  String get profileEditTitle => 'प्रोफ़ाइल संपादित करें';

  @override
  String get nicknameLabel => 'उपनाम';

  @override
  String get nicknameHint => 'एक उपनाम दर्ज करें';

  @override
  String get nicknameRequiredError => 'कृपया एक उपनाम दर्ज करें';

  @override
  String get nicknameCodeAutomaticError =>
      'आपका कोड स्वचालित रूप से जुड़ जाता है';

  @override
  String get nicknameTooShortError => 'कम से कम 2 अक्षर का प्रयोग करें';

  @override
  String profileSavedToast(String name) {
    return '✅ \"$name\" में बदला गया!';
  }

  @override
  String get profileSaveFailedToast => 'सहेजते समय कोई त्रुटि उत्पन्न हुई.';

  @override
  String get avatarPickGallery => 'लाइब्रेरी से चुनें';

  @override
  String get avatarPickCamera => 'एक फोटो लें';

  @override
  String get avatarReset => 'डिफ़ॉल्ट अवतार का प्रयोग करें';

  @override
  String get avatarResetToast => 'डिफ़ॉल्ट अवतार पुनर्स्थापित किया गया.';

  @override
  String get avatarAppliedToast => 'प्रोफ़ाइल फ़ोटो लगाई गई.';

  @override
  String get avatarTooLargeToast =>
      'केवल 5 एमबी तक के फोटो का उपयोग किया जा सकता है।';

  @override
  String get avatarLoadFailedToast => 'फ़ोटो लोड नहीं हो सका.';

  @override
  String get profileCodeLabel => 'प्रोफ़ाइल कोड (बदला नहीं जा सकता)';

  @override
  String get profileSaveButton => 'परिवर्तन सहेजें';

  @override
  String get avatarChangeLabel => 'प्रोफ़ाइल फ़ोटो बदलें';

  @override
  String get avatarChangeHint => 'फ़ोटो को बदलने के लिए उस पर टैप करें';

  @override
  String get avatarSizeHint => 'जेपीजी, पीएनजी, जीआईएफ · 5 एमबी तक';

  @override
  String get reminderNotificationFallbackBody => 'अब वह गुस्सा कैसा लगता है?';

  @override
  String get calmGuideTitle =>
      'जब क्रोध बढ़ता है,\nपहले अपने शरीर को सुरक्षित रूप से नीचे लाएँ';

  @override
  String get calmGuideSubtitle =>
      'फ़्यूरी नोट का शांत मार्गदर्शक आपको क्रोध से छुटकारा पाने के लिए नहीं कहता है। यह किसी को चोट पहुंचाए बिना भावनाओं को दूर करने में मदद करने के लिए एक संक्षिप्त मार्गदर्शिका है।';

  @override
  String get calmGuideNotice =>
      '**यदि आप तत्काल खतरे में हैं**, तो कृपया इस ऐप पर बने रहने के बजाय, अपने आस-पास के लोगों से मदद मांगें या पहले आपातकालीन सेवाओं से संपर्क करें।';

  @override
  String get calmGuideMomentTitle => 'जिस क्षण क्रोध बढ़ता है';

  @override
  String get calmGuideMomentBody1 =>
      'गुस्सा इस बात का संकेत हो सकता है कि जिस चीज़ की आप परवाह करते हैं उसका उल्लंघन किया गया है। लेकिन तीव्र क्रोध की स्थिति में, निर्णय की गति तेज हो जाती है, और शब्द और कार्य सामान्य से अधिक कठोर हो सकते हैं।';

  @override
  String get calmGuideMomentBody2 =>
      'अभी जिस चीज़ की आवश्यकता है वह **पूरी तरह से तर्कसंगत** होने की नहीं है, बल्कि **अपनी प्रतिक्रिया को 30 सेकंड तक विलंबित करने की** है।';

  @override
  String get calmGuideRoutineTitle => '60 सेकंड की शांत दिनचर्या';

  @override
  String get calmGuideStep1Title => 'रुकें';

  @override
  String get calmGuideStep1Desc =>
      'उत्तर देना, कॉल करना, टिप्पणी करना या आगे बढ़ना रोकें। अपने हाथों को आराम दें और एक पल के लिए स्क्रीन से दूर देखें।';

  @override
  String get calmGuideStep2Title => 'साँस लें';

  @override
  String get calmGuideStep2Desc =>
      '4 सेकंड के लिए सांस लें, 7 सेकंड के लिए रोकें, 8 सेकंड के लिए सांस छोड़ें। अगर यह सही नहीं है तो कोई बात नहीं।';

  @override
  String get calmGuideStep3Title => 'अपने शरीर की जांच करें';

  @override
  String get calmGuideStep3Desc =>
      'जाँचें कि क्या आपके जबड़े, कंधे, मुट्ठियाँ या पेट तनावग्रस्त हैं, और केवल एक स्थान छोड़ें।';

  @override
  String get calmGuideStep4Title => 'इसे लिख लें';

  @override
  String get calmGuideStep4Desc =>
      'यहाँ तक कि \"अभी मैं क्रोधित हूँ क्योंकि ___\" जैसा एक वाक्य भी पर्याप्त है।';

  @override
  String get calmGuideBreathTitle => '4-7-8 श्वास';

  @override
  String get calmGuideBreathStep1 => '4 सेकंड के लिए अपनी नाक से सांस लें।';

  @override
  String get calmGuideBreathStep2 => '7 सेकंड के लिए अपनी सांस रोकें।';

  @override
  String get calmGuideBreathStep3 =>
      '8 सेकंड के लिए धीरे-धीरे अपने मुंह से सांस छोड़ें।';

  @override
  String get calmGuideBreathStep4 => 'यदि आप कर सकते हैं तो 3 बार दोहराएं।';

  @override
  String get calmGuideBreathNote =>
      'यदि अपनी सांस को इतनी देर तक रोके रखना कठिन है, तो इसे **3-3-5** जैसी आरामदायक गिनती तक छोटा करें। जो चीज सबसे ज्यादा मायने रखती है वह है धीमी, लंबी सांस छोड़ना।';

  @override
  String get calmGuideTimeoutTitle => '10 मिनट का टाइमआउट';

  @override
  String get calmGuideTimeoutBody =>
      'क्रोध जितना प्रबल होगा, उसे तुरंत हल करने की इच्छा भी उतनी ही प्रबल होगी। लेकिन अभी बात करने से पहले आहत करने वाले शब्द निकल सकते हैं।';

  @override
  String get calmGuideTimeoutExamplesTitle => 'उदाहरण टाइमआउट वाक्यांश';

  @override
  String get calmGuideTimeoutExample1 =>
      '\"मैं अभी बहुत गुस्से में हूं, 10 मिनट में फिर बात करते हैं।\"';

  @override
  String get calmGuideTimeoutExample2 =>
      '\"मैं एक पल के लिए रुक रहा हूं क्योंकि हो सकता है कि मैं कुछ दुख पहुंचाने वाली बात कहूं।\"';

  @override
  String get calmGuideTimeoutExample3 =>
      '\"मैं भाग नहीं रहा हूं, दोबारा बात करने से पहले मुझे बस शांत होने की जरूरत है।\"';

  @override
  String get calmGuideSensoryTitle => 'त्वरित संवेदी ग्राउंडिंग';

  @override
  String get calmGuideSensory1Title => 'ठंडा पानी';

  @override
  String get calmGuideSensory1Desc =>
      'अपनी कलाइयों या चेहरे पर लगभग 10 सेकंड तक ठंडा पानी रखें';

  @override
  String get calmGuideSensory2Title => 'अपने पैरों को महसूस करो';

  @override
  String get calmGuideSensory2Desc =>
      'धीरे-धीरे अपने पैरों के फर्श को छूने के अहसास पर ध्यान दें';

  @override
  String get calmGuideSensory3Title => 'चारों ओर देखो';

  @override
  String get calmGuideSensory3Desc =>
      'चुपचाप उन 5 वस्तुओं के नाम बताएं जिन्हें आप देख सकते हैं';

  @override
  String get calmGuideSensory4Title => 'अपने कंधे नीचे करो';

  @override
  String get calmGuideSensory4Desc =>
      'सांस छोड़ें और अपने कंधों को सिर्फ 1 सेमी नीचे करें';

  @override
  String get calmGuideQuestionsTitle => 'प्रश्न जो लिखते समय मदद करते हैं';

  @override
  String get calmGuideQuestion1 => 'वास्तव में किस बात ने मुझे क्रोधित किया?';

  @override
  String get calmGuideQuestion2 =>
      'मैंने क्या अपेक्षा की थी लेकिन प्राप्त नहीं हुआ?';

  @override
  String get calmGuideQuestion3 =>
      'यदि मैंने इसे अभी किया तो मुझे किस कार्य पर पछतावा होगा?';

  @override
  String get calmGuideQuestion4 => 'कल का मैं किस विकल्प के लिए आभारी रहूँगा?';

  @override
  String get calmGuideTag1 => 'भावना लॉग';

  @override
  String get calmGuideTag2 => 'क्रोध दूर करना';

  @override
  String get calmGuideTag3 => 'अनुस्मारक जांचें';

  @override
  String get calmGuideDangerTitle => 'इन मामलों में पहले मदद मांगें';

  @override
  String get calmGuideDanger1 =>
      'जब खुद को या दूसरों को चोट पहुंचाने की इच्छा प्रबल हो';

  @override
  String get calmGuideDanger2 =>
      'जब चीजों को फेंकने या तोड़ने की इच्छा होती है तो वह रुकती नहीं है';

  @override
  String get calmGuideDanger3 =>
      'जब आपका दूसरे व्यक्ति से मुकाबला करने या उसे धमकाने का मन हो';

  @override
  String get calmGuideDanger4 =>
      'जब शराब, नशीली दवाएं, या गंभीर नींद की कमी से नियंत्रण में रहना कठिन हो जाता है';

  @override
  String get calmGuideDangerBody =>
      'इन मामलों में, अकेले शांत दिनचर्या से इससे निपटने की कोशिश न करें - मदद के लिए अपने आस-पास के लोगों, पेशेवर सेवाओं या आपातकालीन सेवाओं से पूछें।';

  @override
  String get calmGuideFooterTitle => 'Fury Note Calm Guide';

  @override
  String get calmGuideFooterDisclaimer =>
      'यह दस्तावेज़ चिकित्सा निदान या उपचार को प्रतिस्थापित नहीं करता है।';

  @override
  String get privacyTitle => 'गोपनीयता नीति';

  @override
  String get privacyLastUpdated => 'प्रभावी तिथि: 16 जून, 2026';

  @override
  String get privacySection1Title => '1. एकत्रित सूचना की श्रेणियाँ';

  @override
  String get privacySection1Body =>
      'फ़्यूरी नोट का उपयोग बिना किसी सदस्यता पंजीकरण के किया जा सकता है। कंपनी केवल निम्नलिखित जानकारी एकत्र करती है।\n· डिवाइस पहचानकर्ता - धोखाधड़ी वाले उपयोग को रोकने के उद्देश्य से पंजीकरण के बिना उपयोगकर्ता की पहचान करने के लिए उपयोग किया जाने वाला एक यादृच्छिक रूप से जारी किया गया मूल्य\n· क्रोध रिकॉर्ड डेटा - तीव्रता, श्रेणी, और पाठ (केवल डिवाइस पर संग्रहीत)\n· अनाम फ़ीड पोस्ट - उपनाम, अवतार छवि, तीव्रता, श्रेणी और पाठ\n· टिप्पणियाँ - उपनाम और टिप्पणी पाठ\n· रिकॉर्ड पसंद करें - क्या उपयोगकर्ता को कोई पोस्ट पसंद आया है\n· पुश अधिसूचना टोकन - सूचनाएं भेजने के उद्देश्य से (वैकल्पिक)';

  @override
  String get privacySection2Title => '2. प्रसंस्करण का उद्देश्य';

  @override
  String get privacySection2Body =>
      '· अनाम फ़ीड, टिप्पणियाँ और पसंद सहित सामुदायिक सुविधाओं का प्रावधान\n· एक ही पोस्ट पर डुप्लिकेट लाइक की रोकथाम सहित धोखाधड़ी वाले उपयोग का पता लगाना\n· टिप्पणी अलर्ट सहित पुश सूचनाएं भेजना\n· सेवा का संचालन और त्रुटियों का विश्लेषण';

  @override
  String get privacySection3Title =>
      '3. कोई सदस्यता पंजीकरण नहीं और कोई व्यक्तिगत जानकारी नहीं रखी जाएगी';

  @override
  String get privacySection3Body =>
      'फ्यूरी नोट को सदस्यता पंजीकरण की आवश्यकता नहीं है और यह नाम, ईमेल पता या फोन नंबर जैसी पहचान-सत्यापन योग्य व्यक्तिगत जानकारी एकत्र नहीं करता है।\nउपनाम या तो स्वचालित रूप से उत्पन्न होता है या सीधे उपयोगकर्ता द्वारा दर्ज किया जाता है और यह उपयोगकर्ता की वास्तविक पहचान से जुड़ा नहीं होता है। डिवाइस पहचानकर्ता भी एक यादृच्छिक रूप से उत्पन्न मूल्य है जिसका उपयोग किसी विशिष्ट व्यक्ति की पहचान करने के लिए नहीं किया जा सकता है।';

  @override
  String get privacySection4Title => '4. तीसरे पक्ष को सूचना का प्रावधान';

  @override
  String get privacySection4Body =>
      'कंपनी एकत्रित जानकारी तीसरे पक्ष को उपलब्ध नहीं कराती या बेचती नहीं है।';

  @override
  String get privacySection5Title =>
      '5. सूचना को बनाए रखने और उपयोग करने की अवधि';

  @override
  String get privacySection5Body =>
      '· रेज रिकॉर्ड जो केवल सहेजे गए हैं वे केवल डिवाइस पर ही रखे जाते हैं और ऐप को हटाने पर एक साथ हटा दिए जाते हैं।\n· अनाम फ़ीड पर साझा किए गए पोस्ट, अवतार और टिप्पणियाँ उपयोगकर्ता द्वारा हटाए जाने तक सर्वर पर रखी जाती हैं, और ऐसे अनुरोध पर तुरंत हटा दी जाती हैं।\n· संबंधित पोस्ट को हटाने पर समान रिकॉर्ड एक साथ हटा दिए जाते हैं।';

  @override
  String get privacySection6Title => '6. संपर्क करें';

  @override
  String get privacySection6Body =>
      'व्यक्तिगत जानकारी के संबंध में पूछताछ के लिए कृपया नीचे दिए गए ईमेल पते पर संपर्क करें।\nlunlu.co.kr@gmail.com';

  @override
  String get appGuideTitle => 'फ़्यूरी नोट का उपयोग कैसे करें';

  @override
  String get appGuideSubtitle =>
      'क्रोध को लॉग करने, पैटर्न पर नज़र रखने और फ़ीड पर समर्थन प्राप्त करने के लिए एक मार्गदर्शिका।';

  @override
  String get appGuideRecordTitle => 'अपना गुस्सा लॉग करें';

  @override
  String get appGuideRecordBody =>
      'जब आप क्रोधित हों, तो रिकॉर्ड शुरू करने के लिए नीचे 🔥 बटन पर टैप करें।';

  @override
  String get appGuideRecordStep1 =>
      'तीव्रता चुनें: ऐसा इमोजी चुनें जो आपके गुस्से से मेल खाता हो';

  @override
  String get appGuideRecordStep2 => 'एक श्रेणी चुनें: एक कारण चुनें';

  @override
  String get appGuideRecordStep3 =>
      'इसे लिखें: जो हुआ उसका वर्णन करें (आप इसे छोड़ सकते हैं)';

  @override
  String get appGuideRecordStep4 =>
      'अनुस्मारक: यदि आप इसे बाद में दोबारा देखना चाहते हैं तो एक समय निर्धारित करें';

  @override
  String get appGuideRecordStep5 =>
      'सहेजें या पोस्ट करें: रिकॉर्ड को निजी रखें या फ़ीड पर साझा करें';

  @override
  String get appGuideFeedTitle => 'फ़ीड पर समर्थन ढूंढें';

  @override
  String get appGuideFeedBody =>
      'अपना गुस्सा साझा करने से आप दूसरों के साथ भी वैसी ही भावना जोड़ सकते हैं।';

  @override
  String get appGuideFeedItem1 =>
      'सहेजने के बाद, आप फ़ीड पर **अनाम रूप से** पोस्ट कर सकते हैं';

  @override
  String get appGuideFeedItem2 =>
      'अन्य लोगों की पोस्ट को लाइक करें या उस पर टिप्पणी करें';

  @override
  String get appGuideFeedItem3 => 'आप कभी भी अपना पोस्ट डिलीट कर सकते हैं';

  @override
  String get appGuideStatsTitle => 'अपने भावनात्मक पैटर्न को ट्रैक करें';

  @override
  String get appGuideStatsBody =>
      'आँकड़े टैब आपको अपने गुस्से के पैटर्न को देखने में मदद करता है।';

  @override
  String get appGuideStatsItem1 =>
      'अवधि के अनुसार क्रोध की तीव्रता की प्रवृत्ति का ग्राफ';

  @override
  String get appGuideStatsItem2 => 'श्रेणी के अनुसार वितरण का कारण';

  @override
  String get appGuideStatsItem3 =>
      'दिनांक के अनुसार रिकॉर्ड ब्राउज़ करने के लिए कैलेंडर दृश्य';

  @override
  String get appGuideStatsItem4 =>
      'श्रेणी के आधार पर पैटर्न का विश्लेषण करने के लिए रेज रिपोर्ट';

  @override
  String get appGuideCalmTitle => 'अपना गुस्सा कम करें';

  @override
  String get appGuideCalmBody =>
      'लॉग इन करने के बाद, अपनी भावनाओं को कम करने का प्रयास करने के लिए शांत टैब पर जाएं।';

  @override
  String get appGuideCalmItem1 =>
      'अनुस्मारक नोट: आपके द्वारा बाद के लिए चिह्नित किए गए रिकॉर्ड को दोबारा देखें';

  @override
  String get appGuideCalmItem2 => 'श्वास: 4-7-8 तकनीक से अपने मन को स्थिर करें';

  @override
  String get appGuideCalmItem3 =>
      'टाइमआउट: 10 मिनट के टाइमर के साथ अपनी प्रतिक्रिया धीमी करें';

  @override
  String get appGuideCalmItem4 =>
      'छवि ध्यान: प्रकृति चित्रण के साथ अपना मूड बदलें';

  @override
  String get appGuideProfileTitle => 'उपनाम और प्रोफ़ाइल';

  @override
  String get appGuideProfileBody =>
      'अपना उपनाम और अवतार बदलने के लिए मेनू > सेटिंग्स पर जाएँ।';

  @override
  String get appGuideProfileItem1 =>
      'उपनाम: अपना खुद का टाइप करें या यादृच्छिक रूप से एक उत्पन्न करें';

  @override
  String get appGuideProfileItem2 =>
      'अवतार: इमोजी के साथ स्वयं का प्रतिनिधित्व करें';

  @override
  String get appGuideNotificationTitle => 'अधिसूचना सेटिंग्स';

  @override
  String get appGuideNotificationItem1 =>
      'अनुस्मारक अलर्ट: आपके द्वारा निर्धारित समय पर एक क्रोध नोट की याद दिलाएँ';

  @override
  String get appGuideNotificationItem2 =>
      'टिप्पणी अलर्ट: जब कोई आपकी पोस्ट पर टिप्पणी करे तो सूचना प्राप्त करें';

  @override
  String get appGuideNotificationHint =>
      'इन्हें सेटिंग्स > नोटिफिकेशन में टॉगल करें';

  @override
  String get appGuideFooterTitle => 'Fury Note App Guide';
}

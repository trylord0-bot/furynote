// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'Fury Note';

  @override
  String get appKoreanName => 'Fury Note';

  @override
  String get record => 'سجل';

  @override
  String get feed => 'الخلاصة';

  @override
  String get stats => 'الإحصاءات';

  @override
  String get calm => 'تهدئة';

  @override
  String get settings => 'الإعدادات';

  @override
  String get drawerGuide => 'دليل التطبيق';

  @override
  String get drawerCalmGuide => 'دليل التهدئة';

  @override
  String get drawerVersion => 'Fury Note v1.0.0';

  @override
  String get menuTooltip => 'القائمة';

  @override
  String drawerRecordCount(String count) {
    return '🔥 $count ملاحظات الغضب';
  }

  @override
  String get drawerSettingsSubtitle => 'اللقب · الإخطارات';

  @override
  String get drawerGuideSubtitle => 'كيفية استخدام Fury Note';

  @override
  String get drawerCalmGuideSubtitle => 'بطاقات تهدئة · نصائح اليوم';

  @override
  String get relativeTimeJustNow => 'الآن فقط';

  @override
  String relativeTimeMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'منذ $count دقيقة',
      many: 'منذ $count دقيقة',
      few: 'منذ $count دقائق',
      two: 'منذ دقيقتين',
      one: 'منذ دقيقة',
      zero: 'الآن',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'منذ $count ساعة',
      many: 'منذ $count ساعة',
      few: 'منذ $count ساعات',
      two: 'منذ ساعتين',
      one: 'منذ ساعة',
      zero: 'الآن',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'منذ $count يوم',
      many: 'منذ $count يومًا',
      few: 'منذ $count أيام',
      two: 'منذ يومين',
      one: 'منذ يوم',
      zero: 'اليوم',
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
  String get recordTitle => 'سجل الغضب';

  @override
  String get stepIntensity => 'ما مدى غضبك الآن؟';

  @override
  String get stepIntensitySub => 'اختر رمزًا تعبيريًا';

  @override
  String get stepCategory => 'ما سبب ذلك؟';

  @override
  String get stepCategorySub => 'اختر فئة واحدة';

  @override
  String get stepText => 'ماذا حدث؟';

  @override
  String get stepTextSub => 'يمكنك تخطي هذا';

  @override
  String get stepReminder => 'هل تريد العودة لاحقا؟';

  @override
  String get stepReminderSub => 'يمكنك تخطي هذا';

  @override
  String get stepSave => 'هل تريد حفظ هذه الملاحظة؟';

  @override
  String get stepSaveSub => 'يمكنك نشره بعد الحفظ';

  @override
  String get stepPost => 'مشاركة هذا الشعور؟';

  @override
  String get stepPostSub => 'سيكون مجهولا';

  @override
  String get voiceInput => 'تسجيل صوتي';

  @override
  String get next => 'التالي';

  @override
  String get previous => 'السابق';

  @override
  String get skip => 'تخطي';

  @override
  String get save => 'حفظ';

  @override
  String get saveNote => 'حفظ الملاحظة';

  @override
  String get postIt => 'نشر';

  @override
  String get saveOnly => 'حفظ فقط';

  @override
  String get feedPostedToast => 'أرسلت للتغذية';

  @override
  String get recordPostedToast => 'نشر';

  @override
  String get recordSavedToast => 'تم الحفظ';

  @override
  String get commentPostedToast => 'تم نشر التعليق';

  @override
  String get commentSendFailedToast =>
      'لا يمكن إرسال التعليق. يرجى المحاولة مرة أخرى.';

  @override
  String get commentDeleteTitle => 'حذف التعليق';

  @override
  String get commentDeleteContent => 'هل تريد حذف هذا التعليق؟';

  @override
  String commentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تعليق',
      many: '$count تعليقًا',
      few: '$count تعليقات',
      two: 'تعليقان',
      one: 'تعليق واحد',
      zero: 'لا تعليقات',
    );
    return '$_temp0';
  }

  @override
  String get commentsEmpty =>
      'لا توجد تعليقات حتى الآن\nكن أول من يترك واحدة 💬';

  @override
  String get commentInputHint => 'أكتب تعليق...';

  @override
  String get apiErrorContentBlockedUrl =>
      'لا يمكن تقديم المشاركات التي تحتوي على روابط.';

  @override
  String get apiErrorContentBlockedSpam => 'لا يمكن تقديم النص الترويجي.';

  @override
  String get apiErrorContentBlockedProfanity =>
      'لا يمكن تقديم المحتوى الذي يحتوي على لغة نابية.';

  @override
  String get apiErrorContentBlockedModeration => 'لا يمكن تقديم هذا المحتوى.';

  @override
  String get apiErrorRateLimitExceeded => 'الرجاء المحاولة مرة أخرى في لحظة.';

  @override
  String get apiErrorInternal =>
      'حدث خطأ في الخادم. الرجاء المحاولة مرة أخرى في لحظة.';

  @override
  String get apiErrorInvalidRequest => 'طلب غير صالح.';

  @override
  String get apiErrorForbidden => 'ليس لديك إذن.';

  @override
  String get apiErrorPostNotFound => 'لم يتم العثور على آخر.';

  @override
  String get apiErrorCommentNotFound => 'لم يتم العثور على التعليق.';

  @override
  String get apiErrorSignatureRequired => 'توقيع الطلب مطلوب.';

  @override
  String get apiErrorSignatureInvalid => 'طلب غير صالح.';

  @override
  String get apiErrorSignatureExpired =>
      'انتهت صلاحية الطلب. يرجى المحاولة مرة أخرى.';

  @override
  String get apiErrorSignatureReplay => 'لقد تمت معالجة هذا الطلب بالفعل.';

  @override
  String get apiErrorUnknown => 'حدث خطأ غير معروف.';

  @override
  String get reminderNotification => 'إشعار تذكير';

  @override
  String get noReminder => 'لم يتم ضبطه';

  @override
  String get summaryIntensity => 'مستوى الغضب';

  @override
  String get summaryCategory => 'الفئة';

  @override
  String get summaryText => 'نص';

  @override
  String get summaryReminder => 'تذكير';

  @override
  String get none => 'لا شيء';

  @override
  String get other => 'أخرى';

  @override
  String get family => 'العائلة';

  @override
  String get romance => 'الرومانسية';

  @override
  String get work => 'العمل';

  @override
  String get people => 'الناس';

  @override
  String get driving => 'القيادة';

  @override
  String get custom => 'مخصص';

  @override
  String get recordCustomCategoryHint => 'أدخل فئة';

  @override
  String get recordTextHint => 'اكتبها هنا';

  @override
  String get recordMicPermissionRequired => 'مطلوب إذن الميكروفون.';

  @override
  String recordVoiceStartFailed(String label) {
    return 'تعذر بدء $label.';
  }

  @override
  String get recordVoiceStopRecording => 'توقف عن التسجيل';

  @override
  String get recordVoiceRecordAgain => 'سجل مرة أخرى';

  @override
  String get recordVoiceSaved => 'تم حفظ التسجيل الصوتي.';

  @override
  String get recordAudioSummaryLabel => 'صوت';

  @override
  String get recordAudioIncluded => 'التسجيل متضمن';

  @override
  String get recordSavingInProgress => 'جارٍ الحفظ...';

  @override
  String get recordPostingInProgress => 'جارٍ الإرسال...';

  @override
  String get recordSaveFailedToast =>
      'تعذر حفظ الملاحظة. يرجى المحاولة مرة أخرى.';

  @override
  String get recordProgressSemantics => 'سجل التقدم';

  @override
  String get hourSuffix => 'ح';

  @override
  String get minuteSuffix => 'م';

  @override
  String get reminderCustom => 'مخصص';

  @override
  String get reminderIn30Minutes => 'في 30 دقيقة';

  @override
  String get reminderIn1Hour => 'في 1 ساعة';

  @override
  String get reminderIn2Hours => 'في ساعتين';

  @override
  String get reminderIn6Hours => 'في 6 ساعات';

  @override
  String get reminderTomorrow => 'غدا';

  @override
  String get annoyed => 'منزعج';

  @override
  String get angry => 'غاضب';

  @override
  String get mad => 'مجنون';

  @override
  String get furious => 'غاضب';

  @override
  String get rage => 'الغضب';

  @override
  String get calmed => 'الهدوء';

  @override
  String get feedTitle => 'الخلاصة';

  @override
  String get feedSubtitle => 'تصفح أحدث قصص الغضب';

  @override
  String get feedAllTab => 'كل الخلاصة';

  @override
  String get feedMineTab => 'خلاصتي';

  @override
  String get feedLoadFailed => 'تعذر تحميل الخلاصة.';

  @override
  String get feedEmptyMine =>
      'لم تقم بالنشر في الخلاصة بعد.\nمشاركة مذكرة الغضب الأولى الخاصة بك!';

  @override
  String get feedEmptyAll =>
      'لا توجد مشاركات موجزة حتى الآن.\nكن أول من يشارك غضبك!';

  @override
  String get feedPostFailedToast =>
      'تعذر الإرسال إلى الخلاصة. يرجى المحاولة مرة أخرى.';

  @override
  String get like => 'أتفهم';

  @override
  String get comment => 'تعليق';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get statsTitle => 'إحصاءات الغضب';

  @override
  String get statsSubtitle => 'راجع نمط مشاعرك هذا الأسبوع';

  @override
  String get week => '1 أسبوع';

  @override
  String get month => 'شهر واحد';

  @override
  String get all => 'الكل';

  @override
  String get totalRecords => 'السجلات';

  @override
  String get highestLevel => 'الأعلى';

  @override
  String get dailyAverage => 'المتوسط اليومي.';

  @override
  String get decreaseRate => 'إنقاص';

  @override
  String get statsIntensityTrend => 'اتجاه شدة الغضب';

  @override
  String get statsCategoryDistribution => 'توزيع السبب';

  @override
  String get statsNoRecords => 'لا توجد سجلات لإظهارها.';

  @override
  String get statsCalendarButtonTitle => 'عرض السجلات حسب التقويم';

  @override
  String get statsCalendarButtonSubtitle =>
      'التحقق من ملاحظات الغضب وإدارتها حسب التاريخ';

  @override
  String get statsCalendarTitle => 'عرض السجلات حسب التقويم';

  @override
  String get statsOtherCategory => 'أخرى';

  @override
  String selectedDateRecordsTitle(String date) {
    return '$date سجلات';
  }

  @override
  String get noRecordsOnSelectedDate =>
      'لم تتم كتابة أي سجلات في التاريخ المحدد.';

  @override
  String get reminderAction => 'تذكير';

  @override
  String get play => 'تشغيل';

  @override
  String get statsSummaryButtonTitle => 'شاهد تقرير الغضب';

  @override
  String get statsSummaryButtonSubtitle => 'اقلب أنماط غضبك حسب الفئة';

  @override
  String get statsSummaryTitle => 'تقرير الغضب';

  @override
  String get statsSummaryClose => 'إغلاق';

  @override
  String get statsSummaryEmptyTitle => 'لا توجد سجلات لتلخيص حتى الآن';

  @override
  String get statsSummaryEmptyBody =>
      'بمجرد إضافة ملاحظات الغضب، ستظهر أنماط الفئات هنا.';

  @override
  String statsSummaryTopHeadline(String category) {
    return '\"$category\" جعلك غاضبًا في أغلب الأحيان';
  }

  @override
  String statsSummaryCategoryHeadline(String category) {
    return 'النظر إلى \"$category\"';
  }

  @override
  String get statsSummaryComfortGeneric => 'لا بأس. يمكن أن يحدث ذلك.';

  @override
  String get statsSummaryComfortFamily =>
      'كلما كان الشخص أقرب، كلما كان من الصعب الهبوط.';

  @override
  String get statsSummaryComfortRomance =>
      'العلاقة الثمينة يمكن أن تجعل اللحظات الصغيرة تبدو أكثر حدة.';

  @override
  String get statsSummaryComfortWork =>
      'ربما يكون العمل قد دفع عقلك بشكل أسرع مما أراد.';

  @override
  String get statsSummaryComfortPeople =>
      'الكلمات والتعبيرات من الآخرين يمكن أن تستمر لفترة أطول من المتوقع.';

  @override
  String get statsSummaryComfortDriving =>
      'غالبًا ما يصل التوتر على الطريق إلى الجسم أولاً.';

  @override
  String get statsSummaryMetricCount => 'عد';

  @override
  String get statsSummaryMetricCategory => 'الفئة';

  @override
  String get statsSummaryMetricFeed => 'منشورات الخلاصة';

  @override
  String get statsSummaryMetricCalm => 'يحاول الهدوء';

  @override
  String get statsSummaryMetricAverage => 'متوسط المستوى';

  @override
  String get statsSummaryMetricPeak => 'مستوى الذروة';

  @override
  String get statsSummaryConclusion => 'الاستنتاج';

  @override
  String statsSummaryRecordsUnit(int count) {
    return '$count مرات';
  }

  @override
  String statsSummaryAverageValue(String value) {
    return '$value/5';
  }

  @override
  String get statsSummaryConclusionTop =>
      'هذه هي إشارة الغضب الأكثر تكرارًا. في المرة القادمة، حاول التحقق من توتر الجسم قبل أن يرتفع الغضب بشكل كامل.';

  @override
  String get statsSummaryConclusionCategory =>
      'إن كتابة هذه الفئة في حين أنها لا تزال صغيرة يمكن أن تساعدك على ملاحظة النمط في وقت أقرب.';

  @override
  String statsSummaryPageIndicator(int current, int total) {
    return '$current/$total';
  }

  @override
  String get statsSummaryCategoryShare => 'حصة الفئة';

  @override
  String get statsSummaryCalmRate => 'معدل الهدوء';

  @override
  String get statsSummaryShareRate => 'معدل المشاركة';

  @override
  String get noContent => 'لا يوجد محتوى';

  @override
  String get voicePlayback => 'تشغيل الصوت';

  @override
  String get deleteConfirm => 'هل تريد الحذف؟';

  @override
  String get delete => 'حذف';

  @override
  String get cancel => 'إلغاء';

  @override
  String get calmTitle => 'تهدئة';

  @override
  String get calmSubtitle => 'خفف ما لا يزال عالقًا بهدوء';

  @override
  String get reminderNotes => 'ملاحظات تذكيرية';

  @override
  String get breathing => 'التنفس';

  @override
  String get timeout => 'المهلة';

  @override
  String get meditation => 'التأمل بالصورة';

  @override
  String get feedSupport => 'دعم الأعلاف';

  @override
  String get calmReminderEmpty => 'ستظهر التذكيرات هنا عند وصولها';

  @override
  String get calmReminderFallbackText => 'كيف يشعر هذا الغضب الآن؟';

  @override
  String get calmCheckTitle => 'ما مدى غضبك الآن؟';

  @override
  String calmCheckSubtitle(String emoji, String label) {
    return '$emoji $label · ذلك الغضب المبكر';
  }

  @override
  String get calmSavedCalmedToast => 'سعيد لأنك هدأت.';

  @override
  String get calmSavedUpdatedToast => 'تم الحفظ';

  @override
  String get profileName => 'النمر الغاضب';

  @override
  String get nicknameAdjectives =>
      'غاضب، غاضب، هائج، متفجر، شرس، هدير، حاد، مقرن، ساخن، خشن، شرس، هائج، ناري، مدوي، منتفخ، مغلي، مستاء، ملتهب، عاصف، سام';

  @override
  String get nicknameAnimals =>
      'النمر، الأسد، الذئب، الدب، النسر، القرش، النمر، الفهد، التمساح، الكوبرا، الثور، الخنزير، وحيد القرن، الضبع، أشيب، الغراب، الصقر، القنفذ، جاكوار، بوما';

  @override
  String get notificationSettings => 'الإخطارات';

  @override
  String get commentNotification => 'تنبيهات التعليق';

  @override
  String get settingsNotificationsSection => 'الإخطارات';

  @override
  String get settingsReminderSubtitle =>
      'تذكير مذكرة الغضب في الوقت الذي تحدده';

  @override
  String get settingsCommentSubtitle =>
      'تنبيه عندما يقوم شخص ما بالتعليق على منشورك';

  @override
  String get settingsDataSection => 'البيانات';

  @override
  String get settingsDataImportSubtitle =>
      'استعادة السجلات من ملف النسخ الاحتياطي';

  @override
  String get settingsSupportSection => 'الدعم';

  @override
  String get settingsPrivacySubtitle =>
      'المعلومات التي تم جمعها والغرض من الاستخدام';

  @override
  String get settingsFeedbackTitle => 'إرسال ردود الفعل';

  @override
  String get settingsFeedbackSubtitle => 'مشاكل أو أفكار التحسين';

  @override
  String get settingsRecordCountUnit => 'السجلات';

  @override
  String get settingsPostCountUnit => 'المشاركات';

  @override
  String get proPlan => 'تصدير البيانات للمحترفين';

  @override
  String get backupImport => 'استيراد البيانات';

  @override
  String get settingsDataExportSubtitle =>
      'ملف النسخ الاحتياطي · التاريخ · المشاركة';

  @override
  String get dataExportTitle => 'تصدير البيانات';

  @override
  String get dataExportProTitle => 'تصدير البيانات للمحترفين';

  @override
  String get dataExportDescription =>
      'قم بإنشاء ملف نسخة احتياطية واحد يحتوي على جميع بيانات التطبيق المحلية وشاركه عبر البريد الإلكتروني أو برنامج المراسلة.';

  @override
  String get dataExportOneTimePurchase =>
      'الشراء لمرة واحدة · الوصول مدى الحياة';

  @override
  String get dataExportDebugPrice => 'DEBUG';

  @override
  String get dataExportInProgress => 'تصدير';

  @override
  String get dataExportPaymentChecking => 'التحقق من الدفع';

  @override
  String get dataExportCreateButton => 'إنشاء التصدير';

  @override
  String get dataExportPayAndCreateButton => 'الدفع والتصدير';

  @override
  String get dataExportRestorePurchase => 'استعادة الشراء';

  @override
  String get dataExportCreatedToast => 'تم إنشاء ملف التصدير.';

  @override
  String get dataExportFailedToast => 'لا يمكن إنشاء ملف التصدير.';

  @override
  String get dataExportShareSubject => 'Fury Note النسخ الاحتياطي للبيانات';

  @override
  String get dataExportShareText =>
      'هذا هو ملف النسخ الاحتياطي لبيانات Fury Note.';

  @override
  String get dataExportShareFailedToast => 'لا يمكن فتح ورقة المشاركة.';

  @override
  String get dataExportAllDataIncluded =>
      'يتم تضمين جميع بيانات التطبيق المحلية في النسخة الاحتياطية';

  @override
  String get dataExportHistoryTitle => 'تاريخ التصدير';

  @override
  String dataExportHistoryCount(int count) {
    return '$count';
  }

  @override
  String get dataExportShareTooltip => 'شارك';

  @override
  String get dataExportEmptyHistory => 'لا توجد ملفات تصدير حتى الآن.';

  @override
  String get purchaseUpdateFailed => 'تعذرت معالجة تحديث الشراء.';

  @override
  String get purchaseStatusFailed => 'لا يمكن التحقق من حالة الشراء.';

  @override
  String get purchaseProductNotFound => 'لم يتم العثور على منتج المتجر.';

  @override
  String get purchaseStoreUnavailable => 'لا يمكن الاتصال بالمتجر.';

  @override
  String get purchaseProductInfoFailed => 'تعذر تحميل معلومات منتج المتجر.';

  @override
  String get purchaseProductUnavailable => 'معلومات المنتج ليست جاهزة بعد.';

  @override
  String get purchaseStartFailed => 'لا يمكن بدء عملية الشراء.';

  @override
  String get purchaseCanceled => 'تم إلغاء الشراء.';

  @override
  String get purchaseReceiptInvalid => 'لا يمكن التحقق من إيصال الشراء.';

  @override
  String get purchaseReceiptVerifyFailed => 'فشل التحقق من إيصال الشراء.';

  @override
  String get dataImportTitle => 'استيراد البيانات';

  @override
  String get dataImportPickTitle => 'حدد ملف النسخ الاحتياطي';

  @override
  String get dataImportPickDescription =>
      'حدد ملف .fnbackup\nتم تصديره من Fury Note';

  @override
  String get dataImportPickButton => 'اختر الملف';

  @override
  String get dataImportInProgress => 'استيراد';

  @override
  String dataImportSuccessToast(int count) {
    return 'تم استبدال البيانات من النسخة الاحتياطية. ($count سجلات)';
  }

  @override
  String get dataImportNoNewDataToast =>
      'تم استبدال البيانات من النسخة الاحتياطية. (0 سجلات)';

  @override
  String get dataImportFailedToast => 'لا يمكن استيراد ملف النسخة الاحتياطية.';

  @override
  String get dataImportInvalidFileToast => 'يمكن استيراد ملفات .fnbackup فقط.';

  @override
  String get dataImportNoticeTitle => 'قبل الاستيراد';

  @override
  String get dataImportNoticeBody =>
      'سيتم حذف البيانات الموجودة واستبدالها بالبيانات الموجودة في ملف النسخة الاحتياطية.';

  @override
  String get dataImportTransferTitle => 'الأجهزة المتحركة';

  @override
  String get dataImportTransferBody =>
      'بعد تثبيت التطبيق على جهاز جديد، قم باستيراد ملف نسخة احتياطية لاستبدال البيانات المحلية الحالية بالبيانات الاحتياطية.';

  @override
  String get feedDeleteTitle => 'حذف الخلاصة';

  @override
  String get feedDeleteContent => 'هل تريد حذف هذه الخلاصة؟';

  @override
  String get calmBreathingTitle => 'التنفس';

  @override
  String get breathPhaseInhale => 'يستنشق';

  @override
  String get breathPhaseHold => 'عقد';

  @override
  String get breathPhaseExhale => 'الزفير';

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ثانية',
      many: '$count ثانية',
      few: '$count ثوانٍ',
      two: 'ثانيتان',
      one: 'ثانية واحدة',
      zero: 'الآن',
    );
    return '$_temp0';
  }

  @override
  String cycleCount(int count) {
    return 'دورة $count';
  }

  @override
  String get calmTimeoutRunning => 'الجري';

  @override
  String get calmTimeoutPaused => 'متوقف مؤقتًا';

  @override
  String get reset => 'إعادة ضبط';

  @override
  String get start => 'بدء';

  @override
  String get pause => 'إيقاف مؤقت';

  @override
  String get stop => 'إيقاف';

  @override
  String get calmMeditationSceneWave => 'موجات';

  @override
  String get calmMeditationSceneForest => 'غابة';

  @override
  String get calmMeditationSceneSunset => 'غروب الشمس';

  @override
  String get calmMeditationSceneMountain => 'الجبل';

  @override
  String get calmMeditationSceneCherryBlossom => 'أزهار الكرز';

  @override
  String get calmMeditationSceneNightSky => 'سماء الليل';

  @override
  String get calmMeditationPrompt => 'خذ شهيقاً عميقاً ثم أخرجه';

  @override
  String get autoplay => 'اللعب التلقائي';

  @override
  String get profileEditTitle => 'تحرير الملف الشخصي';

  @override
  String get nicknameLabel => 'اللقب';

  @override
  String get nicknameHint => 'أدخل اللقب';

  @override
  String get nicknameRequiredError => 'الرجاء إدخال اللقب';

  @override
  String get nicknameCodeAutomaticError => 'تتم إضافة الرمز الخاص بك تلقائيًا';

  @override
  String get nicknameTooShortError => 'استخدم حرفين على الأقل';

  @override
  String profileSavedToast(String name) {
    return '✅ تم التغيير إلى \"$name\"!';
  }

  @override
  String get profileSaveFailedToast => 'حدث خطأ أثناء الحفظ.';

  @override
  String get avatarPickGallery => 'اختر من المكتبة';

  @override
  String get avatarPickCamera => 'التقط صورة';

  @override
  String get avatarReset => 'استخدم الصورة الرمزية الافتراضية';

  @override
  String get avatarResetToast => 'تمت استعادة الصورة الرمزية الافتراضية.';

  @override
  String get avatarAppliedToast => 'تم تطبيق صورة الملف الشخصي.';

  @override
  String get avatarTooLargeToast =>
      'يمكن استخدام الصور التي يصل حجمها إلى 5 ميغابايت فقط.';

  @override
  String get avatarLoadFailedToast => 'تعذر تحميل الصورة.';

  @override
  String get profileCodeLabel => 'رمز الملف الشخصي (لا يمكن تغييره)';

  @override
  String get profileSaveButton => 'حفظ التغييرات';

  @override
  String get avatarChangeLabel => 'تغيير الصورة الشخصية';

  @override
  String get avatarChangeHint => 'اضغط على الصورة لتغييرها';

  @override
  String get avatarSizeHint => 'JPG، PNG، GIF · ما يصل إلى 5 ميغابايت';

  @override
  String get reminderNotificationFallbackBody => 'كيف يشعر هذا الغضب الآن؟';

  @override
  String get calmGuideTitle => 'وعندما يرتفع الغضب\nخفض جسمك بأمان أولا';

  @override
  String get calmGuideSubtitle =>
      'لا يخبرك دليل Fury Note الهادئ بالتخلص من الغضب. إنه دليل قصير لمساعدة هذا الشعور على المرور دون أن يتأذى أحد.';

  @override
  String get calmGuideNotice =>
      '**إذا كنت في خطر داهم**، فيرجى طلب المساعدة من الأشخاص من حولك أو الاتصال بخدمات الطوارئ أولاً، بدلاً من الاستمرار في استخدام هذا التطبيق.';

  @override
  String get calmGuideMomentTitle => 'لحظة ارتفاع الغضب';

  @override
  String get calmGuideMomentBody1 =>
      'يمكن أن يكون الغضب إشارة إلى انتهاك شيء يهمك. لكن في حالة الغضب الشديد، يتسارع إصدار الأحكام، وقد تصبح الكلمات والأفعال أكثر قسوة من المعتاد.';

  @override
  String get calmGuideMomentBody2 =>
      'ما نحتاجه الآن ليس أن تكون **عقلانيًا تمامًا**، ولكن **تأخير رد فعلك ولو لمدة 30 ثانية**.';

  @override
  String get calmGuideRoutineTitle => 'روتين هادئ لمدة 60 ثانية';

  @override
  String get calmGuideStep1Title => 'توقف';

  @override
  String get calmGuideStep1Desc =>
      'إيقاف الرد أو الاتصال أو التعليق أو التحرك مؤقتًا. أرخِ يديك وانظر بعيدًا عن الشاشة للحظة.';

  @override
  String get calmGuideStep2Title => 'تنفس';

  @override
  String get calmGuideStep2Desc =>
      'خذ شهيقًا لمدة 4 ثوانٍ، ثم احبسه لمدة 7 ثوانٍ، ثم قم بالزفير لمدة 8 ثوانٍ. لا بأس إذا لم يكن الأمر مثاليًا.';

  @override
  String get calmGuideStep3Title => 'تحقق من جسمك';

  @override
  String get calmGuideStep3Desc =>
      'تحقق مما إذا كان فكك أو كتفيك أو قبضتك أو معدتك متوترة، ثم حرر نقطة واحدة فقط.';

  @override
  String get calmGuideStep4Title => 'اكتبها';

  @override
  String get calmGuideStep4Desc =>
      'حتى جملة واحدة مثل \"الآن أنا غاضب لأن ___\" تكفي.';

  @override
  String get calmGuideBreathTitle => '4-7-8 التنفس';

  @override
  String get calmGuideBreathStep1 => 'تنفس من خلال أنفك لمدة 4 ثواني.';

  @override
  String get calmGuideBreathStep2 => 'احبس أنفاسك لمدة 7 ثواني.';

  @override
  String get calmGuideBreathStep3 =>
      'قم بالزفير ببطء من خلال فمك لمدة 8 ثواني.';

  @override
  String get calmGuideBreathStep4 => 'كرر 3 مرات إذا استطعت.';

  @override
  String get calmGuideBreathNote =>
      'إذا كان حبس أنفاسك لفترة طويلة أمرًا صعبًا، فاختصره إلى عدد مريح مثل **3-3-5**. ما يهم أكثر هو الزفير البطيء والطويل.';

  @override
  String get calmGuideTimeoutTitle => 'مهلة 10 دقائق';

  @override
  String get calmGuideTimeoutBody =>
      'كلما كان الغضب أقوى، كانت الرغبة في حله على الفور أقوى. لكن التحدث الآن قد يخرج كلمات جارحة أولاً.';

  @override
  String get calmGuideTimeoutExamplesTitle => 'أمثلة على عبارات المهلة';

  @override
  String get calmGuideTimeoutExample1 =>
      '\"أنا غاضب جدًا الآن، فلنتحدث مرة أخرى بعد 10 دقائق.\"';

  @override
  String get calmGuideTimeoutExample2 =>
      '\"أتوقف للحظة لأنني قد أقول شيئًا جارحًا.\"';

  @override
  String get calmGuideTimeoutExample3 =>
      '\"أنا لا أهرب، أريد فقط أن أهدأ قبل أن نتحدث مرة أخرى.\"';

  @override
  String get calmGuideSensoryTitle => 'التأريض الحسي السريع';

  @override
  String get calmGuideSensory1Title => 'الماء البارد';

  @override
  String get calmGuideSensory1Desc =>
      'ضع الماء البارد على معصميك أو وجهك لمدة 10 ثوانٍ تقريبًا';

  @override
  String get calmGuideSensory2Title => 'اشعر بقدميك';

  @override
  String get calmGuideSensory2Desc => 'لاحظ ببطء الشعور بقدميك تلامس الأرض';

  @override
  String get calmGuideSensory3Title => 'انظر حولك';

  @override
  String get calmGuideSensory3Desc => 'قم بتسمية 5 أشياء يمكنك رؤيتها بهدوء';

  @override
  String get calmGuideSensory4Title => 'إسقاط كتفيك';

  @override
  String get calmGuideSensory4Desc => 'قم بالزفير واخفض كتفيك بمقدار 1 سم فقط';

  @override
  String get calmGuideQuestionsTitle => 'الأسئلة التي تساعد أثناء الكتابة';

  @override
  String get calmGuideQuestion1 => 'ما الذي أغضبني بالضبط؟';

  @override
  String get calmGuideQuestion2 => 'ما الذي كنت أتوقعه ولكن لم أحصل عليه؟';

  @override
  String get calmGuideQuestion3 =>
      'ما هو الإجراء الذي سأندم عليه إذا قمت به الآن؟';

  @override
  String get calmGuideQuestion4 => 'ما هو الاختيار الذي سأكون ممتنًا له غدًا؟';

  @override
  String get calmGuideTag1 => 'سجل المشاعر';

  @override
  String get calmGuideTag2 => 'تباعد الغضب';

  @override
  String get calmGuideTag3 => 'فحص التذكير';

  @override
  String get calmGuideDangerTitle => 'اطلب المساعدة أولاً في هذه الحالات';

  @override
  String get calmGuideDanger1 =>
      'عندما تكون الرغبة في إيذاء نفسك أو الآخرين قوية';

  @override
  String get calmGuideDanger2 =>
      'عندما لا تتوقف الرغبة في رمي الأشياء أو كسرها';

  @override
  String get calmGuideDanger3 =>
      'عندما تشعر بالرغبة في مواجهة أو تهديد الشخص الآخر';

  @override
  String get calmGuideDanger4 =>
      'عندما يجعل الكحول أو المخدرات أو الحرمان الشديد من النوم من الصعب السيطرة على الأمور';

  @override
  String get calmGuideDangerBody =>
      'في هذه الحالات، لا تحاول تجاوز الأمر بالروتين الهادئ وحده — اطلب المساعدة من الأشخاص من حولك أو الخدمات المتخصصة أو خدمات الطوارئ.';

  @override
  String get calmGuideFooterTitle => 'Fury Note Calm Guide';

  @override
  String get calmGuideFooterDisclaimer =>
      'هذه الوثيقة لا تحل محل التشخيص الطبي أو العلاج.';

  @override
  String get privacyTitle => 'سياسة الخصوصية';

  @override
  String get privacyLastUpdated => 'تاريخ السريان: 16 يونيو 2026';

  @override
  String get privacySection1Title => '1. فئات المعلومات التي تم جمعها';

  @override
  String get privacySection1Body =>
      'يمكن استخدام Fury Note دون أي تسجيل عضوية. تقوم الشركة بجمع المعلومات التالية فقط.\n· معرف الجهاز — قيمة يتم إصدارها عشوائيًا تُستخدم لتحديد هوية المستخدم دون تسجيل، بغرض منع الاستخدام الاحتيالي\n· بيانات تسجيل الغضب - الشدة والفئة والنص (المخزنة على الجهاز فقط)\n· منشورات موجزة مجهولة المصدر - اللقب، الصورة الرمزية، الكثافة، الفئة، والنص\n· التعليقات — اللقب ونص التعليق\n· تسجيلات الإعجاب — ما إذا كان المستخدم قد أعجب بمنشور معين\n· رمز إشعار الدفع - لغرض إرسال الإشعارات (اختياري)';

  @override
  String get privacySection2Title => '2. الغرض من المعالجة';

  @override
  String get privacySection2Body =>
      '· توفير ميزات المجتمع، بما في ذلك الخلاصة المجهولة والتعليقات والإعجابات\n· الكشف عن الاستخدام الاحتيالي، بما في ذلك منع الإعجابات المكررة على نفس المنشور\n· إرسال إشعارات الدفع، بما في ذلك تنبيهات التعليق\n· تشغيل الخدمة وتحليل الأخطاء';

  @override
  String get privacySection3Title =>
      '3. لا يوجد تسجيل للعضوية ولا يحتفظ بالمعلومات الشخصية';

  @override
  String get privacySection3Body =>
      'لا يتطلب Fury Note تسجيل العضوية ولا يجمع معلومات شخصية يمكن التحقق من هويتها مثل الاسم أو عنوان البريد الإلكتروني أو رقم الهاتف.\nيتم إنشاء اللقب تلقائيًا أو إدخاله مباشرة من قبل المستخدم ولا يرتبط بالهوية الحقيقية للمستخدم. معرف الجهاز هو أيضًا قيمة تم إنشاؤها عشوائيًا ولا يمكن استخدامها لتحديد هوية فرد معين.';

  @override
  String get privacySection4Title => '4. توفير المعلومات لأطراف ثالثة';

  @override
  String get privacySection4Body =>
      'لا تقوم الشركة بتوفير أو بيع المعلومات التي تم جمعها إلى أطراف ثالثة.';

  @override
  String get privacySection5Title => '5. فترة الاحتفاظ بالمعلومات واستخدامها';

  @override
  String get privacySection5Body =>
      '· يتم الاحتفاظ بسجلات الغضب التي تم حفظها فقط على الجهاز فقط ويتم حذفها معًا عند حذف التطبيق.\n· يتم الاحتفاظ بالمشاركات والصور الرمزية والتعليقات التي تمت مشاركتها في الخلاصة المجهولة على الخادم حتى يقوم المستخدم بحذفها، ويتم حذفها فورًا بناءً على هذا الطلب.\n· يتم حذف سجلات الإعجاب معًا عند حذف المنشور ذي الصلة.';

  @override
  String get privacySection6Title => '6. الاتصال';

  @override
  String get privacySection6Body =>
      'للاستفسارات المتعلقة بالمعلومات الشخصية، يرجى الاتصال على عنوان البريد الإلكتروني أدناه.\nlunlu.co.kr@gmail.com';

  @override
  String get appGuideTitle => 'كيفية استخدام مذكرة الغضب';

  @override
  String get appGuideSubtitle =>
      'دليل لتسجيل الغضب وتتبع الأنماط والحصول على الدعم في الموجز.';

  @override
  String get appGuideRecordTitle => 'سجل غضبك';

  @override
  String get appGuideRecordBody =>
      'عندما تكون غاضبًا، اضغط على الزر 🔥 في الأسفل لبدء التسجيل.';

  @override
  String get appGuideRecordStep1 =>
      'اختر الشدة: اختر رمزًا تعبيريًا يتناسب مع مدى غضبك';

  @override
  String get appGuideRecordStep2 => 'اختر فئة: اختر سببًا واحدًا';

  @override
  String get appGuideRecordStep3 => 'اكتبها: صف ما حدث (يمكنك تخطي هذا)';

  @override
  String get appGuideRecordStep4 =>
      'تذكير: حدد وقتًا إذا كنت تريد العودة إلى هذا لاحقًا';

  @override
  String get appGuideRecordStep5 =>
      'حفظ أو نشر: احتفظ بالسجل خاصًا أو شاركه في الخلاصة';

  @override
  String get appGuideFeedTitle => 'ابحث عن الدعم في الخلاصة';

  @override
  String get appGuideFeedBody =>
      'مشاركة غضبك يمكن أن تربطك بالآخرين الذين يشعرون بنفس الشعور.';

  @override
  String get appGuideFeedItem1 =>
      'بعد الحفظ، يمكنك النشر **بشكل مجهول** في الموجز';

  @override
  String get appGuideFeedItem2 => 'قم بالإعجاب أو التعليق على منشورات الآخرين';

  @override
  String get appGuideFeedItem3 => 'يمكنك حذف مشاركتك في أي وقت';

  @override
  String get appGuideStatsTitle => 'تتبع أنماطك العاطفية';

  @override
  String get appGuideStatsBody =>
      'تساعدك علامة التبويب \"الإحصائيات\" على إلقاء نظرة على أنماط غضبك.';

  @override
  String get appGuideStatsItem1 => 'الرسم البياني لاتجاه شدة الغضب حسب الفترة';

  @override
  String get appGuideStatsItem2 => 'توزيع الأسباب حسب الفئة';

  @override
  String get appGuideStatsItem3 => 'عرض التقويم لتصفح السجلات حسب التاريخ';

  @override
  String get appGuideStatsItem4 => 'تقرير الغضب لتحليل الأنماط حسب الفئة';

  @override
  String get appGuideCalmTitle => 'خفض غضبك';

  @override
  String get appGuideCalmBody =>
      'بعد التسجيل، توجه إلى علامة التبويب \"الهدوء\" لمحاولة تخفيف مشاعرك.';

  @override
  String get appGuideCalmItem1 =>
      'ملاحظات تذكيرية: قم بإعادة زيارة السجلات التي قمت بوضع علامة عليها لوقت لاحق';

  @override
  String get appGuideCalmItem2 => 'التنفس: قم بتسوية عقلك بتقنية 4-7-8';

  @override
  String get appGuideCalmItem3 =>
      'المهلة: قم بإبطاء رد فعلك باستخدام مؤقت مدته 10 دقائق';

  @override
  String get appGuideCalmItem4 =>
      'التأمل بالصور: غيّر حالتك المزاجية باستخدام صور الطبيعة';

  @override
  String get appGuideProfileTitle => 'اللقب والملف الشخصي';

  @override
  String get appGuideProfileBody =>
      'انتقل إلى القائمة > الإعدادات لتغيير لقبك وصورتك الرمزية.';

  @override
  String get appGuideProfileItem1 =>
      'اللقب: اكتب اسمك الخاص أو أنشئ واحدًا بشكل عشوائي';

  @override
  String get appGuideProfileItem2 =>
      'الصورة الرمزية: قم بتمثيل نفسك باستخدام الرموز التعبيرية';

  @override
  String get appGuideNotificationTitle => 'إعدادات الإخطار';

  @override
  String get appGuideNotificationItem1 =>
      'تنبيهات التذكير: احصل على تذكير بمذكرة الغضب في الوقت الذي تحدده';

  @override
  String get appGuideNotificationItem2 =>
      'تنبيهات التعليق: احصل على إشعار عندما يعلق شخص ما على منشورك';

  @override
  String get appGuideNotificationHint => 'قم بتبديلها في الإعدادات> الإشعارات';

  @override
  String get appGuideFooterTitle => 'Fury Note App Guide';
}

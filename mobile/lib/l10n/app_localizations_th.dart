// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'Fury Note';

  @override
  String get appKoreanName => 'Fury Note';

  @override
  String get record => 'บันทึก';

  @override
  String get feed => 'ฟีด';

  @override
  String get stats => 'สถิติ';

  @override
  String get calm => 'สงบใจ';

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get drawerGuide => 'คู่มือแอป';

  @override
  String get drawerCalmGuide => 'คู่มือสงบใจ';

  @override
  String get drawerVersion => 'Fury Note v1.0.0';

  @override
  String get menuTooltip => 'เมนู';

  @override
  String drawerRecordCount(String count) {
    return '🔥 $count บันทึกความโกรธ';
  }

  @override
  String get drawerSettingsSubtitle => 'ชื่อเล่น · การแจ้งเตือน';

  @override
  String get drawerGuideSubtitle => 'วิธีใช้ Fury Note';

  @override
  String get drawerCalmGuideSubtitle =>
      'การ์ดสงบสติอารมณ์ · เคล็ดลับประจำวันนี้';

  @override
  String get relativeTimeJustNow => 'แค่ตอนนี้';

  @override
  String relativeTimeMinutesAgo(int count) {
    return '$count นาทีที่แล้ว';
  }

  @override
  String relativeTimeHoursAgo(int count) {
    return '$countชั่วโมงที่ผ่านมา';
  }

  @override
  String relativeTimeDaysAgo(int count) {
    return '$count วันที่ผ่านมา';
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
  String get recordTitle => 'บันทึกความโกรธ';

  @override
  String get stepIntensity => 'ตอนนี้คุณโกรธแค่ไหน?';

  @override
  String get stepIntensitySub => 'เลือกอีโมจิ';

  @override
  String get stepCategory => 'อะไรเป็นสาเหตุ?';

  @override
  String get stepCategorySub => 'เลือกหนึ่งหมวดหมู่';

  @override
  String get stepText => 'เกิดอะไรขึ้น?';

  @override
  String get stepTextSub => 'คุณสามารถข้ามสิ่งนี้ได้';

  @override
  String get stepReminder => 'ต้องการกลับมาดูอีกครั้งในภายหลังหรือไม่?';

  @override
  String get stepReminderSub => 'คุณสามารถข้ามสิ่งนี้ได้';

  @override
  String get stepSave => 'บันทึกบันทึกนี้ใช่ไหม';

  @override
  String get stepSaveSub => 'คุณสามารถโพสต์ได้หลังจากบันทึกแล้ว';

  @override
  String get stepPost => 'แบ่งปันความรู้สึกนี้?';

  @override
  String get stepPostSub => 'มันจะไม่เปิดเผยตัวตน';

  @override
  String get voiceInput => 'การบันทึกเสียง';

  @override
  String get next => 'ถัดไป';

  @override
  String get previous => 'ก่อนหน้า';

  @override
  String get skip => 'ข้าม';

  @override
  String get save => 'บันทึก';

  @override
  String get saveNote => 'บันทึกโน้ต';

  @override
  String get postIt => 'โพสต์';

  @override
  String get saveOnly => 'บันทึกเท่านั้น';

  @override
  String get feedPostedToast => 'ส่งไปเลี้ยงแล้ว';

  @override
  String get recordPostedToast => 'โพสต์แล้ว';

  @override
  String get recordSavedToast => 'บันทึกแล้ว';

  @override
  String get commentPostedToast => 'โพสต์ความคิดเห็นแล้ว';

  @override
  String get commentSendFailedToast =>
      'ไม่สามารถส่งความคิดเห็นได้ โปรดลองอีกครั้ง';

  @override
  String get commentDeleteTitle => 'ลบความคิดเห็น';

  @override
  String get commentDeleteContent => 'ลบความคิดเห็นนี้ใช่ไหม';

  @override
  String commentsCount(int count) {
    return '$count ความคิดเห็น';
  }

  @override
  String get commentsEmpty =>
      'ยังไม่มีความคิดเห็น\nเป็นคนแรกที่จะออกจากหนึ่ง 💬';

  @override
  String get commentInputHint => 'เขียนความคิดเห็น...';

  @override
  String get apiErrorContentBlockedUrl => 'ไม่สามารถส่งโพสต์ที่มีลิงก์ได้';

  @override
  String get apiErrorContentBlockedSpam =>
      'ไม่สามารถส่งข้อความส่งเสริมการขายได้';

  @override
  String get apiErrorContentBlockedProfanity =>
      'ไม่สามารถส่งเนื้อหาที่มีคำหยาบคายได้';

  @override
  String get apiErrorContentBlockedModeration => 'เนื้อหานี้ไม่สามารถส่งได้';

  @override
  String get apiErrorRateLimitExceeded => 'โปรดลองอีกครั้งในอีกสักครู่';

  @override
  String get apiErrorInternal =>
      'เกิดข้อผิดพลาดของเซิร์ฟเวอร์ โปรดลองอีกครั้งในอีกสักครู่';

  @override
  String get apiErrorInvalidRequest => 'คำขอไม่ถูกต้อง';

  @override
  String get apiErrorForbidden => 'คุณไม่มีสิทธิ์';

  @override
  String get apiErrorPostNotFound => 'ไม่พบโพสต์';

  @override
  String get apiErrorCommentNotFound => 'ไม่พบความคิดเห็น';

  @override
  String get apiErrorSignatureRequired => 'ต้องมีลายเซ็นคำขอ';

  @override
  String get apiErrorSignatureInvalid => 'คำขอไม่ถูกต้อง';

  @override
  String get apiErrorSignatureExpired => 'คำขอหมดอายุแล้ว โปรดลองอีกครั้ง';

  @override
  String get apiErrorSignatureReplay => 'คำขอนี้ได้รับการประมวลผลแล้ว';

  @override
  String get apiErrorUnknown => 'เกิดข้อผิดพลาดที่ไม่ทราบสาเหตุ';

  @override
  String get reminderNotification => 'การแจ้งเตือนการแจ้งเตือน';

  @override
  String get noReminder => 'ไม่ได้ตั้งค่า';

  @override
  String get summaryIntensity => 'ระดับความโกรธ';

  @override
  String get summaryCategory => 'หมวดหมู่';

  @override
  String get summaryText => 'ข้อความ';

  @override
  String get summaryReminder => 'คำเตือน';

  @override
  String get none => 'ไม่มี';

  @override
  String get other => 'อื่นๆ';

  @override
  String get family => 'ครอบครัว';

  @override
  String get romance => 'โรแมนติก';

  @override
  String get work => 'ทำงาน';

  @override
  String get people => 'ผู้คน';

  @override
  String get driving => 'ขับรถ';

  @override
  String get custom => 'กำหนดเอง';

  @override
  String get recordCustomCategoryHint => 'ป้อนหมวดหมู่';

  @override
  String get recordTextHint => 'เขียนไว้ที่นี่';

  @override
  String get recordMicPermissionRequired => 'ต้องได้รับอนุญาตจากไมโครโฟน';

  @override
  String recordVoiceStartFailed(String label) {
    return 'ไม่สามารถเริ่ม $label ได้';
  }

  @override
  String get recordVoiceStopRecording => 'หยุดการบันทึก';

  @override
  String get recordVoiceRecordAgain => 'บันทึกอีกครั้ง';

  @override
  String get recordVoiceSaved => 'บันทึกการบันทึกเสียงแล้ว';

  @override
  String get recordAudioSummaryLabel => 'เสียง';

  @override
  String get recordAudioIncluded => 'รวมการบันทึก';

  @override
  String get recordSavingInProgress => 'กำลังบันทึก...';

  @override
  String get recordPostingInProgress => 'กำลังส่ง...';

  @override
  String get recordSaveFailedToast =>
      'ไม่สามารถบันทึกบันทึกได้ โปรดลองอีกครั้ง';

  @override
  String get recordProgressSemantics => 'บันทึกความคืบหน้า';

  @override
  String get hourSuffix => 'ชั่วโมง';

  @override
  String get minuteSuffix => 'ม';

  @override
  String get reminderCustom => 'กำหนดเอง';

  @override
  String get reminderIn30Minutes => 'ใน 30 นาที';

  @override
  String get reminderIn1Hour => 'ใน 1 ชั่วโมง';

  @override
  String get reminderIn2Hours => 'ภายใน 2 ชั่วโมง';

  @override
  String get reminderIn6Hours => 'ใน 6 ชั่วโมง';

  @override
  String get reminderTomorrow => 'พรุ่งนี้';

  @override
  String get annoyed => 'รำคาญ';

  @override
  String get angry => 'โกรธ';

  @override
  String get mad => 'บ้า';

  @override
  String get furious => 'โกรธมาก';

  @override
  String get rage => 'ความโกรธ';

  @override
  String get calmed => 'สงบ';

  @override
  String get feedTitle => 'ฟีด';

  @override
  String get feedSubtitle => 'เรียกดูเรื่องราวความโกรธล่าสุด';

  @override
  String get feedAllTab => 'ฟีดทั้งหมด';

  @override
  String get feedMineTab => 'ฟีดของฉัน';

  @override
  String get feedLoadFailed => 'ไม่สามารถโหลดฟีดได้';

  @override
  String get feedEmptyMine =>
      'คุณยังไม่ได้โพสต์ในฟีดเลย\nแบ่งปันบันทึกความโกรธครั้งแรกของคุณ!';

  @override
  String get feedEmptyAll =>
      'ยังไม่มีการโพสต์ฟีด\nเป็นคนแรกที่จะแบ่งปันความโกรธของคุณ!';

  @override
  String get feedPostFailedToast => 'ไม่สามารถส่งไปยังฟีดได้ โปรดลองอีกครั้ง';

  @override
  String get like => 'เข้าใจเลย';

  @override
  String get comment => 'ความคิดเห็น';

  @override
  String get retry => 'ลองอีกครั้ง';

  @override
  String get statsTitle => 'สถิติความโกรธ';

  @override
  String get statsSubtitle => 'ดูรูปแบบทางอารมณ์ของสัปดาห์นี้';

  @override
  String get week => '1 สัปดาห์';

  @override
  String get month => '1 เดือน';

  @override
  String get all => 'ทั้งหมด';

  @override
  String get totalRecords => 'บันทึก';

  @override
  String get highestLevel => 'สูงสุด';

  @override
  String get dailyAverage => 'ค่าเฉลี่ยรายวัน';

  @override
  String get decreaseRate => 'ลดลง';

  @override
  String get statsIntensityTrend => 'แนวโน้มความรุนแรงของความโกรธ';

  @override
  String get statsCategoryDistribution => 'สาเหตุการกระจาย';

  @override
  String get statsNoRecords => 'ไม่มีบันทึกที่จะแสดง';

  @override
  String get statsCalendarButtonTitle => 'ดูบันทึกตามปฏิทิน';

  @override
  String get statsCalendarButtonSubtitle =>
      'ตรวจสอบและจัดการบันทึกความโกรธตามวันที่';

  @override
  String get statsCalendarTitle => 'ดูบันทึกตามปฏิทิน';

  @override
  String get statsOtherCategory => 'อื่นๆ';

  @override
  String selectedDateRecordsTitle(String date) {
    return '$date บันทึก';
  }

  @override
  String get noRecordsOnSelectedDate => 'ไม่มีการเขียนบันทึกในวันที่เลือก';

  @override
  String get reminderAction => 'คำเตือน';

  @override
  String get play => 'เล่น';

  @override
  String get statsSummaryButtonTitle => 'ดูรายงานความโกรธ';

  @override
  String get statsSummaryButtonSubtitle =>
      'พลิกดูรูปแบบความโกรธของคุณตามหมวดหมู่';

  @override
  String get statsSummaryTitle => 'รายงานความโกรธ';

  @override
  String get statsSummaryClose => 'ปิด';

  @override
  String get statsSummaryEmptyTitle => 'ยังไม่มีบันทึกที่จะสรุป';

  @override
  String get statsSummaryEmptyBody =>
      'เมื่อคุณเพิ่มบันทึกความโกรธ รูปแบบหมวดหมู่จะปรากฏที่นี่';

  @override
  String statsSummaryTopHeadline(String category) {
    return '\"$category\" ทำให้คุณโกรธบ่อยที่สุด';
  }

  @override
  String statsSummaryCategoryHeadline(String category) {
    return 'กำลังดูที่ \"$category\"';
  }

  @override
  String get statsSummaryComfortGeneric => 'ไม่เป็นไร. ที่สามารถเกิดขึ้นได้';

  @override
  String get statsSummaryComfortFamily =>
      'ยิ่งมีคนใกล้ชิดมากเท่าไรก็ยิ่งลงจอดได้ยากขึ้นเท่านั้น';

  @override
  String get statsSummaryComfortRomance =>
      'ความสัมพันธ์อันล้ำค่าสามารถทำให้ช่วงเวลาเล็กๆ รู้สึกชัดเจนยิ่งขึ้น';

  @override
  String get statsSummaryComfortWork => 'งานอาจทำให้จิตใจคุณเร็วกว่าที่คิด';

  @override
  String get statsSummaryComfortPeople =>
      'คำพูดและสำนวนจากผู้อื่นอาจคงอยู่นานกว่าที่คาดไว้';

  @override
  String get statsSummaryComfortDriving =>
      'ความตึงเครียดบนท้องถนนมักมาถึงร่างกายก่อน';

  @override
  String get statsSummaryMetricCount => 'นับ';

  @override
  String get statsSummaryMetricCategory => 'หมวดหมู่';

  @override
  String get statsSummaryMetricFeed => 'โพสต์ฟีด';

  @override
  String get statsSummaryMetricCalm => 'พยายามอย่างใจเย็น';

  @override
  String get statsSummaryMetricAverage => 'เฉลี่ย ระดับ';

  @override
  String get statsSummaryMetricPeak => 'ระดับสูงสุด';

  @override
  String get statsSummaryConclusion => 'บทสรุป';

  @override
  String statsSummaryRecordsUnit(int count) {
    return '$count ครั้ง';
  }

  @override
  String statsSummaryAverageValue(String value) {
    return '$value/5';
  }

  @override
  String get statsSummaryConclusionTop =>
      'นี่คือสัญญาณความโกรธที่เกิดขึ้นซ้ำๆ ของคุณ ครั้งต่อไปลองตรวจสอบความตึงเครียดของร่างกายก่อนที่ความโกรธจะปะทุเต็มที่';

  @override
  String get statsSummaryConclusionCategory =>
      'การเขียนหมวดหมู่นี้ในขณะที่ยังมีขนาดเล็กจะช่วยให้คุณสังเกตเห็นรูปแบบได้เร็วขึ้น';

  @override
  String statsSummaryPageIndicator(int current, int total) {
    return '$current/$total';
  }

  @override
  String get statsSummaryCategoryShare => 'แบ่งปันหมวดหมู่';

  @override
  String get statsSummaryCalmRate => 'อัตราความสงบ';

  @override
  String get statsSummaryShareRate => 'อัตราการแบ่งปัน';

  @override
  String get noContent => 'ไม่มีเนื้อหา';

  @override
  String get voicePlayback => 'เล่นเสียง';

  @override
  String get deleteConfirm => 'ลบเหรอ?';

  @override
  String get delete => 'ลบ';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get calmTitle => 'สงบใจ';

  @override
  String get calmSubtitle => 'ลดสิ่งที่ยังค้างอยู่ลง';

  @override
  String get reminderNotes => 'บันทึกช่วยเตือน';

  @override
  String get breathing => 'การหายใจ';

  @override
  String get timeout => 'หมดเวลา';

  @override
  String get meditation => 'การทำสมาธิภาพ';

  @override
  String get feedSupport => 'การสนับสนุนฟีด';

  @override
  String get calmReminderEmpty => 'การเตือนความจำจะปรากฏที่นี่เมื่อมาถึง';

  @override
  String get calmReminderFallbackText => 'ตอนนี้ความโกรธนั้นรู้สึกอย่างไร?';

  @override
  String get calmCheckTitle => 'ตอนนี้คุณโกรธแค่ไหน?';

  @override
  String calmCheckSubtitle(String emoji, String label) {
    return '$emoji $label · ความโกรธที่เกิดขึ้นก่อนหน้านี้';
  }

  @override
  String get calmSavedCalmedToast => 'ดีใจที่คุณสงบลงแล้ว';

  @override
  String get calmSavedUpdatedToast => 'บันทึกแล้ว';

  @override
  String get profileName => 'เสือโกรธ';

  @override
  String get nicknameAdjectives =>
      'โกรธ,โมโห,โกรธจัด,ระเบิด,ดุร้าย,คำราม,คม,มีเขา,ร้อน,หยาบ,รุนแรง,อาละวาด,คะนอง,เสียงดังกึกก้อง,เดือดพล่าน,เดือดพล่าน,ขุ่นเคือง,สว่างจ้า,มีพายุ,มีพิษ';

  @override
  String get nicknameAnimals =>
      'เสือ สิงโต หมาป่า หมี นกอินทรี ฉลาม เสือดาว เสือชีตาห์ จระเข้ งูเห่า กระทิง หมูป่า แรด หมาใน กริซลี่ นกกา เหยี่ยว เม่น เสือจากัวร์ เสือพูมา';

  @override
  String get notificationSettings => 'การแจ้งเตือน';

  @override
  String get commentNotification => 'การแจ้งเตือนความคิดเห็น';

  @override
  String get settingsNotificationsSection => 'การแจ้งเตือน';

  @override
  String get settingsReminderSubtitle =>
      'การแจ้งเตือนบันทึกความโกรธในเวลาที่คุณตั้งไว้';

  @override
  String get settingsCommentSubtitle =>
      'แจ้งเตือนเมื่อมีคนแสดงความคิดเห็นในโพสต์ของคุณ';

  @override
  String get settingsDataSection => 'ข้อมูล';

  @override
  String get settingsDataImportSubtitle => 'กู้คืนบันทึกจากไฟล์สำรอง';

  @override
  String get settingsSupportSection => 'สนับสนุน';

  @override
  String get settingsPrivacySubtitle =>
      'ข้อมูลที่รวบรวมและวัตถุประสงค์การใช้งาน';

  @override
  String get settingsFeedbackTitle => 'ส่งคำติชม';

  @override
  String get settingsFeedbackSubtitle => 'ปัญหาหรือแนวคิดในการปรับปรุง';

  @override
  String get settingsRecordCountUnit => 'บันทึก';

  @override
  String get settingsPostCountUnit => 'โพสต์';

  @override
  String get proPlan => 'การส่งออกข้อมูล PRO';

  @override
  String get backupImport => 'นำเข้าข้อมูล';

  @override
  String get settingsDataExportSubtitle => 'ไฟล์สำรอง·ประวัติ·การแชร์';

  @override
  String get dataExportTitle => 'ส่งออกข้อมูล';

  @override
  String get dataExportProTitle => 'การส่งออกข้อมูล PRO';

  @override
  String get dataExportDescription =>
      'สร้างไฟล์สำรองข้อมูลหนึ่งไฟล์พร้อมข้อมูลแอปในเครื่องทั้งหมดแล้วแชร์ทางอีเมลหรือ Messenger';

  @override
  String get dataExportOneTimePurchase =>
      'ซื้อครั้งเดียว · เข้าถึงได้ตลอดชีวิต';

  @override
  String get dataExportDebugPrice => 'DEBUG';

  @override
  String get dataExportInProgress => 'กำลังส่งออก';

  @override
  String get dataExportPaymentChecking => 'กำลังตรวจสอบการชำระเงิน';

  @override
  String get dataExportCreateButton => 'สร้างการส่งออก';

  @override
  String get dataExportPayAndCreateButton => 'ชำระเงินและส่งออก';

  @override
  String get dataExportRestorePurchase => 'คืนค่าการซื้อ';

  @override
  String get dataExportCreatedToast => 'สร้างไฟล์ส่งออกแล้ว';

  @override
  String get dataExportFailedToast => 'ไม่สามารถสร้างไฟล์ส่งออกได้';

  @override
  String get dataExportShareSubject => 'การสำรองข้อมูล Fury Note';

  @override
  String get dataExportShareText => 'นี่เป็นไฟล์สำรองข้อมูล Fury Note';

  @override
  String get dataExportShareFailedToast => 'ไม่สามารถเปิดแผ่นแบ่งปันได้';

  @override
  String get dataExportAllDataIncluded =>
      'ข้อมูลแอปในเครื่องทั้งหมดจะรวมอยู่ในการสำรองข้อมูล';

  @override
  String get dataExportHistoryTitle => 'ประวัติการส่งออก';

  @override
  String dataExportHistoryCount(int count) {
    return '$count';
  }

  @override
  String get dataExportShareTooltip => 'แบ่งปัน';

  @override
  String get dataExportEmptyHistory => 'ยังไม่มีไฟล์ส่งออก';

  @override
  String get purchaseUpdateFailed => 'ไม่สามารถประมวลผลการอัปเดตการซื้อได้';

  @override
  String get purchaseStatusFailed => 'ไม่สามารถตรวจสอบสถานะการซื้อได้';

  @override
  String get purchaseProductNotFound => 'ไม่พบสินค้าในร้าน';

  @override
  String get purchaseStoreUnavailable => 'ไม่สามารถเชื่อมต่อกับร้านค้าได้';

  @override
  String get purchaseProductInfoFailed =>
      'ไม่สามารถโหลดข้อมูลผลิตภัณฑ์ของร้านค้าได้';

  @override
  String get purchaseProductUnavailable => 'ข้อมูลสินค้ายังไม่พร้อม';

  @override
  String get purchaseStartFailed => 'ไม่สามารถเริ่มการซื้อได้';

  @override
  String get purchaseCanceled => 'การซื้อถูกยกเลิก';

  @override
  String get purchaseReceiptInvalid =>
      'ไม่สามารถตรวจสอบใบเสร็จรับเงินการซื้อได้';

  @override
  String get purchaseReceiptVerifyFailed =>
      'การตรวจสอบใบเสร็จรับเงินการซื้อล้มเหลว';

  @override
  String get dataImportTitle => 'นำเข้าข้อมูล';

  @override
  String get dataImportPickTitle => 'เลือกไฟล์สำรอง';

  @override
  String get dataImportPickDescription =>
      'เลือกไฟล์ .fnbackup\nส่งออกจาก Fury Note';

  @override
  String get dataImportPickButton => 'เลือกไฟล์';

  @override
  String get dataImportInProgress => 'กำลังนำเข้า';

  @override
  String dataImportSuccessToast(int count) {
    return 'แทนที่ข้อมูลจากการสำรองข้อมูล ($count บันทึก)';
  }

  @override
  String get dataImportNoNewDataToast =>
      'แทนที่ข้อมูลจากการสำรองข้อมูล (0 บันทึก)';

  @override
  String get dataImportFailedToast => 'ไม่สามารถนำเข้าไฟล์สำรองได้';

  @override
  String get dataImportInvalidFileToast =>
      'สามารถนำเข้าได้เฉพาะไฟล์ .fnbackup เท่านั้น';

  @override
  String get dataImportNoticeTitle => 'ก่อนนำเข้า';

  @override
  String get dataImportNoticeBody =>
      'ข้อมูลที่มีอยู่จะถูกลบและแทนที่ด้วยข้อมูลในไฟล์สำรอง';

  @override
  String get dataImportTransferTitle => 'อุปกรณ์เคลื่อนย้าย';

  @override
  String get dataImportTransferBody =>
      'หลังจากติดตั้งแอปบนอุปกรณ์ใหม่ ให้นำเข้าไฟล์สำรองเพื่อแทนที่ข้อมูลในเครื่องปัจจุบันด้วยข้อมูลที่สำรองไว้';

  @override
  String get feedDeleteTitle => 'ลบฟีด';

  @override
  String get feedDeleteContent => 'ลบฟีดนี้ใช่ไหม';

  @override
  String get calmBreathingTitle => 'การหายใจ';

  @override
  String get breathPhaseInhale => 'หายใจเข้า';

  @override
  String get breathPhaseHold => 'กดค้างไว้';

  @override
  String get breathPhaseExhale => 'หายใจออก';

  @override
  String durationSeconds(int count) {
    return '$countวินาที';
  }

  @override
  String cycleCount(int count) {
    return 'วงจร $count';
  }

  @override
  String get calmTimeoutRunning => 'วิ่ง';

  @override
  String get calmTimeoutPaused => 'หยุดชั่วคราว';

  @override
  String get reset => 'รีเซ็ต';

  @override
  String get start => 'เริ่ม';

  @override
  String get pause => 'หยุดชั่วคราว';

  @override
  String get stop => 'หยุด';

  @override
  String get calmMeditationSceneWave => 'คลื่น';

  @override
  String get calmMeditationSceneForest => 'ป่า';

  @override
  String get calmMeditationSceneSunset => 'พระอาทิตย์ตก';

  @override
  String get calmMeditationSceneMountain => 'ภูเขา';

  @override
  String get calmMeditationSceneCherryBlossom => 'ดอกซากุระ';

  @override
  String get calmMeditationSceneNightSky => 'ท้องฟ้ายามค่ำคืน';

  @override
  String get calmMeditationPrompt => 'หายใจเข้าลึกๆ แล้วหายใจออก';

  @override
  String get autoplay => 'เล่นอัตโนมัติ';

  @override
  String get profileEditTitle => 'แก้ไขโปรไฟล์';

  @override
  String get nicknameLabel => 'ชื่อเล่น';

  @override
  String get nicknameHint => 'ป้อนชื่อเล่น';

  @override
  String get nicknameRequiredError => 'กรุณากรอกชื่อเล่น';

  @override
  String get nicknameCodeAutomaticError => 'รหัสของคุณจะถูกเพิ่มโดยอัตโนมัติ';

  @override
  String get nicknameTooShortError => 'ใช้อย่างน้อย 2 ตัวอักษร';

  @override
  String profileSavedToast(String name) {
    return '✅ เปลี่ยนเป็น \"$name\" แล้ว!';
  }

  @override
  String get profileSaveFailedToast => 'เกิดข้อผิดพลาดขณะบันทึก';

  @override
  String get avatarPickGallery => 'เลือกจากห้องสมุด';

  @override
  String get avatarPickCamera => 'ถ่ายรูป';

  @override
  String get avatarReset => 'ใช้อวตารเริ่มต้น';

  @override
  String get avatarResetToast => 'กู้คืนอวตารเริ่มต้นแล้ว';

  @override
  String get avatarAppliedToast => 'ใช้รูปโปรไฟล์แล้ว';

  @override
  String get avatarTooLargeToast =>
      'สามารถใช้ได้เฉพาะภาพถ่ายที่มีขนาดไม่เกิน 5 MB';

  @override
  String get avatarLoadFailedToast => 'ไม่สามารถโหลดรูปภาพได้';

  @override
  String get profileCodeLabel => 'รหัสโปรไฟล์ (ไม่สามารถเปลี่ยนแปลงได้)';

  @override
  String get profileSaveButton => 'บันทึกการเปลี่ยนแปลง';

  @override
  String get avatarChangeLabel => 'เปลี่ยนรูปโปรไฟล์';

  @override
  String get avatarChangeHint => 'แตะรูปภาพเพื่อเปลี่ยน';

  @override
  String get avatarSizeHint => 'JPG, PNG, GIF · สูงสุด 5 MB';

  @override
  String get reminderNotificationFallbackBody =>
      'ตอนนี้ความโกรธนั้นรู้สึกอย่างไร?';

  @override
  String get calmGuideTitle =>
      'เมื่อความโกรธเกิดขึ้น\nลดร่างกายให้ปลอดภัยไว้ก่อน';

  @override
  String get calmGuideSubtitle =>
      'คู่มือสงบสติอารมณ์ของ Fury Note ไม่ได้บอกให้คุณกำจัดความโกรธ เป็นคำแนะนำสั้นๆ ที่จะช่วยให้ความรู้สึกผ่านไปได้โดยไม่มีใครได้รับบาดเจ็บ';

  @override
  String get calmGuideNotice =>
      '**หากคุณตกอยู่ในอันตราย** โปรดขอความช่วยเหลือจากคนรอบตัวคุณหรือติดต่อบริการฉุกเฉินก่อน แทนที่จะอยู่ในแอปนี้';

  @override
  String get calmGuideMomentTitle => 'ช่วงเวลาที่ความโกรธเพิ่มขึ้น';

  @override
  String get calmGuideMomentBody1 =>
      'ความโกรธอาจเป็นสัญญาณว่ามีการละเมิดสิ่งที่คุณใส่ใจ แต่ในสภาวะโกรธจัด การตัดสินจะเร็วขึ้น และคำพูดและการกระทำอาจรุนแรงกว่าปกติ';

  @override
  String get calmGuideMomentBody2 =>
      'สิ่งที่จำเป็นในตอนนี้ไม่ใช่การ **มีเหตุผลอย่างสมบูรณ์** แต่ต้อง **ชะลอปฏิกิริยาของคุณลงแม้แต่ 30 วินาที**';

  @override
  String get calmGuideRoutineTitle => 'กิจวัตรความสงบ 60 วินาที';

  @override
  String get calmGuideStep1Title => 'หยุด';

  @override
  String get calmGuideStep1Desc =>
      'หยุดตอบกลับ โทร แสดงความคิดเห็น หรือย้ายชั่วคราว ผ่อนคลายมือของคุณและละสายตาจากหน้าจอสักครู่';

  @override
  String get calmGuideStep2Title => 'หายใจเข้า';

  @override
  String get calmGuideStep2Desc =>
      'หายใจเข้า 4 วินาที ค้างไว้ 7 วินาที หายใจออก 8 วินาที ไม่เป็นไรถ้ามันไม่สมบูรณ์แบบ';

  @override
  String get calmGuideStep3Title => 'ตรวจร่างกาย';

  @override
  String get calmGuideStep3Desc =>
      'ตรวจสอบว่ากราม ไหล่ หมัด หรือท้องเกร็งหรือไม่ แล้วปล่อยเพียงจุดเดียว';

  @override
  String get calmGuideStep4Title => 'เขียนมันลงไป';

  @override
  String get calmGuideStep4Desc =>
      'แม้แต่ประโยคเดียวเช่น \"ตอนนี้ฉันโกรธเพราะ ___\" ก็เพียงพอแล้ว';

  @override
  String get calmGuideBreathTitle => 'การหายใจแบบ 4-7-8';

  @override
  String get calmGuideBreathStep1 => 'หายใจเข้าทางจมูกเป็นเวลา 4 วินาที';

  @override
  String get calmGuideBreathStep2 => 'กลั้นหายใจเป็นเวลา 7 วินาที';

  @override
  String get calmGuideBreathStep3 => 'หายใจออกทางปากช้าๆ เป็นเวลา 8 วินาที';

  @override
  String get calmGuideBreathStep4 => 'ทำซ้ำ 3 ครั้งถ้าทำได้';

  @override
  String get calmGuideBreathNote =>
      'ถ้ากลั้นลมหายใจยาวขนาดนั้นได้ยาก ให้ย่อให้เหลือนับสบายๆ เช่น **3-3-5** สิ่งที่สำคัญที่สุดคือการหายใจออกช้าๆ และยาว';

  @override
  String get calmGuideTimeoutTitle => 'หมดเวลา 10 นาที';

  @override
  String get calmGuideTimeoutBody =>
      'ยิ่งความโกรธรุนแรงขึ้นเท่าใด ความอยากที่จะแก้ไขในทันทีก็จะยิ่งมากขึ้นเท่านั้น แต่การพูดคุยตอนนี้อาจดึงคำพูดที่ทำร้ายจิตใจออกมาก่อน';

  @override
  String get calmGuideTimeoutExamplesTitle => 'ตัวอย่างวลีการหมดเวลา';

  @override
  String get calmGuideTimeoutExample1 =>
      '“ตอนนี้ฉันโกรธเกินไป อีก 10 นาทีไว้คุยกันใหม่”';

  @override
  String get calmGuideTimeoutExample2 =>
      '“ฉันขอหยุดสักพักเพราะฉันอาจพูดอะไรที่ทำให้เจ็บปวด”';

  @override
  String get calmGuideTimeoutExample3 =>
      '“ฉันไม่ได้วิ่งหนี ฉันแค่ต้องใจเย็นก่อนเราจะคุยกันใหม่”';

  @override
  String get calmGuideSensoryTitle => 'การต่อสายดินทางประสาทสัมผัสอย่างรวดเร็ว';

  @override
  String get calmGuideSensory1Title => 'น้ำเย็น';

  @override
  String get calmGuideSensory1Desc =>
      'ถือน้ำเย็นไว้บนข้อมือหรือใบหน้าประมาณ 10 วินาที';

  @override
  String get calmGuideSensory2Title => 'รู้สึกถึงเท้าของคุณ';

  @override
  String get calmGuideSensory2Desc => 'ค่อยๆ สังเกตความรู้สึกที่เท้าแตะพื้น';

  @override
  String get calmGuideSensory3Title => 'มองไปรอบ ๆ';

  @override
  String get calmGuideSensory3Desc =>
      'ตั้งชื่อวัตถุ 5 ชิ้นที่คุณเห็นอย่างเงียบๆ';

  @override
  String get calmGuideSensory4Title => 'วางไหล่ของคุณ';

  @override
  String get calmGuideSensory4Desc => 'หายใจออกและลดไหล่ลงเพียง 1 ซม';

  @override
  String get calmGuideQuestionsTitle => 'คำถามที่ช่วยในขณะที่เขียน';

  @override
  String get calmGuideQuestion1 => 'อะไรทำให้ฉันโกรธจริงๆ?';

  @override
  String get calmGuideQuestion2 => 'ฉันคาดหวังอะไรแต่ไม่ได้รับ?';

  @override
  String get calmGuideQuestion3 => 'การกระทำใดที่ฉันจะเสียใจหากฉันทำตอนนี้?';

  @override
  String get calmGuideQuestion4 => 'พรุ่งนี้ฉันจะขอบคุณทางเลือกอะไร?';

  @override
  String get calmGuideTag1 => 'บันทึกอารมณ์';

  @override
  String get calmGuideTag2 => 'ความโกรธเคือง';

  @override
  String get calmGuideTag3 => 'ตรวจสอบการแจ้งเตือน';

  @override
  String get calmGuideDangerTitle => 'ขอความช่วยเหลือก่อนในกรณีเหล่านี้';

  @override
  String get calmGuideDanger1 =>
      'เมื่อความรู้สึกอยากทำร้ายตัวเองหรือผู้อื่นรุนแรงขึ้น';

  @override
  String get calmGuideDanger2 => 'เมื่อความอยากโยนหรือทำลายสิ่งของไม่หยุด';

  @override
  String get calmGuideDanger3 => 'เมื่อคุณรู้สึกอยากเผชิญหน้าหรือข่มขู่อีกฝ่าย';

  @override
  String get calmGuideDanger4 =>
      'เมื่อเครื่องดื่มแอลกอฮอล์ ยาเสพติด หรือการอดนอนอย่างรุนแรงทำให้ควบคุมได้ยาก';

  @override
  String get calmGuideDangerBody =>
      'ในกรณีเหล่านี้ อย่าพยายามผ่านมันไปได้ด้วยกิจวัตรสงบๆ เพียงอย่างเดียว ลองขอความช่วยเหลือจากผู้คนรอบตัวคุณ หน่วยงานวิชาชีพ หรือหน่วยฉุกเฉิน';

  @override
  String get calmGuideFooterTitle => 'Fury Note Calm Guide';

  @override
  String get calmGuideFooterDisclaimer =>
      'เอกสารนี้ไม่ได้ใช้แทนการวินิจฉัยหรือการรักษาทางการแพทย์';

  @override
  String get privacyTitle => 'นโยบายความเป็นส่วนตัว';

  @override
  String get privacyLastUpdated => 'วันที่มีผลบังคับใช้: 16 มิถุนายน 2569';

  @override
  String get privacySection1Title => '1. ประเภทของข้อมูลที่รวบรวม';

  @override
  String get privacySection1Body =>
      'Fury Note สามารถใช้งานได้โดยไม่ต้องลงทะเบียนสมาชิก บริษัทจะเก็บรวบรวมข้อมูลดังต่อไปนี้เท่านั้น\n· ตัวระบุอุปกรณ์ — ค่าที่ออกแบบสุ่มซึ่งใช้เพื่อระบุผู้ใช้โดยไม่ต้องลงทะเบียน เพื่อวัตถุประสงค์ในการป้องกันการใช้งานที่เป็นการฉ้อโกง\n· ข้อมูลบันทึก Rage — ความเข้มข้น หมวดหมู่ และข้อความ (จัดเก็บไว้ในอุปกรณ์เท่านั้น)\n· โพสต์ฟีดแบบไม่ระบุตัวตน — ชื่อเล่น รูปภาพประจำตัว ความเข้มข้น หมวดหมู่ และข้อความ\n· ความคิดเห็น — ชื่อเล่นและข้อความแสดงความคิดเห็น\n· บันทึกการถูกใจ — ไม่ว่าผู้ใช้จะถูกใจโพสต์ที่กำหนดหรือไม่\n· โทเค็นการแจ้งเตือนแบบพุช — เพื่อวัตถุประสงค์ในการส่งการแจ้งเตือน (ตัวเลือก)';

  @override
  String get privacySection2Title => '2. วัตถุประสงค์ของการประมวลผล';

  @override
  String get privacySection2Body =>
      '· การจัดหาคุณลักษณะของชุมชน รวมถึงฟีด ความคิดเห็น และการถูกใจที่ไม่เปิดเผยตัวตน\n· การตรวจจับการใช้งานที่เป็นการฉ้อโกง รวมถึงการป้องกันการกดไลค์ซ้ำในโพสต์เดียวกัน\n· การส่งการแจ้งเตือนแบบพุช รวมถึงการแจ้งเตือนความคิดเห็น\n· การดำเนินงานบริการและการวิเคราะห์ข้อผิดพลาด';

  @override
  String get privacySection3Title =>
      '3. ไม่มีการสมัครสมาชิกและไม่มีการเก็บรักษาข้อมูลส่วนบุคคล';

  @override
  String get privacySection3Body =>
      'Fury Note ไม่จำเป็นต้องลงทะเบียนสมาชิก และไม่รวบรวมข้อมูลส่วนบุคคลที่สามารถตรวจสอบตัวตนได้ เช่น ชื่อ ที่อยู่อีเมล หรือหมายเลขโทรศัพท์\nชื่อเล่นนั้นสร้างขึ้นโดยอัตโนมัติหรือป้อนโดยผู้ใช้โดยตรง และไม่ได้เชื่อมโยงกับข้อมูลประจำตัวที่แท้จริงของผู้ใช้ ตัวระบุอุปกรณ์ก็เป็นค่าที่สร้างขึ้นแบบสุ่มเช่นเดียวกันซึ่งไม่สามารถใช้ระบุตัวบุคคลใดบุคคลหนึ่งได้';

  @override
  String get privacySection4Title => '4. การให้ข้อมูลแก่บุคคลที่สาม';

  @override
  String get privacySection4Body =>
      'บริษัทไม่ให้หรือขายข้อมูลที่เก็บรวบรวมให้กับบุคคลที่สาม';

  @override
  String get privacySection5Title => '5. ระยะเวลาการเก็บรักษาและการใช้ข้อมูล';

  @override
  String get privacySection5Body =>
      '· บันทึก Rage ที่บันทึกไว้เท่านั้นจะถูกเก็บไว้ในอุปกรณ์เท่านั้น และจะถูกลบพร้อมกันเมื่อลบแอป\n· โพสต์ อวตาร และความคิดเห็นที่แชร์ไปยังฟีดที่ไม่ระบุชื่อจะถูกเก็บไว้บนเซิร์ฟเวอร์จนกว่าผู้ใช้จะลบ และจะถูกลบทันทีตามคำขอดังกล่าว\n· บันทึกการถูกใจจะถูกลบพร้อมกันเมื่อมีการลบโพสต์ที่เกี่ยวข้อง';

  @override
  String get privacySection6Title => '6. ติดต่อ';

  @override
  String get privacySection6Body =>
      'สำหรับการสอบถามเกี่ยวกับข้อมูลส่วนบุคคล โปรดติดต่อที่อยู่อีเมลด้านล่าง\nlunlu.co.kr@gmail.com';

  @override
  String get appGuideTitle => 'วิธีใช้ Fury Note';

  @override
  String get appGuideSubtitle =>
      'คำแนะนำในการบันทึกความโกรธ รูปแบบการติดตาม และการขอรับการสนับสนุนบนฟีด';

  @override
  String get appGuideRecordTitle => 'บันทึกความโกรธของคุณ';

  @override
  String get appGuideRecordBody =>
      'เมื่อคุณโกรธ ให้แตะปุ่ม 🔥 ที่ด้านล่างเพื่อเริ่มบันทึก';

  @override
  String get appGuideRecordStep1 =>
      'เลือกความเข้มข้น: เลือกอิโมจิที่ตรงกับความโกรธของคุณ';

  @override
  String get appGuideRecordStep2 => 'เลือกหมวดหมู่: เลือกหนึ่งสาเหตุ';

  @override
  String get appGuideRecordStep3 =>
      'เขียนออกมา: อธิบายสิ่งที่เกิดขึ้น (คุณสามารถข้ามสิ่งนี้ได้)';

  @override
  String get appGuideRecordStep4 =>
      'คำเตือน: ตั้งเวลาหากคุณต้องการกลับมาดูอีกครั้งในภายหลัง';

  @override
  String get appGuideRecordStep5 =>
      'บันทึกหรือโพสต์: เก็บบันทึกส่วนตัวหรือแชร์ไปยังฟีด';

  @override
  String get appGuideFeedTitle => 'ค้นหาการสนับสนุนบนฟีด';

  @override
  String get appGuideFeedBody =>
      'การแบ่งปันความโกรธสามารถเชื่อมโยงคุณกับผู้อื่นที่รู้สึกแบบเดียวกันได้';

  @override
  String get appGuideFeedItem1 =>
      'หลังจากบันทึกแล้ว คุณสามารถโพสต์ **โดยไม่เปิดเผยตัวตน** ในฟีดได้';

  @override
  String get appGuideFeedItem2 => 'ชอบหรือแสดงความคิดเห็นในโพสต์ของผู้อื่น';

  @override
  String get appGuideFeedItem3 => 'คุณสามารถลบโพสต์ของคุณเองได้ตลอดเวลา';

  @override
  String get appGuideStatsTitle => 'ติดตามรูปแบบทางอารมณ์ของคุณ';

  @override
  String get appGuideStatsBody =>
      'แท็บสถิติช่วยให้คุณมองย้อนกลับไปถึงรูปแบบความโกรธของคุณ';

  @override
  String get appGuideStatsItem1 =>
      'กราฟแนวโน้มความรุนแรงของความโกรธตามช่วงเวลา';

  @override
  String get appGuideStatsItem2 => 'สาเหตุการจำหน่ายตามประเภท';

  @override
  String get appGuideStatsItem3 => 'มุมมองปฏิทินเพื่อเรียกดูบันทึกตามวันที่';

  @override
  String get appGuideStatsItem4 =>
      'รายงาน Rage เพื่อวิเคราะห์รูปแบบตามหมวดหมู่';

  @override
  String get appGuideCalmTitle => 'ลดความโกรธของคุณ';

  @override
  String get appGuideCalmBody =>
      'หลังจากเข้าสู่ระบบแล้ว ให้ไปที่แท็บสงบเพื่อพยายามลดอารมณ์ของคุณลง';

  @override
  String get appGuideCalmItem1 =>
      'บันทึกช่วยเตือน: ทบทวนบันทึกที่คุณตั้งค่าสถานะไว้ใช้ในภายหลัง';

  @override
  String get appGuideCalmItem2 => 'การหายใจ: ตั้งสติด้วยเทคนิค 4-7-8';

  @override
  String get appGuideCalmItem3 =>
      'หมดเวลา: ชะลอปฏิกิริยาของคุณด้วยการจับเวลา 10 นาที';

  @override
  String get appGuideCalmItem4 =>
      'การทำสมาธิด้วยภาพ: เปลี่ยนอารมณ์ของคุณด้วยภาพธรรมชาติ';

  @override
  String get appGuideProfileTitle => 'ชื่อเล่นและโปรไฟล์';

  @override
  String get appGuideProfileBody =>
      'ไปที่เมนู > การตั้งค่า เพื่อเปลี่ยนชื่อเล่นและอวาตาร์ของคุณ';

  @override
  String get appGuideProfileItem1 => 'ชื่อเล่น: พิมพ์ของคุณเองหรือสร้างแบบสุ่ม';

  @override
  String get appGuideProfileItem2 => 'Avatar: นำเสนอตัวเองด้วยอิโมจิ';

  @override
  String get appGuideNotificationTitle => 'การตั้งค่าการแจ้งเตือน';

  @override
  String get appGuideNotificationItem1 =>
      'การแจ้งเตือนการแจ้งเตือน: รับการแจ้งเตือนถึงบันทึกความโกรธในเวลาที่คุณตั้งไว้';

  @override
  String get appGuideNotificationItem2 =>
      'การแจ้งเตือนความคิดเห็น: รับการแจ้งเตือนเมื่อมีคนแสดงความคิดเห็นในโพสต์ของคุณ';

  @override
  String get appGuideNotificationHint =>
      'สลับสิ่งเหล่านี้ในการตั้งค่า > การแจ้งเตือน';

  @override
  String get appGuideFooterTitle => 'Fury Note App Guide';
}

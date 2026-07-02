// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Fury Note';

  @override
  String get appKoreanName => 'Fury Note';

  @override
  String get record => 'Ghi lại';

  @override
  String get feed => 'Bảng tin';

  @override
  String get stats => 'Thống kê';

  @override
  String get calm => 'Bình tâm';

  @override
  String get settings => 'Cài đặt';

  @override
  String get drawerGuide => 'Hướng dẫn app';

  @override
  String get drawerCalmGuide => 'Hướng dẫn bình tâm';

  @override
  String get drawerVersion => 'Fury Note v1.0.0';

  @override
  String get menuTooltip => 'Menu';

  @override
  String drawerRecordCount(String count) {
    return '🔥 $count ghi chú giận dữ';
  }

  @override
  String get drawerSettingsSubtitle => 'Biệt danh · thông báo';

  @override
  String get drawerGuideSubtitle => 'Cách dùng Fury Note';

  @override
  String get drawerCalmGuideSubtitle => 'Thẻ bình tĩnh · mẹo ngày nay';

  @override
  String get relativeTimeJustNow => 'Vừa rồi';

  @override
  String relativeTimeMinutesAgo(int count) {
    return '$count phút trước';
  }

  @override
  String relativeTimeHoursAgo(int count) {
    return '$count giờ trước';
  }

  @override
  String relativeTimeDaysAgo(int count) {
    return '$count ngày trước';
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
  String get recordTitle => 'Ghi lại cơn giận';

  @override
  String get stepIntensity => 'Bây giờ bạn tức giận đến mức nào?';

  @override
  String get stepIntensitySub => 'Chọn một biểu tượng cảm xúc';

  @override
  String get stepCategory => 'Điều gì đã gây ra nó?';

  @override
  String get stepCategorySub => 'Chọn một danh mục';

  @override
  String get stepText => 'Chuyện gì đã xảy ra vậy?';

  @override
  String get stepTextSub => 'Bạn có thể bỏ qua điều này';

  @override
  String get stepReminder => 'Bạn muốn xem lại sau?';

  @override
  String get stepReminderSub => 'Bạn có thể bỏ qua điều này';

  @override
  String get stepSave => 'Lưu ghi chú này?';

  @override
  String get stepSaveSub => 'Bạn có thể đăng nó sau khi lưu';

  @override
  String get stepPost => 'Chia sẻ cảm giác này?';

  @override
  String get stepPostSub => 'Nó sẽ ẩn danh';

  @override
  String get voiceInput => 'Ghi âm giọng nói';

  @override
  String get next => 'Tiếp';

  @override
  String get previous => 'Trước';

  @override
  String get skip => 'Bỏ qua';

  @override
  String get save => 'Lưu';

  @override
  String get saveNote => 'Lưu ghi chú';

  @override
  String get postIt => 'Đăng';

  @override
  String get saveOnly => 'Chỉ lưu';

  @override
  String get feedPostedToast => 'Đã gửi tới nguồn cấp dữ liệu';

  @override
  String get recordPostedToast => 'Đã đăng';

  @override
  String get recordSavedToast => 'Đã lưu';

  @override
  String get commentPostedToast => 'Bình luận đã đăng';

  @override
  String get commentSendFailedToast =>
      'Không thể gửi bình luận. Vui lòng thử lại.';

  @override
  String get commentDeleteTitle => 'Xóa bình luận';

  @override
  String get commentDeleteContent => 'Xóa nhận xét này?';

  @override
  String commentsCount(int count) {
    return '$count nhận xét';
  }

  @override
  String get commentsEmpty =>
      'Chưa có bình luận nào\nHãy là người đầu tiên rời đi 💬';

  @override
  String get commentInputHint => 'Viết bình luận...';

  @override
  String get apiErrorContentBlockedUrl =>
      'Bài viết có liên kết không thể được gửi.';

  @override
  String get apiErrorContentBlockedSpam => 'Không thể gửi văn bản quảng cáo.';

  @override
  String get apiErrorContentBlockedProfanity =>
      'Nội dung có chứa ngôn từ tục tĩu không thể được gửi.';

  @override
  String get apiErrorContentBlockedModeration =>
      'Nội dung này không thể được gửi.';

  @override
  String get apiErrorRateLimitExceeded => 'Vui lòng thử lại sau giây lát.';

  @override
  String get apiErrorInternal =>
      'Đã xảy ra lỗi máy chủ. Vui lòng thử lại sau giây lát.';

  @override
  String get apiErrorInvalidRequest => 'Yêu cầu không hợp lệ.';

  @override
  String get apiErrorForbidden => 'Bạn không có quyền.';

  @override
  String get apiErrorPostNotFound => 'Không tìm thấy bài đăng.';

  @override
  String get apiErrorCommentNotFound => 'Không tìm thấy bình luận.';

  @override
  String get apiErrorSignatureRequired => 'Yêu cầu chữ ký là bắt buộc.';

  @override
  String get apiErrorSignatureInvalid => 'Yêu cầu không hợp lệ.';

  @override
  String get apiErrorSignatureExpired =>
      'Yêu cầu đã hết hạn. Vui lòng thử lại.';

  @override
  String get apiErrorSignatureReplay => 'Yêu cầu này đã được xử lý.';

  @override
  String get apiErrorUnknown => 'Đã xảy ra lỗi không xác định.';

  @override
  String get reminderNotification => 'Thông báo nhắc nhở';

  @override
  String get noReminder => 'Chưa đặt';

  @override
  String get summaryIntensity => 'Mức độ thịnh nộ';

  @override
  String get summaryCategory => 'Danh mục';

  @override
  String get summaryText => 'văn bản';

  @override
  String get summaryReminder => 'Lời nhắc';

  @override
  String get none => 'không có';

  @override
  String get other => 'Khác';

  @override
  String get family => 'gia đình';

  @override
  String get romance => 'lãng mạn';

  @override
  String get work => 'công việc';

  @override
  String get people => 'mọi người';

  @override
  String get driving => 'Lái xe';

  @override
  String get custom => 'tùy chỉnh';

  @override
  String get recordCustomCategoryHint => 'Nhập một danh mục';

  @override
  String get recordTextHint => 'Viết nó ở đây';

  @override
  String get recordMicPermissionRequired => 'Cần có sự cho phép của micrô.';

  @override
  String recordVoiceStartFailed(String label) {
    return 'Không thể bắt đầu $label.';
  }

  @override
  String get recordVoiceStopRecording => 'Dừng ghi';

  @override
  String get recordVoiceRecordAgain => 'Ghi lại';

  @override
  String get recordVoiceSaved => 'Đã lưu bản ghi âm giọng nói.';

  @override
  String get recordAudioSummaryLabel => 'Giọng nói';

  @override
  String get recordAudioIncluded => 'Đã bao gồm ghi âm';

  @override
  String get recordSavingInProgress => 'Đang lưu...';

  @override
  String get recordPostingInProgress => 'Đang gửi...';

  @override
  String get recordSaveFailedToast =>
      'Không thể lưu ghi chú. Vui lòng thử lại.';

  @override
  String get recordProgressSemantics => 'Ghi lại tiến độ';

  @override
  String get hourSuffix => 'h';

  @override
  String get minuteSuffix => 'tôi';

  @override
  String get reminderCustom => 'tùy chỉnh';

  @override
  String get reminderIn30Minutes => 'trong 30 phút nữa';

  @override
  String get reminderIn1Hour => 'trong 1 giờ';

  @override
  String get reminderIn2Hours => 'trong 2 giờ nữa';

  @override
  String get reminderIn6Hours => 'trong 6 giờ';

  @override
  String get reminderTomorrow => 'Ngày mai';

  @override
  String get annoyed => 'Bực mình';

  @override
  String get angry => 'tức giận';

  @override
  String get mad => 'điên';

  @override
  String get furious => 'tức giận';

  @override
  String get rage => 'cơn thịnh nộ';

  @override
  String get calmed => 'Bình tĩnh';

  @override
  String get feedTitle => 'Bảng tin';

  @override
  String get feedSubtitle => 'Duyệt những câu chuyện tức giận gần đây';

  @override
  String get feedAllTab => 'Tất cả bảng tin';

  @override
  String get feedMineTab => 'Bảng tin của tôi';

  @override
  String get feedLoadFailed => 'Không thể tải nguồn cấp dữ liệu.';

  @override
  String get feedEmptyMine =>
      'Bạn chưa đăng lên nguồn cấp dữ liệu.\nChia sẻ ghi chú giận dữ đầu tiên của bạn!';

  @override
  String get feedEmptyAll =>
      'Chưa có bài viết nguồn cấp dữ liệu nào.\nHãy là người đầu tiên chia sẻ sự tức giận của bạn!';

  @override
  String get feedPostFailedToast =>
      'Không thể gửi tới nguồn cấp dữ liệu. Vui lòng thử lại.';

  @override
  String get like => 'Đồng cảm';

  @override
  String get comment => 'Bình luận';

  @override
  String get retry => 'Thử lại';

  @override
  String get statsTitle => 'Thống kê cơn giận';

  @override
  String get statsSubtitle => 'Xem mô hình cảm xúc của tuần này';

  @override
  String get week => '1 tuần';

  @override
  String get month => '1 tháng';

  @override
  String get all => 'Tất cả';

  @override
  String get totalRecords => 'Hồ sơ';

  @override
  String get highestLevel => 'Cao nhất';

  @override
  String get dailyAverage => 'Trung bình hàng ngày';

  @override
  String get decreaseRate => 'Giảm';

  @override
  String get statsIntensityTrend => 'Xu hướng cường độ thịnh nộ';

  @override
  String get statsCategoryDistribution => 'Nguyên nhân phân bố';

  @override
  String get statsNoRecords => 'Không có bản ghi nào để hiển thị.';

  @override
  String get statsCalendarButtonTitle => 'Xem bản ghi theo lịch';

  @override
  String get statsCalendarButtonSubtitle =>
      'Kiểm tra và quản lý ghi chú cơn thịnh nộ theo ngày';

  @override
  String get statsCalendarTitle => 'Xem bản ghi theo lịch';

  @override
  String get statsOtherCategory => 'Khác';

  @override
  String selectedDateRecordsTitle(String date) {
    return 'bản ghi $date';
  }

  @override
  String get noRecordsOnSelectedDate =>
      'Không có hồ sơ nào được viết vào ngày đã chọn.';

  @override
  String get reminderAction => 'Lời nhắc';

  @override
  String get play => 'Phát';

  @override
  String get statsSummaryButtonTitle => 'Xem báo cáo cơn thịnh nộ';

  @override
  String get statsSummaryButtonSubtitle =>
      'Lướt qua các kiểu tức giận của bạn theo danh mục';

  @override
  String get statsSummaryTitle => 'Báo cáo cơn thịnh nộ';

  @override
  String get statsSummaryClose => 'Đóng';

  @override
  String get statsSummaryEmptyTitle => 'Chưa có hồ sơ nào để tóm tắt';

  @override
  String get statsSummaryEmptyBody =>
      'Khi bạn thêm ghi chú giận dữ, các mẫu danh mục sẽ xuất hiện ở đây.';

  @override
  String statsSummaryTopHeadline(String category) {
    return '\"$category\" khiến bạn tức giận thường xuyên nhất';
  }

  @override
  String statsSummaryCategoryHeadline(String category) {
    return 'Đang xem \"$category\"';
  }

  @override
  String get statsSummaryComfortGeneric =>
      'Không sao đâu. Điều đó có thể xảy ra.';

  @override
  String get statsSummaryComfortFamily =>
      'Ai đó càng ở gần thì càng khó hạ cánh.';

  @override
  String get statsSummaryComfortRomance =>
      'Một mối quan hệ quý giá có thể khiến những khoảnh khắc nhỏ trở nên sắc nét hơn.';

  @override
  String get statsSummaryComfortWork =>
      'Công việc có thể đã thúc đẩy tâm trí bạn nhanh hơn mức nó muốn.';

  @override
  String get statsSummaryComfortPeople =>
      'Lời nói và cách diễn đạt của người khác có thể kéo dài hơn dự kiến.';

  @override
  String get statsSummaryComfortDriving =>
      'Căng thẳng trên đường thường đến cơ thể trước.';

  @override
  String get statsSummaryMetricCount => 'Đếm';

  @override
  String get statsSummaryMetricCategory => 'Danh mục';

  @override
  String get statsSummaryMetricFeed => 'bài đăng nguồn cấp dữ liệu';

  @override
  String get statsSummaryMetricCalm => 'Bình tĩnh cố gắng';

  @override
  String get statsSummaryMetricAverage => 'Trung bình cấp độ';

  @override
  String get statsSummaryMetricPeak => 'Mức cao nhất';

  @override
  String get statsSummaryConclusion => 'Kết luận';

  @override
  String statsSummaryRecordsUnit(int count) {
    return '$count lần';
  }

  @override
  String statsSummaryAverageValue(String value) {
    return '$value/5';
  }

  @override
  String get statsSummaryConclusionTop =>
      'Đây là tín hiệu tức giận được lặp đi lặp lại nhiều nhất của bạn. Lần tới, hãy thử kiểm tra độ căng của cơ thể trước khi cơn giận bùng lên hoàn toàn.';

  @override
  String get statsSummaryConclusionCategory =>
      'Viết danh mục này ra khi nó vẫn còn nhỏ có thể giúp bạn nhận ra mô hình sớm hơn.';

  @override
  String statsSummaryPageIndicator(int current, int total) {
    return '$current/$total';
  }

  @override
  String get statsSummaryCategoryShare => 'Chia sẻ danh mục';

  @override
  String get statsSummaryCalmRate => 'Tỷ lệ bình tĩnh';

  @override
  String get statsSummaryShareRate => 'Tỷ lệ chia sẻ';

  @override
  String get noContent => 'Không có nội dung';

  @override
  String get voicePlayback => 'Phát giọng nói';

  @override
  String get deleteConfirm => 'Xóa?';

  @override
  String get delete => 'Xóa';

  @override
  String get cancel => 'Hủy';

  @override
  String get calmTitle => 'Bình tâm';

  @override
  String get calmSubtitle => 'Hạ thấp những gì còn đọng lại';

  @override
  String get reminderNotes => 'Ghi chú nhắc nhở';

  @override
  String get breathing => 'Hơi thở';

  @override
  String get timeout => 'Hết giờ';

  @override
  String get meditation => 'thiền hình ảnh';

  @override
  String get feedSupport => 'Hỗ trợ nguồn cấp dữ liệu';

  @override
  String get calmReminderEmpty => 'Lời nhắc sẽ xuất hiện ở đây khi họ đến';

  @override
  String get calmReminderFallbackText =>
      'Bây giờ cảm giác tức giận đó thế nào?';

  @override
  String get calmCheckTitle => 'Bây giờ bạn tức giận đến mức nào?';

  @override
  String calmCheckSubtitle(String emoji, String label) {
    return '$emoji $label · cơn tức giận trước đó';
  }

  @override
  String get calmSavedCalmedToast => 'Mừng vì bạn đã bình tĩnh lại.';

  @override
  String get calmSavedUpdatedToast => 'Đã lưu';

  @override
  String get profileName => 'Hổ giận dữ';

  @override
  String get nicknameAdjectives =>
      'tức giận, dữ dội, cuồng nộ, bùng nổ, hung dữ, gầm gừ, sắc bén, có sừng, nóng nảy, thô bạo, dữ dội, hung hãn, bốc lửa, sấm sét, giận dữ, sôi sục, bực bội, rực cháy, giông bão, độc ác';

  @override
  String get nicknameAnimals =>
      'hổ, sư tử, chó sói, gấu, đại bàng, cá mập, báo, báo gêpa, cá sấu, rắn hổ mang, bò đực, lợn rừng, tê giác, linh cẩu, hoa râm, quạ, diều hâu, nhím, báo đốm, puma';

  @override
  String get notificationSettings => 'Thông báo';

  @override
  String get commentNotification => 'Thông báo bình luận';

  @override
  String get settingsNotificationsSection => 'Thông báo';

  @override
  String get settingsReminderSubtitle =>
      'Lời nhắc ghi chú cơn thịnh nộ vào thời điểm bạn đặt';

  @override
  String get settingsCommentSubtitle =>
      'Cảnh báo khi có người bình luận về bài viết của bạn';

  @override
  String get settingsDataSection => 'dữ liệu';

  @override
  String get settingsDataImportSubtitle =>
      'Khôi phục bản ghi từ tập tin sao lưu';

  @override
  String get settingsSupportSection => 'Hỗ trợ';

  @override
  String get settingsPrivacySubtitle =>
      'Thông tin được thu thập và mục đích sử dụng';

  @override
  String get settingsFeedbackTitle => 'Gửi phản hồi';

  @override
  String get settingsFeedbackSubtitle => 'Vấn đề hoặc ý tưởng cải tiến';

  @override
  String get settingsRecordCountUnit => 'hồ sơ';

  @override
  String get settingsPostCountUnit => 'bài viết';

  @override
  String get proPlan => 'Xuất dữ liệu PRO';

  @override
  String get backupImport => 'Nhập dữ liệu';

  @override
  String get settingsDataExportSubtitle =>
      'Sao lưu tập tin · lịch sử · chia sẻ';

  @override
  String get dataExportTitle => 'Xuất dữ liệu';

  @override
  String get dataExportProTitle => 'Xuất dữ liệu PRO';

  @override
  String get dataExportDescription =>
      'Tạo một tệp sao lưu với tất cả dữ liệu ứng dụng cục bộ và chia sẻ nó qua email hoặc tin nhắn.';

  @override
  String get dataExportOneTimePurchase => 'Mua một lần · truy cập trọn đời';

  @override
  String get dataExportDebugPrice => 'DEBUG';

  @override
  String get dataExportInProgress => 'Xuất khẩu';

  @override
  String get dataExportPaymentChecking => 'Kiểm tra thanh toán';

  @override
  String get dataExportCreateButton => 'Tạo xuất';

  @override
  String get dataExportPayAndCreateButton => 'Thanh toán và xuất khẩu';

  @override
  String get dataExportRestorePurchase => 'Khôi phục mua hàng';

  @override
  String get dataExportCreatedToast => 'Đã tạo tệp xuất.';

  @override
  String get dataExportFailedToast => 'Không thể tạo tệp xuất.';

  @override
  String get dataExportShareSubject => 'Sao lưu dữ liệu Fury Note';

  @override
  String get dataExportShareText => 'Đây là tệp sao lưu dữ liệu Fury Note.';

  @override
  String get dataExportShareFailedToast => 'Không thể mở bảng chia sẻ.';

  @override
  String get dataExportAllDataIncluded =>
      'Tất cả dữ liệu ứng dụng cục bộ được bao gồm trong bản sao lưu';

  @override
  String get dataExportHistoryTitle => 'Lịch sử xuất khẩu';

  @override
  String dataExportHistoryCount(int count) {
    return '$count';
  }

  @override
  String get dataExportShareTooltip => 'Chia sẻ';

  @override
  String get dataExportEmptyHistory => 'Chưa có tập tin xuất nào.';

  @override
  String get purchaseUpdateFailed => 'Không thể xử lý bản cập nhật mua hàng.';

  @override
  String get purchaseStatusFailed => 'Không thể kiểm tra trạng thái mua hàng.';

  @override
  String get purchaseProductNotFound => 'Cửa hàng không tìm thấy sản phẩm.';

  @override
  String get purchaseStoreUnavailable => 'Không thể kết nối với cửa hàng.';

  @override
  String get purchaseProductInfoFailed =>
      'Không thể tải thông tin sản phẩm của cửa hàng.';

  @override
  String get purchaseProductUnavailable =>
      'Thông tin sản phẩm vẫn chưa sẵn sàng.';

  @override
  String get purchaseStartFailed => 'Không thể bắt đầu mua hàng.';

  @override
  String get purchaseCanceled => 'Giao dịch mua đã bị hủy.';

  @override
  String get purchaseReceiptInvalid => 'Không thể xác minh biên lai mua hàng.';

  @override
  String get purchaseReceiptVerifyFailed =>
      'Xác minh biên nhận mua hàng không thành công.';

  @override
  String get dataImportTitle => 'Nhập dữ liệu';

  @override
  String get dataImportPickTitle => 'Chọn tập tin sao lưu';

  @override
  String get dataImportPickDescription =>
      'Chọn tệp .fnbackup\nđược xuất từ Fury Note';

  @override
  String get dataImportPickButton => 'Chọn tập tin';

  @override
  String get dataImportInProgress => 'Nhập khẩu';

  @override
  String dataImportSuccessToast(int count) {
    return 'Đã thay thế dữ liệu từ bản sao lưu. (bản ghi $count)';
  }

  @override
  String get dataImportNoNewDataToast =>
      'Đã thay thế dữ liệu từ bản sao lưu. (0 hồ sơ)';

  @override
  String get dataImportFailedToast => 'Không thể nhập tập tin sao lưu.';

  @override
  String get dataImportInvalidFileToast => 'Chỉ có thể nhập tệp .fnbackup.';

  @override
  String get dataImportNoticeTitle => 'Trước khi nhập khẩu';

  @override
  String get dataImportNoticeBody =>
      'Dữ liệu hiện có sẽ bị xóa và thay thế bằng dữ liệu trong file sao lưu.';

  @override
  String get dataImportTransferTitle => 'Thiết bị di chuyển';

  @override
  String get dataImportTransferBody =>
      'Sau khi cài đặt ứng dụng trên thiết bị mới, hãy nhập tệp sao lưu để thay thế dữ liệu cục bộ hiện tại bằng dữ liệu sao lưu.';

  @override
  String get feedDeleteTitle => 'Xóa nguồn cấp dữ liệu';

  @override
  String get feedDeleteContent => 'Xóa nguồn cấp dữ liệu này?';

  @override
  String get calmBreathingTitle => 'Hơi thở';

  @override
  String get breathPhaseInhale => 'hít vào';

  @override
  String get breathPhaseHold => 'Giữ';

  @override
  String get breathPhaseExhale => 'thở ra';

  @override
  String durationSeconds(int count) {
    return '$count giây';
  }

  @override
  String cycleCount(int count) {
    return 'Chu kỳ $count';
  }

  @override
  String get calmTimeoutRunning => 'Đang chạy';

  @override
  String get calmTimeoutPaused => 'Đã tạm dừng';

  @override
  String get reset => 'Đặt lại';

  @override
  String get start => 'Bắt đầu';

  @override
  String get pause => 'Tạm dừng';

  @override
  String get stop => 'Dừng';

  @override
  String get calmMeditationSceneWave => 'Sóng';

  @override
  String get calmMeditationSceneForest => 'rừng';

  @override
  String get calmMeditationSceneSunset => 'Hoàng hôn';

  @override
  String get calmMeditationSceneMountain => 'Núi';

  @override
  String get calmMeditationSceneCherryBlossom => 'Hoa anh đào';

  @override
  String get calmMeditationSceneNightSky => 'Bầu trời đêm';

  @override
  String get calmMeditationPrompt => 'Hít vào thật sâu rồi thở ra';

  @override
  String get autoplay => 'Tự động phát';

  @override
  String get profileEditTitle => 'Chỉnh sửa hồ sơ';

  @override
  String get nicknameLabel => 'Biệt hiệu';

  @override
  String get nicknameHint => 'Nhập biệt hiệu';

  @override
  String get nicknameRequiredError => 'Vui lòng nhập biệt hiệu';

  @override
  String get nicknameCodeAutomaticError => 'Mã của bạn được thêm tự động';

  @override
  String get nicknameTooShortError => 'Sử dụng ít nhất 2 ký tự';

  @override
  String profileSavedToast(String name) {
    return '✅ Đã đổi thành \"$name\"!';
  }

  @override
  String get profileSaveFailedToast => 'Đã xảy ra lỗi khi lưu.';

  @override
  String get avatarPickGallery => 'Chọn từ thư viện';

  @override
  String get avatarPickCamera => 'Chụp ảnh';

  @override
  String get avatarReset => 'Sử dụng hình đại diện mặc định';

  @override
  String get avatarResetToast => 'Đã khôi phục hình đại diện mặc định.';

  @override
  String get avatarAppliedToast => 'Đã áp dụng ảnh hồ sơ.';

  @override
  String get avatarTooLargeToast =>
      'Chỉ có thể sử dụng ảnh có dung lượng tối đa 5 MB.';

  @override
  String get avatarLoadFailedToast => 'Không thể tải ảnh.';

  @override
  String get profileCodeLabel => 'Mã hồ sơ (không thể thay đổi)';

  @override
  String get profileSaveButton => 'Lưu thay đổi';

  @override
  String get avatarChangeLabel => 'Thay đổi ảnh hồ sơ';

  @override
  String get avatarChangeHint => 'Nhấn vào ảnh để thay đổi nó';

  @override
  String get avatarSizeHint => 'JPG, PNG, GIF · tối đa 5 MB';

  @override
  String get reminderNotificationFallbackBody =>
      'Bây giờ cảm giác tức giận đó thế nào?';

  @override
  String get calmGuideTitle =>
      'Khi cơn giận nổi lên,\nhạ thấp cơ thể của bạn một cách an toàn trước tiên';

  @override
  String get calmGuideSubtitle =>
      'Hướng dẫn bình tĩnh của Fury Note không bảo bạn phải thoát khỏi cơn tức giận. Đó là một hướng dẫn ngắn gọn để giúp cảm giác trôi qua mà không ai bị tổn thương.';

  @override
  String get calmGuideNotice =>
      '**Nếu bạn đang gặp nguy hiểm trước mắt**, vui lòng nhờ những người xung quanh giúp đỡ hoặc liên hệ với các dịch vụ khẩn cấp trước, thay vì ở lại ứng dụng này.';

  @override
  String get calmGuideMomentTitle => 'Khoảnh khắc cơn giận nổi lên';

  @override
  String get calmGuideMomentBody1 =>
      'Sự tức giận có thể là dấu hiệu cho thấy điều gì đó bạn quan tâm đã bị xâm phạm. Nhưng trong trạng thái giận dữ mạnh mẽ, khả năng phán xét tăng tốc, lời nói và hành động có thể trở nên thô bạo hơn bình thường.';

  @override
  String get calmGuideMomentBody2 =>
      'Điều cần thiết lúc này không phải là **hoàn toàn lý trí** mà là **trì hoãn phản ứng của bạn thậm chí 30 giây**.';

  @override
  String get calmGuideRoutineTitle => 'Thói quen bình tĩnh 60 giây';

  @override
  String get calmGuideStep1Title => 'Dừng lại';

  @override
  String get calmGuideStep1Desc =>
      'Tạm dừng trả lời, gọi điện, bình luận hoặc di chuyển. Hãy thả lỏng tay và rời mắt khỏi màn hình trong giây lát.';

  @override
  String get calmGuideStep2Title => 'thở';

  @override
  String get calmGuideStep2Desc =>
      'Hít vào trong 4 giây, giữ trong 7 giây, thở ra trong 8 giây. Không hoàn hảo cũng không sao.';

  @override
  String get calmGuideStep3Title => 'Kiểm tra cơ thể của bạn';

  @override
  String get calmGuideStep3Desc =>
      'Kiểm tra xem hàm, vai, nắm tay hoặc bụng của bạn có bị căng hay không và chỉ thả lỏng một chỗ.';

  @override
  String get calmGuideStep4Title => 'Viết nó ra';

  @override
  String get calmGuideStep4Desc =>
      'Ngay cả một câu như “Ngay bây giờ tôi đang tức giận vì ___” là đủ.';

  @override
  String get calmGuideBreathTitle => 'thở 4-7-8';

  @override
  String get calmGuideBreathStep1 => 'Hít vào bằng mũi trong 4 giây.';

  @override
  String get calmGuideBreathStep2 => 'Nín thở trong 7 giây.';

  @override
  String get calmGuideBreathStep3 => 'Từ từ thở ra bằng miệng trong 8 giây.';

  @override
  String get calmGuideBreathStep4 => 'Lặp lại 3 lần nếu có thể.';

  @override
  String get calmGuideBreathNote =>
      'Nếu việc nín thở lâu như vậy thật khó khăn, hãy rút ngắn thời gian đếm cho thoải mái như **3-3-5**. Điều quan trọng nhất là thở ra chậm và dài.';

  @override
  String get calmGuideTimeoutTitle => 'thời gian chờ 10 phút';

  @override
  String get calmGuideTimeoutBody =>
      'Cơn giận càng mạnh thì sự thôi thúc phải giải quyết nó ngay lập tức càng mạnh. Nhưng nói chuyện bây giờ có thể sẽ đưa ra những lời nói gây tổn thương trước.';

  @override
  String get calmGuideTimeoutExamplesTitle =>
      'Ví dụ về cụm từ hết thời gian chờ';

  @override
  String get calmGuideTimeoutExample1 =>
      '\"Bây giờ tôi đang rất tức giận, chúng ta hãy nói chuyện lại sau 10 phút nữa.\"';

  @override
  String get calmGuideTimeoutExample2 =>
      '\"Tôi tạm dừng một chút vì tôi có thể nói điều gì đó gây tổn thương.\"';

  @override
  String get calmGuideTimeoutExample3 =>
      '\"Tôi không chạy trốn, tôi chỉ cần bình tĩnh lại trước khi chúng ta nói chuyện lần nữa.\"';

  @override
  String get calmGuideSensoryTitle => 'Tiếp đất cảm giác nhanh chóng';

  @override
  String get calmGuideSensory1Title => 'Nước lạnh';

  @override
  String get calmGuideSensory1Desc =>
      'Giữ nước lạnh trên cổ tay hoặc mặt trong khoảng 10 giây';

  @override
  String get calmGuideSensory2Title => 'Cảm nhận đôi chân của bạn';

  @override
  String get calmGuideSensory2Desc =>
      'Từ từ nhận thấy cảm giác bàn chân chạm sàn';

  @override
  String get calmGuideSensory3Title => 'Nhìn xung quanh';

  @override
  String get calmGuideSensory3Desc =>
      'Hãy kể tên 5 đồ vật bạn có thể nhìn thấy';

  @override
  String get calmGuideSensory4Title => 'Thả vai của bạn';

  @override
  String get calmGuideSensory4Desc => 'Thở ra và hạ vai xuống chỉ 1cm';

  @override
  String get calmGuideQuestionsTitle => 'Các câu hỏi hỗ trợ khi viết';

  @override
  String get calmGuideQuestion1 =>
      'Chính xác thì điều gì đã khiến tôi tức giận?';

  @override
  String get calmGuideQuestion2 =>
      'Tôi đã mong đợi điều gì nhưng không nhận được?';

  @override
  String get calmGuideQuestion3 =>
      'Tôi sẽ hối hận về hành động nào nếu làm điều đó ngay bây giờ?';

  @override
  String get calmGuideQuestion4 =>
      'Sự lựa chọn nào của ngày mai tôi sẽ biết ơn?';

  @override
  String get calmGuideTag1 => 'Nhật ký cảm xúc';

  @override
  String get calmGuideTag2 => 'Giận dữ xa cách';

  @override
  String get calmGuideTag3 => 'Kiểm tra lời nhắc';

  @override
  String get calmGuideDangerTitle =>
      'Yêu cầu giúp đỡ trước tiên trong những trường hợp này';

  @override
  String get calmGuideDanger1 =>
      'Khi sự thôi thúc làm tổn thương bản thân hoặc người khác trở nên mạnh mẽ';

  @override
  String get calmGuideDanger2 =>
      'Khi cảm giác muốn ném hoặc đập vỡ đồ đạc không ngừng nghỉ';

  @override
  String get calmGuideDanger3 =>
      'Khi bạn cảm thấy muốn đối đầu hoặc đe dọa người khác';

  @override
  String get calmGuideDanger4 =>
      'Khi rượu, ma túy hoặc tình trạng thiếu ngủ trầm trọng khiến bạn khó kiểm soát';

  @override
  String get calmGuideDangerBody =>
      'Trong những trường hợp này, đừng cố gắng vượt qua nó chỉ bằng thói quen bình tĩnh - hãy nhờ những người xung quanh bạn, các dịch vụ chuyên nghiệp hoặc dịch vụ khẩn cấp giúp đỡ.';

  @override
  String get calmGuideFooterTitle => 'Fury Note Calm Guide';

  @override
  String get calmGuideFooterDisclaimer =>
      'Tài liệu này không thay thế chẩn đoán hoặc điều trị y tế.';

  @override
  String get privacyTitle => 'Chính sách bảo mật';

  @override
  String get privacyLastUpdated => 'Ngày có hiệu lực: 16 tháng 6 năm 2026';

  @override
  String get privacySection1Title => '1. Danh mục thông tin được thu thập';

  @override
  String get privacySection1Body =>
      'Fury Note có thể được sử dụng mà không cần đăng ký thành viên. Công ty chỉ thu thập những thông tin sau.\n· Mã định danh thiết bị - giá trị được phát hành ngẫu nhiên được sử dụng để nhận dạng người dùng mà không cần đăng ký, nhằm mục đích ngăn chặn việc sử dụng gian lận\n· Dữ liệu ghi lại cơn thịnh nộ - cường độ, danh mục và văn bản (chỉ được lưu trữ trên thiết bị)\n· Bài đăng nguồn cấp dữ liệu ẩn danh - biệt hiệu, hình đại diện, cường độ, danh mục và văn bản\n· Bình luận - biệt danh và nội dung bình luận\n· Bản ghi lượt thích — liệu người dùng có thích một bài đăng nhất định hay không\n· Mã thông báo đẩy - nhằm mục đích gửi thông báo (tùy chọn)';

  @override
  String get privacySection2Title => '2. Mục đích xử lý';

  @override
  String get privacySection2Body =>
      '· Cung cấp các tính năng cộng đồng, bao gồm nguồn cấp dữ liệu ẩn danh, nhận xét và lượt thích\n· Phát hiện hành vi sử dụng gian lận, bao gồm ngăn chặn lượt thích trùng lặp trên cùng một bài đăng\n· Gửi thông báo đẩy, bao gồm cả thông báo bình luận\n· Vận hành dịch vụ và phân tích lỗi';

  @override
  String get privacySection3Title =>
      '3. Không đăng ký thành viên và không lưu giữ thông tin cá nhân';

  @override
  String get privacySection3Body =>
      'Fury Note không yêu cầu đăng ký thành viên và không thu thập thông tin cá nhân có thể xác minh danh tính như tên, địa chỉ email hoặc số điện thoại.\nBiệt hiệu được người dùng tự động tạo hoặc nhập trực tiếp và không được liên kết với danh tính thực của người dùng. Mã nhận dạng thiết bị cũng là một giá trị được tạo ngẫu nhiên và không thể sử dụng để nhận dạng một cá nhân cụ thể.';

  @override
  String get privacySection4Title => '4. Cung cấp thông tin cho bên thứ ba';

  @override
  String get privacySection4Body =>
      'Công ty không cung cấp hoặc bán thông tin thu thập được cho bên thứ ba.';

  @override
  String get privacySection5Title =>
      '5. Thời gian lưu giữ và sử dụng thông tin';

  @override
  String get privacySection5Body =>
      '· Các bản ghi cơn thịnh nộ chỉ được lưu sẽ chỉ được giữ lại trên thiết bị và sẽ bị xóa cùng nhau khi xóa ứng dụng.\n· Các bài đăng, hình đại diện và nhận xét được chia sẻ trên nguồn cấp dữ liệu ẩn danh sẽ được giữ lại trên máy chủ cho đến khi bị người dùng xóa và sẽ bị xóa ngay lập tức theo yêu cầu đó.\n· Các bản ghi Like sẽ bị xóa cùng lúc khi xóa bài viết liên quan.';

  @override
  String get privacySection6Title => '6. Liên hệ';

  @override
  String get privacySection6Body =>
      'Mọi thắc mắc liên quan đến thông tin cá nhân, vui lòng liên hệ theo địa chỉ email bên dưới.\nlunlu.co.kr@gmail.com';

  @override
  String get appGuideTitle => 'Cách sử dụng Fury Note';

  @override
  String get appGuideSubtitle =>
      'Hướng dẫn ghi lại sự tức giận, theo dõi các mẫu và nhận hỗ trợ trên nguồn cấp dữ liệu.';

  @override
  String get appGuideRecordTitle => 'Ghi lại sự tức giận của bạn';

  @override
  String get appGuideRecordBody =>
      'Khi bạn tức giận, hãy nhấn vào nút 🔥 ở phía dưới để bắt đầu ghi âm.';

  @override
  String get appGuideRecordStep1 =>
      'Chọn cường độ: chọn biểu tượng cảm xúc phù hợp với mức độ tức giận của bạn';

  @override
  String get appGuideRecordStep2 => 'Chọn một danh mục: chọn một nguyên nhân';

  @override
  String get appGuideRecordStep3 =>
      'Viết nó ra: mô tả những gì đã xảy ra (bạn có thể bỏ qua phần này)';

  @override
  String get appGuideRecordStep4 =>
      'Lời nhắc: đặt thời gian nếu bạn muốn xem lại sau';

  @override
  String get appGuideRecordStep5 =>
      'Lưu hoặc đăng: giữ bản ghi ở chế độ riêng tư hoặc chia sẻ nó lên nguồn cấp dữ liệu';

  @override
  String get appGuideFeedTitle => 'Tìm hỗ trợ trên nguồn cấp dữ liệu';

  @override
  String get appGuideFeedBody =>
      'Chia sẻ sự tức giận của bạn có thể kết nối bạn với những người khác cũng có cảm giác tương tự.';

  @override
  String get appGuideFeedItem1 =>
      'Sau khi lưu, bạn có thể đăng **ẩn danh** lên nguồn cấp dữ liệu';

  @override
  String get appGuideFeedItem2 =>
      'Thích hoặc bình luận về bài viết của người khác';

  @override
  String get appGuideFeedItem3 =>
      'Bạn có thể xóa bài đăng của chính mình bất cứ lúc nào';

  @override
  String get appGuideStatsTitle => 'Theo dõi các mẫu cảm xúc của bạn';

  @override
  String get appGuideStatsBody =>
      'Tab thống kê giúp bạn nhìn lại các kiểu tức giận của mình.';

  @override
  String get appGuideStatsItem1 =>
      'Biểu đồ xu hướng cường độ thịnh nộ theo thời kỳ';

  @override
  String get appGuideStatsItem2 => 'Nguyên nhân phân bố theo danh mục';

  @override
  String get appGuideStatsItem3 => 'Xem lịch để duyệt hồ sơ theo ngày';

  @override
  String get appGuideStatsItem4 =>
      'Báo cáo cơn thịnh nộ để phân tích các mẫu theo danh mục';

  @override
  String get appGuideCalmTitle => 'Giảm bớt sự tức giận của bạn';

  @override
  String get appGuideCalmBody =>
      'Sau khi đăng nhập, hãy chuyển đến tab bình tĩnh để thử giảm bớt cảm xúc của bạn.';

  @override
  String get appGuideCalmItem1 =>
      'Ghi chú nhắc nhở: xem lại các bản ghi bạn đã gắn cờ để sử dụng sau';

  @override
  String get appGuideCalmItem2 =>
      'Hít thở: ổn định tâm trí bằng kỹ thuật 4-7-8';

  @override
  String get appGuideCalmItem3 =>
      'Hết thời gian chờ: làm chậm phản ứng của bạn với bộ hẹn giờ 10 phút';

  @override
  String get appGuideCalmItem4 =>
      'Thiền hình ảnh: thay đổi tâm trạng của bạn với hình ảnh thiên nhiên';

  @override
  String get appGuideProfileTitle => 'Biệt danh và hồ sơ';

  @override
  String get appGuideProfileBody =>
      'Vào menu > Cài đặt để thay đổi biệt hiệu và hình đại diện của bạn.';

  @override
  String get appGuideProfileItem1 =>
      'Biệt danh: nhập tên riêng của bạn hoặc tạo ngẫu nhiên';

  @override
  String get appGuideProfileItem2 =>
      'Hình đại diện: thể hiện bản thân bằng biểu tượng cảm xúc';

  @override
  String get appGuideNotificationTitle => 'Cài đặt thông báo';

  @override
  String get appGuideNotificationItem1 =>
      'Cảnh báo nhắc nhở: được nhắc về ghi chú giận dữ vào thời điểm bạn đặt';

  @override
  String get appGuideNotificationItem2 =>
      'Cảnh báo nhận xét: nhận thông báo khi ai đó nhận xét về bài đăng của bạn';

  @override
  String get appGuideNotificationHint =>
      'Chuyển đổi những điều này trong Cài đặt > Thông báo';

  @override
  String get appGuideFooterTitle => 'Fury Note App Guide';
}

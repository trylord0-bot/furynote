// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Fury Note';

  @override
  String get appKoreanName => 'Fury Note';

  @override
  String get record => '记录';

  @override
  String get feed => '动态';

  @override
  String get stats => '统计';

  @override
  String get calm => '平静';

  @override
  String get settings => '设置';

  @override
  String get drawerGuide => '应用指南';

  @override
  String get drawerCalmGuide => '平静指南';

  @override
  String get drawerVersion => 'Fury Note v1.0.0';

  @override
  String get menuTooltip => '菜单';

  @override
  String drawerRecordCount(String count) {
    return '🔥 $count 愤怒笔记';
  }

  @override
  String get drawerSettingsSubtitle => '昵称·通知';

  @override
  String get drawerGuideSubtitle => '如何使用愤怒笔记';

  @override
  String get drawerCalmGuideSubtitle => '冷静卡·今日小贴士';

  @override
  String get relativeTimeJustNow => '刚才';

  @override
  String relativeTimeMinutesAgo(int count) {
    return '$count 分钟前';
  }

  @override
  String relativeTimeHoursAgo(int count) {
    return '$count小时前';
  }

  @override
  String relativeTimeDaysAgo(int count) {
    return '$count 天前';
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
  String get recordTitle => '愤怒记录';

  @override
  String get stepIntensity => '你现在有多生气？';

  @override
  String get stepIntensitySub => '选择一个表情符号';

  @override
  String get stepCategory => '是什么原因造成的呢？';

  @override
  String get stepCategorySub => '选择一个类别';

  @override
  String get stepText => '发生了什么事？';

  @override
  String get stepTextSub => '你可以跳过这个';

  @override
  String get stepReminder => '想稍后再去吗？';

  @override
  String get stepReminderSub => '你可以跳过这个';

  @override
  String get stepSave => '保存此注释吗？';

  @override
  String get stepSaveSub => '保存后即可发布';

  @override
  String get stepPost => '分享这种感受吗？';

  @override
  String get stepPostSub => '它将是匿名的';

  @override
  String get voiceInput => '录音';

  @override
  String get next => '下一步';

  @override
  String get previous => '上一步';

  @override
  String get skip => '跳过';

  @override
  String get save => '保存';

  @override
  String get saveNote => '保存记录';

  @override
  String get postIt => '发布';

  @override
  String get saveOnly => '仅保存';

  @override
  String get feedPostedToast => '发送到饲料';

  @override
  String get recordPostedToast => '已发布';

  @override
  String get recordSavedToast => '已保存';

  @override
  String get commentPostedToast => '发表评论';

  @override
  String get commentSendFailedToast => '无法发送评论。请再试一次。';

  @override
  String get commentDeleteTitle => '删除评论';

  @override
  String get commentDeleteContent => '删除这条评论？';

  @override
  String commentsCount(int count) {
    return '$count 评论';
  }

  @override
  String get commentsEmpty => '还没有评论\n成为第一个离开的人💬';

  @override
  String get commentInputHint => '写评论...';

  @override
  String get apiErrorContentBlockedUrl => '无法提交带有链接的帖子。';

  @override
  String get apiErrorContentBlockedSpam => '无法提交促销文字。';

  @override
  String get apiErrorContentBlockedProfanity => '不能提交包含脏话的内容。';

  @override
  String get apiErrorContentBlockedModeration => '该内容无法提交。';

  @override
  String get apiErrorRateLimitExceeded => '请稍后重试。';

  @override
  String get apiErrorInternal => '服务器发生错误。请稍后重试。';

  @override
  String get apiErrorInvalidRequest => '无效请求。';

  @override
  String get apiErrorForbidden => '您没有权限。';

  @override
  String get apiErrorPostNotFound => '找不到帖子。';

  @override
  String get apiErrorCommentNotFound => '未找到评论。';

  @override
  String get apiErrorSignatureRequired => '需要请求签名。';

  @override
  String get apiErrorSignatureInvalid => '无效请求。';

  @override
  String get apiErrorSignatureExpired => '请求已过期。请再试一次。';

  @override
  String get apiErrorSignatureReplay => '该请求已被处理。';

  @override
  String get apiErrorUnknown => '发生未知错误。';

  @override
  String get reminderNotification => '提醒通知';

  @override
  String get noReminder => '未设置';

  @override
  String get summaryIntensity => '愤怒等级';

  @override
  String get summaryCategory => '类别';

  @override
  String get summaryText => '文字';

  @override
  String get summaryReminder => '提醒';

  @override
  String get none => '无';

  @override
  String get other => '其他';

  @override
  String get family => '家庭';

  @override
  String get romance => '浪漫';

  @override
  String get work => '工作';

  @override
  String get people => '人';

  @override
  String get driving => '驾驶';

  @override
  String get custom => '定制';

  @override
  String get recordCustomCategoryHint => '输入类别';

  @override
  String get recordTextHint => '写在这里';

  @override
  String get recordMicPermissionRequired => '需要麦克风许可。';

  @override
  String recordVoiceStartFailed(String label) {
    return '无法启动 $label。';
  }

  @override
  String get recordVoiceStopRecording => '停止录音';

  @override
  String get recordVoiceRecordAgain => '再次录制';

  @override
  String get recordVoiceSaved => '录音已保存。';

  @override
  String get recordAudioSummaryLabel => '语音';

  @override
  String get recordAudioIncluded => '包括录音';

  @override
  String get recordSavingInProgress => '正在保存...';

  @override
  String get recordPostingInProgress => '正在发送...';

  @override
  String get recordSaveFailedToast => '无法保存笔记。请再试一次。';

  @override
  String get recordProgressSemantics => '记录进度';

  @override
  String get hourSuffix => '小时';

  @override
  String get minuteSuffix => '米';

  @override
  String get reminderCustom => '定制';

  @override
  String get reminderIn30Minutes => '30分钟后';

  @override
  String get reminderIn1Hour => '1小时内';

  @override
  String get reminderIn2Hours => '2小时内';

  @override
  String get reminderIn6Hours => '6小时内';

  @override
  String get reminderTomorrow => '明天';

  @override
  String get annoyed => '生气';

  @override
  String get angry => '生气';

  @override
  String get mad => '疯狂';

  @override
  String get furious => '愤怒的';

  @override
  String get rage => '愤怒';

  @override
  String get calmed => '冷静';

  @override
  String get feedTitle => '动态';

  @override
  String get feedSubtitle => '浏览最新的愤怒故事';

  @override
  String get feedAllTab => '全部动态';

  @override
  String get feedMineTab => '我的动态';

  @override
  String get feedLoadFailed => '无法加载提要。';

  @override
  String get feedEmptyMine => '您还没有发布到提要。\n分享你的第一个愤怒笔记！';

  @override
  String get feedEmptyAll => '还没有提要帖子。\n成为第一个分享你愤怒的人！';

  @override
  String get feedPostFailedToast => '无法发送至 Feed。请再试一次。';

  @override
  String get like => '共鸣';

  @override
  String get comment => '评论';

  @override
  String get retry => '重试';

  @override
  String get statsTitle => '愤怒统计';

  @override
  String get statsSubtitle => '查看本周的情绪变化';

  @override
  String get week => '1周';

  @override
  String get month => '1个月';

  @override
  String get all => '全部';

  @override
  String get totalRecords => '记录';

  @override
  String get highestLevel => '最高';

  @override
  String get dailyAverage => '每日平均';

  @override
  String get decreaseRate => '减少';

  @override
  String get statsIntensityTrend => '愤怒强度趋势';

  @override
  String get statsCategoryDistribution => '原因分布';

  @override
  String get statsNoRecords => '没有记录可显示。';

  @override
  String get statsCalendarButtonTitle => '按日历查看记录';

  @override
  String get statsCalendarButtonSubtitle => '按日期检查和管理愤怒笔记';

  @override
  String get statsCalendarTitle => '按日历查看记录';

  @override
  String get statsOtherCategory => '其他';

  @override
  String selectedDateRecordsTitle(String date) {
    return '$date 条记录';
  }

  @override
  String get noRecordsOnSelectedDate => '所选日期没有写入任何记录。';

  @override
  String get reminderAction => '提醒';

  @override
  String get play => '播放';

  @override
  String get statsSummaryButtonTitle => '查看愤怒报告';

  @override
  String get statsSummaryButtonSubtitle => '按类别浏览你的愤怒模式';

  @override
  String get statsSummaryTitle => '愤怒报告';

  @override
  String get statsSummaryClose => '关闭';

  @override
  String get statsSummaryEmptyTitle => '尚无记录可汇总';

  @override
  String get statsSummaryEmptyBody => '添加愤怒注释后，类别模式将出现在此处。';

  @override
  String statsSummaryTopHeadline(String category) {
    return '“$category”最常让你生气';
  }

  @override
  String statsSummaryCategoryHeadline(String category) {
    return '正在查看“$category”';
  }

  @override
  String get statsSummaryComfortGeneric => '没关系。这可能会发生。';

  @override
  String get statsSummaryComfortFamily => '距离越近的人，就越难落地。';

  @override
  String get statsSummaryComfortRomance => '一段珍贵的关系可以让微小的时刻变得更加清晰。';

  @override
  String get statsSummaryComfortWork => '工作可能让你的思维速度超出了你的预期。';

  @override
  String get statsSummaryComfortPeople => '他人的言语和表达可能比预期的持续时间更长。';

  @override
  String get statsSummaryComfortDriving => '路上的紧张往往首先影响到身体。';

  @override
  String get statsSummaryMetricCount => '计数';

  @override
  String get statsSummaryMetricCategory => '类别';

  @override
  String get statsSummaryMetricFeed => '提要帖子';

  @override
  String get statsSummaryMetricCalm => '冷静尝试';

  @override
  String get statsSummaryMetricAverage => '平均。水平';

  @override
  String get statsSummaryMetricPeak => '峰值水平';

  @override
  String get statsSummaryConclusion => '结论';

  @override
  String statsSummaryRecordsUnit(int count) {
    return '$count次';
  }

  @override
  String statsSummaryAverageValue(String value) {
    return '$value/5';
  }

  @override
  String get statsSummaryConclusionTop =>
      '这是你最重复的愤怒信号。下次，尝试在愤怒完全升起之前检查身体的紧张程度。';

  @override
  String get statsSummaryConclusionCategory =>
      '在这个类别还很小的时候把它写下来可以帮助您更快地注意到这种模式。';

  @override
  String statsSummaryPageIndicator(int current, int total) {
    return '$current/$total';
  }

  @override
  String get statsSummaryCategoryShare => '品类份额';

  @override
  String get statsSummaryCalmRate => '平静率';

  @override
  String get statsSummaryShareRate => '分享率';

  @override
  String get noContent => '没有内容';

  @override
  String get voicePlayback => '播放语音';

  @override
  String get deleteConfirm => '删除？';

  @override
  String get delete => '删除';

  @override
  String get cancel => '取消';

  @override
  String get calmTitle => '平静';

  @override
  String get calmSubtitle => '慢慢放下仍然残留的情绪';

  @override
  String get reminderNotes => '提醒注意事项';

  @override
  String get breathing => '呼吸';

  @override
  String get timeout => '超时';

  @override
  String get meditation => '意象冥想';

  @override
  String get feedSupport => '饲料支持';

  @override
  String get calmReminderEmpty => '提醒到达后将出现在此处';

  @override
  String get calmReminderFallbackText => '那种愤怒现在感觉如何？';

  @override
  String get calmCheckTitle => '你现在有多生气？';

  @override
  String calmCheckSubtitle(String emoji, String label) {
    return '$emoji $label · 之前的愤怒';
  }

  @override
  String get calmSavedCalmedToast => '很高兴你冷静下来。';

  @override
  String get calmSavedUpdatedToast => '已保存';

  @override
  String get profileName => '愤怒的老虎';

  @override
  String get nicknameAdjectives =>
      '愤怒、愤怒、愤怒、爆炸、凶猛、咆哮、尖锐、有角、加热、粗糙、激烈、横冲直撞、火热、雷鸣般、气喘吁吁、沸腾、怨恨、炽热、暴风雨、有毒';

  @override
  String get nicknameAnimals =>
      '老虎、狮子、狼、熊、鹰、鲨鱼、豹子、猎豹、鳄鱼、眼镜蛇、公牛、野猪、犀牛、鬣狗、灰熊、乌鸦、鹰、刺猬、捷豹、美洲狮';

  @override
  String get notificationSettings => '通知';

  @override
  String get commentNotification => '评论提醒';

  @override
  String get settingsNotificationsSection => '通知';

  @override
  String get settingsReminderSubtitle => '在您设定的时间发出愤怒音符提醒';

  @override
  String get settingsCommentSubtitle => '当有人评论您的帖子时发出警报';

  @override
  String get settingsDataSection => '数据';

  @override
  String get settingsDataImportSubtitle => '从备份文件中恢复记录';

  @override
  String get settingsSupportSection => '支持';

  @override
  String get settingsPrivacySubtitle => '收集的信息和使用目的';

  @override
  String get settingsFeedbackTitle => '发送反馈';

  @override
  String get settingsFeedbackSubtitle => '问题或改进想法';

  @override
  String get settingsRecordCountUnit => '记录';

  @override
  String get settingsPostCountUnit => '帖子';

  @override
  String get proPlan => 'PRO数据导出';

  @override
  String get backupImport => '导入数据';

  @override
  String get settingsDataExportSubtitle => '备份文件·历史记录·共享';

  @override
  String get dataExportTitle => '导出数据';

  @override
  String get dataExportProTitle => 'PRO数据导出';

  @override
  String get dataExportDescription => '使用所有本地应用程序数据创建一个备份文件，并通过电子邮件或信使共享。';

  @override
  String get dataExportOneTimePurchase => '一次性购买·终生使用';

  @override
  String get dataExportDebugPrice => 'DEBUG';

  @override
  String get dataExportInProgress => '出口';

  @override
  String get dataExportPaymentChecking => '检查付款';

  @override
  String get dataExportCreateButton => '创建导出';

  @override
  String get dataExportPayAndCreateButton => '支付及导出';

  @override
  String get dataExportRestorePurchase => '恢复购买';

  @override
  String get dataExportCreatedToast => '创建的导出文件。';

  @override
  String get dataExportFailedToast => '无法创建导出文件。';

  @override
  String get dataExportShareSubject => '狂怒笔记数据备份';

  @override
  String get dataExportShareText => '这是Fury Note 数据备份文件。';

  @override
  String get dataExportShareFailedToast => '无法打开共享表。';

  @override
  String get dataExportAllDataIncluded => '所有本地应用程序数据都包含在备份中';

  @override
  String get dataExportHistoryTitle => '导出历史记录';

  @override
  String dataExportHistoryCount(int count) {
    return '$count';
  }

  @override
  String get dataExportShareTooltip => '分享';

  @override
  String get dataExportEmptyHistory => '还没有导出文件。';

  @override
  String get purchaseUpdateFailed => '无法处理购买更新。';

  @override
  String get purchaseStatusFailed => '无法检查购买状态。';

  @override
  String get purchaseProductNotFound => '未找到商店产品。';

  @override
  String get purchaseStoreUnavailable => '无法连接到商店。';

  @override
  String get purchaseProductInfoFailed => '无法加载商店产品信息。';

  @override
  String get purchaseProductUnavailable => '产品信息尚未准备好。';

  @override
  String get purchaseStartFailed => '无法开始购买。';

  @override
  String get purchaseCanceled => '购买被取消。';

  @override
  String get purchaseReceiptInvalid => '无法验证购买收据。';

  @override
  String get purchaseReceiptVerifyFailed => '购买收据验证失败。';

  @override
  String get dataImportTitle => '导入数据';

  @override
  String get dataImportPickTitle => '选择备份文件';

  @override
  String get dataImportPickDescription => '选择 .fnbackup 文件\n从《愤怒笔记》导出';

  @override
  String get dataImportPickButton => '选择文件';

  @override
  String get dataImportInProgress => '导入';

  @override
  String dataImportSuccessToast(int count) {
    return '替换了备份中的数据。 ($count记录)';
  }

  @override
  String get dataImportNoNewDataToast => '替换了备份中的数据。 (0 条记录)';

  @override
  String get dataImportFailedToast => '无法导入备份文件。';

  @override
  String get dataImportInvalidFileToast => '只能导入 .fnbackup 文件。';

  @override
  String get dataImportNoticeTitle => '导入前';

  @override
  String get dataImportNoticeBody => '现有数据将被删除并替换为备份文件中的数据。';

  @override
  String get dataImportTransferTitle => '移动设备';

  @override
  String get dataImportTransferBody => '在新设备上安装应用程序后，导入备份文件以用备份数据替换当前本地数据。';

  @override
  String get feedDeleteTitle => '删除提要';

  @override
  String get feedDeleteContent => '删除此供稿吗？';

  @override
  String get calmBreathingTitle => '呼吸';

  @override
  String get breathPhaseInhale => '吸气';

  @override
  String get breathPhaseHold => '保持';

  @override
  String get breathPhaseExhale => '呼气';

  @override
  String durationSeconds(int count) {
    return '$count秒';
  }

  @override
  String cycleCount(int count) {
    return '循环$count';
  }

  @override
  String get calmTimeoutRunning => '跑步';

  @override
  String get calmTimeoutPaused => '已暂停';

  @override
  String get reset => '重置';

  @override
  String get start => '开始';

  @override
  String get pause => '暂停';

  @override
  String get stop => '停止';

  @override
  String get calmMeditationSceneWave => '波浪';

  @override
  String get calmMeditationSceneForest => '森林';

  @override
  String get calmMeditationSceneSunset => '日落';

  @override
  String get calmMeditationSceneMountain => '山';

  @override
  String get calmMeditationSceneCherryBlossom => '樱花';

  @override
  String get calmMeditationSceneNightSky => '夜空';

  @override
  String get calmMeditationPrompt => '深吸气，然后呼气';

  @override
  String get autoplay => '自动播放';

  @override
  String get profileEditTitle => '编辑个人资料';

  @override
  String get nicknameLabel => '昵称';

  @override
  String get nicknameHint => '输入昵称';

  @override
  String get nicknameRequiredError => '请输入昵称';

  @override
  String get nicknameCodeAutomaticError => '您的代码会自动添加';

  @override
  String get nicknameTooShortError => '至少使用 2 个字符';

  @override
  String profileSavedToast(String name) {
    return '✅ 更改为“$name”！';
  }

  @override
  String get profileSaveFailedToast => '保存时发生错误。';

  @override
  String get avatarPickGallery => '从库中选择';

  @override
  String get avatarPickCamera => '拍张照片';

  @override
  String get avatarReset => '使用默认头像';

  @override
  String get avatarResetToast => '恢复默认头像。';

  @override
  String get avatarAppliedToast => '已应用个人资料照片。';

  @override
  String get avatarTooLargeToast => '只能使用最大 5 MB 的照片。';

  @override
  String get avatarLoadFailedToast => '无法加载照片。';

  @override
  String get profileCodeLabel => '个人资料代码（无法更改）';

  @override
  String get profileSaveButton => '保存更改';

  @override
  String get avatarChangeLabel => '更改个人资料照片';

  @override
  String get avatarChangeHint => '点按照片即可更改它';

  @override
  String get avatarSizeHint => 'JPG、PNG、GIF · 最大 5 MB';

  @override
  String get reminderNotificationFallbackBody => '那种愤怒现在感觉如何？';

  @override
  String get calmGuideTitle => '当愤怒上升时，\n首先安全地降低身体';

  @override
  String get calmGuideSubtitle =>
      '《愤怒笔记》的冷静指南并不告诉你要摆脱愤怒。这是一个简短的指南，可以帮助您在不伤害任何人的情况下缓解这种感觉。';

  @override
  String get calmGuideNotice =>
      '**如果您面临紧急危险**，请先向周围的人寻求帮助或联系紧急服务部门，而不是继续使用此应用程序。';

  @override
  String get calmGuideMomentTitle => '愤怒升腾的那一刻';

  @override
  String get calmGuideMomentBody1 =>
      '愤怒可能是一个信号，表明你关心的事情被侵犯了。但在强烈的愤怒状态下，判断力会加快，言语和行为会变得比平常更粗暴。';

  @override
  String get calmGuideMomentBody2 => '现在需要的不是**完全理性**，而是**反应延迟30秒**。';

  @override
  String get calmGuideRoutineTitle => '60秒平静例程';

  @override
  String get calmGuideStep1Title => '停止';

  @override
  String get calmGuideStep1Desc => '暂停回复、打电话、评论或移动。放松双手，暂时将目光从屏幕上移开。';

  @override
  String get calmGuideStep2Title => '呼吸';

  @override
  String get calmGuideStep2Desc => '吸气4秒，屏住7秒，呼气8秒。如果不完美也没关系。';

  @override
  String get calmGuideStep3Title => '检查你的身体';

  @override
  String get calmGuideStep3Desc => '检查你的下巴、肩膀、拳头或腹部是否紧张，只放松其中一个部位。';

  @override
  String get calmGuideStep4Title => '写下来';

  @override
  String get calmGuideStep4Desc => '即使是“现在我很生气，因为___”这样的一句话就足够了。';

  @override
  String get calmGuideBreathTitle => '4-7-8呼吸';

  @override
  String get calmGuideBreathStep1 => '通过鼻子吸气 4 秒钟。';

  @override
  String get calmGuideBreathStep2 => '屏住呼吸 7 秒钟。';

  @override
  String get calmGuideBreathStep3 => '通过嘴慢慢呼气，持续 8 秒。';

  @override
  String get calmGuideBreathStep4 => '如果可以的话重复3次。';

  @override
  String get calmGuideBreathNote =>
      '如果长时间屏住呼吸很困难，请将其缩短为舒适的数数，例如 **3-3-5**。最重要的是缓慢而长的呼气。';

  @override
  String get calmGuideTimeoutTitle => '10分钟暂停';

  @override
  String get calmGuideTimeoutBody => '愤怒越强烈，想要立即解决的冲动就越强烈。但现在说话可能首先会带来伤人的话。';

  @override
  String get calmGuideTimeoutExamplesTitle => '超时短语示例';

  @override
  String get calmGuideTimeoutExample1 => '“我现在太生气了，十分钟后再聊吧。”';

  @override
  String get calmGuideTimeoutExample2 => '“我暂停一下，因为我可能会说一些伤人的话。”';

  @override
  String get calmGuideTimeoutExample3 => '“我没有逃跑，我只是需要冷静一下，然后再说话。”';

  @override
  String get calmGuideSensoryTitle => '快速感官接地';

  @override
  String get calmGuideSensory1Title => '冷水';

  @override
  String get calmGuideSensory1Desc => '将冷水敷在手腕或脸上约 10 秒钟';

  @override
  String get calmGuideSensory2Title => '感觉你的脚';

  @override
  String get calmGuideSensory2Desc => '慢慢注意脚接触地板的感觉';

  @override
  String get calmGuideSensory3Title => '环顾四周';

  @override
  String get calmGuideSensory3Desc => '安静地说出 5 个你能看到的物体的名字';

  @override
  String get calmGuideSensory4Title => '放下你的肩膀';

  @override
  String get calmGuideSensory4Desc => '呼气并将肩膀降低1厘米';

  @override
  String get calmGuideQuestionsTitle => '对写作有帮助的问题';

  @override
  String get calmGuideQuestion1 => '究竟是什么让我生气？';

  @override
  String get calmGuideQuestion2 => '我期待但没有收到什么？';

  @override
  String get calmGuideQuestion3 => '如果我现在就采取什么行动，我会后悔吗？';

  @override
  String get calmGuideQuestion4 => '明天的我会庆幸什么样的选择？';

  @override
  String get calmGuideTag1 => '情感日志';

  @override
  String get calmGuideTag2 => '愤怒疏远';

  @override
  String get calmGuideTag3 => '提醒检查';

  @override
  String get calmGuideDangerTitle => '在这些情况下首先寻求帮助';

  @override
  String get calmGuideDanger1 => '当想要伤害自己或他人的冲动强烈时';

  @override
  String get calmGuideDanger2 => '当扔东西或摔东西的冲动无法停止时';

  @override
  String get calmGuideDanger3 => '当您想要对抗或威胁对方时';

  @override
  String get calmGuideDanger4 => '当酒精、毒品或严重睡眠不足导致难以控制时';

  @override
  String get calmGuideDangerBody =>
      '在这些情况下，不要试图仅靠平静的方式来度过难关——向周围的人、专业服务人员或紧急服务人员寻求帮助。';

  @override
  String get calmGuideFooterTitle => 'Fury Note Calm Guide';

  @override
  String get calmGuideFooterDisclaimer => '本文件不能代替医疗诊断或治疗。';

  @override
  String get privacyTitle => '隐私政策';

  @override
  String get privacyLastUpdated => '生效日期：2026 年 6 月 16 日';

  @override
  String get privacySection1Title => '1. 收集信息的类别';

  @override
  String get privacySection1Body =>
      'Fury Note无需任何会员注册即可使用。公司仅收集以下信息。\n· 设备标识符——随机发布的值，用于在未注册的情况下识别用户身份，以防止欺诈使用\n· 愤怒记录数据——强度、类别和文本（仅存储在设备上）\n· 匿名提要帖子 — 昵称、头像图像、强度、类别和文本\n· 评论——昵称和评论文本\n· 点赞记录——用户是否点赞某个帖子\n· 推送通知令牌 — 用于发送通知（可选）';

  @override
  String get privacySection2Title => '2. 处理目的';

  @override
  String get privacySection2Body =>
      '· 提供社区功能，包括匿名提要、评论和点赞\n· 检测欺诈性使用，包括防止同一帖子重复点赞\n· 发送推送通知，包括评论提醒\n· 服务的运行及错误分析';

  @override
  String get privacySection3Title => '3. 无需注册会员，不保留个人信息';

  @override
  String get privacySection3Body =>
      'Fury Note 不需要会员注册，也不会收集可验证身份的个人信息，例如姓名、电子邮件地址或电话号码。\n昵称由用户自动生成或直接输入，与用户的真实身份无关。设备标识符同样是随机生成的值，不能用于识别特定的个人。';

  @override
  String get privacySection4Title => '4. 向第三方提供信息';

  @override
  String get privacySection4Body => '公司不会向第三方提供或出售收集到的信息。';

  @override
  String get privacySection5Title => '5.信息的保留和使用期限';

  @override
  String get privacySection5Body =>
      '· 仅保存的愤怒记录仅保留在设备上，并在删除应用程序时一起删除。\n· 共享到匿名源的帖子、头像和评论将保留在服务器上，直到被用户删除，并根据此类请求立即删除。\n· 删除相关帖子后，点赞记录也会一起删除。';

  @override
  String get privacySection6Title => '6. 联系方式';

  @override
  String get privacySection6Body =>
      '有关个人信息的咨询，请联系以下电子邮件地址。\nlunlu.co.kr@gmail.com';

  @override
  String get appGuideTitle => '如何使用愤怒笔记';

  @override
  String get appGuideSubtitle => '记录愤怒、跟踪模式以及获取动态支持的指南。';

  @override
  String get appGuideRecordTitle => '记录你的愤怒';

  @override
  String get appGuideRecordBody => '当你生气时，点击底部的🔥按钮开始记录。';

  @override
  String get appGuideRecordStep1 => '选择强度：选择与您的愤怒程度相匹配的表情符号';

  @override
  String get appGuideRecordStep2 => '选择类别：选择一个原因';

  @override
  String get appGuideRecordStep3 => '把它写出来：描述发生了什么（你可以跳过这个）';

  @override
  String get appGuideRecordStep4 => '提醒：如果您想稍后再看，请设置时间';

  @override
  String get appGuideRecordStep5 => '保存或发布：将记录保密或分享到提要';

  @override
  String get appGuideFeedTitle => '在 Feed 上寻找支持';

  @override
  String get appGuideFeedBody => '分享你的愤怒可以让你与其他有同样感受的人建立联系。';

  @override
  String get appGuideFeedItem1 => '保存后，您可以**匿名**发布到提要';

  @override
  String get appGuideFeedItem2 => '点赞或评论其他人的帖子';

  @override
  String get appGuideFeedItem3 => '您可以随时删除自己的帖子';

  @override
  String get appGuideStatsTitle => '追踪您的情绪模式';

  @override
  String get appGuideStatsBody => '统计选项卡可帮助您回顾您的愤怒模式。';

  @override
  String get appGuideStatsItem1 => '按时期划分的愤怒强度趋势图';

  @override
  String get appGuideStatsItem2 => '原因按类别分布';

  @override
  String get appGuideStatsItem3 => '日历视图可按日期浏览记录';

  @override
  String get appGuideStatsItem4 => '愤怒报告可按类别分析模式';

  @override
  String get appGuideCalmTitle => '降低你的愤怒';

  @override
  String get appGuideCalmBody => '登录后，前往“平静”选项卡，尝试降低情绪。';

  @override
  String get appGuideCalmItem1 => '提醒说明：重新访问您标记为稍后查看的记录';

  @override
  String get appGuideCalmItem2 => '呼吸：用 4-7-8 技巧让自己平静下来';

  @override
  String get appGuideCalmItem3 => '超时：用 10 分钟计时器减慢你的反应';

  @override
  String get appGuideCalmItem4 => '意象冥想：用自然意象改变你的心情';

  @override
  String get appGuideProfileTitle => '昵称和个人资料';

  @override
  String get appGuideProfileBody => '进入菜单 > 设置来更改您的昵称和头像。';

  @override
  String get appGuideProfileItem1 => '昵称：输入您自己的昵称或随机生成一个';

  @override
  String get appGuideProfileItem2 => '头像：用表情符号代表你自己';

  @override
  String get appGuideNotificationTitle => '通知设置';

  @override
  String get appGuideNotificationItem1 => '提醒警报：在您设置的时间收到愤怒通知提醒';

  @override
  String get appGuideNotificationItem2 => '评论提醒：当有人评论您的帖子时收到通知';

  @override
  String get appGuideNotificationHint => '在“设置”>“通知”中切换这些';

  @override
  String get appGuideFooterTitle => 'Fury Note App Guide';
}

/// The translations for Chinese, using the Han script (`zh_Hans`).
class AppLocalizationsZhHans extends AppLocalizationsZh {
  AppLocalizationsZhHans() : super('zh_Hans');

  @override
  String get appTitle => 'Fury Note';

  @override
  String get appKoreanName => 'Fury Note';

  @override
  String get record => '记录';

  @override
  String get feed => '动态';

  @override
  String get stats => '统计';

  @override
  String get calm => '平静';

  @override
  String get settings => '设置';

  @override
  String get drawerGuide => '应用指南';

  @override
  String get drawerCalmGuide => '平静指南';

  @override
  String get drawerVersion => 'Fury Note v1.0.0';

  @override
  String get menuTooltip => '菜单';

  @override
  String drawerRecordCount(String count) {
    return '🔥 $count 愤怒笔记';
  }

  @override
  String get drawerSettingsSubtitle => '昵称·通知';

  @override
  String get drawerGuideSubtitle => 'Fury Note 使用方法';

  @override
  String get drawerCalmGuideSubtitle => '冷静卡·今日小贴士';

  @override
  String get relativeTimeJustNow => '刚才';

  @override
  String relativeTimeMinutesAgo(int count) {
    return '$count 分钟前';
  }

  @override
  String relativeTimeHoursAgo(int count) {
    return '$count小时前';
  }

  @override
  String relativeTimeDaysAgo(int count) {
    return '$count 天前';
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
  String get recordTitle => '愤怒记录';

  @override
  String get stepIntensity => '你现在有多生气？';

  @override
  String get stepIntensitySub => '选择一个表情符号';

  @override
  String get stepCategory => '是什么原因造成的呢？';

  @override
  String get stepCategorySub => '选择一个类别';

  @override
  String get stepText => '发生了什么事？';

  @override
  String get stepTextSub => '你可以跳过这个';

  @override
  String get stepReminder => '想稍后再去吗？';

  @override
  String get stepReminderSub => '你可以跳过这个';

  @override
  String get stepSave => '保存此注释吗？';

  @override
  String get stepSaveSub => '保存后即可发布';

  @override
  String get stepPost => '分享这种感受吗？';

  @override
  String get stepPostSub => '它将是匿名的';

  @override
  String get voiceInput => '录音';

  @override
  String get next => '下一步';

  @override
  String get previous => '上一步';

  @override
  String get skip => '跳过';

  @override
  String get save => '保存';

  @override
  String get saveNote => '保存记录';

  @override
  String get postIt => '发布';

  @override
  String get saveOnly => '仅保存';

  @override
  String get feedPostedToast => '发送到饲料';

  @override
  String get recordPostedToast => '已发布';

  @override
  String get recordSavedToast => '已保存';

  @override
  String get commentPostedToast => '发表评论';

  @override
  String get commentSendFailedToast => '无法发送评论。请再试一次。';

  @override
  String get commentDeleteTitle => '删除评论';

  @override
  String get commentDeleteContent => '删除这条评论？';

  @override
  String commentsCount(int count) {
    return '$count 评论';
  }

  @override
  String get commentsEmpty => '还没有评论\n成为第一个离开的人💬';

  @override
  String get commentInputHint => '写评论...';

  @override
  String get apiErrorContentBlockedUrl => '无法提交带有链接的帖子。';

  @override
  String get apiErrorContentBlockedSpam => '无法提交促销文字。';

  @override
  String get apiErrorContentBlockedProfanity => '不能提交包含脏话的内容。';

  @override
  String get apiErrorContentBlockedModeration => '该内容无法提交。';

  @override
  String get apiErrorRateLimitExceeded => '请稍后重试。';

  @override
  String get apiErrorInternal => '服务器发生错误。请稍后重试。';

  @override
  String get apiErrorInvalidRequest => '无效请求。';

  @override
  String get apiErrorForbidden => '您没有权限。';

  @override
  String get apiErrorPostNotFound => '找不到帖子。';

  @override
  String get apiErrorCommentNotFound => '未找到评论。';

  @override
  String get apiErrorSignatureRequired => '需要请求签名。';

  @override
  String get apiErrorSignatureInvalid => '无效请求。';

  @override
  String get apiErrorSignatureExpired => '请求已过期。请再试一次。';

  @override
  String get apiErrorSignatureReplay => '该请求已被处理。';

  @override
  String get apiErrorUnknown => '发生未知错误。';

  @override
  String get reminderNotification => '提醒通知';

  @override
  String get noReminder => '未设置';

  @override
  String get summaryIntensity => '愤怒等级';

  @override
  String get summaryCategory => '类别';

  @override
  String get summaryText => '文字';

  @override
  String get summaryReminder => '提醒';

  @override
  String get none => '无';

  @override
  String get other => '其他';

  @override
  String get family => '家庭';

  @override
  String get romance => '浪漫';

  @override
  String get work => '工作';

  @override
  String get people => '人';

  @override
  String get driving => '驾驶';

  @override
  String get custom => '定制';

  @override
  String get recordCustomCategoryHint => '输入类别';

  @override
  String get recordTextHint => '写在这里';

  @override
  String get recordMicPermissionRequired => '需要麦克风许可。';

  @override
  String recordVoiceStartFailed(String label) {
    return '无法启动 $label。';
  }

  @override
  String get recordVoiceStopRecording => '停止录音';

  @override
  String get recordVoiceRecordAgain => '再次录制';

  @override
  String get recordVoiceSaved => '录音已保存。';

  @override
  String get recordAudioSummaryLabel => '语音';

  @override
  String get recordAudioIncluded => '包括录音';

  @override
  String get recordSavingInProgress => '正在保存...';

  @override
  String get recordPostingInProgress => '正在发送...';

  @override
  String get recordSaveFailedToast => '无法保存笔记。请再试一次。';

  @override
  String get recordProgressSemantics => '记录进度';

  @override
  String get hourSuffix => '小时';

  @override
  String get minuteSuffix => '米';

  @override
  String get reminderCustom => '定制';

  @override
  String get reminderIn30Minutes => '30分钟后';

  @override
  String get reminderIn1Hour => '1小时内';

  @override
  String get reminderIn2Hours => '2小时内';

  @override
  String get reminderIn6Hours => '6小时内';

  @override
  String get reminderTomorrow => '明天';

  @override
  String get annoyed => '生气';

  @override
  String get angry => '生气';

  @override
  String get mad => '疯狂';

  @override
  String get furious => '愤怒的';

  @override
  String get rage => '愤怒';

  @override
  String get calmed => '冷静';

  @override
  String get feedTitle => '动态';

  @override
  String get feedSubtitle => '浏览最新的愤怒故事';

  @override
  String get feedAllTab => '全部动态';

  @override
  String get feedMineTab => '我的动态';

  @override
  String get feedLoadFailed => '无法加载提要。';

  @override
  String get feedEmptyMine => '您还没有发布到提要。\n分享你的第一个愤怒笔记！';

  @override
  String get feedEmptyAll => '还没有提要帖子。\n成为第一个分享你愤怒的人！';

  @override
  String get feedPostFailedToast => '无法发送至 Feed。请再试一次。';

  @override
  String get like => '共鸣';

  @override
  String get comment => '评论';

  @override
  String get retry => '重试';

  @override
  String get statsTitle => '愤怒统计';

  @override
  String get statsSubtitle => '查看本周的情绪变化';

  @override
  String get week => '1周';

  @override
  String get month => '1个月';

  @override
  String get all => '全部';

  @override
  String get totalRecords => '记录';

  @override
  String get highestLevel => '最高';

  @override
  String get dailyAverage => '每日平均';

  @override
  String get decreaseRate => '减少';

  @override
  String get statsIntensityTrend => '愤怒强度趋势';

  @override
  String get statsCategoryDistribution => '原因分布';

  @override
  String get statsNoRecords => '没有记录可显示。';

  @override
  String get statsCalendarButtonTitle => '按日历查看记录';

  @override
  String get statsCalendarButtonSubtitle => '按日期检查和管理愤怒笔记';

  @override
  String get statsCalendarTitle => '按日历查看记录';

  @override
  String get statsOtherCategory => '其他';

  @override
  String selectedDateRecordsTitle(String date) {
    return '$date 条记录';
  }

  @override
  String get noRecordsOnSelectedDate => '所选日期没有写入任何记录。';

  @override
  String get reminderAction => '提醒';

  @override
  String get play => '播放';

  @override
  String get statsSummaryButtonTitle => '查看愤怒报告';

  @override
  String get statsSummaryButtonSubtitle => '按类别浏览你的愤怒模式';

  @override
  String get statsSummaryTitle => '愤怒报告';

  @override
  String get statsSummaryClose => '关闭';

  @override
  String get statsSummaryEmptyTitle => '尚无记录可汇总';

  @override
  String get statsSummaryEmptyBody => '添加愤怒注释后，类别模式将出现在此处。';

  @override
  String statsSummaryTopHeadline(String category) {
    return '“$category”最常让你生气';
  }

  @override
  String statsSummaryCategoryHeadline(String category) {
    return '正在查看“$category”';
  }

  @override
  String get statsSummaryComfortGeneric => '没关系。这可能会发生。';

  @override
  String get statsSummaryComfortFamily => '距离越近的人，就越难落地。';

  @override
  String get statsSummaryComfortRomance => '一段珍贵的关系可以让微小的时刻变得更加清晰。';

  @override
  String get statsSummaryComfortWork => '工作可能让你的思维速度超出了你的预期。';

  @override
  String get statsSummaryComfortPeople => '他人的言语和表达可能比预期的持续时间更长。';

  @override
  String get statsSummaryComfortDriving => '路上的紧张往往首先影响到身体。';

  @override
  String get statsSummaryMetricCount => '计数';

  @override
  String get statsSummaryMetricCategory => '类别';

  @override
  String get statsSummaryMetricFeed => '提要帖子';

  @override
  String get statsSummaryMetricCalm => '冷静尝试';

  @override
  String get statsSummaryMetricAverage => '平均。水平';

  @override
  String get statsSummaryMetricPeak => '峰值水平';

  @override
  String get statsSummaryConclusion => '结论';

  @override
  String statsSummaryRecordsUnit(int count) {
    return '$count次';
  }

  @override
  String statsSummaryAverageValue(String value) {
    return '$value/5';
  }

  @override
  String get statsSummaryConclusionTop =>
      '这是你最重复的愤怒信号。下次，尝试在愤怒完全升起之前检查身体的紧张程度。';

  @override
  String get statsSummaryConclusionCategory =>
      '在这个类别还很小的时候把它写下来可以帮助您更快地注意到这种模式。';

  @override
  String statsSummaryPageIndicator(int current, int total) {
    return '$current/$total';
  }

  @override
  String get statsSummaryCategoryShare => '品类份额';

  @override
  String get statsSummaryCalmRate => '平静率';

  @override
  String get statsSummaryShareRate => '分享率';

  @override
  String get noContent => '没有内容';

  @override
  String get voicePlayback => '播放语音';

  @override
  String get deleteConfirm => '删除？';

  @override
  String get delete => '删除';

  @override
  String get cancel => '取消';

  @override
  String get calmTitle => '平静';

  @override
  String get calmSubtitle => '慢慢放下仍然残留的情绪';

  @override
  String get reminderNotes => '提醒注意事项';

  @override
  String get breathing => '呼吸';

  @override
  String get timeout => '超时';

  @override
  String get meditation => '意象冥想';

  @override
  String get feedSupport => '饲料支持';

  @override
  String get calmReminderEmpty => '提醒到达后将出现在此处';

  @override
  String get calmReminderFallbackText => '那种愤怒现在感觉如何？';

  @override
  String get calmCheckTitle => '你现在有多生气？';

  @override
  String calmCheckSubtitle(String emoji, String label) {
    return '$emoji $label · 之前的愤怒';
  }

  @override
  String get calmSavedCalmedToast => '很高兴你冷静下来。';

  @override
  String get calmSavedUpdatedToast => '已保存';

  @override
  String get profileName => '愤怒的老虎';

  @override
  String get nicknameAdjectives =>
      '愤怒、愤怒、愤怒、爆炸、凶猛、咆哮、尖锐、有角、加热、粗糙、激烈、横冲直撞、火热、雷鸣般、气喘吁吁、沸腾、怨恨、炽热、暴风雨、有毒';

  @override
  String get nicknameAnimals =>
      '老虎、狮子、狼、熊、鹰、鲨鱼、豹子、猎豹、鳄鱼、眼镜蛇、公牛、野猪、犀牛、鬣狗、灰熊、乌鸦、鹰、刺猬、捷豹、美洲狮';

  @override
  String get notificationSettings => '通知';

  @override
  String get commentNotification => '评论提醒';

  @override
  String get settingsNotificationsSection => '通知';

  @override
  String get settingsReminderSubtitle => '在您设定的时间发出愤怒音符提醒';

  @override
  String get settingsCommentSubtitle => '当有人评论您的帖子时发出警报';

  @override
  String get settingsDataSection => '数据';

  @override
  String get settingsDataImportSubtitle => '从备份文件中恢复记录';

  @override
  String get settingsSupportSection => '支持';

  @override
  String get settingsPrivacySubtitle => '收集的信息和使用目的';

  @override
  String get settingsFeedbackTitle => '发送反馈';

  @override
  String get settingsFeedbackSubtitle => '问题或改进想法';

  @override
  String get settingsRecordCountUnit => '记录';

  @override
  String get settingsPostCountUnit => '帖子';

  @override
  String get proPlan => 'PRO数据导出';

  @override
  String get backupImport => '导入数据';

  @override
  String get settingsDataExportSubtitle => '备份文件·历史记录·共享';

  @override
  String get dataExportTitle => '导出数据';

  @override
  String get dataExportProTitle => 'PRO数据导出';

  @override
  String get dataExportDescription => '使用所有本地应用程序数据创建一个备份文件，并通过电子邮件或信使共享。';

  @override
  String get dataExportOneTimePurchase => '一次性购买·终生使用';

  @override
  String get dataExportDebugPrice => 'DEBUG';

  @override
  String get dataExportInProgress => '出口';

  @override
  String get dataExportPaymentChecking => '检查付款';

  @override
  String get dataExportCreateButton => '创建导出';

  @override
  String get dataExportPayAndCreateButton => '支付及导出';

  @override
  String get dataExportRestorePurchase => '恢复购买';

  @override
  String get dataExportCreatedToast => '创建的导出文件。';

  @override
  String get dataExportFailedToast => '无法创建导出文件。';

  @override
  String get dataExportShareSubject => 'Fury Note 数据备份';

  @override
  String get dataExportShareText => '这是 Fury Note 的数据备份文件。';

  @override
  String get dataExportShareFailedToast => '无法打开共享表。';

  @override
  String get dataExportAllDataIncluded => '所有本地应用程序数据都包含在备份中';

  @override
  String get dataExportHistoryTitle => '导出历史记录';

  @override
  String dataExportHistoryCount(int count) {
    return '$count';
  }

  @override
  String get dataExportShareTooltip => '分享';

  @override
  String get dataExportEmptyHistory => '还没有导出文件。';

  @override
  String get purchaseUpdateFailed => '无法处理购买更新。';

  @override
  String get purchaseStatusFailed => '无法检查购买状态。';

  @override
  String get purchaseProductNotFound => '未找到商店产品。';

  @override
  String get purchaseStoreUnavailable => '无法连接到商店。';

  @override
  String get purchaseProductInfoFailed => '无法加载商店产品信息。';

  @override
  String get purchaseProductUnavailable => '产品信息尚未准备好。';

  @override
  String get purchaseStartFailed => '无法开始购买。';

  @override
  String get purchaseCanceled => '购买被取消。';

  @override
  String get purchaseReceiptInvalid => '无法验证购买收据。';

  @override
  String get purchaseReceiptVerifyFailed => '购买收据验证失败。';

  @override
  String get dataImportTitle => '导入数据';

  @override
  String get dataImportPickTitle => '选择备份文件';

  @override
  String get dataImportPickDescription => '选择 .fnbackup 文件\n从《愤怒笔记》导出';

  @override
  String get dataImportPickButton => '选择文件';

  @override
  String get dataImportInProgress => '导入';

  @override
  String dataImportSuccessToast(int count) {
    return '替换了备份中的数据。 ($count记录)';
  }

  @override
  String get dataImportNoNewDataToast => '替换了备份中的数据。 (0 条记录)';

  @override
  String get dataImportFailedToast => '无法导入备份文件。';

  @override
  String get dataImportInvalidFileToast => '只能导入 .fnbackup 文件。';

  @override
  String get dataImportNoticeTitle => '导入前';

  @override
  String get dataImportNoticeBody => '现有数据将被删除并替换为备份文件中的数据。';

  @override
  String get dataImportTransferTitle => '移动设备';

  @override
  String get dataImportTransferBody => '在新设备上安装应用程序后，导入备份文件以用备份数据替换当前本地数据。';

  @override
  String get feedDeleteTitle => '删除提要';

  @override
  String get feedDeleteContent => '删除此供稿吗？';

  @override
  String get calmBreathingTitle => '呼吸';

  @override
  String get breathPhaseInhale => '吸气';

  @override
  String get breathPhaseHold => '保持';

  @override
  String get breathPhaseExhale => '呼气';

  @override
  String durationSeconds(int count) {
    return '$count秒';
  }

  @override
  String cycleCount(int count) {
    return '循环$count';
  }

  @override
  String get calmTimeoutRunning => '跑步';

  @override
  String get calmTimeoutPaused => '已暂停';

  @override
  String get reset => '重置';

  @override
  String get start => '开始';

  @override
  String get pause => '暂停';

  @override
  String get stop => '停止';

  @override
  String get calmMeditationSceneWave => '波浪';

  @override
  String get calmMeditationSceneForest => '森林';

  @override
  String get calmMeditationSceneSunset => '日落';

  @override
  String get calmMeditationSceneMountain => '山';

  @override
  String get calmMeditationSceneCherryBlossom => '樱花';

  @override
  String get calmMeditationSceneNightSky => '夜空';

  @override
  String get calmMeditationPrompt => '深吸气，然后呼气';

  @override
  String get autoplay => '自动播放';

  @override
  String get profileEditTitle => '编辑个人资料';

  @override
  String get nicknameLabel => '昵称';

  @override
  String get nicknameHint => '输入昵称';

  @override
  String get nicknameRequiredError => '请输入昵称';

  @override
  String get nicknameCodeAutomaticError => '您的代码会自动添加';

  @override
  String get nicknameTooShortError => '至少使用 2 个字符';

  @override
  String profileSavedToast(String name) {
    return '✅ 更改为“$name”！';
  }

  @override
  String get profileSaveFailedToast => '保存时发生错误。';

  @override
  String get avatarPickGallery => '从库中选择';

  @override
  String get avatarPickCamera => '拍张照片';

  @override
  String get avatarReset => '使用默认头像';

  @override
  String get avatarResetToast => '恢复默认头像。';

  @override
  String get avatarAppliedToast => '已应用个人资料照片。';

  @override
  String get avatarTooLargeToast => '只能使用最大 5 MB 的照片。';

  @override
  String get avatarLoadFailedToast => '无法加载照片。';

  @override
  String get profileCodeLabel => '个人资料代码（无法更改）';

  @override
  String get profileSaveButton => '保存更改';

  @override
  String get avatarChangeLabel => '更改个人资料照片';

  @override
  String get avatarChangeHint => '点按照片即可更改它';

  @override
  String get avatarSizeHint => 'JPG、PNG、GIF · 最大 5 MB';

  @override
  String get reminderNotificationFallbackBody => '那种愤怒现在感觉如何？';

  @override
  String get calmGuideTitle => '当愤怒上升时，\n首先安全地降低身体';

  @override
  String get calmGuideSubtitle =>
      '《愤怒笔记》的冷静指南并不告诉你要摆脱愤怒。这是一个简短的指南，可以帮助您在不伤害任何人的情况下缓解这种感觉。';

  @override
  String get calmGuideNotice =>
      '**如果您面临紧急危险**，请先向周围的人寻求帮助或联系紧急服务部门，而不是继续使用此应用程序。';

  @override
  String get calmGuideMomentTitle => '愤怒升腾的那一刻';

  @override
  String get calmGuideMomentBody1 =>
      '愤怒可能是一个信号，表明你关心的事情被侵犯了。但在强烈的愤怒状态下，判断力会加快，言语和行为会变得比平常更粗暴。';

  @override
  String get calmGuideMomentBody2 => '现在需要的不是**完全理性**，而是**反应延迟30秒**。';

  @override
  String get calmGuideRoutineTitle => '60秒平静例程';

  @override
  String get calmGuideStep1Title => '停止';

  @override
  String get calmGuideStep1Desc => '暂停回复、打电话、评论或移动。放松双手，暂时将目光从屏幕上移开。';

  @override
  String get calmGuideStep2Title => '呼吸';

  @override
  String get calmGuideStep2Desc => '吸气4秒，屏住7秒，呼气8秒。如果不完美也没关系。';

  @override
  String get calmGuideStep3Title => '检查你的身体';

  @override
  String get calmGuideStep3Desc => '检查你的下巴、肩膀、拳头或腹部是否紧张，只放松其中一个部位。';

  @override
  String get calmGuideStep4Title => '写下来';

  @override
  String get calmGuideStep4Desc => '即使是“现在我很生气，因为___”这样的一句话就足够了。';

  @override
  String get calmGuideBreathTitle => '4-7-8呼吸';

  @override
  String get calmGuideBreathStep1 => '通过鼻子吸气 4 秒钟。';

  @override
  String get calmGuideBreathStep2 => '屏住呼吸 7 秒钟。';

  @override
  String get calmGuideBreathStep3 => '通过嘴慢慢呼气，持续 8 秒。';

  @override
  String get calmGuideBreathStep4 => '如果可以的话重复3次。';

  @override
  String get calmGuideBreathNote =>
      '如果长时间屏住呼吸很困难，请将其缩短为舒适的数数，例如 **3-3-5**。最重要的是缓慢而长的呼气。';

  @override
  String get calmGuideTimeoutTitle => '10分钟暂停';

  @override
  String get calmGuideTimeoutBody => '愤怒越强烈，想要立即解决的冲动就越强烈。但现在说话可能首先会带来伤人的话。';

  @override
  String get calmGuideTimeoutExamplesTitle => '超时短语示例';

  @override
  String get calmGuideTimeoutExample1 => '“我现在太生气了，十分钟后再聊吧。”';

  @override
  String get calmGuideTimeoutExample2 => '“我暂停一下，因为我可能会说一些伤人的话。”';

  @override
  String get calmGuideTimeoutExample3 => '“我没有逃跑，我只是需要冷静一下，然后再说话。”';

  @override
  String get calmGuideSensoryTitle => '快速感官接地';

  @override
  String get calmGuideSensory1Title => '冷水';

  @override
  String get calmGuideSensory1Desc => '将冷水敷在手腕或脸上约 10 秒钟';

  @override
  String get calmGuideSensory2Title => '感觉你的脚';

  @override
  String get calmGuideSensory2Desc => '慢慢注意脚接触地板的感觉';

  @override
  String get calmGuideSensory3Title => '环顾四周';

  @override
  String get calmGuideSensory3Desc => '安静地说出 5 个你能看到的物体的名字';

  @override
  String get calmGuideSensory4Title => '放下你的肩膀';

  @override
  String get calmGuideSensory4Desc => '呼气并将肩膀降低1厘米';

  @override
  String get calmGuideQuestionsTitle => '对写作有帮助的问题';

  @override
  String get calmGuideQuestion1 => '究竟是什么让我生气？';

  @override
  String get calmGuideQuestion2 => '我期待但没有收到什么？';

  @override
  String get calmGuideQuestion3 => '如果我现在就采取什么行动，我会后悔吗？';

  @override
  String get calmGuideQuestion4 => '明天的我会庆幸什么样的选择？';

  @override
  String get calmGuideTag1 => '情感日志';

  @override
  String get calmGuideTag2 => '愤怒疏远';

  @override
  String get calmGuideTag3 => '提醒检查';

  @override
  String get calmGuideDangerTitle => '在这些情况下首先寻求帮助';

  @override
  String get calmGuideDanger1 => '当想要伤害自己或他人的冲动强烈时';

  @override
  String get calmGuideDanger2 => '当扔东西或摔东西的冲动无法停止时';

  @override
  String get calmGuideDanger3 => '当您想要对抗或威胁对方时';

  @override
  String get calmGuideDanger4 => '当酒精、毒品或严重睡眠不足导致难以控制时';

  @override
  String get calmGuideDangerBody =>
      '在这些情况下，不要试图仅靠平静的方式来度过难关——向周围的人、专业服务人员或紧急服务人员寻求帮助。';

  @override
  String get calmGuideFooterTitle => 'Fury Note Calm Guide';

  @override
  String get calmGuideFooterDisclaimer => '本文件不能代替医疗诊断或治疗。';

  @override
  String get privacyTitle => '隐私政策';

  @override
  String get privacyLastUpdated => '生效日期：2026 年 6 月 16 日';

  @override
  String get privacySection1Title => '1. 收集信息的类别';

  @override
  String get privacySection1Body =>
      'Fury Note无需任何会员注册即可使用。公司仅收集以下信息。\n· 设备标识符——随机发布的值，用于在未注册的情况下识别用户身份，以防止欺诈使用\n· 愤怒记录数据——强度、类别和文本（仅存储在设备上）\n· 匿名提要帖子 — 昵称、头像图像、强度、类别和文本\n· 评论——昵称和评论文本\n· 点赞记录——用户是否点赞某个帖子\n· 推送通知令牌 — 用于发送通知（可选）';

  @override
  String get privacySection2Title => '2. 处理目的';

  @override
  String get privacySection2Body =>
      '· 提供社区功能，包括匿名提要、评论和点赞\n· 检测欺诈性使用，包括防止同一帖子重复点赞\n· 发送推送通知，包括评论提醒\n· 服务的运行及错误分析';

  @override
  String get privacySection3Title => '3. 无需注册会员，不保留个人信息';

  @override
  String get privacySection3Body =>
      'Fury Note 不需要会员注册，也不会收集可验证身份的个人信息，例如姓名、电子邮件地址或电话号码。\n昵称由用户自动生成或直接输入，与用户的真实身份无关。设备标识符同样是随机生成的值，不能用于识别特定的个人。';

  @override
  String get privacySection4Title => '4. 向第三方提供信息';

  @override
  String get privacySection4Body => '公司不会向第三方提供或出售收集到的信息。';

  @override
  String get privacySection5Title => '5.信息的保留和使用期限';

  @override
  String get privacySection5Body =>
      '· 仅保存的愤怒记录仅保留在设备上，并在删除应用程序时一起删除。\n· 共享到匿名源的帖子、头像和评论将保留在服务器上，直到被用户删除，并根据此类请求立即删除。\n· 删除相关帖子后，点赞记录也会一起删除。';

  @override
  String get privacySection6Title => '6. 联系方式';

  @override
  String get privacySection6Body =>
      '有关个人信息的咨询，请联系以下电子邮件地址。\nlunlu.co.kr@gmail.com';

  @override
  String get appGuideTitle => '如何使用愤怒笔记';

  @override
  String get appGuideSubtitle => '记录愤怒、跟踪模式以及获取动态支持的指南。';

  @override
  String get appGuideRecordTitle => '记录你的愤怒';

  @override
  String get appGuideRecordBody => '当你生气时，点击底部的🔥按钮开始记录。';

  @override
  String get appGuideRecordStep1 => '选择强度：选择与您的愤怒程度相匹配的表情符号';

  @override
  String get appGuideRecordStep2 => '选择类别：选择一个原因';

  @override
  String get appGuideRecordStep3 => '把它写出来：描述发生了什么（你可以跳过这个）';

  @override
  String get appGuideRecordStep4 => '提醒：如果您想稍后再看，请设置时间';

  @override
  String get appGuideRecordStep5 => '保存或发布：将记录保密或分享到提要';

  @override
  String get appGuideFeedTitle => '在 Feed 上寻找支持';

  @override
  String get appGuideFeedBody => '分享你的愤怒可以让你与其他有同样感受的人建立联系。';

  @override
  String get appGuideFeedItem1 => '保存后，您可以**匿名**发布到提要';

  @override
  String get appGuideFeedItem2 => '点赞或评论其他人的帖子';

  @override
  String get appGuideFeedItem3 => '您可以随时删除自己的帖子';

  @override
  String get appGuideStatsTitle => '追踪您的情绪模式';

  @override
  String get appGuideStatsBody => '统计选项卡可帮助您回顾您的愤怒模式。';

  @override
  String get appGuideStatsItem1 => '按时期划分的愤怒强度趋势图';

  @override
  String get appGuideStatsItem2 => '原因按类别分布';

  @override
  String get appGuideStatsItem3 => '日历视图可按日期浏览记录';

  @override
  String get appGuideStatsItem4 => '愤怒报告可按类别分析模式';

  @override
  String get appGuideCalmTitle => '降低你的愤怒';

  @override
  String get appGuideCalmBody => '登录后，前往“平静”选项卡，尝试降低情绪。';

  @override
  String get appGuideCalmItem1 => '提醒说明：重新访问您标记为稍后查看的记录';

  @override
  String get appGuideCalmItem2 => '呼吸：用 4-7-8 技巧让自己平静下来';

  @override
  String get appGuideCalmItem3 => '超时：用 10 分钟计时器减慢你的反应';

  @override
  String get appGuideCalmItem4 => '意象冥想：用自然意象改变你的心情';

  @override
  String get appGuideProfileTitle => '昵称和个人资料';

  @override
  String get appGuideProfileBody => '进入菜单 > 设置来更改您的昵称和头像。';

  @override
  String get appGuideProfileItem1 => '昵称：输入您自己的昵称或随机生成一个';

  @override
  String get appGuideProfileItem2 => '头像：用表情符号代表你自己';

  @override
  String get appGuideNotificationTitle => '通知设置';

  @override
  String get appGuideNotificationItem1 => '提醒警报：在您设置的时间收到愤怒通知提醒';

  @override
  String get appGuideNotificationItem2 => '评论提醒：当有人评论您的帖子时收到通知';

  @override
  String get appGuideNotificationHint => '在“设置”>“通知”中切换这些';

  @override
  String get appGuideFooterTitle => 'Fury Note App Guide';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get appTitle => 'Fury Note';

  @override
  String get appKoreanName => 'Fury Note';

  @override
  String get record => '記錄';

  @override
  String get feed => '動態';

  @override
  String get stats => '統計';

  @override
  String get calm => '平靜';

  @override
  String get settings => '設定';

  @override
  String get drawerGuide => '應用程式指南';

  @override
  String get drawerCalmGuide => '平靜指南';

  @override
  String get drawerVersion => 'Fury Note v1.0.0';

  @override
  String get menuTooltip => '選單';

  @override
  String drawerRecordCount(String count) {
    return '🔥 $count 憤怒筆記';
  }

  @override
  String get drawerSettingsSubtitle => '暱稱·通知';

  @override
  String get drawerGuideSubtitle => 'Fury Note 使用方法';

  @override
  String get drawerCalmGuideSubtitle => '冷靜卡·今日小貼士';

  @override
  String get relativeTimeJustNow => '剛才';

  @override
  String relativeTimeMinutesAgo(int count) {
    return '$count 分鐘前';
  }

  @override
  String relativeTimeHoursAgo(int count) {
    return '$count小時前';
  }

  @override
  String relativeTimeDaysAgo(int count) {
    return '$count 天前';
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
  String get recordTitle => '憤怒記錄';

  @override
  String get stepIntensity => '你現在有多生氣？';

  @override
  String get stepIntensitySub => '選擇一個表情符號';

  @override
  String get stepCategory => '是什麼原因造成的呢？';

  @override
  String get stepCategorySub => '選擇一個類別';

  @override
  String get stepText => '發生了什麼事？';

  @override
  String get stepTextSub => '你可以跳過這個';

  @override
  String get stepReminder => '想稍後再去嗎？';

  @override
  String get stepReminderSub => '你可以跳過這個';

  @override
  String get stepSave => '保存此註釋嗎？';

  @override
  String get stepSaveSub => '儲存後即可發布';

  @override
  String get stepPost => '分享這種感受嗎？';

  @override
  String get stepPostSub => '它將是匿名的';

  @override
  String get voiceInput => '錄音';

  @override
  String get next => '下一步';

  @override
  String get previous => '上一步';

  @override
  String get skip => '略過';

  @override
  String get save => '儲存';

  @override
  String get saveNote => '儲存記錄';

  @override
  String get postIt => '發布';

  @override
  String get saveOnly => '僅儲存';

  @override
  String get feedPostedToast => '發送到飼料';

  @override
  String get recordPostedToast => '已發布';

  @override
  String get recordSavedToast => '已儲存';

  @override
  String get commentPostedToast => '發表評論';

  @override
  String get commentSendFailedToast => '無法發送評論。請再試一次。';

  @override
  String get commentDeleteTitle => '刪除評論';

  @override
  String get commentDeleteContent => '刪除這則評論？';

  @override
  String commentsCount(int count) {
    return '$count 評論';
  }

  @override
  String get commentsEmpty => '還沒有評論\n成為第一個離開的人💬';

  @override
  String get commentInputHint => '寫評論...';

  @override
  String get apiErrorContentBlockedUrl => '無法提交帶有連結的帖子。';

  @override
  String get apiErrorContentBlockedSpam => '無法提交促銷文字。';

  @override
  String get apiErrorContentBlockedProfanity => '不能提交包含髒話的內容。';

  @override
  String get apiErrorContentBlockedModeration => '該內容無法提交。';

  @override
  String get apiErrorRateLimitExceeded => '請稍後重試。';

  @override
  String get apiErrorInternal => '伺服器發生錯誤。請稍後重試。';

  @override
  String get apiErrorInvalidRequest => '無效請求。';

  @override
  String get apiErrorForbidden => '您沒有權限。';

  @override
  String get apiErrorPostNotFound => '找不到貼文。';

  @override
  String get apiErrorCommentNotFound => '未找到評論。';

  @override
  String get apiErrorSignatureRequired => '需要請求簽名。';

  @override
  String get apiErrorSignatureInvalid => '無效請求。';

  @override
  String get apiErrorSignatureExpired => '請求已過期。請再試一次。';

  @override
  String get apiErrorSignatureReplay => '該請求已被處理。';

  @override
  String get apiErrorUnknown => '發生未知錯誤。';

  @override
  String get reminderNotification => '提醒通知';

  @override
  String get noReminder => '未設定';

  @override
  String get summaryIntensity => '憤怒等級';

  @override
  String get summaryCategory => '類別';

  @override
  String get summaryText => '文字';

  @override
  String get summaryReminder => '提醒';

  @override
  String get none => '無';

  @override
  String get other => '其他';

  @override
  String get family => '家庭';

  @override
  String get romance => '浪漫';

  @override
  String get work => '工作';

  @override
  String get people => '人';

  @override
  String get driving => '駕駛';

  @override
  String get custom => '客製化';

  @override
  String get recordCustomCategoryHint => '輸入類別';

  @override
  String get recordTextHint => '寫在這裡';

  @override
  String get recordMicPermissionRequired => '需要麥克風許可。';

  @override
  String recordVoiceStartFailed(String label) {
    return '無法啟動 $label。';
  }

  @override
  String get recordVoiceStopRecording => '停止錄音';

  @override
  String get recordVoiceRecordAgain => '再次錄製';

  @override
  String get recordVoiceSaved => '錄音已儲存。';

  @override
  String get recordAudioSummaryLabel => '語音';

  @override
  String get recordAudioIncluded => '包括錄音';

  @override
  String get recordSavingInProgress => '正在儲存...';

  @override
  String get recordPostingInProgress => '正在發送...';

  @override
  String get recordSaveFailedToast => '無法保存筆記。請再試一次。';

  @override
  String get recordProgressSemantics => '記錄進度';

  @override
  String get hourSuffix => '小時';

  @override
  String get minuteSuffix => '米';

  @override
  String get reminderCustom => '客製化';

  @override
  String get reminderIn30Minutes => '30分鐘後';

  @override
  String get reminderIn1Hour => '1小時內';

  @override
  String get reminderIn2Hours => '2小時內';

  @override
  String get reminderIn6Hours => '6小時內';

  @override
  String get reminderTomorrow => '明天';

  @override
  String get annoyed => '生氣';

  @override
  String get angry => '生氣';

  @override
  String get mad => '瘋狂';

  @override
  String get furious => '憤怒的';

  @override
  String get rage => '憤怒';

  @override
  String get calmed => '冷靜';

  @override
  String get feedTitle => '動態';

  @override
  String get feedSubtitle => '瀏覽最新的憤怒故事';

  @override
  String get feedAllTab => '全部動態';

  @override
  String get feedMineTab => '我的動態';

  @override
  String get feedLoadFailed => '無法加載提要。';

  @override
  String get feedEmptyMine => '您還沒有發佈到提要。\n分享你的第一個憤怒筆記！';

  @override
  String get feedEmptyAll => '還沒有提要帖子。\n成為第一個分享你憤怒的人！';

  @override
  String get feedPostFailedToast => '無法發送至 Feed。請再試一次。';

  @override
  String get like => '共鳴';

  @override
  String get comment => '留言';

  @override
  String get retry => '重試';

  @override
  String get statsTitle => '憤怒統計';

  @override
  String get statsSubtitle => '查看本週的情緒變化';

  @override
  String get week => '1週';

  @override
  String get month => '1個月';

  @override
  String get all => '全部';

  @override
  String get totalRecords => '記錄';

  @override
  String get highestLevel => '最高';

  @override
  String get dailyAverage => '每日平均';

  @override
  String get decreaseRate => '減少';

  @override
  String get statsIntensityTrend => '憤怒強度趨勢';

  @override
  String get statsCategoryDistribution => '原因分佈';

  @override
  String get statsNoRecords => '沒有記錄可顯示。';

  @override
  String get statsCalendarButtonTitle => '按日曆查看記錄';

  @override
  String get statsCalendarButtonSubtitle => '按日期檢查和管理憤怒筆記';

  @override
  String get statsCalendarTitle => '按日曆查看記錄';

  @override
  String get statsOtherCategory => '其他';

  @override
  String selectedDateRecordsTitle(String date) {
    return '$date 筆記錄';
  }

  @override
  String get noRecordsOnSelectedDate => '所選日期沒有寫入任何記錄。';

  @override
  String get reminderAction => '提醒';

  @override
  String get play => '播放';

  @override
  String get statsSummaryButtonTitle => '查看憤怒報告';

  @override
  String get statsSummaryButtonSubtitle => '按類別瀏覽你的憤怒模式';

  @override
  String get statsSummaryTitle => '憤怒報告';

  @override
  String get statsSummaryClose => '關閉';

  @override
  String get statsSummaryEmptyTitle => '尚無記錄可匯總';

  @override
  String get statsSummaryEmptyBody => '新增憤怒註釋後，類別模式將出現在此。';

  @override
  String statsSummaryTopHeadline(String category) {
    return '「$category」最常讓你生氣';
  }

  @override
  String statsSummaryCategoryHeadline(String category) {
    return '正在查看“$category”';
  }

  @override
  String get statsSummaryComfortGeneric => '沒關係。這可能會發生。';

  @override
  String get statsSummaryComfortFamily => '距離越近的人，越難落地。';

  @override
  String get statsSummaryComfortRomance => '一段珍貴的關係可以讓微小的時刻變得更清晰。';

  @override
  String get statsSummaryComfortWork => '工作可能讓你的思考速度超出了你的預期。';

  @override
  String get statsSummaryComfortPeople => '他人的言語和表達可能比預期的持續時間更長。';

  @override
  String get statsSummaryComfortDriving => '路上的緊張往往會先影響到身體。';

  @override
  String get statsSummaryMetricCount => '計數';

  @override
  String get statsSummaryMetricCategory => '類別';

  @override
  String get statsSummaryMetricFeed => '動態貼文';

  @override
  String get statsSummaryMetricCalm => '冷靜嘗試';

  @override
  String get statsSummaryMetricAverage => '平均。水平';

  @override
  String get statsSummaryMetricPeak => '峰值水平';

  @override
  String get statsSummaryConclusion => '結論';

  @override
  String statsSummaryRecordsUnit(int count) {
    return '$count次';
  }

  @override
  String statsSummaryAverageValue(String value) {
    return '$value/5';
  }

  @override
  String get statsSummaryConclusionTop =>
      '這是你最重複的憤怒訊號。下次，試著在憤怒完全升起之前檢查身體的緊張程度。';

  @override
  String get statsSummaryConclusionCategory =>
      '在這個類別還很小的時候把它寫下來可以幫助您更快地註意到這種模式。';

  @override
  String statsSummaryPageIndicator(int current, int total) {
    return '$current/$total';
  }

  @override
  String get statsSummaryCategoryShare => '品類份額';

  @override
  String get statsSummaryCalmRate => '平靜率';

  @override
  String get statsSummaryShareRate => '分享率';

  @override
  String get noContent => '沒有內容';

  @override
  String get voicePlayback => '播放語音';

  @override
  String get deleteConfirm => '刪除？';

  @override
  String get delete => '刪除';

  @override
  String get cancel => '取消';

  @override
  String get calmTitle => '平靜';

  @override
  String get calmSubtitle => '慢慢放下仍然殘留的情緒';

  @override
  String get reminderNotes => '提醒注意事項';

  @override
  String get breathing => '呼吸';

  @override
  String get timeout => '超時';

  @override
  String get meditation => '意象冥想';

  @override
  String get feedSupport => '飼料支持';

  @override
  String get calmReminderEmpty => '提醒到達後將出現在此處';

  @override
  String get calmReminderFallbackText => '那種憤怒現在感覺如何？';

  @override
  String get calmCheckTitle => '你現在有多生氣？';

  @override
  String calmCheckSubtitle(String emoji, String label) {
    return '$emoji $label · 之前的憤怒';
  }

  @override
  String get calmSavedCalmedToast => '很高興你冷靜下來。';

  @override
  String get calmSavedUpdatedToast => '已儲存';

  @override
  String get profileName => '憤怒的老虎';

  @override
  String get nicknameAdjectives =>
      '憤怒、憤怒、憤怒、爆炸、兇猛、咆哮、尖銳、有角、加熱、粗糙、激烈、橫衝直撞、火熱、雷鳴般、氣喘吁籲、沸騰、怨恨、熾熱、暴風雨、有毒';

  @override
  String get nicknameAnimals =>
      '老虎、獅子、狼、熊、鷹、鯊魚、豹、獵豹、鱷魚、眼鏡蛇、公牛、野豬、犀牛、鬣狗、灰熊、烏鴉、鷹、刺蝟、捷豹、美洲獅';

  @override
  String get notificationSettings => '通知';

  @override
  String get commentNotification => '評論提醒';

  @override
  String get settingsNotificationsSection => '通知';

  @override
  String get settingsReminderSubtitle => '在您設定的時間發出憤怒音符提醒';

  @override
  String get settingsCommentSubtitle => '當有人評論您的貼文時發出警報';

  @override
  String get settingsDataSection => '數據';

  @override
  String get settingsDataImportSubtitle => '從備份檔案還原記錄';

  @override
  String get settingsSupportSection => '支援';

  @override
  String get settingsPrivacySubtitle => '收集的資訊和使用目的';

  @override
  String get settingsFeedbackTitle => '傳送回饋';

  @override
  String get settingsFeedbackSubtitle => '問題或改進想法';

  @override
  String get settingsRecordCountUnit => '記錄';

  @override
  String get settingsPostCountUnit => '貼文';

  @override
  String get proPlan => 'PRO資料匯出';

  @override
  String get backupImport => '導入數據';

  @override
  String get settingsDataExportSubtitle => '備份檔案·歷史記錄·共享';

  @override
  String get dataExportTitle => '匯出數據';

  @override
  String get dataExportProTitle => 'PRO資料匯出';

  @override
  String get dataExportDescription => '使用所有本機應用程式資料建立備份文件，並透過電子郵件或信使共用。';

  @override
  String get dataExportOneTimePurchase => '一次性購買·終身使用';

  @override
  String get dataExportDebugPrice => 'DEBUG';

  @override
  String get dataExportInProgress => '出口';

  @override
  String get dataExportPaymentChecking => '檢查付款';

  @override
  String get dataExportCreateButton => '建立導出';

  @override
  String get dataExportPayAndCreateButton => '支付及匯出';

  @override
  String get dataExportRestorePurchase => '恢復購買';

  @override
  String get dataExportCreatedToast => '建立的匯出文件。';

  @override
  String get dataExportFailedToast => '無法建立導出文件。';

  @override
  String get dataExportShareSubject => 'Fury Note 資料備份';

  @override
  String get dataExportShareText => '這是 Fury Note 的資料備份檔。';

  @override
  String get dataExportShareFailedToast => '無法開啟共享表。';

  @override
  String get dataExportAllDataIncluded => '所有本機應用程式資料都包含在備份中';

  @override
  String get dataExportHistoryTitle => '匯出歷史記錄';

  @override
  String dataExportHistoryCount(int count) {
    return '$count';
  }

  @override
  String get dataExportShareTooltip => '分享';

  @override
  String get dataExportEmptyHistory => '還沒有匯出文件。';

  @override
  String get purchaseUpdateFailed => '無法處理購買更新。';

  @override
  String get purchaseStatusFailed => '無法檢查購買狀態。';

  @override
  String get purchaseProductNotFound => '未找到商店產品。';

  @override
  String get purchaseStoreUnavailable => '無法連接到商店。';

  @override
  String get purchaseProductInfoFailed => '無法載入商店產品資訊。';

  @override
  String get purchaseProductUnavailable => '產品資訊尚未準備好。';

  @override
  String get purchaseStartFailed => '無法開始購買。';

  @override
  String get purchaseCanceled => '購買被取消。';

  @override
  String get purchaseReceiptInvalid => '無法驗證購買收據。';

  @override
  String get purchaseReceiptVerifyFailed => '購買收據驗證失敗。';

  @override
  String get dataImportTitle => '導入數據';

  @override
  String get dataImportPickTitle => '選擇備份文件';

  @override
  String get dataImportPickDescription => '選擇 .fnbackup 文件\n從《憤怒筆記》匯出';

  @override
  String get dataImportPickButton => '選擇文件';

  @override
  String get dataImportInProgress => '導入';

  @override
  String dataImportSuccessToast(int count) {
    return '替換了備份中的資料。 ($count記錄)';
  }

  @override
  String get dataImportNoNewDataToast => '替換了備份中的資料。 (0 筆記錄)';

  @override
  String get dataImportFailedToast => '無法匯入備份檔案。';

  @override
  String get dataImportInvalidFileToast => '只能匯入 .fnbackup 檔案。';

  @override
  String get dataImportNoticeTitle => '導入前';

  @override
  String get dataImportNoticeBody => '現有資料將被刪除並替換為備份檔案中的資料。';

  @override
  String get dataImportTransferTitle => '行動裝置';

  @override
  String get dataImportTransferBody => '在新裝置上安裝應用程式後，匯入備份檔案以用備份資料取代目前本機資料。';

  @override
  String get feedDeleteTitle => '刪除提要';

  @override
  String get feedDeleteContent => '刪除此動態嗎？';

  @override
  String get calmBreathingTitle => '呼吸';

  @override
  String get breathPhaseInhale => '吸氣';

  @override
  String get breathPhaseHold => '保持';

  @override
  String get breathPhaseExhale => '吐氣';

  @override
  String durationSeconds(int count) {
    return '$count秒';
  }

  @override
  String cycleCount(int count) {
    return '循環$count';
  }

  @override
  String get calmTimeoutRunning => '跑步';

  @override
  String get calmTimeoutPaused => '已暫停';

  @override
  String get reset => '重置';

  @override
  String get start => '開始';

  @override
  String get pause => '暫停';

  @override
  String get stop => '停止';

  @override
  String get calmMeditationSceneWave => '波浪';

  @override
  String get calmMeditationSceneForest => '森林';

  @override
  String get calmMeditationSceneSunset => '日落';

  @override
  String get calmMeditationSceneMountain => '山';

  @override
  String get calmMeditationSceneCherryBlossom => '櫻花';

  @override
  String get calmMeditationSceneNightSky => '夜空';

  @override
  String get calmMeditationPrompt => '深吸氣，然後呼氣';

  @override
  String get autoplay => '自動播放';

  @override
  String get profileEditTitle => '編輯個人資料';

  @override
  String get nicknameLabel => '暱稱';

  @override
  String get nicknameHint => '輸入暱稱';

  @override
  String get nicknameRequiredError => '請輸入暱稱';

  @override
  String get nicknameCodeAutomaticError => '您的程式碼會自動新增';

  @override
  String get nicknameTooShortError => '至少使用 2 個字符';

  @override
  String profileSavedToast(String name) {
    return '✅ 改為「$name」！';
  }

  @override
  String get profileSaveFailedToast => '保存時發生錯誤。';

  @override
  String get avatarPickGallery => '從庫中選擇';

  @override
  String get avatarPickCamera => '拍張照片';

  @override
  String get avatarReset => '使用預設頭像';

  @override
  String get avatarResetToast => '恢復預設頭像。';

  @override
  String get avatarAppliedToast => '已套用個人資料照片。';

  @override
  String get avatarTooLargeToast => '只能使用最大 5 MB 的照片。';

  @override
  String get avatarLoadFailedToast => '無法載入照片。';

  @override
  String get profileCodeLabel => '個人資料代碼（無法更改）';

  @override
  String get profileSaveButton => '儲存變更';

  @override
  String get avatarChangeLabel => '更改個人資料照片';

  @override
  String get avatarChangeHint => '點按照片即可更改它';

  @override
  String get avatarSizeHint => 'JPG、PNG、GIF · 最大 5 MB';

  @override
  String get reminderNotificationFallbackBody => '那種憤怒現在感覺如何？';

  @override
  String get calmGuideTitle => '當憤怒上升時，\n首先安全地降低身體';

  @override
  String get calmGuideSubtitle =>
      '《憤怒筆記》的冷靜指南並沒有告訴你要擺脫憤怒。這是一個簡短的指南，可以幫助您在不傷害任何人的情況下緩解這種感覺。';

  @override
  String get calmGuideNotice =>
      '**如果您面臨緊急危險**，請先向周圍的人尋求幫助或聯繫緊急服務部門，而不是繼續使用此應用程式。';

  @override
  String get calmGuideMomentTitle => '憤怒升騰的那一刻';

  @override
  String get calmGuideMomentBody1 =>
      '憤怒可能是一個信號，表示你關心的事情被侵犯了。但在強烈的憤怒狀態下，判斷力會加快，言語和行為會變得比平常更粗暴。';

  @override
  String get calmGuideMomentBody2 => '現在需要的不是**完全理性**，而是**反應延遲30秒**。';

  @override
  String get calmGuideRoutineTitle => '60秒平靜例程';

  @override
  String get calmGuideStep1Title => '停止';

  @override
  String get calmGuideStep1Desc => '暫停回覆、打電話、評論或移動。放鬆雙手，暫時將目光從螢幕移開。';

  @override
  String get calmGuideStep2Title => '呼吸';

  @override
  String get calmGuideStep2Desc => '吸氣4秒，屏住7秒，吐氣8秒。如果不完美也沒關係。';

  @override
  String get calmGuideStep3Title => '檢查你的身體';

  @override
  String get calmGuideStep3Desc => '檢查你的下巴、肩膀、拳頭或腹部是否緊張，只放鬆其中一個部位。';

  @override
  String get calmGuideStep4Title => '寫下來';

  @override
  String get calmGuideStep4Desc => '即使是「現在我很生氣，因為___」這樣的一句話就夠了。';

  @override
  String get calmGuideBreathTitle => '4-7-8呼吸';

  @override
  String get calmGuideBreathStep1 => '透過鼻子吸氣 4 秒鐘。';

  @override
  String get calmGuideBreathStep2 => '屏住呼吸 7 秒鐘。';

  @override
  String get calmGuideBreathStep3 => '透過嘴巴慢慢吐氣，持續 8 秒。';

  @override
  String get calmGuideBreathStep4 => '如果可以的話重複3次。';

  @override
  String get calmGuideBreathNote =>
      '如果長時間屏住呼吸很困難，請將其縮短為舒適的數數，例如 **3-3-5**。最重要的是緩慢而長的呼氣。';

  @override
  String get calmGuideTimeoutTitle => '10分鐘暫停';

  @override
  String get calmGuideTimeoutBody => '憤怒越強烈，想要立即解決的衝動就越強烈。但現在說話可能會先帶來傷人的話。';

  @override
  String get calmGuideTimeoutExamplesTitle => '超時短語範例';

  @override
  String get calmGuideTimeoutExample1 => '“我現在太生氣了，十分鐘後再聊吧。”';

  @override
  String get calmGuideTimeoutExample2 => '“我暫停一下，因為我可能會說一些傷人的話。”';

  @override
  String get calmGuideTimeoutExample3 => '“我沒有逃跑，我只是需要冷靜一下，然後再說話。”';

  @override
  String get calmGuideSensoryTitle => '快速感官接地';

  @override
  String get calmGuideSensory1Title => '冷水';

  @override
  String get calmGuideSensory1Desc => '將冷水敷在手腕或臉上約 10 秒鐘';

  @override
  String get calmGuideSensory2Title => '感覺你的腳';

  @override
  String get calmGuideSensory2Desc => '慢慢注意腳接觸地板的感覺';

  @override
  String get calmGuideSensory3Title => '環顧四周';

  @override
  String get calmGuideSensory3Desc => '安靜地說出 5 個你能看到的物體的名字';

  @override
  String get calmGuideSensory4Title => '放下你的肩膀';

  @override
  String get calmGuideSensory4Desc => '吐氣並將肩膀降低1厘米';

  @override
  String get calmGuideQuestionsTitle => '對寫作有幫助的問題';

  @override
  String get calmGuideQuestion1 => '究竟是什麼讓我生氣？';

  @override
  String get calmGuideQuestion2 => '我期待但沒有收到什麼？';

  @override
  String get calmGuideQuestion3 => '如果我現在就採取什麼行動，我會後悔嗎？';

  @override
  String get calmGuideQuestion4 => '明天的我會慶幸什麼樣的選擇？';

  @override
  String get calmGuideTag1 => '情感日誌';

  @override
  String get calmGuideTag2 => '憤怒疏遠';

  @override
  String get calmGuideTag3 => '提醒檢查';

  @override
  String get calmGuideDangerTitle => '在這些情況下首先尋求幫助';

  @override
  String get calmGuideDanger1 => '當想要傷害自己或他人的衝動強烈時';

  @override
  String get calmGuideDanger2 => '當丟東西或摔東西的衝動無法停止時';

  @override
  String get calmGuideDanger3 => '當您想要對抗或威脅對方時';

  @override
  String get calmGuideDanger4 => '當酒精、毒品或嚴重睡眠不足導致難以控制時';

  @override
  String get calmGuideDangerBody =>
      '在這些情況下，不要試圖僅靠平靜的方式來度過難關——向周圍的人、專業服務人員或緊急服務人員尋求幫助。';

  @override
  String get calmGuideFooterTitle => 'Fury Note Calm Guide';

  @override
  String get calmGuideFooterDisclaimer => '本文件不能取代醫療診斷或治療。';

  @override
  String get privacyTitle => '隱私權政策';

  @override
  String get privacyLastUpdated => '生效日期：2026 年 6 月 16 日';

  @override
  String get privacySection1Title => '1. 收集資訊的類別';

  @override
  String get privacySection1Body =>
      'Fury Note無需任何會員註冊即可使用。本公司僅收集以下資訊。\n· 裝置識別碼－隨機發布的值，用於在未註冊的情況下識別使用者身份，以防止詐欺使用\n· 憤怒記錄資料－強度、類別和文字（僅儲存在裝置上）\n· 匿名提要貼文 — 暱稱、頭像圖像、強度、類別和文字\n· 評論——暱稱和評論文本\n· 讚記錄－用戶是否按讚某篇貼文\n· 推播通知令牌 — 用於傳送通知（選用）';

  @override
  String get privacySection2Title => '2. 處理目的';

  @override
  String get privacySection2Body =>
      '· 提供社群功能，包括匿名提要、評論和讚\n· 偵測詐欺性使用，包括防止相同貼文重複按讚\n· 發送推播通知，包括評論提醒\n· 服務的運作及錯誤分析';

  @override
  String get privacySection3Title => '3. 無需註冊會員，不保留個人資訊';

  @override
  String get privacySection3Body =>
      'Fury Note 不需要會員註冊，也不會收集可驗證身分的個人信息，例如姓名、電子郵件地址或電話號碼。\n暱稱由使用者自動產生或直接輸入，與使用者的真實身分無關。設備標識符同樣是隨機產生的值，不能用於識別特定的個人。';

  @override
  String get privacySection4Title => '4. 向第三方提供信息';

  @override
  String get privacySection4Body => '本公司不會提供或出售所收集到的資訊給第三方。';

  @override
  String get privacySection5Title => '5.資訊的保留與使用期限';

  @override
  String get privacySection5Body =>
      '· 僅儲存的憤怒記錄僅保留在裝置上，並在刪除應用程式時一起刪除。\n· 分享到匿名來源的貼文、頭像和評論將保留在伺服器上，直到被用戶刪除，並根據此類請求立即刪除。\n· 刪除相關貼文後，按讚記錄也會一起刪除。';

  @override
  String get privacySection6Title => '6. 聯絡方式';

  @override
  String get privacySection6Body =>
      '有關個人資訊的諮詢，請聯絡以下電子郵件地址。\nlunlu.co.kr@gmail.com';

  @override
  String get appGuideTitle => '如何使用憤怒筆記';

  @override
  String get appGuideSubtitle => '記錄憤怒、追蹤模式以及獲取動態支援的指南。';

  @override
  String get appGuideRecordTitle => '記錄你的憤怒';

  @override
  String get appGuideRecordBody => '當你生氣時，點擊底部的🔥按鈕開始記錄。';

  @override
  String get appGuideRecordStep1 => '選擇強度：選擇與您的憤怒程度相符的表情符號';

  @override
  String get appGuideRecordStep2 => '選擇類別：選擇一個原因';

  @override
  String get appGuideRecordStep3 => '把它寫出來：描述發生了什麼事（你可以跳過這個）';

  @override
  String get appGuideRecordStep4 => '提醒：如果您想稍後再看，請設定時間';

  @override
  String get appGuideRecordStep5 => '儲存或發布：將記錄保密或分享到提要';

  @override
  String get appGuideFeedTitle => '在 Feed 上尋找支持';

  @override
  String get appGuideFeedBody => '分享你的憤怒可以讓你與其他有相同感受的人建立連結。';

  @override
  String get appGuideFeedItem1 => '儲存後，您可以**匿名**發佈到提要';

  @override
  String get appGuideFeedItem2 => '讚或留言其他人的貼文';

  @override
  String get appGuideFeedItem3 => '您可以隨時刪除自己的帖子';

  @override
  String get appGuideStatsTitle => '追蹤您的情緒模式';

  @override
  String get appGuideStatsBody => '統計選項卡可幫助您回顧您的憤怒模式。';

  @override
  String get appGuideStatsItem1 => '按時期劃分的憤怒強度趨勢圖';

  @override
  String get appGuideStatsItem2 => '原因按類別分佈';

  @override
  String get appGuideStatsItem3 => '日曆檢視可依日期瀏覽記錄';

  @override
  String get appGuideStatsItem4 => '憤怒報告可依類別分析模式';

  @override
  String get appGuideCalmTitle => '降低你的憤怒';

  @override
  String get appGuideCalmBody => '登入後，前往「平靜」選項卡，嘗試降低情緒。';

  @override
  String get appGuideCalmItem1 => '提醒說明：重新造訪您標記為稍後查看的記錄';

  @override
  String get appGuideCalmItem2 => '呼吸：用 4-7-8 技巧讓自己冷靜下來';

  @override
  String get appGuideCalmItem3 => '超時：用 10 分鐘計時器減慢你的反應';

  @override
  String get appGuideCalmItem4 => '意象冥想：用自然意象改變你的心情';

  @override
  String get appGuideProfileTitle => '暱稱和個人資料';

  @override
  String get appGuideProfileBody => '進入選單 > 設定來更改您的暱稱和頭像。';

  @override
  String get appGuideProfileItem1 => '暱稱：輸入您自己的暱稱或隨機產生一個';

  @override
  String get appGuideProfileItem2 => '頭像：用表情符號代表自己';

  @override
  String get appGuideNotificationTitle => '通知設定';

  @override
  String get appGuideNotificationItem1 => '提醒警報：在您設定的時間收到憤怒通知提醒';

  @override
  String get appGuideNotificationItem2 => '評論提醒：當有人評論您的貼文時收到通知';

  @override
  String get appGuideNotificationHint => '在“設定”>“通知”中切換這些';

  @override
  String get appGuideFooterTitle => 'Fury Note App Guide';
}

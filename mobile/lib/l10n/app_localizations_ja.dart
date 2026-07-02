// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Fury Note';

  @override
  String get appKoreanName => 'Fury Note';

  @override
  String get record => '記録';

  @override
  String get feed => 'フィード';

  @override
  String get stats => '統計';

  @override
  String get calm => '落ち着く';

  @override
  String get settings => '設定';

  @override
  String get drawerGuide => 'アプリガイド';

  @override
  String get drawerCalmGuide => 'クールダウンガイド';

  @override
  String get drawerVersion => 'Fury Note v1.0.0';

  @override
  String get menuTooltip => 'メニュー';

  @override
  String drawerRecordCount(String count) {
    return '🔥 $count の怒りのメモ';
  }

  @override
  String get drawerSettingsSubtitle => 'ニックネーム・お知らせ';

  @override
  String get drawerGuideSubtitle => 'Fury Note の使い方';

  @override
  String get drawerCalmGuideSubtitle => 'クールダウンカード · 今日のヒント';

  @override
  String get relativeTimeJustNow => 'たった今';

  @override
  String relativeTimeMinutesAgo(int count) {
    return '$count分前';
  }

  @override
  String relativeTimeHoursAgo(int count) {
    return '$count時間前';
  }

  @override
  String relativeTimeDaysAgo(int count) {
    return '$count日前';
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
  String get recordTitle => '怒りの記録';

  @override
  String get stepIntensity => 'あなたは今どのくらい怒っていますか？';

  @override
  String get stepIntensitySub => '絵文字を選択してください';

  @override
  String get stepCategory => '何が原因でしょうか?';

  @override
  String get stepCategorySub => 'カテゴリを 1 つ選択してください';

  @override
  String get stepText => '何が起こったのでしょうか？';

  @override
  String get stepTextSub => 'これはスキップできます';

  @override
  String get stepReminder => '後でもう一度訪れたいですか?';

  @override
  String get stepReminderSub => 'これはスキップできます';

  @override
  String get stepSave => 'このメモを保存しますか?';

  @override
  String get stepSaveSub => '保存後投稿可能です';

  @override
  String get stepPost => 'この気持ちを共有しますか？';

  @override
  String get stepPostSub => '匿名になります';

  @override
  String get voiceInput => '音声録音';

  @override
  String get next => '次へ';

  @override
  String get previous => '前へ';

  @override
  String get skip => 'スキップ';

  @override
  String get save => '保存';

  @override
  String get saveNote => '記録を保存';

  @override
  String get postIt => '投稿する';

  @override
  String get saveOnly => '保存だけする';

  @override
  String get feedPostedToast => 'フィードに送信されました';

  @override
  String get recordPostedToast => '投稿しました';

  @override
  String get recordSavedToast => '保存されました';

  @override
  String get commentPostedToast => '投稿されたコメント';

  @override
  String get commentSendFailedToast => 'コメントを送信できませんでした。もう一度試してください。';

  @override
  String get commentDeleteTitle => 'コメントの削除';

  @override
  String get commentDeleteContent => 'このコメントを削除しますか?';

  @override
  String commentsCount(int count) {
    return 'コメント$count';
  }

  @override
  String get commentsEmpty => 'コメントはまだありません\n最初に残しましょう 💬';

  @override
  String get commentInputHint => 'コメントを書いてください...';

  @override
  String get apiErrorContentBlockedUrl => 'リンクを含む投稿は送信できません。';

  @override
  String get apiErrorContentBlockedSpam => '宣伝文は送信できません。';

  @override
  String get apiErrorContentBlockedProfanity => '冒涜的な内容を含むコンテンツは投稿できません。';

  @override
  String get apiErrorContentBlockedModeration => 'このコンテンツは送信できません。';

  @override
  String get apiErrorRateLimitExceeded => 'しばらくしてからもう一度お試しください。';

  @override
  String get apiErrorInternal => 'サーバーエラーが発生しました。しばらくしてからもう一度お試しください。';

  @override
  String get apiErrorInvalidRequest => '無効なリクエストです。';

  @override
  String get apiErrorForbidden => '許可がありません。';

  @override
  String get apiErrorPostNotFound => '投稿が見つかりません。';

  @override
  String get apiErrorCommentNotFound => 'コメントが見つかりません。';

  @override
  String get apiErrorSignatureRequired => 'リクエストの署名が必要です。';

  @override
  String get apiErrorSignatureInvalid => '無効なリクエストです。';

  @override
  String get apiErrorSignatureExpired => 'リクエストの有効期限が切れました。もう一度試してください。';

  @override
  String get apiErrorSignatureReplay => 'このリクエストはすでに処理されています。';

  @override
  String get apiErrorUnknown => '不明なエラーが発生しました。';

  @override
  String get reminderNotification => 'リマインダー通知';

  @override
  String get noReminder => '未設定';

  @override
  String get summaryIntensity => '激怒レベル';

  @override
  String get summaryCategory => 'カテゴリ';

  @override
  String get summaryText => 'テキスト';

  @override
  String get summaryReminder => 'リマインダー';

  @override
  String get none => 'なし';

  @override
  String get other => 'その他';

  @override
  String get family => '家族';

  @override
  String get romance => 'ロマンス';

  @override
  String get work => '仕事';

  @override
  String get people => '人々';

  @override
  String get driving => '運転';

  @override
  String get custom => 'カスタム';

  @override
  String get recordCustomCategoryHint => 'カテゴリを入力してください';

  @override
  String get recordTextHint => 'ここに書いてください';

  @override
  String get recordMicPermissionRequired => 'マイクの許可が必要です。';

  @override
  String recordVoiceStartFailed(String label) {
    return '$label を開始できませんでした。';
  }

  @override
  String get recordVoiceStopRecording => '録音を停止する';

  @override
  String get recordVoiceRecordAgain => '再度録音する';

  @override
  String get recordVoiceSaved => '音声録音が保存されました。';

  @override
  String get recordAudioSummaryLabel => '声';

  @override
  String get recordAudioIncluded => '録音あり';

  @override
  String get recordSavingInProgress => '保存中...';

  @override
  String get recordPostingInProgress => '送信中...';

  @override
  String get recordSaveFailedToast => 'メモを保存できませんでした。もう一度試してください。';

  @override
  String get recordProgressSemantics => '進行状況を記録する';

  @override
  String get hourSuffix => 'h';

  @override
  String get minuteSuffix => 'メートル';

  @override
  String get reminderCustom => 'カスタム';

  @override
  String get reminderIn30Minutes => '30分以内';

  @override
  String get reminderIn1Hour => '1時間以内';

  @override
  String get reminderIn2Hours => '2時間以内';

  @override
  String get reminderIn6Hours => '6時間以内';

  @override
  String get reminderTomorrow => '明日';

  @override
  String get annoyed => 'イライラする';

  @override
  String get angry => '怒っている';

  @override
  String get mad => 'マッド';

  @override
  String get furious => '激怒';

  @override
  String get rage => '怒り';

  @override
  String get calmed => '穏やかな';

  @override
  String get feedTitle => 'フィード';

  @override
  String get feedSubtitle => '最近の怒りの投稿を見る';

  @override
  String get feedAllTab => 'すべてのフィード';

  @override
  String get feedMineTab => '自分のフィード';

  @override
  String get feedLoadFailed => 'フィードを読み込めませんでした。';

  @override
  String get feedEmptyMine => 'まだフィードに投稿していません。\n初めての怒りのメモを共有しましょう!';

  @override
  String get feedEmptyAll => 'まだフィード投稿はありません。\n真っ先に怒りを分かち合いましょう！';

  @override
  String get feedPostFailedToast => 'フィードに送信できませんでした。もう一度試してください。';

  @override
  String get like => '共感';

  @override
  String get comment => 'コメント';

  @override
  String get retry => '再試行';

  @override
  String get statsTitle => '怒りの統計';

  @override
  String get statsSubtitle => '今週の感情パターンを見る';

  @override
  String get week => '1週間';

  @override
  String get month => '1ヶ月';

  @override
  String get all => 'すべて';

  @override
  String get totalRecords => '記録';

  @override
  String get highestLevel => '最高';

  @override
  String get dailyAverage => '毎日の平均';

  @override
  String get decreaseRate => '減少';

  @override
  String get statsIntensityTrend => '怒りの強さの傾向';

  @override
  String get statsCategoryDistribution => '原因の分布';

  @override
  String get statsNoRecords => '表示する記録はありません。';

  @override
  String get statsCalendarButtonTitle => 'カレンダーごとに記録を表示する';

  @override
  String get statsCalendarButtonSubtitle => '怒りのメモを日付ごとに確認して管理する';

  @override
  String get statsCalendarTitle => 'カレンダーごとに記録を表示する';

  @override
  String get statsOtherCategory => 'その他';

  @override
  String selectedDateRecordsTitle(String date) {
    return '$date レコード';
  }

  @override
  String get noRecordsOnSelectedDate => '選択した日付にはレコードが書き込まれませんでした。';

  @override
  String get reminderAction => 'リマインダー';

  @override
  String get play => '再生';

  @override
  String get statsSummaryButtonTitle => '怒りのレポートを見る';

  @override
  String get statsSummaryButtonSubtitle => '自分の怒りのパターンをカテゴリー別に確認する';

  @override
  String get statsSummaryTitle => 'レイジレポート';

  @override
  String get statsSummaryClose => '閉じる';

  @override
  String get statsSummaryEmptyTitle => '要約する記録はまだありません';

  @override
  String get statsSummaryEmptyBody => '怒りノートを追加すると、ここにカテゴリ パターンが表示されます。';

  @override
  String statsSummaryTopHeadline(String category) {
    return '「$category」が最も頻繁にあなたを怒らせました';
  }

  @override
  String statsSummaryCategoryHeadline(String category) {
    return '「$category」を見ています';
  }

  @override
  String get statsSummaryComfortGeneric => '大丈夫です。そういうことが起こり得るのです。';

  @override
  String get statsSummaryComfortFamily => '誰かが近づくほど、着地が難しくなります。';

  @override
  String get statsSummaryComfortRomance => '大切な関係は、小さな瞬間をより鮮明に感じさせます。';

  @override
  String get statsSummaryComfortWork => '仕事のせいで、頭が思った以上に早く進んでしまったかもしれません。';

  @override
  String get statsSummaryComfortPeople => '他人からの言葉や表現は、予想以上に長く残ることがあります。';

  @override
  String get statsSummaryComfortDriving => '路面の緊張は最初に体に伝わることがよくあります。';

  @override
  String get statsSummaryMetricCount => 'カウント';

  @override
  String get statsSummaryMetricCategory => 'カテゴリ';

  @override
  String get statsSummaryMetricFeed => 'フィード投稿';

  @override
  String get statsSummaryMetricCalm => '冷静に試す';

  @override
  String get statsSummaryMetricAverage => '平均レベル';

  @override
  String get statsSummaryMetricPeak => 'ピークレベル';

  @override
  String get statsSummaryConclusion => '結論';

  @override
  String statsSummaryRecordsUnit(int count) {
    return '$count 回';
  }

  @override
  String statsSummaryAverageValue(String value) {
    return '$value/5';
  }

  @override
  String get statsSummaryConclusionTop =>
      'これは最も繰り返される怒りのサインです。次回は、怒りが完全に高まる前に体の緊張をチェックしてみてください。';

  @override
  String get statsSummaryConclusionCategory =>
      'このカテゴリがまだ小さいうちに書き留めておくと、パターンに早く気づくことができます。';

  @override
  String statsSummaryPageIndicator(int current, int total) {
    return '$current/$total';
  }

  @override
  String get statsSummaryCategoryShare => 'カテゴリシェア';

  @override
  String get statsSummaryCalmRate => 'カームレート';

  @override
  String get statsSummaryShareRate => 'シェア率';

  @override
  String get noContent => 'コンテンツなし';

  @override
  String get voicePlayback => '音声を再生する';

  @override
  String get deleteConfirm => '削除しますか？';

  @override
  String get delete => '削除';

  @override
  String get cancel => 'キャンセル';

  @override
  String get calmTitle => '落ち着く';

  @override
  String get calmSubtitle => 'まだ残っているものを下げる';

  @override
  String get reminderNotes => 'リマインダーメモ';

  @override
  String get breathing => '呼吸';

  @override
  String get timeout => 'タイムアウト';

  @override
  String get meditation => 'イメージ瞑想';

  @override
  String get feedSupport => 'フィードのサポート';

  @override
  String get calmReminderEmpty => 'リマインダーが到着するとここに表示されます';

  @override
  String get calmReminderFallbackText => 'その怒りは今どう感じていますか？';

  @override
  String get calmCheckTitle => 'あなたは今どのくらい怒っていますか？';

  @override
  String calmCheckSubtitle(String emoji, String label) {
    return '$emoji $label · 先ほどの怒り';
  }

  @override
  String get calmSavedCalmedToast => '落ち着いてくれて良かったです。';

  @override
  String get calmSavedUpdatedToast => '保存されました';

  @override
  String get profileName => '怒っているタイガー';

  @override
  String get nicknameAdjectives =>
      '怒っている、激怒、激怒、爆発的、猛烈な、うなり声、鋭い、角のある、加熱された、荒々しい、猛烈な、暴れ回る、激しい、雷のような、息を呑むような、沸騰する、憤慨する、燃えるような、嵐のような、有毒な';

  @override
  String get nicknameAnimals =>
      'トラ、ライオン、オオカミ、クマ、ワシ、サメ、ヒョウ、チーター、ワニ、コブラ、雄牛、イノシシ、サイ、ハイエナ、グリズリー、レイヴン、タカ、ハリネズミ、ジャガー、ピューマ';

  @override
  String get notificationSettings => '通知';

  @override
  String get commentNotification => 'コメントアラート';

  @override
  String get settingsNotificationsSection => '通知';

  @override
  String get settingsReminderSubtitle => '設定した時間に怒りメモリマインダー';

  @override
  String get settingsCommentSubtitle => '誰かがあなたの投稿にコメントしたときに警告する';

  @override
  String get settingsDataSection => 'データ';

  @override
  String get settingsDataImportSubtitle => 'バックアップファイルからレコードを復元する';

  @override
  String get settingsSupportSection => 'サポート';

  @override
  String get settingsPrivacySubtitle => '収集する情報と利用目的';

  @override
  String get settingsFeedbackTitle => 'フィードバックを送信する';

  @override
  String get settingsFeedbackSubtitle => '問題や改善のアイデア';

  @override
  String get settingsRecordCountUnit => '記録';

  @override
  String get settingsPostCountUnit => '投稿';

  @override
  String get proPlan => 'PRO データのエクスポート';

  @override
  String get backupImport => 'データのインポート';

  @override
  String get settingsDataExportSubtitle => 'バックアップファイル・履歴・共有';

  @override
  String get dataExportTitle => 'データのエクスポート';

  @override
  String get dataExportProTitle => 'PRO データのエクスポート';

  @override
  String get dataExportDescription =>
      'すべてのローカル アプリ データを含む 1 つのバックアップ ファイルを作成し、電子メールまたはメッセンジャーで共有します。';

  @override
  String get dataExportOneTimePurchase => '1 回限りの購入と生涯アクセス';

  @override
  String get dataExportDebugPrice => 'DEBUG';

  @override
  String get dataExportInProgress => '輸出中';

  @override
  String get dataExportPaymentChecking => '支払いの確認';

  @override
  String get dataExportCreateButton => 'エクスポートの作成';

  @override
  String get dataExportPayAndCreateButton => '支払いと輸出';

  @override
  String get dataExportRestorePurchase => '購入を復元する';

  @override
  String get dataExportCreatedToast => 'エクスポートファイルが作成されました。';

  @override
  String get dataExportFailedToast => 'エクスポートファイルを作成できませんでした。';

  @override
  String get dataExportShareSubject => 'Fury Note データバックアップ';

  @override
  String get dataExportShareText => 'Fury Note のデータバックアップファイルです。';

  @override
  String get dataExportShareFailedToast => '共有シートを開けませんでした。';

  @override
  String get dataExportAllDataIncluded => 'すべてのローカル アプリ データがバックアップに含まれます';

  @override
  String get dataExportHistoryTitle => 'エクスポート履歴';

  @override
  String dataExportHistoryCount(int count) {
    return '$count';
  }

  @override
  String get dataExportShareTooltip => 'シェアする';

  @override
  String get dataExportEmptyHistory => 'エクスポート ファイルはまだありません。';

  @override
  String get purchaseUpdateFailed => '購入の更新を処理できませんでした。';

  @override
  String get purchaseStatusFailed => '購入状況を確認できませんでした。';

  @override
  String get purchaseProductNotFound => 'ストアの商品が見つかりません。';

  @override
  String get purchaseStoreUnavailable => 'ストアに接続できませんでした。';

  @override
  String get purchaseProductInfoFailed => 'ストアの商品情報を読み込めませんでした。';

  @override
  String get purchaseProductUnavailable => '製品情報はまだ準備されていません。';

  @override
  String get purchaseStartFailed => '購入を開始できませんでした。';

  @override
  String get purchaseCanceled => '購入はキャンセルされました。';

  @override
  String get purchaseReceiptInvalid => '購入時のレシートを確認できませんでした。';

  @override
  String get purchaseReceiptVerifyFailed => '購入レシートの検証に失敗しました。';

  @override
  String get dataImportTitle => 'データのインポート';

  @override
  String get dataImportPickTitle => 'バックアップファイルを選択';

  @override
  String get dataImportPickDescription =>
      '.fnbackup ファイルを選択します\nフューリーノートからエクスポート';

  @override
  String get dataImportPickButton => 'ファイルを選択してください';

  @override
  String get dataImportInProgress => 'インポート中';

  @override
  String dataImportSuccessToast(int count) {
    return 'バックアップからデータを置き換えました。 ($count レコード)';
  }

  @override
  String get dataImportNoNewDataToast => 'バックアップからデータを置き換えました。 (0件)';

  @override
  String get dataImportFailedToast => 'バックアップファイルをインポートできませんでした。';

  @override
  String get dataImportInvalidFileToast => '.fnbackup ファイルのみをインポートできます。';

  @override
  String get dataImportNoticeTitle => '輸入する前に';

  @override
  String get dataImportNoticeBody => '既存のデータは削除され、バックアップ ファイル内のデータに置き換えられます。';

  @override
  String get dataImportTransferTitle => 'デバイスの移動';

  @override
  String get dataImportTransferBody =>
      '新しいデバイスにアプリをインストールした後、バックアップ ファイルをインポートして、現在のローカル データをバックアップ データに置き換えます。';

  @override
  String get feedDeleteTitle => 'フィードの削除';

  @override
  String get feedDeleteContent => 'このフィードを削除しますか?';

  @override
  String get calmBreathingTitle => '呼吸';

  @override
  String get breathPhaseInhale => '吸う';

  @override
  String get breathPhaseHold => 'ホールド';

  @override
  String get breathPhaseExhale => '息を吐く';

  @override
  String durationSeconds(int count) {
    return '$count秒';
  }

  @override
  String cycleCount(int count) {
    return 'サイクル $count';
  }

  @override
  String get calmTimeoutRunning => 'ランニング';

  @override
  String get calmTimeoutPaused => '一時停止中';

  @override
  String get reset => 'リセット';

  @override
  String get start => '開始';

  @override
  String get pause => '一時停止';

  @override
  String get stop => '停止';

  @override
  String get calmMeditationSceneWave => '波';

  @override
  String get calmMeditationSceneForest => '森';

  @override
  String get calmMeditationSceneSunset => '日没';

  @override
  String get calmMeditationSceneMountain => '山';

  @override
  String get calmMeditationSceneCherryBlossom => '桜';

  @override
  String get calmMeditationSceneNightSky => '夜空';

  @override
  String get calmMeditationPrompt => '深く息を吸い、そして息を吐きます';

  @override
  String get autoplay => '自動再生';

  @override
  String get profileEditTitle => 'プロフィールの編集';

  @override
  String get nicknameLabel => 'ニックネーム';

  @override
  String get nicknameHint => 'ニックネームを入力してください';

  @override
  String get nicknameRequiredError => 'ニックネームを入力してください';

  @override
  String get nicknameCodeAutomaticError => 'コードは自動的に追加されます';

  @override
  String get nicknameTooShortError => '少なくとも 2 文字を使用してください';

  @override
  String profileSavedToast(String name) {
    return '✅「$name」に変更しました！';
  }

  @override
  String get profileSaveFailedToast => '保存中にエラーが発生しました。';

  @override
  String get avatarPickGallery => 'ライブラリから選ぶ';

  @override
  String get avatarPickCamera => '写真を撮ってください';

  @override
  String get avatarReset => 'デフォルトのアバターを使用する';

  @override
  String get avatarResetToast => 'デフォルトのアバターが復元されました。';

  @override
  String get avatarAppliedToast => 'プロフィール写真が適用されました。';

  @override
  String get avatarTooLargeToast => '使用できる写真は5MBまでです。';

  @override
  String get avatarLoadFailedToast => '写真を読み込めませんでした。';

  @override
  String get profileCodeLabel => 'プロフィールコード（変更不可）';

  @override
  String get profileSaveButton => '変更を保存する';

  @override
  String get avatarChangeLabel => 'プロフィール写真を変更する';

  @override
  String get avatarChangeHint => '写真をタップして変更します';

  @override
  String get avatarSizeHint => 'JPG、PNG、GIF・最大5MB';

  @override
  String get reminderNotificationFallbackBody => 'その怒りは今どう感じていますか？';

  @override
  String get calmGuideTitle => '怒りがこみ上げてくると、\nまずは安全に体を下ろしてください';

  @override
  String get calmGuideSubtitle =>
      'Fury Note の穏やかなガイドは、怒りを取り除くようにとは言いません。これは、誰も傷つけずに感情を乗り越えるための短いガイドです。';

  @override
  String get calmGuideNotice =>
      '**差し迫った危険にさらされている**場合は、このアプリを使い続けるのではなく、周囲の人に助けを求めるか、まず緊急サービスに連絡してください。';

  @override
  String get calmGuideMomentTitle => '怒りが湧き上がる瞬間';

  @override
  String get calmGuideMomentBody1 =>
      '怒りは、あなたが大切にしているものが侵害されたことを示す信号である可能性があります。しかし、強い怒りの状態では判断が早くなり、普段よりも言葉や行動が荒くなってしまうことがあります。';

  @override
  String get calmGuideMomentBody2 =>
      '今必要なのは、**完全に合理的になる**ことではなく、**反応を 30 秒でも遅らせる**ことです。';

  @override
  String get calmGuideRoutineTitle => '60秒の穏やかなルーチン';

  @override
  String get calmGuideStep1Title => '停止';

  @override
  String get calmGuideStep1Desc =>
      '返信、通話、コメント、移動を一時停止します。手をリラックスさせて、しばらく画面から目を離してください。';

  @override
  String get calmGuideStep2Title => '呼吸する';

  @override
  String get calmGuideStep2Desc => '4 秒間吸って、7 秒間止めて、8 秒間吐きます。完璧でなくても大丈夫です。';

  @override
  String get calmGuideStep3Title => 'あなたの体をチェックしてください';

  @override
  String get calmGuideStep3Desc => '顎、肩、拳、お腹などが緊張していないか確認し、一か所だけ力を抜きましょう。';

  @override
  String get calmGuideStep4Title => '書き留めてください';

  @override
  String get calmGuideStep4Desc => '「今、私は○○のせいで怒っています」という一文でも十分です。';

  @override
  String get calmGuideBreathTitle => '4-7-8の呼吸';

  @override
  String get calmGuideBreathStep1 => '鼻から4秒かけて息を吸います。';

  @override
  String get calmGuideBreathStep2 => '7秒間息を止めてください。';

  @override
  String get calmGuideBreathStep3 => '8秒かけて口からゆっくりと息を吐きます。';

  @override
  String get calmGuideBreathStep4 => 'できれば3回繰り返してください。';

  @override
  String get calmGuideBreathNote =>
      '息を長く止めるのが難しい場合は、**3-3-5** などの快適なカウントに短くしてください。最も重要なのは、ゆっくりと長く息を吐くことです。';

  @override
  String get calmGuideTimeoutTitle => '10分のタイムアウト';

  @override
  String get calmGuideTimeoutBody =>
      '怒りが強ければ強いほど、すぐに解決したいという気持ちも強くなります。しかし、今話すと、最初に傷つく言葉が出てくるかもしれません。';

  @override
  String get calmGuideTimeoutExamplesTitle => 'タイムアウトフレーズの例';

  @override
  String get calmGuideTimeoutExample1 => '「今はとても怒っているので、10分後にもう一度話しましょう。」';

  @override
  String get calmGuideTimeoutExample2 => '「傷つくことを言うかもしれないので、少し休憩します。」';

  @override
  String get calmGuideTimeoutExample3 =>
      '「逃げているわけではありません。もう一度話す前に落ち着く必要があるだけです。」';

  @override
  String get calmGuideSensoryTitle => '感覚の素早いグラウンディング';

  @override
  String get calmGuideSensory1Title => '冷水';

  @override
  String get calmGuideSensory1Desc => '冷たい水を手首や顔に10秒ほど当てます。';

  @override
  String get calmGuideSensory2Title => '足を感じてください';

  @override
  String get calmGuideSensory2Desc => '足が床に触れる感覚にゆっくりと気づいてください';

  @override
  String get calmGuideSensory3Title => '周りを見回してください';

  @override
  String get calmGuideSensory3Desc => '目に見える 5 つのオブジェクトの名前を静かに挙げてください';

  @override
  String get calmGuideSensory4Title => '肩を落として';

  @override
  String get calmGuideSensory4Desc => '息を吐きながら肩を1cmだけ下げる';

  @override
  String get calmGuideQuestionsTitle => '執筆中に役立つ質問';

  @override
  String get calmGuideQuestion1 => 'いったい何が私を怒らせたのでしょうか？';

  @override
  String get calmGuideQuestion2 => '期待していたのに受け取れなかったものは何ですか?';

  @override
  String get calmGuideQuestion3 => '今実行したらどんな行動を後悔するでしょうか？';

  @override
  String get calmGuideQuestion4 => '明日の私はどの選択に感謝するでしょうか？';

  @override
  String get calmGuideTag1 => '感情ログ';

  @override
  String get calmGuideTag2 => '怒りを遠ざける';

  @override
  String get calmGuideTag3 => 'リマインダーチェック';

  @override
  String get calmGuideDangerTitle => 'このような場合はまず助けを求めてください';

  @override
  String get calmGuideDanger1 => '自分や他人を傷つけたいという衝動が強いとき';

  @override
  String get calmGuideDanger2 => '物を投げたり壊したりする衝動が止まらないとき';

  @override
  String get calmGuideDanger3 => '相手と対峙したり、脅迫したくなったとき';

  @override
  String get calmGuideDanger4 => 'アルコール、薬物、または極度の睡眠不足により、コントロールを維持することが困難な場合';

  @override
  String get calmGuideDangerBody =>
      'このような場合は、落ち着いた日常生活だけで乗り越えようとせず、周囲の人、専門サービス、または緊急サービスに助けを求めてください。';

  @override
  String get calmGuideFooterTitle => 'Fury Note Calm Guide';

  @override
  String get calmGuideFooterDisclaimer => 'この文書は医学的診断や治療に代わるものではありません。';

  @override
  String get privacyTitle => 'プライバシーポリシー';

  @override
  String get privacyLastUpdated => '発効日: 2026 年 6 月 16 日';

  @override
  String get privacySection1Title => '1. 収集される情報のカテゴリー';

  @override
  String get privacySection1Body =>
      'フューリーノートは会員登録なしでご利用いただけます。当社は以下の情報のみを収集します。\n· デバイス識別子 — 不正使用を防止する目的で、登録せずにユーザーを識別するために使用されるランダムに発行される値\n· 怒りの記録データ — 強度、カテゴリー、テキスト (デバイスのみに保存)\n· 匿名フィード投稿 — ニックネーム、アバター画像、強度、カテゴリ、テキスト\n· コメント — ニックネームとコメントのテキスト\n· いいねレコード — ユーザーが特定の投稿にいいねをしたかどうか\n· プッシュ通知トークン — 通知を送信する目的 (オプション)';

  @override
  String get privacySection2Title => '2. 処理の目的';

  @override
  String get privacySection2Body =>
      '・匿名フィード、コメント、いいねなどのコミュニティ機能の提供\n・同一投稿への重複いいね防止など不正利用の検知\n· コメントアラートを含むプッシュ通知の送信\n・サービスの運用およびエラーの分析';

  @override
  String get privacySection3Title => '3. 会員登録不要、個人情報の保持不要';

  @override
  String get privacySection3Body =>
      'Fury Noteでは会員登録は不要で、氏名、メールアドレス、電話番号などの本人確認が可能な個人情報は収集しません。\nニックネームは自動的に生成されるか、ユーザーによって直接入力され、ユーザーの実際の身元には関連付けられません。デバイス識別子も同様にランダムに生成される値であり、特定の個人を識別するために使用することはできません。';

  @override
  String get privacySection4Title => '4. 第三者への情報提供';

  @override
  String get privacySection4Body => '当社は、収集した情報を第三者に提供・販売することはありません。';

  @override
  String get privacySection5Title => '5. 情報の保存期間および利用期間';

  @override
  String get privacySection5Body =>
      '・保存のみされた怒り記録は端末内にのみ保持され、アプリ削除時に一緒に削除されます。\n· 匿名フィードに共有された投稿、アバター、コメントは、ユーザーによって削除されるまでサーバー上に保持され、そのような要求があった場合には直ちに削除されます。\n・いいねレコードは関連投稿の削除と同時に削除されます。';

  @override
  String get privacySection6Title => '6.連絡先';

  @override
  String get privacySection6Body =>
      '個人情報に関するお問い合わせは下記のメールアドレスまでご連絡ください。\nlunlu.co.kr@gmail.com';

  @override
  String get appGuideTitle => 'フューリーノートの使い方';

  @override
  String get appGuideSubtitle => '怒りを記録し、パターンを追跡し、フィードでサポートを受けるためのガイド。';

  @override
  String get appGuideRecordTitle => '怒りを記録する';

  @override
  String get appGuideRecordBody => '怒っているときは、下部にある 🔥 ボタンをタップして記録を開始します。';

  @override
  String get appGuideRecordStep1 => '強さを選択: 怒りの度合いに応じた絵文字を選択してください';

  @override
  String get appGuideRecordStep2 => 'カテゴリを選択してください: 原因を 1 つ選択してください';

  @override
  String get appGuideRecordStep3 => '書き出します: 何が起こったのか説明します (これはスキップできます)';

  @override
  String get appGuideRecordStep4 => 'リマインダー: 後でもう一度確認したい場合は、時間を設定してください';

  @override
  String get appGuideRecordStep5 => '保存または投稿: 記録を非公開にするか、フィードで共有します';

  @override
  String get appGuideFeedTitle => 'フィードでサポートを見つける';

  @override
  String get appGuideFeedBody => '怒りを共有すると、同じように感じている他の人たちとつながることができます。';

  @override
  String get appGuideFeedItem1 => '保存後、**匿名**でフィードに投稿できます';

  @override
  String get appGuideFeedItem2 => '他の人の投稿に「いいね」をしたりコメントしたりする';

  @override
  String get appGuideFeedItem3 => '自分の投稿はいつでも削除できます';

  @override
  String get appGuideStatsTitle => '自分の感情パターンを追跡する';

  @override
  String get appGuideStatsBody => '統計タブは、自分の怒りのパターンを振り返るのに役立ちます。';

  @override
  String get appGuideStatsItem1 => '期間別の怒りの強さの傾向グラフ';

  @override
  String get appGuideStatsItem2 => 'カテゴリ別原因分布';

  @override
  String get appGuideStatsItem3 => '日付ごとにレコードを参照するカレンダー ビュー';

  @override
  String get appGuideStatsItem4 => 'カテゴリ別にパターンを分析する怒りレポート';

  @override
  String get appGuideCalmTitle => '怒りを鎮める';

  @override
  String get appGuideCalmBody => 'ログインしたら、「穏やか」タブに移動して、感情を落ち着かせてみてください。';

  @override
  String get appGuideCalmItem1 => 'リマインダーメモ: フラグを付けたレコードを後で再確認します';

  @override
  String get appGuideCalmItem2 => '呼吸：4-7-8のテクニックで心を落ち着かせる';

  @override
  String get appGuideCalmItem3 => 'タイムアウト: 10 分間のタイマーで反応を遅らせます。';

  @override
  String get appGuideCalmItem4 => 'イメージ瞑想: 自然のイメージで気分を変える';

  @override
  String get appGuideProfileTitle => 'ニックネームとプロフィール';

  @override
  String get appGuideProfileBody => 'メニュー > 設定に移動して、ニックネームとアバターを変更します。';

  @override
  String get appGuideProfileItem1 => 'ニックネーム: 独自のニックネームを入力するか、ランダムに生成します';

  @override
  String get appGuideProfileItem2 => 'アバター: 絵文字で自分を表現します';

  @override
  String get appGuideNotificationTitle => '通知設定';

  @override
  String get appGuideNotificationItem1 => 'リマインダーアラート: 設定した時間に怒りのメモを思い出させます';

  @override
  String get appGuideNotificationItem2 =>
      'コメントアラート: 誰かがあなたの投稿にコメントしたときに通知を受け取ります';

  @override
  String get appGuideNotificationHint => '[設定] > [通知] でこれらを切り替えます。';

  @override
  String get appGuideFooterTitle => 'Fury Note App Guide';
}

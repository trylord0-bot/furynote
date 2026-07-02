// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Fury Note';

  @override
  String get appKoreanName => 'Fury Note';

  @override
  String get record => 'Запись';

  @override
  String get feed => 'Лента';

  @override
  String get stats => 'Статистика';

  @override
  String get calm => 'Успокоение';

  @override
  String get settings => 'Настройки';

  @override
  String get drawerGuide => 'Гид по приложению';

  @override
  String get drawerCalmGuide => 'Гид по успокоению';

  @override
  String get drawerVersion => 'Fury Note v1.0.0';

  @override
  String get menuTooltip => 'Меню';

  @override
  String drawerRecordCount(String count) {
    return '🔥 $count заметки о ярости';
  }

  @override
  String get drawerSettingsSubtitle => 'Псевдоним · уведомления';

  @override
  String get drawerGuideSubtitle => 'Как пользоваться Fury Note';

  @override
  String get drawerCalmGuideSubtitle => 'Спокойные карты · советы дня';

  @override
  String get relativeTimeJustNow => 'только что';

  @override
  String relativeTimeMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count минуты назад',
      many: '$count минут назад',
      few: '$count минуты назад',
      one: '$count минуту назад',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count часа назад',
      many: '$count часов назад',
      few: '$count часа назад',
      one: '$count час назад',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дня назад',
      many: '$count дней назад',
      few: '$count дня назад',
      one: '$count день назад',
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
  String get recordTitle => 'Запись гнева';

  @override
  String get stepIntensity => 'Насколько ты зол сейчас?';

  @override
  String get stepIntensitySub => 'Выберите смайлик';

  @override
  String get stepCategory => 'Что стало причиной этого?';

  @override
  String get stepCategorySub => 'Выберите одну категорию';

  @override
  String get stepText => 'Что случилось?';

  @override
  String get stepTextSub => 'Вы можете пропустить это';

  @override
  String get stepReminder => 'Хотите вернуться позже?';

  @override
  String get stepReminderSub => 'Вы можете пропустить это';

  @override
  String get stepSave => 'Сохранить эту заметку?';

  @override
  String get stepSaveSub => 'Вы можете опубликовать его после сохранения';

  @override
  String get stepPost => 'Разделите это чувство?';

  @override
  String get stepPostSub => 'Это будет анонимно';

  @override
  String get voiceInput => 'Запись голоса';

  @override
  String get next => 'Далее';

  @override
  String get previous => 'Назад';

  @override
  String get skip => 'Пропустить';

  @override
  String get save => 'Сохранить';

  @override
  String get saveNote => 'Сохранить заметку';

  @override
  String get postIt => 'Опубликовать';

  @override
  String get saveOnly => 'Только сохранить';

  @override
  String get feedPostedToast => 'Отправлено на корм';

  @override
  String get recordPostedToast => 'Опубликовано';

  @override
  String get recordSavedToast => 'Сохранено';

  @override
  String get commentPostedToast => 'Комментарий опубликован';

  @override
  String get commentSendFailedToast =>
      'Не удалось отправить комментарий. Пожалуйста, попробуйте еще раз.';

  @override
  String get commentDeleteTitle => 'Удалить комментарий';

  @override
  String get commentDeleteContent => 'Удалить этот комментарий?';

  @override
  String commentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count комментария',
      many: '$count комментариев',
      few: '$count комментария',
      one: '$count комментарий',
    );
    return '$_temp0';
  }

  @override
  String get commentsEmpty =>
      'Комментариев пока нет\nБудьте первым, кто оставит один 💬';

  @override
  String get commentInputHint => 'Напишите комментарий...';

  @override
  String get apiErrorContentBlockedUrl =>
      'Посты со ссылками не могут быть отправлены.';

  @override
  String get apiErrorContentBlockedSpam =>
      'Рекламный текст не может быть отправлен.';

  @override
  String get apiErrorContentBlockedProfanity =>
      'Контент, содержащий ненормативную лексику, не может быть отправлен.';

  @override
  String get apiErrorContentBlockedModeration =>
      'Этот контент не может быть отправлен.';

  @override
  String get apiErrorRateLimitExceeded =>
      'Пожалуйста, повторите попытку через минуту.';

  @override
  String get apiErrorInternal =>
      'Произошла ошибка сервера. Пожалуйста, повторите попытку через минуту.';

  @override
  String get apiErrorInvalidRequest => 'Неверный запрос.';

  @override
  String get apiErrorForbidden => 'У вас нет разрешения.';

  @override
  String get apiErrorPostNotFound => 'Пост не найден.';

  @override
  String get apiErrorCommentNotFound => 'Комментарий не найден.';

  @override
  String get apiErrorSignatureRequired => 'Требуется подпись запроса.';

  @override
  String get apiErrorSignatureInvalid => 'Неверный запрос.';

  @override
  String get apiErrorSignatureExpired =>
      'Срок действия запроса истек. Пожалуйста, попробуйте еще раз.';

  @override
  String get apiErrorSignatureReplay => 'Этот запрос уже обработан.';

  @override
  String get apiErrorUnknown => 'Произошла неизвестная ошибка.';

  @override
  String get reminderNotification => 'Уведомление-напоминание';

  @override
  String get noReminder => 'Не установлено';

  @override
  String get summaryIntensity => 'Уровень ярости';

  @override
  String get summaryCategory => 'Категория';

  @override
  String get summaryText => 'Текст';

  @override
  String get summaryReminder => 'Напоминание';

  @override
  String get none => 'Нет';

  @override
  String get other => 'Другое';

  @override
  String get family => 'Семья';

  @override
  String get romance => 'Романтика';

  @override
  String get work => 'Работа';

  @override
  String get people => 'Люди';

  @override
  String get driving => 'Вождение';

  @override
  String get custom => 'Пользовательский';

  @override
  String get recordCustomCategoryHint => 'Введите категорию';

  @override
  String get recordTextHint => 'Напишите это здесь';

  @override
  String get recordMicPermissionRequired =>
      'Требуется разрешение на использование микрофона.';

  @override
  String recordVoiceStartFailed(String label) {
    return 'Не удалось запустить $label.';
  }

  @override
  String get recordVoiceStopRecording => 'Остановить запись';

  @override
  String get recordVoiceRecordAgain => 'Записать еще раз';

  @override
  String get recordVoiceSaved => 'Запись голоса сохранена.';

  @override
  String get recordAudioSummaryLabel => 'Голос';

  @override
  String get recordAudioIncluded => 'Запись включена';

  @override
  String get recordSavingInProgress => 'Сохранение...';

  @override
  String get recordPostingInProgress => 'Отправка...';

  @override
  String get recordSaveFailedToast =>
      'Не удалось сохранить заметку. Пожалуйста, попробуйте еще раз.';

  @override
  String get recordProgressSemantics => 'Записывайте прогресс';

  @override
  String get hourSuffix => 'ч';

  @override
  String get minuteSuffix => 'м';

  @override
  String get reminderCustom => 'Пользовательский';

  @override
  String get reminderIn30Minutes => 'Через 30 минут';

  @override
  String get reminderIn1Hour => 'Через 1 час';

  @override
  String get reminderIn2Hours => 'Через 2 часа';

  @override
  String get reminderIn6Hours => 'Через 6 часов';

  @override
  String get reminderTomorrow => 'Завтра';

  @override
  String get annoyed => 'Раздраженный';

  @override
  String get angry => 'Злой';

  @override
  String get mad => 'Безумный';

  @override
  String get furious => 'Яростный';

  @override
  String get rage => 'Ярость';

  @override
  String get calmed => 'Спокойствие';

  @override
  String get feedTitle => 'Лента';

  @override
  String get feedSubtitle => 'Просмотрите недавние истории гнева';

  @override
  String get feedAllTab => 'Вся лента';

  @override
  String get feedMineTab => 'Моя лента';

  @override
  String get feedLoadFailed => 'Не удалось загрузить канал.';

  @override
  String get feedEmptyMine =>
      'Вы еще не публиковали сообщения в ленте.\nПоделитесь своей первой гневной заметкой!';

  @override
  String get feedEmptyAll =>
      'Пока нет публикаций в ленте.\nБудьте первым, кто поделитесь своим гневом!';

  @override
  String get feedPostFailedToast =>
      'Не удалось отправить на корм. Пожалуйста, попробуйте еще раз.';

  @override
  String get like => 'Понимаю';

  @override
  String get comment => 'Комментарий';

  @override
  String get retry => 'Повторить';

  @override
  String get statsTitle => 'Статистика гнева';

  @override
  String get statsSubtitle => 'Посмотрите на эмоциональную картину этой недели';

  @override
  String get week => '1 неделя';

  @override
  String get month => '1 месяц';

  @override
  String get all => 'Все';

  @override
  String get totalRecords => 'Рекорды';

  @override
  String get highestLevel => 'Самый высокий';

  @override
  String get dailyAverage => 'В среднем за день';

  @override
  String get decreaseRate => 'Уменьшение';

  @override
  String get statsIntensityTrend => 'Тенденция интенсивности ярости';

  @override
  String get statsCategoryDistribution => 'Распространение причин';

  @override
  String get statsNoRecords => 'Нет записей для отображения.';

  @override
  String get statsCalendarButtonTitle => 'Просмотр записей по календарю';

  @override
  String get statsCalendarButtonSubtitle =>
      'Проверяйте и управляйте заметками о ярости по дате';

  @override
  String get statsCalendarTitle => 'Просмотр записей по календарю';

  @override
  String get statsOtherCategory => 'Другое';

  @override
  String selectedDateRecordsTitle(String date) {
    return '$date записей';
  }

  @override
  String get noRecordsOnSelectedDate =>
      'На выбранную дату не было записано ни одной записи.';

  @override
  String get reminderAction => 'Напоминание';

  @override
  String get play => 'Воспроизвести';

  @override
  String get statsSummaryButtonTitle => 'Посмотреть отчет о гневе';

  @override
  String get statsSummaryButtonSubtitle =>
      'Пролистайте свои модели гнева по категориям.';

  @override
  String get statsSummaryTitle => 'Отчет о ярости';

  @override
  String get statsSummaryClose => 'Закрыть';

  @override
  String get statsSummaryEmptyTitle => 'Пока нет записей для подведения итогов';

  @override
  String get statsSummaryEmptyBody =>
      'Как только вы добавите заметки о ярости, здесь появятся шаблоны категорий.';

  @override
  String statsSummaryTopHeadline(String category) {
    return '\"$category\" чаще всего вас злил';
  }

  @override
  String statsSummaryCategoryHeadline(String category) {
    return 'Глядя на \"$category\"';
  }

  @override
  String get statsSummaryComfortGeneric =>
      'Все в порядке. Это может случиться.';

  @override
  String get statsSummaryComfortFamily =>
      'Чем ближе кто-то находится, тем труднее ему приземлиться.';

  @override
  String get statsSummaryComfortRomance =>
      'Драгоценные отношения могут сделать небольшие моменты еще более острыми.';

  @override
  String get statsSummaryComfortWork =>
      'Возможно, работа заставляла ваш разум работать быстрее, чем ему хотелось.';

  @override
  String get statsSummaryComfortPeople =>
      'Слова и выражения других людей могут задерживаться дольше, чем ожидалось.';

  @override
  String get statsSummaryComfortDriving =>
      'Напряжение в дороге часто сначала достигает тела.';

  @override
  String get statsSummaryMetricCount => 'Граф';

  @override
  String get statsSummaryMetricCategory => 'Категория';

  @override
  String get statsSummaryMetricFeed => 'Лента сообщений';

  @override
  String get statsSummaryMetricCalm => 'Спокойствие пытается';

  @override
  String get statsSummaryMetricAverage => 'Среднее уровень';

  @override
  String get statsSummaryMetricPeak => 'Пиковый уровень';

  @override
  String get statsSummaryConclusion => 'Заключение';

  @override
  String statsSummaryRecordsUnit(int count) {
    return '$count раз';
  }

  @override
  String statsSummaryAverageValue(String value) {
    return '$value/5';
  }

  @override
  String get statsSummaryConclusionTop =>
      'Это ваш наиболее повторяющийся сигнал гнева. В следующий раз попробуйте проверить напряжение тела до того, как гнев достигнет полной силы.';

  @override
  String get statsSummaryConclusionCategory =>
      'Записав эту категорию, пока она еще маленькая, вы сможете быстрее заметить закономерность.';

  @override
  String statsSummaryPageIndicator(int current, int total) {
    return '$current/$total';
  }

  @override
  String get statsSummaryCategoryShare => 'Доля категории';

  @override
  String get statsSummaryCalmRate => 'Спокойный тариф';

  @override
  String get statsSummaryShareRate => 'Курс акции';

  @override
  String get noContent => 'Нет контента';

  @override
  String get voicePlayback => 'Воспроизвести голос';

  @override
  String get deleteConfirm => 'Удалить?';

  @override
  String get delete => 'Удалить';

  @override
  String get cancel => 'Отмена';

  @override
  String get calmTitle => 'Успокоение';

  @override
  String get calmSubtitle => 'Опустите то, что все еще задерживается';

  @override
  String get reminderNotes => 'Напоминания';

  @override
  String get breathing => 'Дыхание';

  @override
  String get timeout => 'Тайм-аут';

  @override
  String get meditation => 'Образная медитация';

  @override
  String get feedSupport => 'Поддержка подачи';

  @override
  String get calmReminderEmpty =>
      'Напоминания будут появляться здесь, когда они прибудут.';

  @override
  String get calmReminderFallbackText => 'Как этот гнев ощущается сейчас?';

  @override
  String get calmCheckTitle => 'Насколько ты зол сейчас?';

  @override
  String calmCheckSubtitle(String emoji, String label) {
    return '$emoji $label · прежний гнев';
  }

  @override
  String get calmSavedCalmedToast => 'Рад, что ты успокоился.';

  @override
  String get calmSavedUpdatedToast => 'Сохранено';

  @override
  String get profileName => 'Злой Тигр';

  @override
  String get nicknameAdjectives =>
      'злой, яростный, бушующий, взрывной, свирепый, рычащий, острый, рогатый, нагретый, грубый, свирепый, неистовый, огненный, громовой, пыхтящий, кипящий, обиженный, пылающий, бурный, ядовитый';

  @override
  String get nicknameAnimals =>
      'тигр,лев,волк,медведь,орел,акула,леопард,гепард,крокодил,кобра,бык,кабан,носорог,гиена,гризли,ворон,ястреб,еж,ягуар,пума';

  @override
  String get notificationSettings => 'Уведомления';

  @override
  String get commentNotification => 'Оповещения о комментариях';

  @override
  String get settingsNotificationsSection => 'Уведомления';

  @override
  String get settingsReminderSubtitle =>
      'Напоминание о ярости в установленное вами время';

  @override
  String get settingsCommentSubtitle =>
      'Оповещение, когда кто-то комментирует вашу публикацию';

  @override
  String get settingsDataSection => 'Данные';

  @override
  String get settingsDataImportSubtitle =>
      'Восстановление записей из файла резервной копии';

  @override
  String get settingsSupportSection => 'Поддержка';

  @override
  String get settingsPrivacySubtitle =>
      'Собираемая информация и цель использования';

  @override
  String get settingsFeedbackTitle => 'Отправить отзыв';

  @override
  String get settingsFeedbackSubtitle => 'Проблемы или идеи по улучшению';

  @override
  String get settingsRecordCountUnit => 'записи';

  @override
  String get settingsPostCountUnit => 'посты';

  @override
  String get proPlan => 'Экспорт данных PRO';

  @override
  String get backupImport => 'Импортировать данные';

  @override
  String get settingsDataExportSubtitle =>
      'Файл резервной копии · история · обмен';

  @override
  String get dataExportTitle => 'Экспортировать данные';

  @override
  String get dataExportProTitle => 'Экспорт данных PRO';

  @override
  String get dataExportDescription =>
      'Создайте один файл резервной копии со всеми локальными данными приложения и поделитесь им по электронной почте или через мессенджер.';

  @override
  String get dataExportOneTimePurchase =>
      'Разовая покупка · пожизненный доступ';

  @override
  String get dataExportDebugPrice => 'DEBUG';

  @override
  String get dataExportInProgress => 'Экспорт';

  @override
  String get dataExportPaymentChecking => 'Проверка оплаты';

  @override
  String get dataExportCreateButton => 'Создать экспорт';

  @override
  String get dataExportPayAndCreateButton => 'Оплатить и экспортировать';

  @override
  String get dataExportRestorePurchase => 'Восстановить покупку';

  @override
  String get dataExportCreatedToast => 'Файл экспорта создан.';

  @override
  String get dataExportFailedToast => 'Не удалось создать файл экспорта.';

  @override
  String get dataExportShareSubject => 'Резервное копирование данных Fury Note';

  @override
  String get dataExportShareText =>
      'Это файл резервной копии данных Fury Note.';

  @override
  String get dataExportShareFailedToast => 'Не удалось открыть общий лист.';

  @override
  String get dataExportAllDataIncluded =>
      'Все локальные данные приложения включены в резервную копию.';

  @override
  String get dataExportHistoryTitle => 'История экспорта';

  @override
  String dataExportHistoryCount(int count) {
    return '$count';
  }

  @override
  String get dataExportShareTooltip => 'Поделиться';

  @override
  String get dataExportEmptyHistory => 'Файлов экспорта пока нет.';

  @override
  String get purchaseUpdateFailed =>
      'Не удалось обработать обновление покупки.';

  @override
  String get purchaseStatusFailed => 'Не удалось проверить статус покупки.';

  @override
  String get purchaseProductNotFound => 'Товар в магазине не найден.';

  @override
  String get purchaseStoreUnavailable => 'Не удалось подключиться к магазину.';

  @override
  String get purchaseProductInfoFailed =>
      'Не удалось загрузить информацию о продукте магазина.';

  @override
  String get purchaseProductUnavailable =>
      'Информация о продукте еще не готова.';

  @override
  String get purchaseStartFailed => 'Не удалось начать покупку.';

  @override
  String get purchaseCanceled => 'Покупка была отменена.';

  @override
  String get purchaseReceiptInvalid => 'Не удалось проверить чек о покупке.';

  @override
  String get purchaseReceiptVerifyFailed =>
      'Проверка чека о покупке не удалась.';

  @override
  String get dataImportTitle => 'Импортировать данные';

  @override
  String get dataImportPickTitle => 'Выберите файл резервной копии';

  @override
  String get dataImportPickDescription =>
      'Выберите файл .fnbackup\nэкспортировано из Fury Note';

  @override
  String get dataImportPickButton => 'Выбрать файл';

  @override
  String get dataImportInProgress => 'Импорт';

  @override
  String dataImportSuccessToast(int count) {
    return 'Заменил данные из бекапа. ($count записей)';
  }

  @override
  String get dataImportNoNewDataToast =>
      'Заменил данные из бекапа. (0 записей)';

  @override
  String get dataImportFailedToast =>
      'Не удалось импортировать файл резервной копии.';

  @override
  String get dataImportInvalidFileToast =>
      'Импортировать можно только файлы .fnbackup.';

  @override
  String get dataImportNoticeTitle => 'Перед импортом';

  @override
  String get dataImportNoticeBody =>
      'Существующие данные будут удалены и заменены данными из файла резервной копии.';

  @override
  String get dataImportTransferTitle => 'Перемещение устройств';

  @override
  String get dataImportTransferBody =>
      'После установки приложения на новое устройство импортируйте файл резервной копии, чтобы заменить текущие локальные данные данными резервной копии.';

  @override
  String get feedDeleteTitle => 'Удалить канал';

  @override
  String get feedDeleteContent => 'Удалить этот канал?';

  @override
  String get calmBreathingTitle => 'Дыхание';

  @override
  String get breathPhaseInhale => 'Вдохните';

  @override
  String get breathPhaseHold => 'Удерживать';

  @override
  String get breathPhaseExhale => 'Выдохните';

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count секунды',
      many: '$count секунд',
      few: '$count секунды',
      one: '$count секунда',
    );
    return '$_temp0';
  }

  @override
  String cycleCount(int count) {
    return 'Цикл $count';
  }

  @override
  String get calmTimeoutRunning => 'Бег';

  @override
  String get calmTimeoutPaused => 'Приостановлено';

  @override
  String get reset => 'Сброс';

  @override
  String get start => 'Старт';

  @override
  String get pause => 'Пауза';

  @override
  String get stop => 'Стоп';

  @override
  String get calmMeditationSceneWave => 'Волны';

  @override
  String get calmMeditationSceneForest => 'Лес';

  @override
  String get calmMeditationSceneSunset => 'Закат';

  @override
  String get calmMeditationSceneMountain => 'Гора';

  @override
  String get calmMeditationSceneCherryBlossom => 'Цветущая вишня';

  @override
  String get calmMeditationSceneNightSky => 'Ночное небо';

  @override
  String get calmMeditationPrompt => 'Вдохните глубоко, затем выдохните';

  @override
  String get autoplay => 'Автоматическое воспроизведение';

  @override
  String get profileEditTitle => 'Редактировать профиль';

  @override
  String get nicknameLabel => 'Псевдоним';

  @override
  String get nicknameHint => 'Введите псевдоним';

  @override
  String get nicknameRequiredError => 'Пожалуйста, введите псевдоним';

  @override
  String get nicknameCodeAutomaticError => 'Ваш код добавляется автоматически';

  @override
  String get nicknameTooShortError => 'Используйте не менее 2 символов';

  @override
  String profileSavedToast(String name) {
    return '✅ Изменено на «$name»!';
  }

  @override
  String get profileSaveFailedToast => 'При сохранении произошла ошибка.';

  @override
  String get avatarPickGallery => 'Выбрать из библиотеки';

  @override
  String get avatarPickCamera => 'Сфотографироваться';

  @override
  String get avatarReset => 'Использовать аватар по умолчанию';

  @override
  String get avatarResetToast => 'Аватар по умолчанию восстановлен.';

  @override
  String get avatarAppliedToast => 'Фотография профиля применена.';

  @override
  String get avatarTooLargeToast =>
      'Можно использовать только фотографии размером до 5 МБ.';

  @override
  String get avatarLoadFailedToast => 'Не удалось загрузить фото.';

  @override
  String get profileCodeLabel => 'Код профиля (не подлежит изменению)';

  @override
  String get profileSaveButton => 'Сохранить изменения';

  @override
  String get avatarChangeLabel => 'Изменить фотографию профиля';

  @override
  String get avatarChangeHint => 'Нажмите на фотографию, чтобы изменить ее.';

  @override
  String get avatarSizeHint => 'JPG, PNG, GIF · до 5 МБ';

  @override
  String get reminderNotificationFallbackBody =>
      'Как этот гнев ощущается сейчас?';

  @override
  String get calmGuideTitle =>
      'Когда гнев поднимается,\nсначала опустите тело безопасно';

  @override
  String get calmGuideSubtitle =>
      'Спокойное руководство Fury Note не советует вам избавляться от гнева. Это краткое руководство, которое поможет этому чувству пройти, не причинив никому вреда.';

  @override
  String get calmGuideNotice =>
      '**Если вам грозит непосредственная опасность**, попросите помощи у окружающих вас людей или сначала обратитесь в службу экстренной помощи, а не оставайтесь в этом приложении.';

  @override
  String get calmGuideMomentTitle => 'В тот момент, когда гнев поднимается';

  @override
  String get calmGuideMomentBody1 =>
      'Гнев может быть сигналом о том, что что-то, что вам дорого, было нарушено. Но в состоянии сильного гнева суждения ускоряются, а слова и действия могут стать более грубыми, чем обычно.';

  @override
  String get calmGuideMomentBody2 =>
      'Сейчас нужно не быть **совершенно рациональным**, а **задержать свою реакцию хотя бы на 30 секунд**.';

  @override
  String get calmGuideRoutineTitle => '60-секундная спокойная программа';

  @override
  String get calmGuideStep1Title => 'Стоп';

  @override
  String get calmGuideStep1Desc =>
      'Приостановите ответ, звонок, комментарий или перемещение. Расслабьте руки и на мгновение отведите взгляд от экрана.';

  @override
  String get calmGuideStep2Title => 'Дышите';

  @override
  String get calmGuideStep2Desc =>
      'Вдохните 4 секунды, задержите 7, выдохните 8. Ничего страшного, если не идеально.';

  @override
  String get calmGuideStep3Title => 'Проверьте свое тело';

  @override
  String get calmGuideStep3Desc =>
      'Проверьте, напряжены ли ваши челюсти, плечи, кулаки или живот, и расслабьте только одну точку.';

  @override
  String get calmGuideStep4Title => 'Запишите это';

  @override
  String get calmGuideStep4Desc =>
      'Даже одного предложения типа «Сейчас я злюсь, потому что ___» достаточно.';

  @override
  String get calmGuideBreathTitle => 'дыхание 4-7-8';

  @override
  String get calmGuideBreathStep1 => 'Вдохните через нос в течение 4 секунд.';

  @override
  String get calmGuideBreathStep2 => 'Задержите дыхание на 7 секунд.';

  @override
  String get calmGuideBreathStep3 =>
      'Медленно выдыхайте через рот в течение 8 секунд.';

  @override
  String get calmGuideBreathStep4 => 'Если можете, повторите 3 раза.';

  @override
  String get calmGuideBreathNote =>
      'Если вам тяжело задерживать дыхание на столь долгий срок, сократите его до комфортного счета, например **3-3-5**. Самое главное – это медленный, длинный выдох.';

  @override
  String get calmGuideTimeoutTitle => '10-минутный тайм-аут';

  @override
  String get calmGuideTimeoutBody =>
      'Чем сильнее гнев, тем сильнее желание немедленно решить эту проблему. Но разговор сейчас может сначала вызвать обидные слова.';

  @override
  String get calmGuideTimeoutExamplesTitle => 'Примеры фраз тайм-аута';

  @override
  String get calmGuideTimeoutExample1 =>
      '«Я сейчас слишком зол, давай поговорим еще раз через 10 минут».';

  @override
  String get calmGuideTimeoutExample2 =>
      '«Я делаю паузу на мгновение, потому что могу сказать что-нибудь обидное».';

  @override
  String get calmGuideTimeoutExample3 =>
      '«Я не убегаю, мне просто нужно успокоиться, прежде чем мы снова поговорим».';

  @override
  String get calmGuideSensoryTitle => 'Быстрое сенсорное заземление';

  @override
  String get calmGuideSensory1Title => 'Холодная вода';

  @override
  String get calmGuideSensory1Desc =>
      'Подержите холодную воду на запястьях или лице около 10 секунд.';

  @override
  String get calmGuideSensory2Title => 'Почувствуй свои ноги';

  @override
  String get calmGuideSensory2Desc =>
      'Медленно обратите внимание на ощущение прикосновения ног к полу.';

  @override
  String get calmGuideSensory3Title => 'Посмотрите вокруг';

  @override
  String get calmGuideSensory3Desc =>
      'Тихо назовите 5 предметов, которые вы видите.';

  @override
  String get calmGuideSensory4Title => 'Опусти плечи';

  @override
  String get calmGuideSensory4Desc =>
      'Выдохните и опустите плечи всего на 1 см.';

  @override
  String get calmGuideQuestionsTitle =>
      'Вопросы, которые помогают при написании';

  @override
  String get calmGuideQuestion1 => 'Что именно меня разозлило?';

  @override
  String get calmGuideQuestion2 => 'Чего я ожидал, но не получил?';

  @override
  String get calmGuideQuestion3 =>
      'О каком поступке я бы пожалел, если бы сделал это прямо сейчас?';

  @override
  String get calmGuideQuestion4 => 'За какой выбор буду благодарен я завтра?';

  @override
  String get calmGuideTag1 => 'Журнал эмоций';

  @override
  String get calmGuideTag2 => 'Гнев дистанцируется';

  @override
  String get calmGuideTag3 => 'Проверка напоминаний';

  @override
  String get calmGuideDangerTitle =>
      'В таких случаях сначала обратитесь за помощью';

  @override
  String get calmGuideDanger1 =>
      'Когда желание причинить вред себе или другим становится сильным';

  @override
  String get calmGuideDanger2 =>
      'Когда непреодолимое желание бросить или сломать вещи';

  @override
  String get calmGuideDanger3 =>
      'Когда вам хочется противостоять или угрожать другому человеку';

  @override
  String get calmGuideDanger4 =>
      'Когда алкоголь, наркотики или серьезное недосыпание мешают контролировать ситуацию';

  @override
  String get calmGuideDangerBody =>
      'В этих случаях не пытайтесь справиться с этим, используя только спокойную рутину — обратитесь за помощью к людям вокруг вас, к профессиональным службам или службам экстренной помощи.';

  @override
  String get calmGuideFooterTitle => 'Fury Note Calm Guide';

  @override
  String get calmGuideFooterDisclaimer =>
      'Этот документ не заменяет медицинскую диагностику или лечение.';

  @override
  String get privacyTitle => 'Политика конфиденциальности';

  @override
  String get privacyLastUpdated => 'Дата вступления в силу: 16 июня 2026 г.';

  @override
  String get privacySection1Title => '1. Категории собираемой информации';

  @override
  String get privacySection1Body =>
      'Fury Note можно использовать без регистрации членства. Компания собирает только следующую информацию.\n· Идентификатор устройства — случайно выдаваемое значение, используемое для идентификации пользователя без регистрации с целью предотвращения мошеннического использования.\n· Данные записи ярости — интенсивность, категория и текст (хранятся только на устройстве)\n· Анонимные сообщения в ленте — псевдоним, изображение аватара, интенсивность, категория и текст.\n· Комментарии — никнейм и текст комментария.\n· Записи лайков — понравилась ли пользователю данная публикация.\n· Токен push-уведомлений — для отправки уведомлений (необязательно)';

  @override
  String get privacySection2Title => '2. Цель обработки';

  @override
  String get privacySection2Body =>
      '· Предоставление функций сообщества, включая анонимную ленту, комментарии и лайки.\n· Обнаружение мошеннического использования, включая предотвращение дублирования лайков на одну и ту же публикацию.\n· Отправка push-уведомлений, включая оповещения о комментариях\n· Работа сервиса и анализ ошибок';

  @override
  String get privacySection3Title =>
      '3. Отсутствие регистрации членства и отсутствие хранения личной информации.';

  @override
  String get privacySection3Body =>
      'Fury Note не требует регистрации членства и не собирает личную информацию, позволяющую проверить личность, такую как имя, адрес электронной почты или номер телефона.\nПсевдоним либо генерируется автоматически, либо вводится непосредственно пользователем и не связан с реальной личностью пользователя. Идентификатор устройства также представляет собой случайно сгенерированное значение, которое нельзя использовать для идентификации конкретного человека.';

  @override
  String get privacySection4Title =>
      '4. Предоставление информации третьим лицам';

  @override
  String get privacySection4Body =>
      'Компания не предоставляет и не продает собранную информацию третьим лицам.';

  @override
  String get privacySection5Title =>
      '5. Срок хранения и использования информации';

  @override
  String get privacySection5Body =>
      '· Только сохраненные записи ярости сохраняются только на устройстве и удаляются вместе при удалении приложения.\n· Сообщения, аватары и комментарии, опубликованные в анонимном канале, сохраняются на сервере до тех пор, пока не будут удалены пользователем, и удаляются немедленно по такому запросу.\n· Записи лайков удаляются вместе с удалением соответствующего поста.';

  @override
  String get privacySection6Title => '6. Контакт';

  @override
  String get privacySection6Body =>
      'По вопросам, касающимся личной информации, обращайтесь по адресу электронной почты, указанному ниже.\nlunlu.co.kr@gmail.com';

  @override
  String get appGuideTitle => 'Как использовать записку ярости';

  @override
  String get appGuideSubtitle =>
      'Руководство по регистрации гнева, отслеживанию закономерностей и получению поддержки в ленте.';

  @override
  String get appGuideRecordTitle => 'Запишите свой гнев';

  @override
  String get appGuideRecordBody =>
      'Когда вы злитесь, нажмите кнопку 🔥 внизу, чтобы начать запись.';

  @override
  String get appGuideRecordStep1 =>
      'Выберите интенсивность: выберите смайлик, который соответствует тому, насколько вы злы.';

  @override
  String get appGuideRecordStep2 => 'Выберите категорию: выберите одну причину';

  @override
  String get appGuideRecordStep3 =>
      'Запишите это: опишите, что произошло (это можно пропустить)';

  @override
  String get appGuideRecordStep4 =>
      'Напоминание: установите время, если захотите вернуться к этому позже.';

  @override
  String get appGuideRecordStep5 =>
      'Сохранить или опубликовать: сохраните запись приватной или поделитесь ею в ленте.';

  @override
  String get appGuideFeedTitle => 'Найдите поддержку в ленте';

  @override
  String get appGuideFeedBody =>
      'Если вы поделитесь своим гневом, это поможет вам сблизиться с другими, которые чувствуют то же самое.';

  @override
  String get appGuideFeedItem1 =>
      'После сохранения вы можете публиковать сообщения **анонимно** в ленте.';

  @override
  String get appGuideFeedItem2 =>
      'Ставьте лайк или комментируйте публикации других людей';

  @override
  String get appGuideFeedItem3 =>
      'Вы можете удалить свою публикацию в любое время';

  @override
  String get appGuideStatsTitle => 'Отслеживайте свои эмоциональные шаблоны';

  @override
  String get appGuideStatsBody =>
      'Вкладка статистики поможет вам взглянуть на свои модели гнева.';

  @override
  String get appGuideStatsItem1 =>
      'График тенденции интенсивности ярости по периодам';

  @override
  String get appGuideStatsItem2 => 'Распределение причин по категориям';

  @override
  String get appGuideStatsItem3 =>
      'Представление календаря для просмотра записей по дате';

  @override
  String get appGuideStatsItem4 =>
      'Отчет Rage для анализа закономерностей по категориям';

  @override
  String get appGuideCalmTitle => 'Уменьшите свой гнев';

  @override
  String get appGuideCalmBody =>
      'После входа перейдите на вкладку «Спокойствие», чтобы попытаться снизить свои эмоции.';

  @override
  String get appGuideCalmItem1 =>
      'Примечания для напоминаний: повторно посетите отмеченные вами записи для последующего просмотра.';

  @override
  String get appGuideCalmItem2 =>
      'Дыхание: успокойте свой разум с помощью техники 4-7-8.';

  @override
  String get appGuideCalmItem3 =>
      'Тайм-аут: замедлите свою реакцию с помощью 10-минутного таймера.';

  @override
  String get appGuideCalmItem4 =>
      'Образная медитация: измените свое настроение с помощью образов природы';

  @override
  String get appGuideProfileTitle => 'Никнейм и профиль';

  @override
  String get appGuideProfileBody =>
      'Перейдите в меню > Настройки, чтобы изменить свой никнейм и аватар.';

  @override
  String get appGuideProfileItem1 =>
      'Псевдоним: введите свой собственный или сгенерируйте его случайным образом.';

  @override
  String get appGuideProfileItem2 => 'Аватар: представьте себя смайликом';

  @override
  String get appGuideNotificationTitle => 'Настройки уведомлений';

  @override
  String get appGuideNotificationItem1 =>
      'Напоминания: получайте напоминания о заметках о ярости в установленное вами время.';

  @override
  String get appGuideNotificationItem2 =>
      'Оповещения о комментариях: получайте уведомления, когда кто-то комментирует вашу публикацию.';

  @override
  String get appGuideNotificationHint =>
      'Переключите их в «Настройки» > «Уведомления».';

  @override
  String get appGuideFooterTitle => 'Fury Note App Guide';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Fury Note';

  @override
  String get appKoreanName => 'Fury Note';

  @override
  String get record => 'Wpis';

  @override
  String get feed => 'Feed';

  @override
  String get stats => 'Statystyki';

  @override
  String get calm => 'Uspokój';

  @override
  String get settings => 'Ustawienia';

  @override
  String get drawerGuide => 'Przewodnik po aplikacji';

  @override
  String get drawerCalmGuide => 'Przewodnik wyciszenia';

  @override
  String get drawerVersion => 'Fury Note v1.0.0';

  @override
  String get menuTooltip => 'Menu';

  @override
  String drawerRecordCount(String count) {
    return '🔥 $count notatki wściekłości';
  }

  @override
  String get drawerSettingsSubtitle => 'Pseudonim · powiadomienia';

  @override
  String get drawerGuideSubtitle => 'Jak korzystać z Fury Note';

  @override
  String get drawerCalmGuideSubtitle => 'Spokojne karty · dzisiejsze wskazówki';

  @override
  String get relativeTimeJustNow => 'Właśnie teraz';

  @override
  String relativeTimeMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuty temu',
      many: '$count minut temu',
      few: '$count minuty temu',
      one: '$count minutę temu',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count godziny temu',
      many: '$count godzin temu',
      few: '$count godziny temu',
      one: '$count godzinę temu',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dnia temu',
      many: '$count dni temu',
      few: '$count dni temu',
      one: '$count dzień temu',
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
  String get recordTitle => 'Wpis złości';

  @override
  String get stepIntensity => 'Jak bardzo jesteś teraz zły?';

  @override
  String get stepIntensitySub => 'Wybierz emoji';

  @override
  String get stepCategory => 'Co to spowodowało?';

  @override
  String get stepCategorySub => 'Wybierz jedną kategorię';

  @override
  String get stepText => 'Co się stało?';

  @override
  String get stepTextSub => 'Możesz to pominąć';

  @override
  String get stepReminder => 'Chcesz wrócić później?';

  @override
  String get stepReminderSub => 'Możesz to pominąć';

  @override
  String get stepSave => 'Zapisać tę notatkę?';

  @override
  String get stepSaveSub => 'Możesz opublikować go po zapisaniu';

  @override
  String get stepPost => 'Podzielasz to uczucie?';

  @override
  String get stepPostSub => 'Będzie anonimowo';

  @override
  String get voiceInput => 'Nagrywanie głosu';

  @override
  String get next => 'Dalej';

  @override
  String get previous => 'Wstecz';

  @override
  String get skip => 'Pomiń';

  @override
  String get save => 'Zapisz';

  @override
  String get saveNote => 'Zapisz notatkę';

  @override
  String get postIt => 'Opublikuj';

  @override
  String get saveOnly => 'Tylko zapisz';

  @override
  String get feedPostedToast => 'Wysłano do karmienia';

  @override
  String get recordPostedToast => 'Wysłano';

  @override
  String get recordSavedToast => 'Zapisano';

  @override
  String get commentPostedToast => 'Komentarz opublikowany';

  @override
  String get commentSendFailedToast =>
      'Nie udało się wysłać komentarza. Spróbuj ponownie.';

  @override
  String get commentDeleteTitle => 'Usuń komentarz';

  @override
  String get commentDeleteContent => 'Usunąć ten komentarz?';

  @override
  String commentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count komentarza',
      many: '$count komentarzy',
      few: '$count komentarze',
      one: '$count komentarz',
    );
    return '$_temp0';
  }

  @override
  String get commentsEmpty =>
      'Nie ma jeszcze żadnych komentarzy\nBądź pierwszą osobą, która go zostawi 💬';

  @override
  String get commentInputHint => 'Napisz komentarz...';

  @override
  String get apiErrorContentBlockedUrl =>
      'Nie można przesyłać postów zawierających linki.';

  @override
  String get apiErrorContentBlockedSpam =>
      'Nie można przesłać tekstu promocyjnego.';

  @override
  String get apiErrorContentBlockedProfanity =>
      'Nie można przesyłać treści zawierających wulgaryzmy.';

  @override
  String get apiErrorContentBlockedModeration =>
      'Nie można przesłać tej treści.';

  @override
  String get apiErrorRateLimitExceeded => 'Spróbuj ponownie za chwilę.';

  @override
  String get apiErrorInternal =>
      'Wystąpił błąd serwera. Spróbuj ponownie za chwilę.';

  @override
  String get apiErrorInvalidRequest => 'Nieprawidłowe żądanie.';

  @override
  String get apiErrorForbidden => 'Nie masz pozwolenia.';

  @override
  String get apiErrorPostNotFound => 'Nie znaleziono wpisu.';

  @override
  String get apiErrorCommentNotFound => 'Nie znaleziono komentarza.';

  @override
  String get apiErrorSignatureRequired => 'Wymagany jest podpis żądania.';

  @override
  String get apiErrorSignatureInvalid => 'Nieprawidłowe żądanie.';

  @override
  String get apiErrorSignatureExpired => 'Żądanie wygasło. Spróbuj ponownie.';

  @override
  String get apiErrorSignatureReplay => 'To żądanie zostało już przetworzone.';

  @override
  String get apiErrorUnknown => 'Wystąpił nieznany błąd.';

  @override
  String get reminderNotification => 'Powiadomienie przypominające';

  @override
  String get noReminder => 'Nie ustawiono';

  @override
  String get summaryIntensity => 'Poziom wściekłości';

  @override
  String get summaryCategory => 'Kategoria';

  @override
  String get summaryText => 'Tekst';

  @override
  String get summaryReminder => 'Przypomnienie';

  @override
  String get none => 'Żadne';

  @override
  String get other => 'Inne';

  @override
  String get family => 'Rodzina';

  @override
  String get romance => 'Romans';

  @override
  String get work => 'Praca';

  @override
  String get people => 'Ludzie';

  @override
  String get driving => 'Jazda';

  @override
  String get custom => 'Niestandardowe';

  @override
  String get recordCustomCategoryHint => 'Wprowadź kategorię';

  @override
  String get recordTextHint => 'Napisz to tutaj';

  @override
  String get recordMicPermissionRequired =>
      'Wymagane jest pozwolenie na korzystanie z mikrofonu.';

  @override
  String recordVoiceStartFailed(String label) {
    return 'Nie można uruchomić $label.';
  }

  @override
  String get recordVoiceStopRecording => 'Zatrzymaj nagrywanie';

  @override
  String get recordVoiceRecordAgain => 'Nagraj ponownie';

  @override
  String get recordVoiceSaved => 'Nagranie głosowe zostało zapisane.';

  @override
  String get recordAudioSummaryLabel => 'Głos';

  @override
  String get recordAudioIncluded => 'Nagranie w cenie';

  @override
  String get recordSavingInProgress => 'Zapisywanie...';

  @override
  String get recordPostingInProgress => 'Wysyłanie...';

  @override
  String get recordSaveFailedToast =>
      'Nie udało się zapisać notatki. Spróbuj ponownie.';

  @override
  String get recordProgressSemantics => 'Rekordowy postęp';

  @override
  String get hourSuffix => 'godz';

  @override
  String get minuteSuffix => 'm';

  @override
  String get reminderCustom => 'Niestandardowe';

  @override
  String get reminderIn30Minutes => 'Za 30 minut';

  @override
  String get reminderIn1Hour => 'Za 1 godzinę';

  @override
  String get reminderIn2Hours => 'Za 2 godziny';

  @override
  String get reminderIn6Hours => 'Za 6 godzin';

  @override
  String get reminderTomorrow => 'Jutro';

  @override
  String get annoyed => 'Zirytowany';

  @override
  String get angry => 'Zły';

  @override
  String get mad => 'Szalony';

  @override
  String get furious => 'Wściekły';

  @override
  String get rage => 'Wściekłość';

  @override
  String get calmed => 'Spokojny';

  @override
  String get feedTitle => 'Feed';

  @override
  String get feedSubtitle => 'Przeglądaj najnowsze historie dotyczące gniewu';

  @override
  String get feedAllTab => 'Cały feed';

  @override
  String get feedMineTab => 'Mój feed';

  @override
  String get feedLoadFailed => 'Nie udało się wczytać kanału.';

  @override
  String get feedEmptyMine =>
      'Nie opublikowałeś jeszcze posta w kanale.\nPodziel się swoją pierwszą wściekłą notatką!';

  @override
  String get feedEmptyAll =>
      'Nie ma jeszcze żadnych postów w kanale.\nBądź pierwszą osobą, która podzieli się swoją złością!';

  @override
  String get feedPostFailedToast =>
      'Nie udało się wysłać do kanału. Spróbuj ponownie.';

  @override
  String get like => 'Rozumiem';

  @override
  String get comment => 'Komentarz';

  @override
  String get retry => 'Spróbuj ponownie';

  @override
  String get statsTitle => 'Statystyki złości';

  @override
  String get statsSubtitle => 'Zobacz wzorzec emocjonalny w tym tygodniu';

  @override
  String get week => '1 tydzień';

  @override
  String get month => '1 miesiąc';

  @override
  String get all => 'Wszystko';

  @override
  String get totalRecords => 'Rekordy';

  @override
  String get highestLevel => 'Najwyższy';

  @override
  String get dailyAverage => 'Średnia dzienna';

  @override
  String get decreaseRate => 'Zmniejsz';

  @override
  String get statsIntensityTrend => 'Trend intensywności wściekłości';

  @override
  String get statsCategoryDistribution => 'Dystrybucja przyczyn';

  @override
  String get statsNoRecords => 'Brak rekordów do pokazania.';

  @override
  String get statsCalendarButtonTitle => 'Przeglądaj rekordy według kalendarza';

  @override
  String get statsCalendarButtonSubtitle =>
      'Sprawdzaj i zarządzaj notatkami wściekłości według daty';

  @override
  String get statsCalendarTitle => 'Przeglądaj rekordy według kalendarza';

  @override
  String get statsOtherCategory => 'Inne';

  @override
  String selectedDateRecordsTitle(String date) {
    return 'Rekordy $date';
  }

  @override
  String get noRecordsOnSelectedDate =>
      'W wybranym dniu nie zapisano żadnych zapisów.';

  @override
  String get reminderAction => 'Przypomnienie';

  @override
  String get play => 'Odtwórz';

  @override
  String get statsSummaryButtonTitle => 'Zobacz raport wściekłości';

  @override
  String get statsSummaryButtonSubtitle =>
      'Przeglądaj swoje wzorce złości według kategorii';

  @override
  String get statsSummaryTitle => 'Raport wściekłości';

  @override
  String get statsSummaryClose => 'Zamknij';

  @override
  String get statsSummaryEmptyTitle => 'Brak rekordów do podsumowania';

  @override
  String get statsSummaryEmptyBody =>
      'Po dodaniu notatek dotyczących wściekłości pojawią się tutaj wzorce kategorii.';

  @override
  String statsSummaryTopHeadline(String category) {
    return '„$category” najczęściej Cię złościło';
  }

  @override
  String statsSummaryCategoryHeadline(String category) {
    return 'Patrząc na „$category”';
  }

  @override
  String get statsSummaryComfortGeneric =>
      'Jest w porządku. To może się zdarzyć.';

  @override
  String get statsSummaryComfortFamily =>
      'Im ktoś jest bliżej, tym trudniej może wylądować.';

  @override
  String get statsSummaryComfortRomance =>
      'Cenny związek może sprawić, że małe chwile staną się ostrzejsze.';

  @override
  String get statsSummaryComfortWork =>
      'Praca mogła popchnąć Twój umysł szybciej, niż chciał.';

  @override
  String get statsSummaryComfortPeople =>
      'Słowa i wyrażenia innych osób mogą pozostać dłużej, niż się spodziewano.';

  @override
  String get statsSummaryComfortDriving =>
      'Napięcie na drodze często najpierw dociera do ciała.';

  @override
  String get statsSummaryMetricCount => 'Policz';

  @override
  String get statsSummaryMetricCategory => 'Kategoria';

  @override
  String get statsSummaryMetricFeed => 'Posty z kanałami';

  @override
  String get statsSummaryMetricCalm => 'Spokojnie próbuje';

  @override
  String get statsSummaryMetricAverage => 'Śr. poziom';

  @override
  String get statsSummaryMetricPeak => 'Poziom szczytowy';

  @override
  String get statsSummaryConclusion => 'Wniosek';

  @override
  String statsSummaryRecordsUnit(int count) {
    return '$count razy';
  }

  @override
  String statsSummaryAverageValue(String value) {
    return '$value/5';
  }

  @override
  String get statsSummaryConclusionTop =>
      'To najczęściej powtarzany sygnał złości. Następnym razem spróbuj sprawdzić napięcie ciała, zanim złość w pełni wzrośnie.';

  @override
  String get statsSummaryConclusionCategory =>
      'Zapisanie tej kategorii, gdy jest jeszcze mała, może pomóc Ci szybciej zauważyć wzór.';

  @override
  String statsSummaryPageIndicator(int current, int total) {
    return '$current/$total';
  }

  @override
  String get statsSummaryCategoryShare => 'Udział kategorii';

  @override
  String get statsSummaryCalmRate => 'Spokojne tempo';

  @override
  String get statsSummaryShareRate => 'Kurs akcji';

  @override
  String get noContent => 'Brak treści';

  @override
  String get voicePlayback => 'Odtwórz głos';

  @override
  String get deleteConfirm => 'Usunąć?';

  @override
  String get delete => 'Usuń';

  @override
  String get cancel => 'Anuluj';

  @override
  String get calmTitle => 'Uspokój';

  @override
  String get calmSubtitle => 'Obniż to, co wciąż pozostaje';

  @override
  String get reminderNotes => 'Notatki przypomnienia';

  @override
  String get breathing => 'Oddychanie';

  @override
  String get timeout => 'Limit czasu';

  @override
  String get meditation => 'Medytacja obrazowa';

  @override
  String get feedSupport => 'Wsparcie paszowe';

  @override
  String get calmReminderEmpty =>
      'Przypomnienia pojawią się tutaj, gdy nadejdą';

  @override
  String get calmReminderFallbackText => 'Jak teraz odczuwasz tę złość?';

  @override
  String get calmCheckTitle => 'Jak bardzo jesteś teraz zły?';

  @override
  String calmCheckSubtitle(String emoji, String label) {
    return '$emoji $label · ten wcześniejszy gniew';
  }

  @override
  String get calmSavedCalmedToast => 'Cieszę się, że się uspokoiłeś.';

  @override
  String get calmSavedUpdatedToast => 'Zapisano';

  @override
  String get profileName => 'Wściekły Tygrys';

  @override
  String get nicknameAdjectives =>
      'zły, wściekły, wściekły, wybuchowy, dziki, warczący, ostry, rogaty, podgrzewany, szorstki, gwałtowny, szalejący, ognisty, grzmiący, sapiąc, wrzący, urażony, płonący, burzliwy, jadowity';

  @override
  String get nicknameAnimals =>
      'tygrys, lew, wilk, niedźwiedź, orzeł, rekin, lampart, gepard, krokodyl, kobra, byk, dzik, nosorożec, hiena, grizzly, kruk, jastrząb, jeż, jaguar, puma';

  @override
  String get notificationSettings => 'Powiadomienia';

  @override
  String get commentNotification => 'Alerty w komentarzach';

  @override
  String get settingsNotificationsSection => 'Powiadomienia';

  @override
  String get settingsReminderSubtitle =>
      'Przypomnienie o wściekłości w ustawionym czasie';

  @override
  String get settingsCommentSubtitle =>
      'Ostrzegaj, gdy ktoś skomentuje Twój post';

  @override
  String get settingsDataSection => 'Dane';

  @override
  String get settingsDataImportSubtitle =>
      'Przywróć zapisy z pliku kopii zapasowej';

  @override
  String get settingsSupportSection => 'Wsparcie';

  @override
  String get settingsPrivacySubtitle =>
      'Zebrane informacje i cel ich wykorzystania';

  @override
  String get settingsFeedbackTitle => 'Wyślij opinię';

  @override
  String get settingsFeedbackSubtitle => 'Problemy lub pomysły na ulepszenia';

  @override
  String get settingsRecordCountUnit => 'zapisy';

  @override
  String get settingsPostCountUnit => 'posty';

  @override
  String get proPlan => 'Eksport danych PRO';

  @override
  String get backupImport => 'Importuj dane';

  @override
  String get settingsDataExportSubtitle =>
      'Plik kopii zapasowej · historia · udostępnianie';

  @override
  String get dataExportTitle => 'Eksportuj dane';

  @override
  String get dataExportProTitle => 'Eksport danych PRO';

  @override
  String get dataExportDescription =>
      'Utwórz jeden plik kopii zapasowej ze wszystkimi lokalnymi danymi aplikacji i udostępnij go e-mailem lub komunikatorem.';

  @override
  String get dataExportOneTimePurchase =>
      'Jednorazowy zakup · Dostęp dożywotni';

  @override
  String get dataExportDebugPrice => 'DEBUG';

  @override
  String get dataExportInProgress => 'Eksportowanie';

  @override
  String get dataExportPaymentChecking => 'Sprawdzanie płatności';

  @override
  String get dataExportCreateButton => 'Utwórz eksport';

  @override
  String get dataExportPayAndCreateButton => 'Zapłać i eksportuj';

  @override
  String get dataExportRestorePurchase => 'Przywróć zakup';

  @override
  String get dataExportCreatedToast => 'Utworzono plik eksportu.';

  @override
  String get dataExportFailedToast => 'Nie można utworzyć pliku eksportu.';

  @override
  String get dataExportShareSubject => 'Kopia zapasowa danych Fury Note';

  @override
  String get dataExportShareText =>
      'To jest plik kopii zapasowej danych Fury Note.';

  @override
  String get dataExportShareFailedToast =>
      'Nie można otworzyć arkusza udostępniania.';

  @override
  String get dataExportAllDataIncluded =>
      'Kopia zapasowa obejmuje wszystkie dane aplikacji lokalnych';

  @override
  String get dataExportHistoryTitle => 'Eksportuj historię';

  @override
  String dataExportHistoryCount(int count) {
    return '$count';
  }

  @override
  String get dataExportShareTooltip => 'Udostępnij';

  @override
  String get dataExportEmptyHistory => 'Nie ma jeszcze plików eksportu.';

  @override
  String get purchaseUpdateFailed =>
      'Nie można przetworzyć aktualizacji zakupu.';

  @override
  String get purchaseStatusFailed => 'Nie można sprawdzić statusu zakupu.';

  @override
  String get purchaseProductNotFound => 'Nie znaleziono produktu w sklepie.';

  @override
  String get purchaseStoreUnavailable => 'Nie można połączyć się ze sklepem.';

  @override
  String get purchaseProductInfoFailed =>
      'Nie można załadować informacji o produkcie w sklepie.';

  @override
  String get purchaseProductUnavailable =>
      'Informacje o produkcie nie są jeszcze gotowe.';

  @override
  String get purchaseStartFailed => 'Nie można rozpocząć zakupu.';

  @override
  String get purchaseCanceled => 'Zakup został anulowany.';

  @override
  String get purchaseReceiptInvalid =>
      'Nie udało się zweryfikować dowodu zakupu.';

  @override
  String get purchaseReceiptVerifyFailed =>
      'Weryfikacja dowodu zakupu nie powiodła się.';

  @override
  String get dataImportTitle => 'Importuj dane';

  @override
  String get dataImportPickTitle => 'Wybierz plik kopii zapasowej';

  @override
  String get dataImportPickDescription =>
      'Wybierz plik .fnbackup\nwyeksportowane z Fury Note';

  @override
  String get dataImportPickButton => 'Wybierz plik';

  @override
  String get dataImportInProgress => 'Importowanie';

  @override
  String dataImportSuccessToast(int count) {
    return 'Zastąpiono dane z kopii zapasowej. ($count rekordów)';
  }

  @override
  String get dataImportNoNewDataToast =>
      'Zastąpiono dane z kopii zapasowej. (0 rekordów)';

  @override
  String get dataImportFailedToast =>
      'Nie można zaimportować pliku kopii zapasowej.';

  @override
  String get dataImportInvalidFileToast =>
      'Można importować tylko pliki .fnbackup.';

  @override
  String get dataImportNoticeTitle => 'Przed importem';

  @override
  String get dataImportNoticeBody =>
      'Istniejące dane zostaną usunięte i zastąpione danymi z pliku kopii zapasowej.';

  @override
  String get dataImportTransferTitle => 'Przenoszenie urządzeń';

  @override
  String get dataImportTransferBody =>
      'Po zainstalowaniu aplikacji na nowym urządzeniu zaimportuj plik kopii zapasowej, aby zastąpić bieżące dane lokalne danymi kopii zapasowej.';

  @override
  String get feedDeleteTitle => 'Usuń kanał';

  @override
  String get feedDeleteContent => 'Usunąć ten kanał?';

  @override
  String get calmBreathingTitle => 'Oddychanie';

  @override
  String get breathPhaseInhale => 'Wdech';

  @override
  String get breathPhaseHold => 'Trzymaj';

  @override
  String get breathPhaseExhale => 'Wydech';

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sekundy',
      many: '$count sekund',
      few: '$count sekundy',
      one: '$count sekunda',
    );
    return '$_temp0';
  }

  @override
  String cycleCount(int count) {
    return 'Cykl $count';
  }

  @override
  String get calmTimeoutRunning => 'Bieganie';

  @override
  String get calmTimeoutPaused => 'Wstrzymano';

  @override
  String get reset => 'Resetuj';

  @override
  String get start => 'Start';

  @override
  String get pause => 'Pauza';

  @override
  String get stop => 'Stop';

  @override
  String get calmMeditationSceneWave => 'Fale';

  @override
  String get calmMeditationSceneForest => 'Las';

  @override
  String get calmMeditationSceneSunset => 'Zachód słońca';

  @override
  String get calmMeditationSceneMountain => 'Góra';

  @override
  String get calmMeditationSceneCherryBlossom => 'Kwiaty wiśni';

  @override
  String get calmMeditationSceneNightSky => 'Nocne niebo';

  @override
  String get calmMeditationPrompt =>
      'Oddychaj głęboko, a następnie zrób wydech';

  @override
  String get autoplay => 'Automatyczne odtwarzanie';

  @override
  String get profileEditTitle => 'Edytuj profil';

  @override
  String get nicknameLabel => 'Pseudonim';

  @override
  String get nicknameHint => 'Wpisz pseudonim';

  @override
  String get nicknameRequiredError => 'Proszę wpisać pseudonim';

  @override
  String get nicknameCodeAutomaticError =>
      'Twój kod zostanie dodany automatycznie';

  @override
  String get nicknameTooShortError => 'Użyj co najmniej 2 znaków';

  @override
  String profileSavedToast(String name) {
    return '✅ Zmieniono na „$name”!';
  }

  @override
  String get profileSaveFailedToast => 'Wystąpił błąd podczas zapisywania.';

  @override
  String get avatarPickGallery => 'Wybierz z biblioteki';

  @override
  String get avatarPickCamera => 'Zrób zdjęcie';

  @override
  String get avatarReset => 'Użyj domyślnego awatara';

  @override
  String get avatarResetToast => 'Przywrócono domyślny awatar.';

  @override
  String get avatarAppliedToast => 'Zastosowano zdjęcie profilowe.';

  @override
  String get avatarTooLargeToast =>
      'Można używać wyłącznie zdjęć o rozmiarze do 5 MB.';

  @override
  String get avatarLoadFailedToast => 'Nie udało się załadować zdjęcia.';

  @override
  String get profileCodeLabel => 'Kod profilu (nie można zmienić)';

  @override
  String get profileSaveButton => 'Zapisz zmiany';

  @override
  String get avatarChangeLabel => 'Zmień zdjęcie profilowe';

  @override
  String get avatarChangeHint => 'Kliknij zdjęcie, aby je zmienić';

  @override
  String get avatarSizeHint => 'JPG, PNG, GIF · do 5 MB';

  @override
  String get reminderNotificationFallbackBody =>
      'Jak teraz odczuwasz tę złość?';

  @override
  String get calmGuideTitle =>
      'Gdy narasta złość,\nnajpierw bezpiecznie opuść ciało';

  @override
  String get calmGuideSubtitle =>
      'Poradnik dotyczący spokoju w Fury Note nie mówi ci, żebyś pozbył się gniewu. To krótki przewodnik, który pomoże Ci przejść przez to uczucie bez krzywdzenia kogokolwiek.';

  @override
  String get calmGuideNotice =>
      '**Jeśli jesteś w bezpośrednim niebezpieczeństwie**, zamiast pozostawać w tej aplikacji, poproś o pomoc osoby w swoim otoczeniu lub skontaktuj się ze służbami ratunkowymi.';

  @override
  String get calmGuideMomentTitle => 'Moment, w którym narasta złość';

  @override
  String get calmGuideMomentBody1 =>
      'Złość może być sygnałem, że coś, na czym Ci zależy, zostało naruszone. Jednak w stanie silnego gniewu osądy stają się szybsze, a słowa i czyny mogą stać się ostrzejsze niż zwykle.';

  @override
  String get calmGuideMomentBody2 =>
      'To, czego teraz potrzeba, to nie być **idealnie racjonalnym**, ale **opóźnić reakcję nawet o 30 sekund**.';

  @override
  String get calmGuideRoutineTitle => '60-sekundowa spokojna rutyna';

  @override
  String get calmGuideStep1Title => 'Zatrzymaj się';

  @override
  String get calmGuideStep1Desc =>
      'Wstrzymaj odpowiadanie, dzwonienie, komentowanie lub przenoszenie się. Rozluźnij ręce i odwróć na chwilę wzrok od ekranu.';

  @override
  String get calmGuideStep2Title => 'Oddychaj';

  @override
  String get calmGuideStep2Desc =>
      'Wdech przez 4 sekundy, wstrzymaj przez 7, wydech przez 8. Nie ma problemu, jeśli nie jest idealnie.';

  @override
  String get calmGuideStep3Title => 'Sprawdź swoje ciało';

  @override
  String get calmGuideStep3Desc =>
      'Sprawdź, czy Twoja szczęka, ramiona, pięści lub brzuch są napięte i rozluźnij tylko jedno miejsce.';

  @override
  String get calmGuideStep4Title => 'Zapisz to';

  @override
  String get calmGuideStep4Desc =>
      'Wystarczy jedno zdanie typu „W tej chwili jestem zły, ponieważ ___”.';

  @override
  String get calmGuideBreathTitle => 'Oddychanie 4-7-8';

  @override
  String get calmGuideBreathStep1 => 'Wdychaj przez nos przez 4 sekundy.';

  @override
  String get calmGuideBreathStep2 => 'Wstrzymaj oddech na 7 sekund.';

  @override
  String get calmGuideBreathStep3 =>
      'Powoli wydychaj powietrze ustami przez 8 sekund.';

  @override
  String get calmGuideBreathStep4 => 'Jeśli możesz, powtórz 3 razy.';

  @override
  String get calmGuideBreathNote =>
      'Jeśli wstrzymywanie oddechu na tak długo jest trudne, skróć je do wygodnej liczby, np. **3-3-5**. Najważniejszy jest powolny, długi wydech.';

  @override
  String get calmGuideTimeoutTitle => '10-minutowa przerwa';

  @override
  String get calmGuideTimeoutBody =>
      'Im silniejszy jest gniew, tym silniejsza jest potrzeba natychmiastowego rozwiązania go. Ale rozmowa teraz może najpierw wywołać bolesne słowa.';

  @override
  String get calmGuideTimeoutExamplesTitle =>
      'Przykładowe wyrażenia dotyczące limitu czasu';

  @override
  String get calmGuideTimeoutExample1 =>
      '„Jestem teraz zbyt zły, porozmawiajmy ponownie za 10 minut”.';

  @override
  String get calmGuideTimeoutExample2 =>
      '– Przerywam na chwilę, bo mógłbym powiedzieć coś bolesnego.';

  @override
  String get calmGuideTimeoutExample3 =>
      '„Nie uciekam, muszę się tylko uspokoić, zanim znowu porozmawiamy”.';

  @override
  String get calmGuideSensoryTitle => 'Szybkie uziemienie sensoryczne';

  @override
  String get calmGuideSensory1Title => 'Zimna woda';

  @override
  String get calmGuideSensory1Desc =>
      'Trzymaj zimną wodę na nadgarstkach lub twarzy przez około 10 sekund';

  @override
  String get calmGuideSensory2Title => 'Poczuj swoje stopy';

  @override
  String get calmGuideSensory2Desc =>
      'Powoli zauważ uczucie, że Twoje stopy dotykają podłogi';

  @override
  String get calmGuideSensory3Title => 'Rozejrzyj się';

  @override
  String get calmGuideSensory3Desc =>
      'Nazwij po cichu 5 obiektów, które widzisz';

  @override
  String get calmGuideSensory4Title => 'Opuść ramiona';

  @override
  String get calmGuideSensory4Desc =>
      'Wykonaj wydech i opuść ramiona zaledwie o 1 cm';

  @override
  String get calmGuideQuestionsTitle => 'Pytania pomocne podczas pisania';

  @override
  String get calmGuideQuestion1 => 'Co dokładnie mnie złościło?';

  @override
  String get calmGuideQuestion2 =>
      'Czego się spodziewałem, ale nie otrzymałem?';

  @override
  String get calmGuideQuestion3 =>
      'Jakiego działania żałowałbym, gdybym zrobił to teraz?';

  @override
  String get calmGuideQuestion4 => 'Za jaki wybór jutro będę wdzięczny?';

  @override
  String get calmGuideTag1 => 'Dziennik emocji';

  @override
  String get calmGuideTag2 => 'Dystansowanie gniewu';

  @override
  String get calmGuideTag3 => 'Kontrola przypomnienia';

  @override
  String get calmGuideDangerTitle =>
      'W takich przypadkach najpierw poproś o pomoc';

  @override
  String get calmGuideDanger1 =>
      'Kiedy potrzeba wyrządzenia krzywdy sobie lub innym jest silna';

  @override
  String get calmGuideDanger2 =>
      'Kiedy chęć rzucenia lub rozbicia rzeczy nie ustanie';

  @override
  String get calmGuideDanger3 =>
      'Kiedy masz ochotę skonfrontować się lub zagrozić drugiej osobie';

  @override
  String get calmGuideDanger4 =>
      'Kiedy alkohol, narkotyki lub poważny brak snu utrudniają utrzymanie kontroli';

  @override
  String get calmGuideDangerBody =>
      'W takich przypadkach nie próbuj sobie z tym poradzić, stosując jedynie spokojną rutynę – poproś o pomoc osoby w swoim otoczeniu, profesjonalne służby lub służby ratunkowe.';

  @override
  String get calmGuideFooterTitle => 'Fury Note Calm Guide';

  @override
  String get calmGuideFooterDisclaimer =>
      'Niniejszy dokument nie zastępuje diagnozy lekarskiej ani leczenia.';

  @override
  String get privacyTitle => 'Polityka prywatności';

  @override
  String get privacyLastUpdated => 'Data wejścia w życie: 16 czerwca 2026 r';

  @override
  String get privacySection1Title => '1. Kategorie gromadzonych informacji';

  @override
  String get privacySection1Body =>
      'Z Fury Note można korzystać bez konieczności rejestracji członkostwa. Spółka gromadzi wyłącznie następujące informacje.\n· Identyfikator urządzenia — losowo nadawana wartość służąca do identyfikacji użytkownika bez rejestracji, w celu zapobiegania nieuprawnionemu użyciu\n· Dane rekordu wściekłości — intensywność, kategoria i tekst (przechowywane tylko na urządzeniu)\n· Anonimowe posty w kanałach — pseudonim, obraz awatara, intensywność, kategoria i tekst\n· Komentarze — pseudonim i tekst komentarza\n· Zapisy polubień – czy użytkownik polubił dany post\n· Token powiadomień push – w celu wysyłania powiadomień (opcjonalnie)';

  @override
  String get privacySection2Title => '2. Cel przetwarzania';

  @override
  String get privacySection2Body =>
      '· Udostępnianie funkcji społecznościowych, w tym anonimowych kanałów, komentarzy i polubień\n· Wykrywanie oszukańczego użycia, w tym zapobieganie duplikowaniu polubień tego samego postu\n· Wysyłanie powiadomień push, w tym powiadomień o komentarzach\n· Obsługa serwisu i analiza błędów';

  @override
  String get privacySection3Title =>
      '3. Zakaz rejestracji członkostwa i zakaz przechowywania danych osobowych';

  @override
  String get privacySection3Body =>
      'Fury Note nie wymaga rejestracji członkostwa i nie zbiera danych osobowych umożliwiających weryfikację tożsamości, takich jak imię i nazwisko, adres e-mail czy numer telefonu.\nPseudonim jest generowany automatycznie lub wprowadzany bezpośrednio przez użytkownika i nie jest powiązany z prawdziwą tożsamością użytkownika. Identyfikator urządzenia jest również wartością generowaną losowo, która nie pozwala na identyfikację konkretnej osoby.';

  @override
  String get privacySection4Title =>
      '4. Przekazywanie informacji stronom trzecim';

  @override
  String get privacySection4Body =>
      'Spółka nie udostępnia ani nie sprzedaje zebranych informacji osobom trzecim.';

  @override
  String get privacySection5Title =>
      '5. Okres przechowywania i wykorzystywania informacji';

  @override
  String get privacySection5Body =>
      '· Zapisy wściekłości, które zostały zapisane, są zachowywane tylko na urządzeniu i usuwane razem po usunięciu aplikacji.\n· Posty, awatary i komentarze udostępnione w anonimowym kanale są przechowywane na serwerze do czasu ich usunięcia przez użytkownika i są natychmiast usuwane na takie żądanie.\n· Podobne wpisy są usuwane razem po usunięciu powiązanego wpisu.';

  @override
  String get privacySection6Title => '6. Kontakt';

  @override
  String get privacySection6Body =>
      'W przypadku pytań dotyczących danych osobowych prosimy o kontakt na adres e-mail podany poniżej.\nlunlu.co.kr@gmail.com';

  @override
  String get appGuideTitle => 'Jak korzystać z notatki Furii';

  @override
  String get appGuideSubtitle =>
      'Przewodnik po rejestrowaniu gniewu, śledzeniu wzorców i uzyskiwaniu wsparcia w kanale.';

  @override
  String get appGuideRecordTitle => 'Zapisz swoją złość';

  @override
  String get appGuideRecordBody =>
      'Kiedy jesteś zły, dotknij przycisku 🔥 na dole, aby rozpocząć nagrywanie.';

  @override
  String get appGuideRecordStep1 =>
      'Wybierz intensywność: wybierz emoji pasujący do tego, jak bardzo jesteś zły';

  @override
  String get appGuideRecordStep2 =>
      'Wybierz kategorię: wybierz jedną przyczynę';

  @override
  String get appGuideRecordStep3 =>
      'Zapisz to: opisz, co się stało (możesz to pominąć)';

  @override
  String get appGuideRecordStep4 =>
      'Przypomnienie: ustaw godzinę, jeśli chcesz wrócić do tego później';

  @override
  String get appGuideRecordStep5 =>
      'Zapisz lub opublikuj: zachowaj rekord jako prywatny lub udostępnij go w kanale';

  @override
  String get appGuideFeedTitle => 'Znajdź wsparcie w kanale';

  @override
  String get appGuideFeedBody =>
      'Dzielenie się swoją złością może połączyć Cię z innymi, którzy czują to samo.';

  @override
  String get appGuideFeedItem1 =>
      'Po zapisaniu możesz publikować **anonimowo** w kanale';

  @override
  String get appGuideFeedItem2 => 'Polub lub skomentuj posty innych osób';

  @override
  String get appGuideFeedItem3 => 'W każdej chwili możesz usunąć swój post';

  @override
  String get appGuideStatsTitle => 'Śledź swoje wzorce emocjonalne';

  @override
  String get appGuideStatsBody =>
      'Zakładka statystyk pomaga spojrzeć wstecz na wzorce gniewu.';

  @override
  String get appGuideStatsItem1 =>
      'Wykres trendu intensywności wściekłości według okresu';

  @override
  String get appGuideStatsItem2 => 'Podział przyczyn według kategorii';

  @override
  String get appGuideStatsItem3 =>
      'Widok kalendarza umożliwiający przeglądanie zapisów według daty';

  @override
  String get appGuideStatsItem4 =>
      'Raport wściekłości umożliwiający analizę wzorców według kategorii';

  @override
  String get appGuideCalmTitle => 'Obniż swój gniew';

  @override
  String get appGuideCalmBody =>
      'Po zalogowaniu przejdź do zakładki spokoju, aby spróbować uspokoić emocje.';

  @override
  String get appGuideCalmItem1 =>
      'Notatki przypomnienia: wróć do oznaczonych rekordów na później';

  @override
  String get appGuideCalmItem2 =>
      'Oddychanie: uspokój umysł za pomocą techniki 4-7-8';

  @override
  String get appGuideCalmItem3 =>
      'Limit czasu: spowolnij reakcję za pomocą 10-minutowego timera';

  @override
  String get appGuideCalmItem4 =>
      'Medytacja obrazowa: zmień swój nastrój dzięki obrazom natury';

  @override
  String get appGuideProfileTitle => 'Pseudonim i profil';

  @override
  String get appGuideProfileBody =>
      'Przejdź do menu > Ustawienia, aby zmienić swój pseudonim i awatar.';

  @override
  String get appGuideProfileItem1 =>
      'Pseudonim: wpisz własny lub wygeneruj go losowo';

  @override
  String get appGuideProfileItem2 =>
      'Awatar: reprezentuj siebie za pomocą emoji';

  @override
  String get appGuideNotificationTitle => 'Ustawienia powiadomień';

  @override
  String get appGuideNotificationItem1 =>
      'Alerty przypomnienia: otrzymuj przypomnienie o notatce wściekłości w ustawionym czasie';

  @override
  String get appGuideNotificationItem2 =>
      'Alerty dotyczące komentarzy: otrzymuj powiadomienia, gdy ktoś skomentuje Twój post';

  @override
  String get appGuideNotificationHint =>
      'Przełącz je w Ustawieniach > Powiadomienia';

  @override
  String get appGuideFooterTitle => 'Fury Note App Guide';
}

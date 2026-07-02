// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Fury Note';

  @override
  String get appKoreanName => 'Fury Note';

  @override
  String get record => 'Eintrag';

  @override
  String get feed => 'Feed';

  @override
  String get stats => 'Statistik';

  @override
  String get calm => 'Beruhigen';

  @override
  String get settings => 'Einstellungen';

  @override
  String get drawerGuide => 'App-Anleitung';

  @override
  String get drawerCalmGuide => 'Beruhigungsanleitung';

  @override
  String get drawerVersion => 'Fury Note v1.0.0';

  @override
  String get menuTooltip => 'Menü';

  @override
  String drawerRecordCount(String count) {
    return '🔥 $count Wutnotizen';
  }

  @override
  String get drawerSettingsSubtitle => 'Spitzname · Benachrichtigungen';

  @override
  String get drawerGuideSubtitle => 'So verwendest du Fury Note';

  @override
  String get drawerCalmGuideSubtitle => 'Ruhige Karten · heutige Tipps';

  @override
  String get relativeTimeJustNow => 'Gerade eben';

  @override
  String relativeTimeMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vor $count Minuten',
      one: 'Vor 1 Minute',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vor $count Stunden',
      one: 'Vor 1 Stunde',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vor $count Tagen',
      one: 'Vor 1 Tag',
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
  String get recordTitle => 'Wut-Eintrag';

  @override
  String get stepIntensity => 'Wie wütend bist du jetzt?';

  @override
  String get stepIntensitySub => 'Wählen Sie ein Emoji';

  @override
  String get stepCategory => 'Was hat es verursacht?';

  @override
  String get stepCategorySub => 'Wählen Sie eine Kategorie aus';

  @override
  String get stepText => 'Was ist passiert?';

  @override
  String get stepTextSub => 'Sie können dies überspringen';

  @override
  String get stepReminder => 'Möchten Sie später noch einmal vorbeischauen?';

  @override
  String get stepReminderSub => 'Sie können dies überspringen';

  @override
  String get stepSave => 'Diese Notiz speichern?';

  @override
  String get stepSaveSub => 'Sie können es nach dem Speichern veröffentlichen';

  @override
  String get stepPost => 'Teilen Sie dieses Gefühl?';

  @override
  String get stepPostSub => 'Es wird anonym sein';

  @override
  String get voiceInput => 'Sprachaufzeichnung';

  @override
  String get next => 'Weiter';

  @override
  String get previous => 'Zurück';

  @override
  String get skip => 'Überspringen';

  @override
  String get save => 'Speichern';

  @override
  String get saveNote => 'Notiz speichern';

  @override
  String get postIt => 'Posten';

  @override
  String get saveOnly => 'Nur speichern';

  @override
  String get feedPostedToast => 'Zum Füttern geschickt';

  @override
  String get recordPostedToast => 'Gepostet';

  @override
  String get recordSavedToast => 'Gespeichert';

  @override
  String get commentPostedToast => 'Kommentar gepostet';

  @override
  String get commentSendFailedToast =>
      'Der Kommentar konnte nicht gesendet werden. Bitte versuchen Sie es erneut.';

  @override
  String get commentDeleteTitle => 'Kommentar löschen';

  @override
  String get commentDeleteContent => 'Diesen Kommentar löschen?';

  @override
  String commentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Kommentare',
      one: '1 Kommentar',
    );
    return '$_temp0';
  }

  @override
  String get commentsEmpty =>
      'Noch keine Kommentare\nSei der Erste, der eins hinterlässt 💬';

  @override
  String get commentInputHint => 'Schreibe einen Kommentar...';

  @override
  String get apiErrorContentBlockedUrl =>
      'Beiträge mit Links können nicht eingereicht werden.';

  @override
  String get apiErrorContentBlockedSpam =>
      'Werbetext kann nicht eingereicht werden.';

  @override
  String get apiErrorContentBlockedProfanity =>
      'Inhalte, die Obszönitäten enthalten, können nicht eingereicht werden.';

  @override
  String get apiErrorContentBlockedModeration =>
      'Dieser Inhalt kann nicht übermittelt werden.';

  @override
  String get apiErrorRateLimitExceeded =>
      'Bitte versuchen Sie es gleich noch einmal.';

  @override
  String get apiErrorInternal =>
      'Es ist ein Serverfehler aufgetreten. Bitte versuchen Sie es gleich noch einmal.';

  @override
  String get apiErrorInvalidRequest => 'Ungültige Anfrage.';

  @override
  String get apiErrorForbidden => 'Sie haben keine Erlaubnis.';

  @override
  String get apiErrorPostNotFound => 'Beitrag nicht gefunden.';

  @override
  String get apiErrorCommentNotFound => 'Kommentar nicht gefunden.';

  @override
  String get apiErrorSignatureRequired =>
      'Für die Anfrage ist eine Unterschrift erforderlich.';

  @override
  String get apiErrorSignatureInvalid => 'Ungültige Anfrage.';

  @override
  String get apiErrorSignatureExpired =>
      'Die Anfrage ist abgelaufen. Bitte versuchen Sie es erneut.';

  @override
  String get apiErrorSignatureReplay =>
      'Diese Anfrage wurde bereits bearbeitet.';

  @override
  String get apiErrorUnknown => 'Es ist ein unbekannter Fehler aufgetreten.';

  @override
  String get reminderNotification => 'Erinnerungsbenachrichtigung';

  @override
  String get noReminder => 'Nicht festgelegt';

  @override
  String get summaryIntensity => 'Wutlevel';

  @override
  String get summaryCategory => 'Kategorie';

  @override
  String get summaryText => 'Text';

  @override
  String get summaryReminder => 'Erinnerung';

  @override
  String get none => 'Keine';

  @override
  String get other => 'Andere';

  @override
  String get family => 'Familie';

  @override
  String get romance => 'Romantik';

  @override
  String get work => 'Arbeit';

  @override
  String get people => 'Menschen';

  @override
  String get driving => 'Fahren';

  @override
  String get custom => 'Benutzerdefiniert';

  @override
  String get recordCustomCategoryHint => 'Geben Sie eine Kategorie ein';

  @override
  String get recordTextHint => 'Schreiben Sie es hier';

  @override
  String get recordMicPermissionRequired =>
      'Eine Mikrofonerlaubnis ist erforderlich.';

  @override
  String recordVoiceStartFailed(String label) {
    return '$label konnte nicht gestartet werden.';
  }

  @override
  String get recordVoiceStopRecording => 'Stoppen Sie die Aufnahme';

  @override
  String get recordVoiceRecordAgain => 'Nochmals aufnehmen';

  @override
  String get recordVoiceSaved => 'Sprachaufzeichnung gespeichert.';

  @override
  String get recordAudioSummaryLabel => 'Stimme';

  @override
  String get recordAudioIncluded => 'Aufnahme inklusive';

  @override
  String get recordSavingInProgress => 'Sparen...';

  @override
  String get recordPostingInProgress => 'Senden...';

  @override
  String get recordSaveFailedToast =>
      'Die Notiz konnte nicht gespeichert werden. Bitte versuchen Sie es erneut.';

  @override
  String get recordProgressSemantics => 'Fortschritt aufzeichnen';

  @override
  String get hourSuffix => 'h';

  @override
  String get minuteSuffix => 'm';

  @override
  String get reminderCustom => 'Benutzerdefiniert';

  @override
  String get reminderIn30Minutes => 'In 30 Minuten';

  @override
  String get reminderIn1Hour => 'In 1 Stunde';

  @override
  String get reminderIn2Hours => 'In 2 Stunden';

  @override
  String get reminderIn6Hours => 'In 6 Stunden';

  @override
  String get reminderTomorrow => 'Morgen';

  @override
  String get annoyed => 'Genervt';

  @override
  String get angry => 'Wütend';

  @override
  String get mad => 'Verrückt';

  @override
  String get furious => 'Wütend';

  @override
  String get rage => 'Wut';

  @override
  String get calmed => 'Ruhig';

  @override
  String get feedTitle => 'Feed';

  @override
  String get feedSubtitle => 'Durchsuchen Sie aktuelle Wutgeschichten';

  @override
  String get feedAllTab => 'Gesamter Feed';

  @override
  String get feedMineTab => 'Mein Feed';

  @override
  String get feedLoadFailed => 'Der Feed konnte nicht geladen werden.';

  @override
  String get feedEmptyMine =>
      'Sie haben noch nichts im Feed gepostet.\nTeilen Sie Ihre erste Wutnotiz!';

  @override
  String get feedEmptyAll =>
      'Noch keine Feed-Beiträge.\nSeien Sie der Erste, der Ihre Wut teilt!';

  @override
  String get feedPostFailedToast =>
      'Konnte nicht an den Feed gesendet werden. Bitte versuchen Sie es erneut.';

  @override
  String get like => 'Fühle ich';

  @override
  String get comment => 'Kommentar';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get statsTitle => 'Wut-Statistik';

  @override
  String get statsSubtitle =>
      'Sehen Sie sich das emotionale Muster dieser Woche an';

  @override
  String get week => '1 Woche';

  @override
  String get month => '1 Monat';

  @override
  String get all => 'Alle';

  @override
  String get totalRecords => 'Aufzeichnungen';

  @override
  String get highestLevel => 'Höchste';

  @override
  String get dailyAverage => 'Täglicher Durchschnitt.';

  @override
  String get decreaseRate => 'Abnahme';

  @override
  String get statsIntensityTrend => 'Trend zur Wutintensität';

  @override
  String get statsCategoryDistribution => 'Ursachenverteilung';

  @override
  String get statsNoRecords => 'Keine Datensätze zum Anzeigen.';

  @override
  String get statsCalendarButtonTitle => 'Datensätze nach Kalender anzeigen';

  @override
  String get statsCalendarButtonSubtitle =>
      'Überprüfen und verwalten Sie Wutnotizen nach Datum';

  @override
  String get statsCalendarTitle => 'Datensätze nach Kalender anzeigen';

  @override
  String get statsOtherCategory => 'Andere';

  @override
  String selectedDateRecordsTitle(String date) {
    return '$date Datensätze';
  }

  @override
  String get noRecordsOnSelectedDate =>
      'Am ausgewählten Datum wurden keine Datensätze geschrieben.';

  @override
  String get reminderAction => 'Erinnerung';

  @override
  String get play => 'Abspielen';

  @override
  String get statsSummaryButtonTitle => 'Wutbericht ansehen';

  @override
  String get statsSummaryButtonSubtitle =>
      'Blättern Sie durch Ihre Wutmuster nach Kategorien';

  @override
  String get statsSummaryTitle => 'Wutbericht';

  @override
  String get statsSummaryClose => 'Schließen';

  @override
  String get statsSummaryEmptyTitle =>
      'Noch keine Datensätze zum Zusammenfassen';

  @override
  String get statsSummaryEmptyBody =>
      'Sobald Sie Wutnotizen hinzufügen, werden hier Kategoriemuster angezeigt.';

  @override
  String statsSummaryTopHeadline(String category) {
    return '„$category“ hat dich am häufigsten wütend gemacht';
  }

  @override
  String statsSummaryCategoryHeadline(String category) {
    return 'Betrachtet „$category“';
  }

  @override
  String get statsSummaryComfortGeneric => 'Es ist okay. Das kann passieren.';

  @override
  String get statsSummaryComfortFamily =>
      'Je näher jemand ist, desto schwieriger kann es landen.';

  @override
  String get statsSummaryComfortRomance =>
      'Eine wertvolle Beziehung kann kleine Momente schärfer wirken lassen.';

  @override
  String get statsSummaryComfortWork =>
      'Die Arbeit hat Ihren Geist möglicherweise schneller vorangetrieben, als er wollte.';

  @override
  String get statsSummaryComfortPeople =>
      'Worte und Ausdrücke anderer können länger nachklingen als erwartet.';

  @override
  String get statsSummaryComfortDriving =>
      'Die Spannung auf der Straße erreicht oft zuerst den Körper.';

  @override
  String get statsSummaryMetricCount => 'Zählen';

  @override
  String get statsSummaryMetricCategory => 'Kategorie';

  @override
  String get statsSummaryMetricFeed => 'Feed-Beiträge';

  @override
  String get statsSummaryMetricCalm => 'Ruhige Versuche';

  @override
  String get statsSummaryMetricAverage => 'Durchschn. Ebene';

  @override
  String get statsSummaryMetricPeak => 'Spitzenniveau';

  @override
  String get statsSummaryConclusion => 'Fazit';

  @override
  String statsSummaryRecordsUnit(int count) {
    return '$count Mal';
  }

  @override
  String statsSummaryAverageValue(String value) {
    return '$value/5';
  }

  @override
  String get statsSummaryConclusionTop =>
      'Dies ist Ihr am häufigsten wiederholtes Wutsignal. Versuchen Sie das nächste Mal, die Körperspannung zu überprüfen, bevor die Wut vollständig aufsteigt.';

  @override
  String get statsSummaryConclusionCategory =>
      'Wenn Sie diese Kategorie aufschreiben, solange sie noch klein ist, können Sie das Muster schneller erkennen.';

  @override
  String statsSummaryPageIndicator(int current, int total) {
    return '$current/$total';
  }

  @override
  String get statsSummaryCategoryShare => 'Kategorieanteil';

  @override
  String get statsSummaryCalmRate => 'Ruhiger Tarif';

  @override
  String get statsSummaryShareRate => 'Aktienkurs';

  @override
  String get noContent => 'Kein Inhalt';

  @override
  String get voicePlayback => 'Stimme spielen';

  @override
  String get deleteConfirm => 'Löschen?';

  @override
  String get delete => 'Löschen';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get calmTitle => 'Beruhigen';

  @override
  String get calmSubtitle => 'Senken Sie, was noch übrig ist';

  @override
  String get reminderNotes => 'Erinnerungsnotizen';

  @override
  String get breathing => 'Atmen';

  @override
  String get timeout => 'Auszeit';

  @override
  String get meditation => 'Bildmeditation';

  @override
  String get feedSupport => 'Futterunterstützung';

  @override
  String get calmReminderEmpty =>
      'Erinnerungen werden hier angezeigt, wenn sie eintreffen';

  @override
  String get calmReminderFallbackText => 'Wie fühlt sich diese Wut jetzt an?';

  @override
  String get calmCheckTitle => 'Wie wütend bist du jetzt?';

  @override
  String calmCheckSubtitle(String emoji, String label) {
    return '$emoji $label · dieser frühere Zorn';
  }

  @override
  String get calmSavedCalmedToast =>
      'Ich freue mich, dass du dich beruhigt hast.';

  @override
  String get calmSavedUpdatedToast => 'Gespeichert';

  @override
  String get profileName => 'Wütender Tiger';

  @override
  String get nicknameAdjectives =>
      'wütend, wütend, wütend, explosiv, grausam, knurrend, scharf, gehörnt, erhitzt, rau, wild, tobend, feurig, donnernd, schnaufend, kochend, ärgerlich, lodernd, stürmisch, giftig';

  @override
  String get nicknameAnimals =>
      'Tiger, Löwe, Wolf, Bär, Adler, Hai, Leopard, Gepard, Krokodil, Kobra, Stier, Wildschwein, Nashorn, Hyäne, Grizzly, Rabe, Falke, Igel, Jaguar, Puma';

  @override
  String get notificationSettings => 'Benachrichtigungen';

  @override
  String get commentNotification => 'Kommentarbenachrichtigungen';

  @override
  String get settingsNotificationsSection => 'Benachrichtigungen';

  @override
  String get settingsReminderSubtitle =>
      'Rage-Notiz-Erinnerung zum von Ihnen festgelegten Zeitpunkt';

  @override
  String get settingsCommentSubtitle =>
      'Benachrichtigung, wenn jemand Ihren Beitrag kommentiert';

  @override
  String get settingsDataSection => 'Daten';

  @override
  String get settingsDataImportSubtitle =>
      'Datensätze aus einer Sicherungsdatei wiederherstellen';

  @override
  String get settingsSupportSection => 'Unterstützung';

  @override
  String get settingsPrivacySubtitle =>
      'Gesammelte Informationen und Verwendungszweck';

  @override
  String get settingsFeedbackTitle => 'Feedback senden';

  @override
  String get settingsFeedbackSubtitle =>
      'Probleme oder Verbesserungsvorschläge';

  @override
  String get settingsRecordCountUnit => 'Aufzeichnungen';

  @override
  String get settingsPostCountUnit => 'Beiträge';

  @override
  String get proPlan => 'PRO-Datenexport';

  @override
  String get backupImport => 'Daten importieren';

  @override
  String get settingsDataExportSubtitle => 'Sicherungsdatei · Verlauf · Teilen';

  @override
  String get dataExportTitle => 'Daten exportieren';

  @override
  String get dataExportProTitle => 'PRO-Datenexport';

  @override
  String get dataExportDescription =>
      'Erstellen Sie eine Sicherungsdatei mit allen lokalen App-Daten und teilen Sie sie per E-Mail oder Messenger.';

  @override
  String get dataExportOneTimePurchase =>
      'Einmaliger Kauf · lebenslanger Zugriff';

  @override
  String get dataExportDebugPrice => 'DEBUG';

  @override
  String get dataExportInProgress => 'Exportieren';

  @override
  String get dataExportPaymentChecking => 'Zahlung prüfen';

  @override
  String get dataExportCreateButton => 'Export erstellen';

  @override
  String get dataExportPayAndCreateButton => 'Bezahlen und exportieren';

  @override
  String get dataExportRestorePurchase => 'Kauf wiederherstellen';

  @override
  String get dataExportCreatedToast => 'Exportdatei erstellt.';

  @override
  String get dataExportFailedToast =>
      'Die Exportdatei konnte nicht erstellt werden.';

  @override
  String get dataExportShareSubject => 'Fury Note-Datensicherung';

  @override
  String get dataExportShareText =>
      'Dies ist eine Fury Note-Datensicherungsdatei.';

  @override
  String get dataExportShareFailedToast =>
      'Das Freigabeblatt konnte nicht geöffnet werden.';

  @override
  String get dataExportAllDataIncluded =>
      'Alle lokalen App-Daten sind im Backup enthalten';

  @override
  String get dataExportHistoryTitle => 'Verlauf exportieren';

  @override
  String dataExportHistoryCount(int count) {
    return '$count';
  }

  @override
  String get dataExportShareTooltip => 'Teilen';

  @override
  String get dataExportEmptyHistory => 'Noch keine Exportdateien.';

  @override
  String get purchaseUpdateFailed =>
      'Die Kaufaktualisierung konnte nicht verarbeitet werden.';

  @override
  String get purchaseStatusFailed =>
      'Der Kaufstatus konnte nicht überprüft werden.';

  @override
  String get purchaseProductNotFound => 'Store-Produkt nicht gefunden.';

  @override
  String get purchaseStoreUnavailable =>
      'Es konnte keine Verbindung zum Shop hergestellt werden.';

  @override
  String get purchaseProductInfoFailed =>
      'Die Produktinformationen des Shops konnten nicht geladen werden.';

  @override
  String get purchaseProductUnavailable =>
      'Produktinformationen sind noch nicht fertig.';

  @override
  String get purchaseStartFailed => 'Der Kauf konnte nicht gestartet werden.';

  @override
  String get purchaseCanceled => 'Der Kauf wurde storniert.';

  @override
  String get purchaseReceiptInvalid =>
      'Der Kaufbeleg konnte nicht überprüft werden.';

  @override
  String get purchaseReceiptVerifyFailed =>
      'Die Überprüfung des Kaufbelegs ist fehlgeschlagen.';

  @override
  String get dataImportTitle => 'Daten importieren';

  @override
  String get dataImportPickTitle => 'Wählen Sie die Sicherungsdatei aus';

  @override
  String get dataImportPickDescription =>
      'Wählen Sie eine .fnbackup-Datei aus\naus Fury Note exportiert';

  @override
  String get dataImportPickButton => 'Datei auswählen';

  @override
  String get dataImportInProgress => 'Importieren';

  @override
  String dataImportSuccessToast(int count) {
    return 'Daten aus Backup ersetzt. ($count Datensätze)';
  }

  @override
  String get dataImportNoNewDataToast =>
      'Daten aus Backup ersetzt. (0 Datensätze)';

  @override
  String get dataImportFailedToast =>
      'Die Sicherungsdatei konnte nicht importiert werden.';

  @override
  String get dataImportInvalidFileToast =>
      'Es können nur .fnbackup-Dateien importiert werden.';

  @override
  String get dataImportNoticeTitle => 'Vor dem Import';

  @override
  String get dataImportNoticeBody =>
      'Vorhandene Daten werden gelöscht und durch die Daten in der Sicherungsdatei ersetzt.';

  @override
  String get dataImportTransferTitle => 'Geräte bewegen';

  @override
  String get dataImportTransferBody =>
      'Importieren Sie nach der Installation der App auf einem neuen Gerät eine Sicherungsdatei, um die aktuellen lokalen Daten durch die Sicherungsdaten zu ersetzen.';

  @override
  String get feedDeleteTitle => 'Feed löschen';

  @override
  String get feedDeleteContent => 'Diesen Feed löschen?';

  @override
  String get calmBreathingTitle => 'Atmen';

  @override
  String get breathPhaseInhale => 'Einatmen';

  @override
  String get breathPhaseHold => 'Halt';

  @override
  String get breathPhaseExhale => 'Ausatmen';

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Sekunden',
      one: '1 Sekunde',
    );
    return '$_temp0';
  }

  @override
  String cycleCount(int count) {
    return 'Zyklus $count';
  }

  @override
  String get calmTimeoutRunning => 'Laufen';

  @override
  String get calmTimeoutPaused => 'Angehalten';

  @override
  String get reset => 'Zurücksetzen';

  @override
  String get start => 'Start';

  @override
  String get pause => 'Pause';

  @override
  String get stop => 'Stopp';

  @override
  String get calmMeditationSceneWave => 'Wellen';

  @override
  String get calmMeditationSceneForest => 'Wald';

  @override
  String get calmMeditationSceneSunset => 'Sonnenuntergang';

  @override
  String get calmMeditationSceneMountain => 'Berg';

  @override
  String get calmMeditationSceneCherryBlossom => 'Kirschblüten';

  @override
  String get calmMeditationSceneNightSky => 'Nachthimmel';

  @override
  String get calmMeditationPrompt => 'Atme tief ein und dann aus';

  @override
  String get autoplay => 'Automatische Wiedergabe';

  @override
  String get profileEditTitle => 'Profil bearbeiten';

  @override
  String get nicknameLabel => 'Spitzname';

  @override
  String get nicknameHint => 'Geben Sie einen Spitznamen ein';

  @override
  String get nicknameRequiredError => 'Bitte geben Sie einen Spitznamen ein';

  @override
  String get nicknameCodeAutomaticError =>
      'Ihr Code wird automatisch hinzugefügt';

  @override
  String get nicknameTooShortError => 'Verwenden Sie mindestens 2 Zeichen';

  @override
  String profileSavedToast(String name) {
    return '✅ Geändert in „$name“!';
  }

  @override
  String get profileSaveFailedToast =>
      'Beim Speichern ist ein Fehler aufgetreten.';

  @override
  String get avatarPickGallery => 'Wählen Sie aus der Bibliothek';

  @override
  String get avatarPickCamera => 'Machen Sie ein Foto';

  @override
  String get avatarReset => 'Standard-Avatar verwenden';

  @override
  String get avatarResetToast => 'Standard-Avatar wiederhergestellt.';

  @override
  String get avatarAppliedToast => 'Profilfoto angewendet.';

  @override
  String get avatarTooLargeToast =>
      'Es können nur Fotos bis 5 MB verwendet werden.';

  @override
  String get avatarLoadFailedToast => 'Das Foto konnte nicht geladen werden.';

  @override
  String get profileCodeLabel => 'Profilcode (kann nicht geändert werden)';

  @override
  String get profileSaveButton => 'Änderungen speichern';

  @override
  String get avatarChangeLabel => 'Profilfoto ändern';

  @override
  String get avatarChangeHint => 'Tippen Sie auf das Foto, um es zu ändern';

  @override
  String get avatarSizeHint => 'JPG, PNG, GIF · bis zu 5 MB';

  @override
  String get reminderNotificationFallbackBody =>
      'Wie fühlt sich diese Wut jetzt an?';

  @override
  String get calmGuideTitle =>
      'Wenn die Wut steigt,\nSenken Sie Ihren Körper zuerst sicher ab';

  @override
  String get calmGuideSubtitle =>
      'Der ruhige Leitfaden von Fury Note fordert Sie nicht auf, Ihren Ärger loszuwerden. Es ist eine kurze Anleitung, die dabei helfen soll, dass das Gefühl vergeht, ohne dass jemand verletzt wird.';

  @override
  String get calmGuideNotice =>
      '**Wenn Sie in unmittelbarer Gefahr sind**, bitten Sie bitte zuerst die Menschen in Ihrer Nähe um Hilfe oder wenden Sie sich an den Rettungsdienst, anstatt in dieser App zu bleiben.';

  @override
  String get calmGuideMomentTitle => 'In dem Moment steigt die Wut';

  @override
  String get calmGuideMomentBody1 =>
      'Wut kann ein Signal dafür sein, dass etwas, das Ihnen am Herzen liegt, verletzt wurde. Aber in einem starken Wutzustand beschleunigt sich das Urteilsvermögen und Worte und Taten können rauer als gewöhnlich werden.';

  @override
  String get calmGuideMomentBody2 =>
      'Im Moment kommt es nicht darauf an, **völlig rational** zu sein, sondern **deine Reaktion um sogar 30 Sekunden zu verzögern**.';

  @override
  String get calmGuideRoutineTitle => '60-sekündige ruhige Routine';

  @override
  String get calmGuideStep1Title => 'Stopp';

  @override
  String get calmGuideStep1Desc =>
      'Unterbrechen Sie das Antworten, Anrufen, Kommentieren oder Verschieben. Entspannen Sie Ihre Hände und schauen Sie für einen Moment vom Bildschirm weg.';

  @override
  String get calmGuideStep2Title => 'Atme';

  @override
  String get calmGuideStep2Desc =>
      '4 Sekunden lang einatmen, 7 Sekunden lang gedrückt halten, 8 Sekunden lang ausatmen. Es ist in Ordnung, wenn es nicht perfekt ist.';

  @override
  String get calmGuideStep3Title => 'Überprüfen Sie Ihren Körper';

  @override
  String get calmGuideStep3Desc =>
      'Überprüfen Sie, ob Ihr Kiefer, Ihre Schultern, Ihre Fäuste oder Ihr Bauch angespannt sind, und lösen Sie nur eine Stelle.';

  @override
  String get calmGuideStep4Title => 'Schreiben Sie es auf';

  @override
  String get calmGuideStep4Desc =>
      'Schon ein Satz wie „Im Moment bin ich wütend, weil ___“ reicht aus.';

  @override
  String get calmGuideBreathTitle => '4-7-8 Atmung';

  @override
  String get calmGuideBreathStep1 =>
      'Atmen Sie 4 Sekunden lang durch die Nase ein.';

  @override
  String get calmGuideBreathStep2 => 'Halten Sie den Atem 7 Sekunden lang an.';

  @override
  String get calmGuideBreathStep3 =>
      'Atmen Sie 8 Sekunden lang langsam durch den Mund aus.';

  @override
  String get calmGuideBreathStep4 =>
      'Wiederholen Sie dies dreimal, wenn Sie können.';

  @override
  String get calmGuideBreathNote =>
      'Wenn es schwierig ist, den Atem so lange anzuhalten, verkürzen Sie ihn auf eine angenehme Zahl wie **3-3-5**. Am wichtigsten ist ein langsames, langes Ausatmen.';

  @override
  String get calmGuideTimeoutTitle => '10-minütige Auszeit';

  @override
  String get calmGuideTimeoutBody =>
      'Je stärker die Wut, desto stärker der Drang, sie sofort zu lösen. Aber wenn man jetzt spricht, kann es sein, dass zuerst verletzende Worte zum Vorschein kommen.';

  @override
  String get calmGuideTimeoutExamplesTitle => 'Beispielhafte Timeout-Phrasen';

  @override
  String get calmGuideTimeoutExample1 =>
      '„Ich bin im Moment zu wütend, lass uns in 10 Minuten noch einmal reden.“';

  @override
  String get calmGuideTimeoutExample2 =>
      '„Ich mache eine kurze Pause, weil ich vielleicht etwas Verletzendes sage.“';

  @override
  String get calmGuideTimeoutExample3 =>
      '„Ich renne nicht weg, ich muss mich nur beruhigen, bevor wir wieder reden.“';

  @override
  String get calmGuideSensoryTitle => 'Schnelle sensorische Erdung';

  @override
  String get calmGuideSensory1Title => 'Kaltes Wasser';

  @override
  String get calmGuideSensory1Desc =>
      'Halten Sie etwa 10 Sekunden lang kaltes Wasser auf Ihre Handgelenke oder Ihr Gesicht';

  @override
  String get calmGuideSensory2Title => 'Spüre deine Füße';

  @override
  String get calmGuideSensory2Desc =>
      'Nehmen Sie langsam das Gefühl wahr, wie Ihre Füße den Boden berühren';

  @override
  String get calmGuideSensory3Title => 'Schauen Sie sich um';

  @override
  String get calmGuideSensory3Desc =>
      'Nennen Sie ruhig 5 Objekte, die Sie sehen können';

  @override
  String get calmGuideSensory4Title => 'Lass deine Schultern fallen';

  @override
  String get calmGuideSensory4Desc =>
      'Atmen Sie aus und senken Sie Ihre Schultern nur um 1 cm';

  @override
  String get calmGuideQuestionsTitle => 'Fragen, die beim Schreiben helfen';

  @override
  String get calmGuideQuestion1 => 'Was genau hat mich wütend gemacht?';

  @override
  String get calmGuideQuestion2 =>
      'Was habe ich erwartet, aber nicht erhalten?';

  @override
  String get calmGuideQuestion3 =>
      'Welche Handlung würde ich bereuen, wenn ich sie jetzt tun würde?';

  @override
  String get calmGuideQuestion4 =>
      'Für welche Wahl werde ich morgen dankbar sein?';

  @override
  String get calmGuideTag1 => 'Emotionsprotokoll';

  @override
  String get calmGuideTag2 => 'Wut distanziert';

  @override
  String get calmGuideTag3 => 'Erinnerungskontrolle';

  @override
  String get calmGuideDangerTitle =>
      'Bitten Sie in diesen Fällen zunächst um Hilfe';

  @override
  String get calmGuideDanger1 =>
      'Wenn der Drang, sich selbst oder andere zu verletzen, stark ist';

  @override
  String get calmGuideDanger2 =>
      'Wenn der Drang, Dinge zu werfen oder zu zerbrechen, nicht aufhört';

  @override
  String get calmGuideDanger3 =>
      'Wenn Sie Lust haben, die andere Person zu konfrontieren oder zu bedrohen';

  @override
  String get calmGuideDanger4 =>
      'Wenn Alkohol, Drogen oder starker Schlafmangel es schwierig machen, die Kontrolle zu behalten';

  @override
  String get calmGuideDangerBody =>
      'Versuchen Sie in diesen Fällen nicht, allein mit einer ruhigen Routine durchzukommen, sondern bitten Sie die Menschen in Ihrer Umgebung, professionelle Dienste oder den Notdienst um Hilfe.';

  @override
  String get calmGuideFooterTitle => 'Fury Note Calm Guide';

  @override
  String get calmGuideFooterDisclaimer =>
      'Dieses Dokument ersetzt keine medizinische Diagnose oder Behandlung.';

  @override
  String get privacyTitle => 'Datenschutzrichtlinie';

  @override
  String get privacyLastUpdated => 'Datum des Inkrafttretens: 16. Juni 2026';

  @override
  String get privacySection1Title =>
      '1. Kategorien der erfassten Informationen';

  @override
  String get privacySection1Body =>
      'Fury Note kann ohne Registrierung einer Mitgliedschaft genutzt werden. Das Unternehmen sammelt nur die folgenden Informationen.\n· Gerätekennung – ein zufällig ausgegebener Wert, der zur Identifizierung des Benutzers ohne Registrierung verwendet wird, um betrügerische Nutzung zu verhindern\n· Wutaufzeichnungsdaten – Intensität, Kategorie und Text (nur auf dem Gerät gespeichert)\n· Anonyme Feed-Beiträge – Spitzname, Avatarbild, Intensität, Kategorie und Text\n· Kommentare – Spitzname und Kommentartext\n· „Gefällt mir“-Datensätze – ob dem Benutzer ein bestimmter Beitrag gefallen hat\n· Push-Benachrichtigungstoken – zum Versenden von Benachrichtigungen (optional)';

  @override
  String get privacySection2Title => '2. Zweck der Verarbeitung';

  @override
  String get privacySection2Body =>
      '· Bereitstellung von Community-Funktionen, einschließlich anonymem Feed, Kommentaren und Likes\n· Erkennung betrügerischer Nutzung, einschließlich der Verhinderung doppelter „Gefällt mir“-Angaben für denselben Beitrag\n· Versenden von Push-Benachrichtigungen, einschließlich Kommentarbenachrichtigungen\n· Betrieb des Dienstes und Analyse von Fehlern';

  @override
  String get privacySection3Title =>
      '3. Keine Mitgliedschaftsregistrierung und keine Speicherung personenbezogener Daten';

  @override
  String get privacySection3Body =>
      'Für Fury Note ist keine Mitgliedschaftsregistrierung erforderlich und es werden keine identitätsüberprüfbaren persönlichen Daten wie Name, E-Mail-Adresse oder Telefonnummer erfasst.\nDer Spitzname wird entweder automatisch generiert oder direkt vom Benutzer eingegeben und ist nicht mit der tatsächlichen Identität des Benutzers verknüpft. Bei der Gerätekennung handelt es sich ebenfalls um einen zufällig generierten Wert, der nicht zur Identifizierung einer bestimmten Person herangezogen werden kann.';

  @override
  String get privacySection4Title =>
      '4. Weitergabe von Informationen an Dritte';

  @override
  String get privacySection4Body =>
      'Das Unternehmen gibt die gesammelten Informationen nicht an Dritte weiter und verkauft diese auch nicht.';

  @override
  String get privacySection5Title =>
      '5. Aufbewahrungs- und Nutzungszeitraum von Informationen';

  @override
  String get privacySection5Body =>
      '· Rage-Datensätze, die nur gespeichert wurden, bleiben nur auf dem Gerät erhalten und werden beim Löschen der App zusammen gelöscht.\n· Mit dem anonymen Feed geteilte Beiträge, Avatare und Kommentare bleiben auf dem Server erhalten, bis sie vom Benutzer gelöscht werden, und werden bei einer solchen Anfrage sofort gelöscht.\n· Like-Datensätze werden beim Löschen des zugehörigen Beitrags gemeinsam gelöscht.';

  @override
  String get privacySection6Title => '6. Kontakt';

  @override
  String get privacySection6Body =>
      'Für Anfragen zu personenbezogenen Daten wenden Sie sich bitte an die unten stehende E-Mail-Adresse.\nlunlu.co.kr@gmail.com';

  @override
  String get appGuideTitle => 'So verwenden Sie Fury Note';

  @override
  String get appGuideSubtitle =>
      'Eine Anleitung zum Protokollieren von Ärger, zum Verfolgen von Mustern und zum Erhalten von Unterstützung für den Feed.';

  @override
  String get appGuideRecordTitle => 'Protokollieren Sie Ihre Wut';

  @override
  String get appGuideRecordBody =>
      'Wenn Sie wütend sind, tippen Sie unten auf die Schaltfläche 🔥, um eine Aufnahme zu starten.';

  @override
  String get appGuideRecordStep1 =>
      'Wählen Sie die Intensität: Wählen Sie ein Emoji, das zu Ihrer Wut passt';

  @override
  String get appGuideRecordStep2 =>
      'Wählen Sie eine Kategorie: Wählen Sie eine Ursache';

  @override
  String get appGuideRecordStep3 =>
      'Schreiben Sie es auf: Beschreiben Sie, was passiert ist (dies können Sie überspringen)';

  @override
  String get appGuideRecordStep4 =>
      'Erinnerung: Legen Sie einen Zeitpunkt fest, wenn Sie später noch einmal darauf zurückkommen möchten';

  @override
  String get appGuideRecordStep5 =>
      'Speichern oder posten: Halten Sie den Datensatz privat oder teilen Sie ihn im Feed';

  @override
  String get appGuideFeedTitle => 'Finden Sie Unterstützung im Feed';

  @override
  String get appGuideFeedBody =>
      'Das Teilen Ihrer Wut kann Sie mit anderen verbinden, denen es genauso geht.';

  @override
  String get appGuideFeedItem1 =>
      'Nach dem Speichern können Sie **anonym** im Feed posten';

  @override
  String get appGuideFeedItem2 =>
      'Liken oder kommentieren Sie die Beiträge anderer Personen';

  @override
  String get appGuideFeedItem3 =>
      'Sie können Ihren eigenen Beitrag jederzeit löschen';

  @override
  String get appGuideStatsTitle => 'Verfolgen Sie Ihre emotionalen Muster';

  @override
  String get appGuideStatsBody =>
      'Die Registerkarte „Statistiken“ hilft Ihnen dabei, Ihre Wutmuster im Nachhinein zu betrachten.';

  @override
  String get appGuideStatsItem1 =>
      'Trenddiagramm zur Wutintensität nach Zeitraum';

  @override
  String get appGuideStatsItem2 => 'Ursachenverteilung nach Kategorie';

  @override
  String get appGuideStatsItem3 =>
      'Kalenderansicht zum Durchsuchen von Datensätzen nach Datum';

  @override
  String get appGuideStatsItem4 =>
      'Wutbericht zur Analyse von Mustern nach Kategorie';

  @override
  String get appGuideCalmTitle => 'Reduziere deine Wut';

  @override
  String get appGuideCalmBody =>
      'Gehen Sie nach der Anmeldung zur Registerkarte „Beruhigung“, um zu versuchen, Ihre Emotionen zu dämpfen.';

  @override
  String get appGuideCalmItem1 =>
      'Erinnerungsnotizen: Besuchen Sie Datensätze, die Sie für später markiert haben, noch einmal';

  @override
  String get appGuideCalmItem2 =>
      'Atmung: Bringen Sie Ihren Geist mit der 4-7-8-Technik zur Ruhe';

  @override
  String get appGuideCalmItem3 =>
      'Auszeit: Verlangsamen Sie Ihre Reaktion mit einem 10-Minuten-Timer';

  @override
  String get appGuideCalmItem4 =>
      'Bildmeditation: Verändern Sie Ihre Stimmung mit Naturbildern';

  @override
  String get appGuideProfileTitle => 'Spitzname und Profil';

  @override
  String get appGuideProfileBody =>
      'Gehen Sie zu Menü > Einstellungen, um Ihren Spitznamen und Avatar zu ändern.';

  @override
  String get appGuideProfileItem1 =>
      'Spitzname: Geben Sie Ihren eigenen ein oder generieren Sie einen zufälligen';

  @override
  String get appGuideProfileItem2 =>
      'Avatar: Repräsentieren Sie sich mit einem Emoji';

  @override
  String get appGuideNotificationTitle => 'Benachrichtigungseinstellungen';

  @override
  String get appGuideNotificationItem1 =>
      'Erinnerungsalarme: Lassen Sie sich zu der von Ihnen festgelegten Zeit an eine Wutnotiz erinnern';

  @override
  String get appGuideNotificationItem2 =>
      'Kommentarbenachrichtigungen: Lassen Sie sich benachrichtigen, wenn jemand Ihren Beitrag kommentiert';

  @override
  String get appGuideNotificationHint =>
      'Schalten Sie diese unter „Einstellungen“ > „Benachrichtigungen“ um';

  @override
  String get appGuideFooterTitle => 'Fury Note App Guide';
}

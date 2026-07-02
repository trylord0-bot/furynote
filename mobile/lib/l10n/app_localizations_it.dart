// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Fury Note';

  @override
  String get appKoreanName => 'Fury Note';

  @override
  String get record => 'Registra';

  @override
  String get feed => 'Feed';

  @override
  String get stats => 'Statistiche';

  @override
  String get calm => 'Calma';

  @override
  String get settings => 'Impostazioni';

  @override
  String get drawerGuide => 'Guida app';

  @override
  String get drawerCalmGuide => 'Guida alla calma';

  @override
  String get drawerVersion => 'Fury Note v1.0.0';

  @override
  String get menuTooltip => 'Menu';

  @override
  String drawerRecordCount(String count) {
    return '🔥 $count note di rabbia';
  }

  @override
  String get drawerSettingsSubtitle => 'Soprannome · notifiche';

  @override
  String get drawerGuideSubtitle => 'Come usare Fury Note';

  @override
  String get drawerCalmGuideSubtitle =>
      'Carte della calma · i consigli di oggi';

  @override
  String get relativeTimeJustNow => 'Proprio adesso';

  @override
  String relativeTimeMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuti fa',
      one: '1 minuto fa',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ore fa',
      one: '1 ora fa',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giorni fa',
      one: '1 giorno fa',
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
  String get recordTitle => 'Registro della rabbia';

  @override
  String get stepIntensity => 'Quanto sei arrabbiato adesso?';

  @override
  String get stepIntensitySub => 'Scegli un\'emoji';

  @override
  String get stepCategory => 'Cosa lo ha causato?';

  @override
  String get stepCategorySub => 'Scegli una categoria';

  @override
  String get stepText => 'Cosa è successo?';

  @override
  String get stepTextSub => 'Puoi saltare questo';

  @override
  String get stepReminder => 'Vuoi rivisitare più tardi?';

  @override
  String get stepReminderSub => 'Puoi saltare questo';

  @override
  String get stepSave => 'Salvare questa nota?';

  @override
  String get stepSaveSub => 'Puoi pubblicarlo dopo averlo salvato';

  @override
  String get stepPost => 'Condividi questa sensazione?';

  @override
  String get stepPostSub => 'Sarà anonimo';

  @override
  String get voiceInput => 'Registrazione vocale';

  @override
  String get next => 'Avanti';

  @override
  String get previous => 'Indietro';

  @override
  String get skip => 'Salta';

  @override
  String get save => 'Salva';

  @override
  String get saveNote => 'Salva nota';

  @override
  String get postIt => 'Pubblica';

  @override
  String get saveOnly => 'Solo salva';

  @override
  String get feedPostedToast => 'Inviato a nutrire';

  @override
  String get recordPostedToast => 'Pubblicato';

  @override
  String get recordSavedToast => 'Salvato';

  @override
  String get commentPostedToast => 'Commento pubblicato';

  @override
  String get commentSendFailedToast =>
      'Impossibile inviare il commento. Per favore riprova.';

  @override
  String get commentDeleteTitle => 'Elimina commento';

  @override
  String get commentDeleteContent => 'Eliminare questo commento?';

  @override
  String commentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count commenti',
      one: '1 commento',
    );
    return '$_temp0';
  }

  @override
  String get commentsEmpty =>
      'Nessun commento ancora\nSii il primo a lasciarne uno 💬';

  @override
  String get commentInputHint => 'Scrivi un commento...';

  @override
  String get apiErrorContentBlockedUrl =>
      'Non è possibile inviare post con collegamenti.';

  @override
  String get apiErrorContentBlockedSpam =>
      'Non è possibile inviare testo promozionale.';

  @override
  String get apiErrorContentBlockedProfanity =>
      'Non è possibile inviare contenuti che contengono linguaggio volgare.';

  @override
  String get apiErrorContentBlockedModeration =>
      'Questo contenuto non può essere inviato.';

  @override
  String get apiErrorRateLimitExceeded => 'Per favore riprova tra poco.';

  @override
  String get apiErrorInternal =>
      'Si è verificato un errore del server. Per favore riprova tra poco.';

  @override
  String get apiErrorInvalidRequest => 'Richiesta non valida.';

  @override
  String get apiErrorForbidden => 'Non hai il permesso.';

  @override
  String get apiErrorPostNotFound => 'Messaggio non trovato.';

  @override
  String get apiErrorCommentNotFound => 'Commento non trovato.';

  @override
  String get apiErrorSignatureRequired =>
      'È richiesta la firma della richiesta.';

  @override
  String get apiErrorSignatureInvalid => 'Richiesta non valida.';

  @override
  String get apiErrorSignatureExpired =>
      'La richiesta è scaduta. Per favore riprova.';

  @override
  String get apiErrorSignatureReplay =>
      'Questa richiesta è già stata elaborata.';

  @override
  String get apiErrorUnknown => 'Si è verificato un errore sconosciuto.';

  @override
  String get reminderNotification => 'Notifica di promemoria';

  @override
  String get noReminder => 'Non impostato';

  @override
  String get summaryIntensity => 'Livello di rabbia';

  @override
  String get summaryCategory => 'Categoria';

  @override
  String get summaryText => 'Testo';

  @override
  String get summaryReminder => 'Promemoria';

  @override
  String get none => 'Nessuno';

  @override
  String get other => 'Altro';

  @override
  String get family => 'Famiglia';

  @override
  String get romance => 'Romanticismo';

  @override
  String get work => 'Lavoro';

  @override
  String get people => 'Persone';

  @override
  String get driving => 'Guidare';

  @override
  String get custom => 'Personalizzato';

  @override
  String get recordCustomCategoryHint => 'Inserisci una categoria';

  @override
  String get recordTextHint => 'Scrivilo qui';

  @override
  String get recordMicPermissionRequired =>
      'È richiesta l\'autorizzazione del microfono.';

  @override
  String recordVoiceStartFailed(String label) {
    return 'Impossibile avviare $label.';
  }

  @override
  String get recordVoiceStopRecording => 'Interrompi la registrazione';

  @override
  String get recordVoiceRecordAgain => 'Registra di nuovo';

  @override
  String get recordVoiceSaved => 'Registrazione vocale salvata.';

  @override
  String get recordAudioSummaryLabel => 'Voce';

  @override
  String get recordAudioIncluded => 'Registrazione inclusa';

  @override
  String get recordSavingInProgress => 'Salvataggio...';

  @override
  String get recordPostingInProgress => 'Invio...';

  @override
  String get recordSaveFailedToast =>
      'Impossibile salvare la nota. Per favore riprova.';

  @override
  String get recordProgressSemantics => 'Registra i progressi';

  @override
  String get hourSuffix => 'h';

  @override
  String get minuteSuffix => 'm';

  @override
  String get reminderCustom => 'Personalizzato';

  @override
  String get reminderIn30Minutes => 'Tra 30 minuti';

  @override
  String get reminderIn1Hour => 'Tra 1 ora';

  @override
  String get reminderIn2Hours => 'Tra 2 ore';

  @override
  String get reminderIn6Hours => 'Tra 6 ore';

  @override
  String get reminderTomorrow => 'Domani';

  @override
  String get annoyed => 'Infastidito';

  @override
  String get angry => 'Arrabbiato';

  @override
  String get mad => 'Pazzo';

  @override
  String get furious => 'Furioso';

  @override
  String get rage => 'Rabbia';

  @override
  String get calmed => 'Calma';

  @override
  String get feedTitle => 'Feed';

  @override
  String get feedSubtitle => 'Sfoglia le storie recenti sulla rabbia';

  @override
  String get feedAllTab => 'Tutto il feed';

  @override
  String get feedMineTab => 'Il mio feed';

  @override
  String get feedLoadFailed => 'Impossibile caricare il feed.';

  @override
  String get feedEmptyMine =>
      'Non hai ancora pubblicato nel feed.\nCondividi la tua prima nota di rabbia!';

  @override
  String get feedEmptyAll =>
      'Nessun post nel feed ancora.\nSii il primo a condividere la tua rabbia!';

  @override
  String get feedPostFailedToast =>
      'Impossibile inviare al feed. Per favore riprova.';

  @override
  String get like => 'Mi rispecchio';

  @override
  String get comment => 'Commento';

  @override
  String get retry => 'Riprova';

  @override
  String get statsTitle => 'Statistiche rabbia';

  @override
  String get statsSubtitle => 'Guarda lo schema emotivo di questa settimana';

  @override
  String get week => '1 settimana';

  @override
  String get month => '1 mese';

  @override
  String get all => 'Tutto';

  @override
  String get totalRecords => 'Record';

  @override
  String get highestLevel => 'Il più alto';

  @override
  String get dailyAverage => 'Media giornaliera';

  @override
  String get decreaseRate => 'Diminuire';

  @override
  String get statsIntensityTrend => 'Andamento dell\'intensità della rabbia';

  @override
  String get statsCategoryDistribution => 'Distribuzione delle cause';

  @override
  String get statsNoRecords => 'Nessun record da mostrare.';

  @override
  String get statsCalendarButtonTitle => 'Visualizza i record per calendario';

  @override
  String get statsCalendarButtonSubtitle =>
      'Controlla e gestisci le note di rabbia per data';

  @override
  String get statsCalendarTitle => 'Visualizza i record per calendario';

  @override
  String get statsOtherCategory => 'Altro';

  @override
  String selectedDateRecordsTitle(String date) {
    return '$date record';
  }

  @override
  String get noRecordsOnSelectedDate =>
      'Nessun record è stato scritto nella data selezionata.';

  @override
  String get reminderAction => 'Promemoria';

  @override
  String get play => 'Riproduci';

  @override
  String get statsSummaryButtonTitle => 'Visualizza il rapporto sulla rabbia';

  @override
  String get statsSummaryButtonSubtitle =>
      'Sfoglia i tuoi schemi di rabbia per categoria';

  @override
  String get statsSummaryTitle => 'Rapporto sulla rabbia';

  @override
  String get statsSummaryClose => 'Chiudi';

  @override
  String get statsSummaryEmptyTitle => 'Nessun record da riepilogare ancora';

  @override
  String get statsSummaryEmptyBody =>
      'Una volta aggiunte le note di rabbia, i modelli di categoria appariranno qui.';

  @override
  String statsSummaryTopHeadline(String category) {
    return '\"$category\" ti ha fatto arrabbiare molto spesso';
  }

  @override
  String statsSummaryCategoryHeadline(String category) {
    return 'Guardando \"$category\"';
  }

  @override
  String get statsSummaryComfortGeneric => 'Va bene. Questo può succedere.';

  @override
  String get statsSummaryComfortFamily =>
      'Più qualcuno è vicino, più difficile sarà atterrare.';

  @override
  String get statsSummaryComfortRomance =>
      'Una relazione preziosa può rendere i piccoli momenti più nitidi.';

  @override
  String get statsSummaryComfortWork =>
      'Il lavoro potrebbe aver spinto la tua mente più velocemente di quanto volesse andare.';

  @override
  String get statsSummaryComfortPeople =>
      'Le parole e le espressioni degli altri possono persistere più a lungo del previsto.';

  @override
  String get statsSummaryComfortDriving =>
      'La tensione sulla strada spesso raggiunge prima il corpo.';

  @override
  String get statsSummaryMetricCount => 'Conte';

  @override
  String get statsSummaryMetricCategory => 'Categoria';

  @override
  String get statsSummaryMetricFeed => 'Alimenta i post';

  @override
  String get statsSummaryMetricCalm => 'Ci prova con calma';

  @override
  String get statsSummaryMetricAverage => 'Media livello';

  @override
  String get statsSummaryMetricPeak => 'Livello di picco';

  @override
  String get statsSummaryConclusion => 'Conclusione';

  @override
  String statsSummaryRecordsUnit(int count) {
    return '$count volte';
  }

  @override
  String statsSummaryAverageValue(String value) {
    return '$value/5';
  }

  @override
  String get statsSummaryConclusionTop =>
      'Questo è il segnale di rabbia più ripetuto. La prossima volta, prova a controllare la tensione corporea prima che la rabbia aumenti completamente.';

  @override
  String get statsSummaryConclusionCategory =>
      'Annotare questa categoria mentre è ancora piccola può aiutarti a notare lo schema prima.';

  @override
  String statsSummaryPageIndicator(int current, int total) {
    return '$current/$total';
  }

  @override
  String get statsSummaryCategoryShare => 'Quota di categoria';

  @override
  String get statsSummaryCalmRate => 'Tasso calmo';

  @override
  String get statsSummaryShareRate => 'Tasso di partecipazione';

  @override
  String get noContent => 'Nessun contenuto';

  @override
  String get voicePlayback => 'Riproduci la voce';

  @override
  String get deleteConfirm => 'Eliminare?';

  @override
  String get delete => 'Elimina';

  @override
  String get cancel => 'Annulla';

  @override
  String get calmTitle => 'Calma';

  @override
  String get calmSubtitle => 'Abbassa ciò che ancora persiste';

  @override
  String get reminderNotes => 'Note di promemoria';

  @override
  String get breathing => 'Respirazione';

  @override
  String get timeout => 'Timeout';

  @override
  String get meditation => 'Meditazione sull\'immagine';

  @override
  String get feedSupport => 'Supporto per l\'alimentazione';

  @override
  String get calmReminderEmpty =>
      'I promemoria appariranno qui quando arrivano';

  @override
  String get calmReminderFallbackText => 'Come si sente quella rabbia adesso?';

  @override
  String get calmCheckTitle => 'Quanto sei arrabbiato adesso?';

  @override
  String calmCheckSubtitle(String emoji, String label) {
    return '$emoji $label · quella rabbia di prima';
  }

  @override
  String get calmSavedCalmedToast => 'Sono felice che ti sia calmato.';

  @override
  String get calmSavedUpdatedToast => 'Salvato';

  @override
  String get profileName => 'Tigre arrabbiata';

  @override
  String get nicknameAdjectives =>
      'arrabbiato, furioso, furioso, esplosivo, feroce, ringhio, acuto, cornuto, riscaldato, aspro, feroce, furioso, focoso, fragoroso, sbuffante, bollente, risentito, sfolgorante, tempestoso, velenoso';

  @override
  String get nicknameAnimals =>
      'tigre, leone, lupo, orso, aquila, squalo, leopardo, ghepardo, coccodrillo, cobra, toro, cinghiale, rinoceronte, iena, grizzly, corvo, falco, riccio, giaguaro, puma';

  @override
  String get notificationSettings => 'Notifiche';

  @override
  String get commentNotification => 'Avvisi sui commenti';

  @override
  String get settingsNotificationsSection => 'Notifiche';

  @override
  String get settingsReminderSubtitle =>
      'Promemoria della nota di rabbia all\'ora impostata';

  @override
  String get settingsCommentSubtitle =>
      'Avvisa quando qualcuno commenta il tuo post';

  @override
  String get settingsDataSection => 'Dati';

  @override
  String get settingsDataImportSubtitle =>
      'Ripristina i record da un file di backup';

  @override
  String get settingsSupportSection => 'Supporto';

  @override
  String get settingsPrivacySubtitle =>
      'Informazioni raccolte e scopo di utilizzo';

  @override
  String get settingsFeedbackTitle => 'Invia feedback';

  @override
  String get settingsFeedbackSubtitle => 'Problemi o idee di miglioramento';

  @override
  String get settingsRecordCountUnit => 'record';

  @override
  String get settingsPostCountUnit => 'post';

  @override
  String get proPlan => 'Esportazione dati PRO';

  @override
  String get backupImport => 'Importa dati';

  @override
  String get settingsDataExportSubtitle =>
      'File di backup · cronologia · condivisione';

  @override
  String get dataExportTitle => 'Esporta dati';

  @override
  String get dataExportProTitle => 'Esportazione dati PRO';

  @override
  String get dataExportDescription =>
      'Crea un file di backup con tutti i dati dell\'app locale e condividilo tramite e-mail o messenger.';

  @override
  String get dataExportOneTimePurchase =>
      'Acquisto una tantum · accesso illimitato';

  @override
  String get dataExportDebugPrice => 'DEBUG';

  @override
  String get dataExportInProgress => 'Esportazione';

  @override
  String get dataExportPaymentChecking => 'Controllo del pagamento';

  @override
  String get dataExportCreateButton => 'Crea esportazione';

  @override
  String get dataExportPayAndCreateButton => 'Paga ed esporta';

  @override
  String get dataExportRestorePurchase => 'Ripristina l\'acquisto';

  @override
  String get dataExportCreatedToast => 'File di esportazione creato.';

  @override
  String get dataExportFailedToast =>
      'Impossibile creare il file di esportazione.';

  @override
  String get dataExportShareSubject => 'Backup dei dati di Fury Note';

  @override
  String get dataExportShareText =>
      'Questo è un file di backup dei dati di Fury Note.';

  @override
  String get dataExportShareFailedToast =>
      'Impossibile aprire il foglio di condivisione.';

  @override
  String get dataExportAllDataIncluded =>
      'Tutti i dati delle app locali sono inclusi nel backup';

  @override
  String get dataExportHistoryTitle => 'Esporta cronologia';

  @override
  String dataExportHistoryCount(int count) {
    return '$count';
  }

  @override
  String get dataExportShareTooltip => 'Condividi';

  @override
  String get dataExportEmptyHistory => 'Nessun file di esportazione ancora.';

  @override
  String get purchaseUpdateFailed =>
      'Impossibile elaborare l\'aggiornamento dell\'acquisto.';

  @override
  String get purchaseStatusFailed =>
      'Impossibile verificare lo stato dell\'acquisto.';

  @override
  String get purchaseProductNotFound => 'Prodotto del negozio non trovato.';

  @override
  String get purchaseStoreUnavailable => 'Impossibile connettersi al negozio.';

  @override
  String get purchaseProductInfoFailed =>
      'Impossibile caricare le informazioni sul prodotto del negozio.';

  @override
  String get purchaseProductUnavailable =>
      'Le informazioni sul prodotto non sono ancora pronte.';

  @override
  String get purchaseStartFailed => 'Impossibile avviare l\'acquisto.';

  @override
  String get purchaseCanceled => 'L\'acquisto è stato annullato.';

  @override
  String get purchaseReceiptInvalid =>
      'Impossibile verificare la ricevuta di acquisto.';

  @override
  String get purchaseReceiptVerifyFailed =>
      'La verifica della ricevuta di acquisto non è riuscita.';

  @override
  String get dataImportTitle => 'Importa dati';

  @override
  String get dataImportPickTitle => 'Seleziona il file di backup';

  @override
  String get dataImportPickDescription =>
      'Seleziona un file .fnbackup\nesportato da Fury Note';

  @override
  String get dataImportPickButton => 'Scegli file';

  @override
  String get dataImportInProgress => 'Importazione';

  @override
  String dataImportSuccessToast(int count) {
    return 'Dati sostituiti dal backup. ($count record)';
  }

  @override
  String get dataImportNoNewDataToast =>
      'Dati sostituiti dal backup. (0 record)';

  @override
  String get dataImportFailedToast =>
      'Impossibile importare il file di backup.';

  @override
  String get dataImportInvalidFileToast =>
      'È possibile importare solo file .fnbackup.';

  @override
  String get dataImportNoticeTitle => 'Prima dell\'importazione';

  @override
  String get dataImportNoticeBody =>
      'I dati esistenti verranno eliminati e sostituiti con i dati nel file di backup.';

  @override
  String get dataImportTransferTitle => 'Dispositivi in movimento';

  @override
  String get dataImportTransferBody =>
      'Dopo aver installato l\'app su un nuovo dispositivo, importa un file di backup per sostituire i dati locali correnti con i dati di backup.';

  @override
  String get feedDeleteTitle => 'Elimina feed';

  @override
  String get feedDeleteContent => 'Eliminare questo feed?';

  @override
  String get calmBreathingTitle => 'Respirazione';

  @override
  String get breathPhaseInhale => 'Inspira';

  @override
  String get breathPhaseHold => 'Tieni';

  @override
  String get breathPhaseExhale => 'Espira';

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count secondi',
      one: '1 secondo',
    );
    return '$_temp0';
  }

  @override
  String cycleCount(int count) {
    return 'Ciclo $count';
  }

  @override
  String get calmTimeoutRunning => 'Correre';

  @override
  String get calmTimeoutPaused => 'In pausa';

  @override
  String get reset => 'Reimposta';

  @override
  String get start => 'Avvia';

  @override
  String get pause => 'Pausa';

  @override
  String get stop => 'Stop';

  @override
  String get calmMeditationSceneWave => 'Onde';

  @override
  String get calmMeditationSceneForest => 'Foresta';

  @override
  String get calmMeditationSceneSunset => 'Tramonto';

  @override
  String get calmMeditationSceneMountain => 'Montagna';

  @override
  String get calmMeditationSceneCherryBlossom => 'Fiori di ciliegio';

  @override
  String get calmMeditationSceneNightSky => 'Cielo notturno';

  @override
  String get calmMeditationPrompt => 'Inspira profondamente, poi espira';

  @override
  String get autoplay => 'Riproduzione automatica';

  @override
  String get profileEditTitle => 'Modifica profilo';

  @override
  String get nicknameLabel => 'Soprannome';

  @override
  String get nicknameHint => 'Inserisci un soprannome';

  @override
  String get nicknameRequiredError => 'Inserisci un soprannome';

  @override
  String get nicknameCodeAutomaticError =>
      'Il tuo codice viene aggiunto automaticamente';

  @override
  String get nicknameTooShortError => 'Utilizza almeno 2 caratteri';

  @override
  String profileSavedToast(String name) {
    return '✅ Modificato in \"$name\"!';
  }

  @override
  String get profileSaveFailedToast =>
      'Si è verificato un errore durante il salvataggio.';

  @override
  String get avatarPickGallery => 'Scegli dalla libreria';

  @override
  String get avatarPickCamera => 'Scatta una foto';

  @override
  String get avatarReset => 'Utilizza l\'avatar predefinito';

  @override
  String get avatarResetToast => 'Avatar predefinito ripristinato.';

  @override
  String get avatarAppliedToast => 'Foto del profilo applicata.';

  @override
  String get avatarTooLargeToast =>
      'Possono essere utilizzate solo foto fino a 5 MB.';

  @override
  String get avatarLoadFailedToast => 'Impossibile caricare la foto.';

  @override
  String get profileCodeLabel => 'Codice profilo (non può essere modificato)';

  @override
  String get profileSaveButton => 'Salva modifiche';

  @override
  String get avatarChangeLabel => 'Cambia foto del profilo';

  @override
  String get avatarChangeHint => 'Tocca la foto per modificarla';

  @override
  String get avatarSizeHint => 'JPG, PNG, GIF · fino a 5 MB';

  @override
  String get reminderNotificationFallbackBody =>
      'Come si sente quella rabbia adesso?';

  @override
  String get calmGuideTitle =>
      'Quando la rabbia sale,\nabbassa prima il corpo in sicurezza';

  @override
  String get calmGuideSubtitle =>
      'La guida calma di Fury Note non ti dice di sbarazzarti della rabbia. È una breve guida per aiutare il sentimento a passare senza che nessuno si faccia male.';

  @override
  String get calmGuideNotice =>
      '**Se sei in pericolo immediato**, chiedi aiuto alle persone intorno a te o contatta prima i servizi di emergenza, invece di restare su questa app.';

  @override
  String get calmGuideMomentTitle => 'Il momento in cui sale la rabbia';

  @override
  String get calmGuideMomentBody1 =>
      'La rabbia può essere un segnale che qualcosa a cui tieni è stato violato. Ma in uno stato di rabbia forte, il giudizio accelera e le parole e le azioni possono diventare più dure del solito.';

  @override
  String get calmGuideMomentBody2 =>
      'Ciò che serve in questo momento non è essere **perfettamente razionali**, ma **ritardare la tua reazione anche solo di 30 secondi**.';

  @override
  String get calmGuideRoutineTitle => 'Routine calma di 60 secondi';

  @override
  String get calmGuideStep1Title => 'Fermare';

  @override
  String get calmGuideStep1Desc =>
      'Metti in pausa la risposta, la chiamata, i commenti o lo spostamento. Rilassa le mani e distogli lo sguardo dallo schermo per un momento.';

  @override
  String get calmGuideStep2Title => 'Respira';

  @override
  String get calmGuideStep2Desc =>
      'Inspira per 4 secondi, trattieni per 7, espira per 8. Va bene se non è perfetto.';

  @override
  String get calmGuideStep3Title => 'Controlla il tuo corpo';

  @override
  String get calmGuideStep3Desc =>
      'Controlla se la mascella, le spalle, i pugni o lo stomaco sono tesi e rilascia solo un punto.';

  @override
  String get calmGuideStep4Title => 'Scrivilo';

  @override
  String get calmGuideStep4Desc =>
      'Anche una sola frase come \"In questo momento sono arrabbiato perché ___\" è sufficiente.';

  @override
  String get calmGuideBreathTitle => '4-7-8 respirazione';

  @override
  String get calmGuideBreathStep1 =>
      'Inspira attraverso il naso per 4 secondi.';

  @override
  String get calmGuideBreathStep2 => 'Trattenete il respiro per 7 secondi.';

  @override
  String get calmGuideBreathStep3 =>
      'Espira lentamente attraverso la bocca per 8 secondi.';

  @override
  String get calmGuideBreathStep4 => 'Ripeti 3 volte se puoi.';

  @override
  String get calmGuideBreathNote =>
      'Se trattenere il respiro così a lungo è difficile, abbrevialo fino a un conteggio confortevole come **3-3-5**. Ciò che conta di più è un’espirazione lenta e lunga.';

  @override
  String get calmGuideTimeoutTitle => 'Pausa di 10 minuti';

  @override
  String get calmGuideTimeoutBody =>
      'Più forte è la rabbia, più forte è il bisogno di risolverla subito. Ma parlare adesso potrebbe far emergere prima parole offensive.';

  @override
  String get calmGuideTimeoutExamplesTitle => 'Frasi di timeout di esempio';

  @override
  String get calmGuideTimeoutExample1 =>
      '\"Sono troppo arrabbiato in questo momento, ne riparliamo tra 10 minuti.\"';

  @override
  String get calmGuideTimeoutExample2 =>
      '\"Mi fermo un attimo perché potrei dire qualcosa di offensivo.\"';

  @override
  String get calmGuideTimeoutExample3 =>
      '\"Non sto scappando, ho solo bisogno di calmarmi prima di parlare ancora.\"';

  @override
  String get calmGuideSensoryTitle => 'Messa a terra sensoriale rapida';

  @override
  String get calmGuideSensory1Title => 'Acqua fredda';

  @override
  String get calmGuideSensory1Desc =>
      'Tieni l\'acqua fredda sui polsi o sul viso per circa 10 secondi';

  @override
  String get calmGuideSensory2Title => 'Senti i tuoi piedi';

  @override
  String get calmGuideSensory2Desc =>
      'Nota lentamente la sensazione dei tuoi piedi che toccano il pavimento';

  @override
  String get calmGuideSensory3Title => 'Guardati intorno';

  @override
  String get calmGuideSensory3Desc =>
      'Nomina tranquillamente 5 oggetti che puoi vedere';

  @override
  String get calmGuideSensory4Title => 'Abbassa le spalle';

  @override
  String get calmGuideSensory4Desc => 'Espira e abbassa le spalle di solo 1 cm';

  @override
  String get calmGuideQuestionsTitle =>
      'Domande che aiutano durante la scrittura';

  @override
  String get calmGuideQuestion1 => 'Cosa mi ha fatto arrabbiare esattamente?';

  @override
  String get calmGuideQuestion2 => 'Cosa mi aspettavo ma non ho ricevuto?';

  @override
  String get calmGuideQuestion3 =>
      'Di quale azione mi pentirei se la facessi adesso?';

  @override
  String get calmGuideQuestion4 => 'Per quale scelta sarò grato domani?';

  @override
  String get calmGuideTag1 => 'Registro delle emozioni';

  @override
  String get calmGuideTag2 => 'Distanziamento della rabbia';

  @override
  String get calmGuideTag3 => 'Controllo del promemoria';

  @override
  String get calmGuideDangerTitle => 'Chiedere aiuto prima in questi casi';

  @override
  String get calmGuideDanger1 =>
      'Quando il bisogno di fare del male a te stesso o agli altri è forte';

  @override
  String get calmGuideDanger2 =>
      'Quando la voglia di lanciare o rompere le cose non si ferma';

  @override
  String get calmGuideDanger3 =>
      'Quando hai voglia di affrontare o minacciare l\'altra persona';

  @override
  String get calmGuideDanger4 =>
      'Quando l\'alcol, le droghe o la grave privazione del sonno rendono difficile mantenere il controllo';

  @override
  String get calmGuideDangerBody =>
      'In questi casi, non cercare di superare la situazione solo con la calma routine: chiedi aiuto alle persone intorno a te, ai servizi professionali o ai servizi di emergenza.';

  @override
  String get calmGuideFooterTitle => 'Fury Note Calm Guide';

  @override
  String get calmGuideFooterDisclaimer =>
      'Questo documento non sostituisce la diagnosi o il trattamento medico.';

  @override
  String get privacyTitle => 'Informativa sulla privacy';

  @override
  String get privacyLastUpdated => 'Data di entrata in vigore: 16 giugno 2026';

  @override
  String get privacySection1Title => '1. Categorie di informazioni raccolte';

  @override
  String get privacySection1Body =>
      'Fury Note può essere utilizzato senza alcuna registrazione di abbonamento. La Società raccoglie solo le seguenti informazioni.\n· Identificatore del dispositivo: un valore emesso in modo casuale utilizzato per identificare l\'utente senza registrazione, allo scopo di prevenire un uso fraudolento\n· Dati relativi alla registrazione della rabbia: intensità, categoria e testo (memorizzati solo sul dispositivo)\n· Post di feed anonimi: nickname, immagine avatar, intensità, categoria e testo\n· Commenti: nickname e testo del commento\n· Record Mi piace: indica se all\'utente è piaciuto un determinato post\n· Token di notifica push: allo scopo di inviare notifiche (facoltativo)';

  @override
  String get privacySection2Title => '2. Finalità del trattamento';

  @override
  String get privacySection2Body =>
      '· Fornitura di funzionalità per la community, inclusi feed anonimi, commenti e Mi piace\n· Rilevamento di usi fraudolenti, inclusa la prevenzione di Mi piace duplicati sullo stesso post\n· Invio di notifiche push, inclusi avvisi di commenti\n· Funzionamento del servizio e analisi degli errori';

  @override
  String get privacySection3Title =>
      '3. Nessuna registrazione dell\'iscrizione e nessuna conservazione delle informazioni personali';

  @override
  String get privacySection3Body =>
      'Fury Note non richiede la registrazione dell\'iscrizione e non raccoglie informazioni personali verificabili dell\'identità come nome, indirizzo e-mail o numero di telefono.\nIl nickname viene generato automaticamente oppure inserito direttamente dall\'utente e non è legato alla reale identità dell\'utente. Anche l\'identificatore del dispositivo è un valore generato casualmente che non può essere utilizzato per identificare un individuo specifico.';

  @override
  String get privacySection4Title => '4. Fornitura di informazioni a terzi';

  @override
  String get privacySection4Body =>
      'La Società non fornisce né vende le informazioni raccolte a terzi.';

  @override
  String get privacySection5Title =>
      '5. Periodo di conservazione e utilizzo delle informazioni';

  @override
  String get privacySection5Body =>
      '· I record Rage che sono stati solo salvati vengono conservati solo sul dispositivo e vengono eliminati insieme alla cancellazione dell\'app.\n· I post, gli avatar e i commenti condivisi nel feed anonimo vengono conservati sul server finché non vengono eliminati dall\'utente e vengono eliminati immediatamente su tale richiesta.\n· I record simili vengono eliminati insieme alla cancellazione del post correlato.';

  @override
  String get privacySection6Title => '6. Contatto';

  @override
  String get privacySection6Body =>
      'Per richieste relative ai dati personali, si prega di contattare l\'indirizzo e-mail riportato di seguito.\nlunlu.co.kr@gmail.com';

  @override
  String get appGuideTitle => 'Come usare Furia Nota';

  @override
  String get appGuideSubtitle =>
      'Una guida per registrare la rabbia, monitorare i modelli e ottenere supporto sul feed.';

  @override
  String get appGuideRecordTitle => 'Registra la tua rabbia';

  @override
  String get appGuideRecordBody =>
      'Quando sei arrabbiato, tocca il pulsante 🔥 in basso per avviare una registrazione.';

  @override
  String get appGuideRecordStep1 =>
      'Scegli l\'intensità: scegli un\'emoji che corrisponda a quanto sei arrabbiato';

  @override
  String get appGuideRecordStep2 => 'Scegli una categoria: scegli una causa';

  @override
  String get appGuideRecordStep3 =>
      'Scrivilo: descrivi cosa è successo (puoi saltare questo)';

  @override
  String get appGuideRecordStep4 =>
      'Promemoria: imposta un orario se desideri rivederlo in un secondo momento';

  @override
  String get appGuideRecordStep5 =>
      'Salva o pubblica: mantieni il record privato o condividilo nel feed';

  @override
  String get appGuideFeedTitle => 'Trova supporto sul feed';

  @override
  String get appGuideFeedBody =>
      'Condividere la tua rabbia può connetterti con gli altri che provano la tua stessa sensazione.';

  @override
  String get appGuideFeedItem1 =>
      'Dopo aver salvato, puoi pubblicare **in modo anonimo** nel feed';

  @override
  String get appGuideFeedItem2 =>
      'Metti mi piace o commenta i post di altre persone';

  @override
  String get appGuideFeedItem3 =>
      'Puoi eliminare il tuo post in qualsiasi momento';

  @override
  String get appGuideStatsTitle => 'Tieni traccia dei tuoi schemi emotivi';

  @override
  String get appGuideStatsBody =>
      'La scheda delle statistiche ti aiuta a rivedere i tuoi schemi di rabbia.';

  @override
  String get appGuideStatsItem1 =>
      'Grafico dell\'andamento dell\'intensità della rabbia per periodo';

  @override
  String get appGuideStatsItem2 => 'Distribuzione delle cause per categoria';

  @override
  String get appGuideStatsItem3 =>
      'Vista calendario per sfogliare i record per data';

  @override
  String get appGuideStatsItem4 =>
      'Rapporto sulla rabbia per analizzare i modelli per categoria';

  @override
  String get appGuideCalmTitle => 'Abbassa la tua rabbia';

  @override
  String get appGuideCalmBody =>
      'Dopo aver effettuato l\'accesso, vai alla scheda Calma per provare a calmare le tue emozioni.';

  @override
  String get appGuideCalmItem1 =>
      'Note promemoria: rivisita i record contrassegnati per dopo';

  @override
  String get appGuideCalmItem2 =>
      'Respirazione: calma la mente con la tecnica 4-7-8';

  @override
  String get appGuideCalmItem3 =>
      'Timeout: rallenta la tua reazione con un timer di 10 minuti';

  @override
  String get appGuideCalmItem4 =>
      'Meditazione dell\'immagine: cambia il tuo umore con le immagini della natura';

  @override
  String get appGuideProfileTitle => 'Soprannome e profilo';

  @override
  String get appGuideProfileBody =>
      'Vai al menu > Impostazioni per cambiare nickname e avatar.';

  @override
  String get appGuideProfileItem1 =>
      'Soprannome: digita il tuo o generane uno in modo casuale';

  @override
  String get appGuideProfileItem2 => 'Avatar: rappresentati con un emoji';

  @override
  String get appGuideNotificationTitle => 'Impostazioni di notifica';

  @override
  String get appGuideNotificationItem1 =>
      'Avvisi di promemoria: ricevi un promemoria di una nota di rabbia all\'ora impostata';

  @override
  String get appGuideNotificationItem2 =>
      'Avvisi sui commenti: ricevi una notifica quando qualcuno commenta il tuo post';

  @override
  String get appGuideNotificationHint =>
      'Attiva o disattiva queste opzioni in Impostazioni > Notifiche';

  @override
  String get appGuideFooterTitle => 'Fury Note App Guide';
}

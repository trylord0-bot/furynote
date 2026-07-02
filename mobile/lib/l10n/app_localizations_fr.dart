// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Fury Note';

  @override
  String get appKoreanName => 'Fury Note';

  @override
  String get record => 'Journal';

  @override
  String get feed => 'Fil';

  @override
  String get stats => 'Stats';

  @override
  String get calm => 'Calme';

  @override
  String get settings => 'Réglages';

  @override
  String get drawerGuide => 'Guide de l’app';

  @override
  String get drawerCalmGuide => 'Guide de calme';

  @override
  String get drawerVersion => 'Fury Note v1.0.0';

  @override
  String get menuTooltip => 'Menu';

  @override
  String drawerRecordCount(String count) {
    return '🔥 $count notes de rage';
  }

  @override
  String get drawerSettingsSubtitle => 'Pseudo · notifications';

  @override
  String get drawerGuideSubtitle => 'Comment utiliser Fury Note';

  @override
  String get drawerCalmGuideSubtitle => 'Cartes calmes · conseils du jour';

  @override
  String get relativeTimeJustNow => 'Juste maintenant';

  @override
  String relativeTimeMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Il y a $count minutes',
      one: 'Il y a 1 minute',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Il y a $count heures',
      one: 'Il y a 1 heure',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Il y a $count jours',
      one: 'Il y a 1 jour',
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
  String get recordTitle => 'Journal de colère';

  @override
  String get stepIntensity => 'À quel point es-tu en colère maintenant ?';

  @override
  String get stepIntensitySub => 'Choisissez un emoji';

  @override
  String get stepCategory => 'Qu’est-ce qui l’a causé ?';

  @override
  String get stepCategorySub => 'Choisissez une catégorie';

  @override
  String get stepText => 'Que s\'est-il passé ?';

  @override
  String get stepTextSub => 'Vous pouvez ignorer ceci';

  @override
  String get stepReminder => 'Vous souhaitez revenir plus tard ?';

  @override
  String get stepReminderSub => 'Vous pouvez ignorer ceci';

  @override
  String get stepSave => 'Enregistrer cette note ?';

  @override
  String get stepSaveSub => 'Vous pouvez le publier après avoir enregistré';

  @override
  String get stepPost => 'Partager ce sentiment ?';

  @override
  String get stepPostSub => 'Ce sera anonyme';

  @override
  String get voiceInput => 'Enregistrement vocal';

  @override
  String get next => 'Suivant';

  @override
  String get previous => 'Précédent';

  @override
  String get skip => 'Passer';

  @override
  String get save => 'Enregistrer';

  @override
  String get saveNote => 'Enregistrer la note';

  @override
  String get postIt => 'Publier';

  @override
  String get saveOnly => 'Enregistrer seulement';

  @override
  String get feedPostedToast => 'Envoyé pour se nourrir';

  @override
  String get recordPostedToast => 'Publié';

  @override
  String get recordSavedToast => 'Enregistré';

  @override
  String get commentPostedToast => 'Commentaire posté';

  @override
  String get commentSendFailedToast =>
      'Impossible d\'envoyer le commentaire. Veuillez réessayer.';

  @override
  String get commentDeleteTitle => 'Supprimer le commentaire';

  @override
  String get commentDeleteContent => 'Supprimer ce commentaire ?';

  @override
  String commentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count commentaires',
      one: '1 commentaire',
    );
    return '$_temp0';
  }

  @override
  String get commentsEmpty =>
      'Pas encore de commentaires\nSoyez le premier à en laisser un 💬';

  @override
  String get commentInputHint => 'Écrivez un commentaire...';

  @override
  String get apiErrorContentBlockedUrl =>
      'Les messages contenant des liens ne peuvent pas être soumis.';

  @override
  String get apiErrorContentBlockedSpam =>
      'Le texte promotionnel ne peut pas être soumis.';

  @override
  String get apiErrorContentBlockedProfanity =>
      'Le contenu contenant des grossièretés ne peut pas être soumis.';

  @override
  String get apiErrorContentBlockedModeration =>
      'Ce contenu ne peut pas être soumis.';

  @override
  String get apiErrorRateLimitExceeded => 'Veuillez réessayer dans un instant.';

  @override
  String get apiErrorInternal =>
      'Une erreur de serveur s\'est produite. Veuillez réessayer dans un instant.';

  @override
  String get apiErrorInvalidRequest => 'Demande invalide.';

  @override
  String get apiErrorForbidden => 'Vous n\'avez pas l\'autorisation.';

  @override
  String get apiErrorPostNotFound => 'Message introuvable.';

  @override
  String get apiErrorCommentNotFound => 'Commentaire introuvable.';

  @override
  String get apiErrorSignatureRequired =>
      'La signature de la demande est requise.';

  @override
  String get apiErrorSignatureInvalid => 'Demande invalide.';

  @override
  String get apiErrorSignatureExpired =>
      'La demande a expiré. Veuillez réessayer.';

  @override
  String get apiErrorSignatureReplay => 'Cette demande a déjà été traitée.';

  @override
  String get apiErrorUnknown => 'Une erreur inconnue s\'est produite.';

  @override
  String get reminderNotification => 'Notification de rappel';

  @override
  String get noReminder => 'Non défini';

  @override
  String get summaryIntensity => 'Niveau de rage';

  @override
  String get summaryCategory => 'Catégorie';

  @override
  String get summaryText => 'Texte';

  @override
  String get summaryReminder => 'Rappel';

  @override
  String get none => 'Aucun';

  @override
  String get other => 'Autre';

  @override
  String get family => 'Famille';

  @override
  String get romance => 'Romance';

  @override
  String get work => 'Travail';

  @override
  String get people => 'Les gens';

  @override
  String get driving => 'Conduite';

  @override
  String get custom => 'Personnalisé';

  @override
  String get recordCustomCategoryHint => 'Entrez une catégorie';

  @override
  String get recordTextHint => 'Écrivez-le ici';

  @override
  String get recordMicPermissionRequired =>
      'L\'autorisation du microphone est requise.';

  @override
  String recordVoiceStartFailed(String label) {
    return 'Impossible de démarrer $label.';
  }

  @override
  String get recordVoiceStopRecording => 'Arrêter l\'enregistrement';

  @override
  String get recordVoiceRecordAgain => 'Enregistrer à nouveau';

  @override
  String get recordVoiceSaved => 'Enregistrement vocal enregistré.';

  @override
  String get recordAudioSummaryLabel => 'Voix';

  @override
  String get recordAudioIncluded => 'Enregistrement inclus';

  @override
  String get recordSavingInProgress => 'Sauvegarde...';

  @override
  String get recordPostingInProgress => 'Envoi...';

  @override
  String get recordSaveFailedToast =>
      'Impossible d\'enregistrer la note. Veuillez réessayer.';

  @override
  String get recordProgressSemantics => 'Enregistrer les progrès';

  @override
  String get hourSuffix => 'h';

  @override
  String get minuteSuffix => 'm';

  @override
  String get reminderCustom => 'Personnalisé';

  @override
  String get reminderIn30Minutes => 'Dans 30 minutes';

  @override
  String get reminderIn1Hour => 'Dans 1 heure';

  @override
  String get reminderIn2Hours => 'Dans 2 heures';

  @override
  String get reminderIn6Hours => 'Dans 6 heures';

  @override
  String get reminderTomorrow => 'Demain';

  @override
  String get annoyed => 'Ennuyé';

  @override
  String get angry => 'En colère';

  @override
  String get mad => 'Fou';

  @override
  String get furious => 'Furieux';

  @override
  String get rage => 'Colère';

  @override
  String get calmed => 'Calme';

  @override
  String get feedTitle => 'Fil';

  @override
  String get feedSubtitle => 'Parcourez les histoires récentes de colère';

  @override
  String get feedAllTab => 'Tout le fil';

  @override
  String get feedMineTab => 'Mon fil';

  @override
  String get feedLoadFailed => 'Impossible de charger le flux.';

  @override
  String get feedEmptyMine =>
      'Vous n\'avez pas encore publié de message sur le flux.\nPartagez votre première note de rage !';

  @override
  String get feedEmptyAll =>
      'Aucune publication dans le fil pour l\'instant.\nSoyez le premier à partager votre colère !';

  @override
  String get feedPostFailedToast =>
      'Impossible d\'envoyer vers le flux. Veuillez réessayer.';

  @override
  String get like => 'Je comprends';

  @override
  String get comment => 'Commentaire';

  @override
  String get retry => 'Réessayer';

  @override
  String get statsTitle => 'Stats de colère';

  @override
  String get statsSubtitle => 'Voir le schéma émotionnel de cette semaine';

  @override
  String get week => '1 semaine';

  @override
  String get month => '1 mois';

  @override
  String get all => 'Tout';

  @override
  String get totalRecords => 'Enregistrements';

  @override
  String get highestLevel => 'Le plus haut';

  @override
  String get dailyAverage => 'Moyenne quotidienne.';

  @override
  String get decreaseRate => 'Diminuer';

  @override
  String get statsIntensityTrend => 'Tendance de l\'intensité de la rage';

  @override
  String get statsCategoryDistribution => 'Répartition des causes';

  @override
  String get statsNoRecords => 'Aucun enregistrement à afficher.';

  @override
  String get statsCalendarButtonTitle =>
      'Afficher les enregistrements par calendrier';

  @override
  String get statsCalendarButtonSubtitle =>
      'Vérifier et gérer les notes de rage par date';

  @override
  String get statsCalendarTitle =>
      'Afficher les enregistrements par calendrier';

  @override
  String get statsOtherCategory => 'Autre';

  @override
  String selectedDateRecordsTitle(String date) {
    return '$date enregistrements';
  }

  @override
  String get noRecordsOnSelectedDate =>
      'Aucun enregistrement n\'a été rédigé à la date sélectionnée.';

  @override
  String get reminderAction => 'Rappel';

  @override
  String get play => 'Lire';

  @override
  String get statsSummaryButtonTitle => 'Afficher le rapport sur la rage';

  @override
  String get statsSummaryButtonSubtitle =>
      'Parcourez vos schémas de colère par catégorie';

  @override
  String get statsSummaryTitle => 'Rapport de rage';

  @override
  String get statsSummaryClose => 'Fermer';

  @override
  String get statsSummaryEmptyTitle =>
      'Aucun enregistrement à résumer pour l\'instant';

  @override
  String get statsSummaryEmptyBody =>
      'Une fois que vous avez ajouté des notes de rage, les modèles de catégories apparaîtront ici.';

  @override
  String statsSummaryTopHeadline(String category) {
    return '\"$category\" vous a le plus souvent mis en colère';
  }

  @override
  String statsSummaryCategoryHeadline(String category) {
    return 'En regardant \"$category\"';
  }

  @override
  String get statsSummaryComfortGeneric => 'C\'est bon. Cela peut arriver.';

  @override
  String get statsSummaryComfortFamily =>
      'Plus une personne est proche, plus elle peut atterrir difficilement.';

  @override
  String get statsSummaryComfortRomance =>
      'Une relation précieuse peut rendre les petits moments plus intenses.';

  @override
  String get statsSummaryComfortWork =>
      'Le travail a peut-être poussé votre esprit plus vite qu’il ne le souhaitait.';

  @override
  String get statsSummaryComfortPeople =>
      'Les mots et expressions des autres peuvent persister plus longtemps que prévu.';

  @override
  String get statsSummaryComfortDriving =>
      'La tension sur la route atteint souvent le corps en premier.';

  @override
  String get statsSummaryMetricCount => 'Compter';

  @override
  String get statsSummaryMetricCategory => 'Catégorie';

  @override
  String get statsSummaryMetricFeed => 'Publications dans le fil';

  @override
  String get statsSummaryMetricCalm => 'Le calme essaie';

  @override
  String get statsSummaryMetricAverage => 'Moy. niveau';

  @override
  String get statsSummaryMetricPeak => 'Niveau de pointe';

  @override
  String get statsSummaryConclusion => 'Conclusion';

  @override
  String statsSummaryRecordsUnit(int count) {
    return '$count fois';
  }

  @override
  String statsSummaryAverageValue(String value) {
    return '$value/5';
  }

  @override
  String get statsSummaryConclusionTop =>
      'C’est votre signal de colère le plus répété. La prochaine fois, essayez de vérifier la tension de votre corps avant que la colère ne monte complètement.';

  @override
  String get statsSummaryConclusionCategory =>
      'Écrire cette catégorie alors qu’elle est encore petite peut vous aider à remarquer le modèle plus tôt.';

  @override
  String statsSummaryPageIndicator(int current, int total) {
    return '$current/$total';
  }

  @override
  String get statsSummaryCategoryShare => 'Part de catégorie';

  @override
  String get statsSummaryCalmRate => 'Tarif calme';

  @override
  String get statsSummaryShareRate => 'Taux de partage';

  @override
  String get noContent => 'Aucun contenu';

  @override
  String get voicePlayback => 'Jouer la voix';

  @override
  String get deleteConfirm => 'Supprimer ?';

  @override
  String get delete => 'Supprimer';

  @override
  String get cancel => 'Annuler';

  @override
  String get calmTitle => 'Calme';

  @override
  String get calmSubtitle => 'Abaisser ce qui traîne encore';

  @override
  String get reminderNotes => 'Notes de rappel';

  @override
  String get breathing => 'Respiration';

  @override
  String get timeout => 'Délai d\'attente';

  @override
  String get meditation => 'Méditation d’images';

  @override
  String get feedSupport => 'Prise en charge des flux';

  @override
  String get calmReminderEmpty => 'Des rappels apparaîtront ici à leur arrivée';

  @override
  String get calmReminderFallbackText =>
      'Comment se sent cette colère maintenant ?';

  @override
  String get calmCheckTitle => 'À quel point es-tu en colère maintenant ?';

  @override
  String calmCheckSubtitle(String emoji, String label) {
    return '$emoji $label · cette colère antérieure';
  }

  @override
  String get calmSavedCalmedToast => 'Content que tu t\'es calmé.';

  @override
  String get calmSavedUpdatedToast => 'Enregistré';

  @override
  String get profileName => 'Tigre en colère';

  @override
  String get nicknameAdjectives =>
      'en colère, furieux, déchaîné, explosif, féroce, grognant, pointu, cornu, chauffé, rugueux, féroce, déchaîné, ardent, tonitruant, soufflant, bouillant, plein de ressentiment, flamboyant, orageux, venimeux';

  @override
  String get nicknameAnimals =>
      'tigre, lion, loup, ours, aigle, requin, léopard, guépard, crocodile, cobra, taureau, sanglier, rhinocéros, hyène, grizzly, corbeau, faucon, hérisson, jaguar, puma';

  @override
  String get notificationSettings => 'Notifications';

  @override
  String get commentNotification => 'Alertes de commentaires';

  @override
  String get settingsNotificationsSection => 'Notifications';

  @override
  String get settingsReminderSubtitle =>
      'Rappel de note de rage à l\'heure que vous avez définie';

  @override
  String get settingsCommentSubtitle =>
      'Alerte lorsque quelqu\'un commente votre message';

  @override
  String get settingsDataSection => 'Données';

  @override
  String get settingsDataImportSubtitle =>
      'Restaurer des enregistrements à partir d\'un fichier de sauvegarde';

  @override
  String get settingsSupportSection => 'Assistance';

  @override
  String get settingsPrivacySubtitle =>
      'Informations collectées et finalité d\'utilisation';

  @override
  String get settingsFeedbackTitle => 'Envoyer des commentaires';

  @override
  String get settingsFeedbackSubtitle => 'Problèmes ou idées d\'amélioration';

  @override
  String get settingsRecordCountUnit => 'enregistrements';

  @override
  String get settingsPostCountUnit => 'messages';

  @override
  String get proPlan => 'Exportation de données PRO';

  @override
  String get backupImport => 'Importer des données';

  @override
  String get settingsDataExportSubtitle =>
      'Fichier de sauvegarde · historique · partage';

  @override
  String get dataExportTitle => 'Exporter des données';

  @override
  String get dataExportProTitle => 'Exportation de données PRO';

  @override
  String get dataExportDescription =>
      'Créez un fichier de sauvegarde avec toutes les données de l\'application locale et partagez-le par e-mail ou par messagerie.';

  @override
  String get dataExportOneTimePurchase => 'Achat unique · accès à vie';

  @override
  String get dataExportDebugPrice => 'DEBUG';

  @override
  String get dataExportInProgress => 'Exportation';

  @override
  String get dataExportPaymentChecking => 'Vérification du paiement';

  @override
  String get dataExportCreateButton => 'Créer une exportation';

  @override
  String get dataExportPayAndCreateButton => 'Payer et exporter';

  @override
  String get dataExportRestorePurchase => 'Restaurer l\'achat';

  @override
  String get dataExportCreatedToast => 'Fichier d\'exportation créé.';

  @override
  String get dataExportFailedToast =>
      'Impossible de créer le fichier d\'exportation.';

  @override
  String get dataExportShareSubject => 'Sauvegarde des données Fury Note';

  @override
  String get dataExportShareText =>
      'Il s\'agit d\'un fichier de sauvegarde de données Fury Note.';

  @override
  String get dataExportShareFailedToast =>
      'Impossible d\'ouvrir la feuille de partage.';

  @override
  String get dataExportAllDataIncluded =>
      'Toutes les données de l\'application locale sont incluses dans la sauvegarde';

  @override
  String get dataExportHistoryTitle => 'Historique des exportations';

  @override
  String dataExportHistoryCount(int count) {
    return '$count';
  }

  @override
  String get dataExportShareTooltip => 'Partager';

  @override
  String get dataExportEmptyHistory =>
      'Aucun fichier d\'exportation pour l\'instant.';

  @override
  String get purchaseUpdateFailed =>
      'Impossible de traiter la mise à jour de l\'achat.';

  @override
  String get purchaseStatusFailed =>
      'Impossible de vérifier le statut de l\'achat.';

  @override
  String get purchaseProductNotFound => 'Produit du magasin introuvable.';

  @override
  String get purchaseStoreUnavailable =>
      'Impossible de se connecter au magasin.';

  @override
  String get purchaseProductInfoFailed =>
      'Impossible de charger les informations sur le produit en magasin.';

  @override
  String get purchaseProductUnavailable =>
      'Les informations sur le produit ne sont pas encore prêtes.';

  @override
  String get purchaseStartFailed => 'Impossible de démarrer l\'achat.';

  @override
  String get purchaseCanceled => 'L\'achat a été annulé.';

  @override
  String get purchaseReceiptInvalid =>
      'Impossible de vérifier le reçu d\'achat.';

  @override
  String get purchaseReceiptVerifyFailed =>
      'La vérification du reçu d\'achat a échoué.';

  @override
  String get dataImportTitle => 'Importer des données';

  @override
  String get dataImportPickTitle => 'Sélectionnez le fichier de sauvegarde';

  @override
  String get dataImportPickDescription =>
      'Sélectionnez un fichier .fnbackup\nexporté depuis Fury Note';

  @override
  String get dataImportPickButton => 'Choisir un fichier';

  @override
  String get dataImportInProgress => 'Importation';

  @override
  String dataImportSuccessToast(int count) {
    return 'Données remplacées à partir de la sauvegarde. ($count enregistrements)';
  }

  @override
  String get dataImportNoNewDataToast =>
      'Données remplacées à partir de la sauvegarde. (0 enregistrements)';

  @override
  String get dataImportFailedToast =>
      'Impossible d\'importer le fichier de sauvegarde.';

  @override
  String get dataImportInvalidFileToast =>
      'Seuls les fichiers .fnbackup peuvent être importés.';

  @override
  String get dataImportNoticeTitle => 'Avant d\'importer';

  @override
  String get dataImportNoticeBody =>
      'Les données existantes seront supprimées et remplacées par les données du fichier de sauvegarde.';

  @override
  String get dataImportTransferTitle => 'Déplacer des appareils';

  @override
  String get dataImportTransferBody =>
      'Après avoir installé l\'application sur un nouvel appareil, importez un fichier de sauvegarde pour remplacer les données locales actuelles par les données de sauvegarde.';

  @override
  String get feedDeleteTitle => 'Supprimer le flux';

  @override
  String get feedDeleteContent => 'Supprimer ce flux ?';

  @override
  String get calmBreathingTitle => 'Respiration';

  @override
  String get breathPhaseInhale => 'Inspirez';

  @override
  String get breathPhaseHold => 'Tenir';

  @override
  String get breathPhaseExhale => 'Expirez';

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count secondes',
      one: '1 seconde',
    );
    return '$_temp0';
  }

  @override
  String cycleCount(int count) {
    return 'Cycle $count';
  }

  @override
  String get calmTimeoutRunning => 'Courir';

  @override
  String get calmTimeoutPaused => 'En pause';

  @override
  String get reset => 'Réinitialiser';

  @override
  String get start => 'Démarrer';

  @override
  String get pause => 'Pause';

  @override
  String get stop => 'Arrêter';

  @override
  String get calmMeditationSceneWave => 'Vagues';

  @override
  String get calmMeditationSceneForest => 'Forêt';

  @override
  String get calmMeditationSceneSunset => 'Coucher de soleil';

  @override
  String get calmMeditationSceneMountain => 'Montagne';

  @override
  String get calmMeditationSceneCherryBlossom => 'Fleurs de cerisier';

  @override
  String get calmMeditationSceneNightSky => 'Ciel nocturne';

  @override
  String get calmMeditationPrompt => 'Inspirez profondément, puis expirez';

  @override
  String get autoplay => 'Lecture automatique';

  @override
  String get profileEditTitle => 'Modifier le profil';

  @override
  String get nicknameLabel => 'Surnom';

  @override
  String get nicknameHint => 'Entrez un pseudo';

  @override
  String get nicknameRequiredError => 'Veuillez entrer un pseudo';

  @override
  String get nicknameCodeAutomaticError =>
      'Votre code est ajouté automatiquement';

  @override
  String get nicknameTooShortError => 'Utilisez au moins 2 caractères';

  @override
  String profileSavedToast(String name) {
    return '✅ Changé par \"$name\" !';
  }

  @override
  String get profileSaveFailedToast =>
      'Une erreur s\'est produite lors de l\'enregistrement.';

  @override
  String get avatarPickGallery => 'Choisissez dans la bibliothèque';

  @override
  String get avatarPickCamera => 'Prendre une photo';

  @override
  String get avatarReset => 'Utiliser l\'avatar par défaut';

  @override
  String get avatarResetToast => 'Avatar par défaut restauré.';

  @override
  String get avatarAppliedToast => 'Photo de profil appliquée.';

  @override
  String get avatarTooLargeToast =>
      'Seules les photos jusqu\'à 5 Mo peuvent être utilisées.';

  @override
  String get avatarLoadFailedToast => 'Impossible de charger la photo.';

  @override
  String get profileCodeLabel => 'Code de profil (ne peut pas être modifié)';

  @override
  String get profileSaveButton => 'Enregistrer les modifications';

  @override
  String get avatarChangeLabel => 'Changer la photo de profil';

  @override
  String get avatarChangeHint => 'Appuyez sur la photo pour la modifier';

  @override
  String get avatarSizeHint => 'JPG, PNG, GIF · jusqu\'à 5 Mo';

  @override
  String get reminderNotificationFallbackBody =>
      'Comment se sent cette colère maintenant ?';

  @override
  String get calmGuideTitle =>
      'Quand la colère monte,\nabaissez d\'abord votre corps en toute sécurité';

  @override
  String get calmGuideSubtitle =>
      'Le guide calme de Fury Note ne vous dit pas de vous débarrasser de la colère. C\'est un petit guide pour aider le sentiment à passer sans que personne ne soit blessé.';

  @override
  String get calmGuideNotice =>
      '**Si vous êtes en danger immédiat**, veuillez demander de l\'aide à votre entourage ou contacter d\'abord les services d\'urgence, au lieu de rester sur cette application.';

  @override
  String get calmGuideMomentTitle => 'Au moment où la colère monte';

  @override
  String get calmGuideMomentBody1 =>
      'La colère peut être le signe que quelque chose qui vous tient à cœur a été violé. Mais dans un état de colère intense, le jugement s’accélère et les paroles et les actions peuvent devenir plus dures que d’habitude.';

  @override
  String get calmGuideMomentBody2 =>
      'Ce qu\'il faut en ce moment, ce n\'est pas d\'être **parfaitement rationnel**, mais de **retarder votre réaction même de 30 secondes**.';

  @override
  String get calmGuideRoutineTitle => 'Routine calme de 60 secondes';

  @override
  String get calmGuideStep1Title => 'Arrêter';

  @override
  String get calmGuideStep1Desc =>
      'Arrêtez de répondre, d\'appeler, de commenter ou de bouger. Détendez vos mains et détournez le regard de l\'écran pendant un moment.';

  @override
  String get calmGuideStep2Title => 'Respirer';

  @override
  String get calmGuideStep2Desc =>
      'Inspirez pendant 4 secondes, maintenez pendant 7 secondes, expirez pendant 8 secondes. Ce n\'est pas grave si ce n\'est pas parfait.';

  @override
  String get calmGuideStep3Title => 'Vérifiez votre corps';

  @override
  String get calmGuideStep3Desc =>
      'Vérifiez si votre mâchoire, vos épaules, vos poings ou votre ventre sont tendus et relâchez un seul endroit.';

  @override
  String get calmGuideStep4Title => 'Écrivez-le';

  @override
  String get calmGuideStep4Desc =>
      'Même une phrase comme « En ce moment, je suis en colère parce que ___ » suffit.';

  @override
  String get calmGuideBreathTitle => 'Respiration 4-7-8';

  @override
  String get calmGuideBreathStep1 => 'Inspirez par le nez pendant 4 secondes.';

  @override
  String get calmGuideBreathStep2 =>
      'Retenez votre souffle pendant 7 secondes.';

  @override
  String get calmGuideBreathStep3 =>
      'Expirez lentement par la bouche pendant 8 secondes.';

  @override
  String get calmGuideBreathStep4 => 'Répétez 3 fois si vous le pouvez.';

  @override
  String get calmGuideBreathNote =>
      'S\'il est difficile de retenir sa respiration aussi longtemps, réduisez-la à un nombre confortable comme **3-3-5**. Ce qui compte le plus, c\'est une expiration lente et longue.';

  @override
  String get calmGuideTimeoutTitle => 'Délai d\'attente de 10 minutes';

  @override
  String get calmGuideTimeoutBody =>
      'Plus la colère est forte, plus l’envie de la résoudre immédiatement est forte. Mais parler maintenant pourrait d’abord faire ressortir des mots blessants.';

  @override
  String get calmGuideTimeoutExamplesTitle =>
      'Exemples de phrases d\'expiration';

  @override
  String get calmGuideTimeoutExample1 =>
      '\"Je suis trop en colère en ce moment, reparlons dans 10 minutes.\"';

  @override
  String get calmGuideTimeoutExample2 =>
      '\"Je fais une pause un instant parce que je pourrais dire quelque chose de blessant.\"';

  @override
  String get calmGuideTimeoutExample3 =>
      '\"Je ne m\'enfuis pas, j\'ai juste besoin de me calmer avant de reparler.\"';

  @override
  String get calmGuideSensoryTitle => 'Mise à la terre sensorielle rapide';

  @override
  String get calmGuideSensory1Title => 'Eau froide';

  @override
  String get calmGuideSensory1Desc =>
      'Gardez de l\'eau froide sur vos poignets ou votre visage pendant environ 10 secondes';

  @override
  String get calmGuideSensory2Title => 'Sentez vos pieds';

  @override
  String get calmGuideSensory2Desc =>
      'Remarquez lentement la sensation de vos pieds touchant le sol';

  @override
  String get calmGuideSensory3Title => 'Regardez autour de vous';

  @override
  String get calmGuideSensory3Desc =>
      'Nommez tranquillement 5 objets que vous pouvez voir';

  @override
  String get calmGuideSensory4Title => 'Baissez vos épaules';

  @override
  String get calmGuideSensory4Desc =>
      'Expirez et abaissez vos épaules de seulement 1 cm';

  @override
  String get calmGuideQuestionsTitle => 'Questions qui aident à écrire';

  @override
  String get calmGuideQuestion1 =>
      'Qu’est-ce qui m’a mis en colère exactement ?';

  @override
  String get calmGuideQuestion2 =>
      'Qu’est-ce que j’attendais mais que je n’ai pas reçu ?';

  @override
  String get calmGuideQuestion3 =>
      'Quelle action regretterais-je si je la faisais maintenant ?';

  @override
  String get calmGuideQuestion4 =>
      'De quel choix serai-je reconnaissant demain ?';

  @override
  String get calmGuideTag1 => 'Journal des émotions';

  @override
  String get calmGuideTag2 => 'Distanciation de la colère';

  @override
  String get calmGuideTag3 => 'Vérification de rappel';

  @override
  String get calmGuideDangerTitle => 'Demandez d’abord de l’aide dans ces cas';

  @override
  String get calmGuideDanger1 =>
      'Lorsque l’envie de se faire du mal ou de blesser autrui est forte';

  @override
  String get calmGuideDanger2 =>
      'Quand l\'envie de jeter ou de casser les choses ne s\'arrête pas';

  @override
  String get calmGuideDanger3 =>
      'Lorsque vous avez envie d’affronter ou de menacer l’autre personne';

  @override
  String get calmGuideDanger4 =>
      'Lorsque l’alcool, les drogues ou un manque de sommeil sévère rendent difficile le contrôle';

  @override
  String get calmGuideDangerBody =>
      'Dans ces cas-là, n\'essayez pas de vous en sortir seul avec une routine calme : demandez de l\'aide à votre entourage, aux services professionnels ou aux services d\'urgence.';

  @override
  String get calmGuideFooterTitle => 'Fury Note Calm Guide';

  @override
  String get calmGuideFooterDisclaimer =>
      'Ce document ne remplace pas un diagnostic ou un traitement médical.';

  @override
  String get privacyTitle => 'Politique de confidentialité';

  @override
  String get privacyLastUpdated => 'Date d\'entrée en vigueur : 16 juin 2026';

  @override
  String get privacySection1Title => '1. Catégories d\'informations collectées';

  @override
  String get privacySection1Body =>
      'Fury Note peut être utilisé sans aucune inscription d’adhésion. La Société collecte uniquement les informations suivantes.\n· Identifiant de l\'appareil — une valeur émise de manière aléatoire utilisée pour identifier l\'utilisateur sans inscription, dans le but de prévenir toute utilisation frauduleuse.\n· Données d\'enregistrement de Rage : intensité, catégorie et texte (stockés sur l\'appareil uniquement)\n· Publications de fil anonymes : surnom, image d\'avatar, intensité, catégorie et texte\n· Commentaires – surnom et texte du commentaire\n· J\'aime les enregistrements : indique si l\'utilisateur a aimé une publication donnée\n· Jeton de notification push — dans le but d\'envoyer des notifications (facultatif)';

  @override
  String get privacySection2Title => '2. Finalité du traitement';

  @override
  String get privacySection2Body =>
      '· Fourniture de fonctionnalités communautaires, y compris le flux anonyme, les commentaires et les likes\n· Détection des utilisations frauduleuses, y compris la prévention des likes en double sur la même publication\n· Envoi de notifications push, y compris des alertes de commentaires\n· Fonctionnement du service et analyse des erreurs';

  @override
  String get privacySection3Title =>
      '3. Aucune inscription d’adhésion et aucune conservation d’informations personnelles';

  @override
  String get privacySection3Body =>
      'Fury Note ne nécessite pas d\'inscription comme membre et ne collecte pas d\'informations personnelles permettant de vérifier l\'identité telles que le nom, l\'adresse e-mail ou le numéro de téléphone.\nLe pseudo est soit généré automatiquement, soit saisi directement par l\'utilisateur et n\'est pas lié à l\'identité réelle de l\'utilisateur. L\'identifiant de l\'appareil est également une valeur générée aléatoirement qui ne peut pas être utilisée pour identifier un individu spécifique.';

  @override
  String get privacySection4Title =>
      '4. Fourniture d\'informations à des tiers';

  @override
  String get privacySection4Body =>
      'La Société ne fournit ni ne vend les informations collectées à des tiers.';

  @override
  String get privacySection5Title =>
      '5. Durée de conservation et d\'utilisation des informations';

  @override
  String get privacySection5Body =>
      '· Les enregistrements Rage qui ont uniquement été enregistrés sont conservés sur l\'appareil uniquement et sont supprimés ensemble lors de la suppression de l\'application.\n· Les publications, avatars et commentaires partagés sur le flux anonyme sont conservés sur le serveur jusqu\'à leur suppression par l\'utilisateur, et sont supprimés immédiatement sur cette demande.\n· Les enregistrements similaires sont supprimés ensemble lors de la suppression de la publication associée.';

  @override
  String get privacySection6Title => '6. Contacter';

  @override
  String get privacySection6Body =>
      'Pour toute demande concernant des informations personnelles, veuillez contacter l’adresse e-mail ci-dessous.\nlunlu.co.kr@gmail.com';

  @override
  String get appGuideTitle => 'Comment utiliser Fury Note';

  @override
  String get appGuideSubtitle =>
      'Un guide pour enregistrer la colère, suivre les tendances et obtenir de l\'aide sur le fil.';

  @override
  String get appGuideRecordTitle => 'Enregistrez votre colère';

  @override
  String get appGuideRecordBody =>
      'Lorsque vous êtes en colère, appuyez sur le bouton 🔥 en bas pour démarrer un enregistrement.';

  @override
  String get appGuideRecordStep1 =>
      'Choisissez l\'intensité : choisissez un emoji qui correspond à votre degré de colère';

  @override
  String get appGuideRecordStep2 =>
      'Choisissez une catégorie : choisissez une cause';

  @override
  String get appGuideRecordStep3 =>
      'Écrivez-le : décrivez ce qui s\'est passé (vous pouvez ignorer ceci)';

  @override
  String get appGuideRecordStep4 =>
      'Rappel : fixez une heure si vous souhaitez y revenir plus tard';

  @override
  String get appGuideRecordStep5 =>
      'Enregistrer ou publier : gardez l\'enregistrement privé ou partagez-le sur le flux';

  @override
  String get appGuideFeedTitle => 'Trouver de l\'aide sur le fil';

  @override
  String get appGuideFeedBody =>
      'Partager votre colère peut vous connecter avec d’autres personnes qui ressentent la même chose.';

  @override
  String get appGuideFeedItem1 =>
      'Après avoir enregistré, vous pouvez publier **de manière anonyme** sur le flux';

  @override
  String get appGuideFeedItem2 =>
      'Aimez ou commentez les publications d’autres personnes';

  @override
  String get appGuideFeedItem3 =>
      'Vous pouvez supprimer votre propre message à tout moment';

  @override
  String get appGuideStatsTitle => 'Suivez vos schémas émotionnels';

  @override
  String get appGuideStatsBody =>
      'L\'onglet Statistiques vous aide à revenir sur vos schémas de colère.';

  @override
  String get appGuideStatsItem1 =>
      'Graphique de tendance de l\'intensité de la rage par période';

  @override
  String get appGuideStatsItem2 => 'Répartition des causes par catégorie';

  @override
  String get appGuideStatsItem3 =>
      'Vue Calendrier pour parcourir les enregistrements par date';

  @override
  String get appGuideStatsItem4 =>
      'Rapport Rage pour analyser les modèles par catégorie';

  @override
  String get appGuideCalmTitle => 'Baissez votre colère';

  @override
  String get appGuideCalmBody =>
      'Après vous être connecté, dirigez-vous vers l’onglet calme pour essayer de réduire votre émotion.';

  @override
  String get appGuideCalmItem1 =>
      'Notes de rappel : revisitez les enregistrements que vous avez signalés pour plus tard';

  @override
  String get appGuideCalmItem2 =>
      'Respiration : apaisez votre esprit avec la technique 4-7-8';

  @override
  String get appGuideCalmItem3 =>
      'Timeout : ralentissez votre réaction avec une minuterie de 10 minutes';

  @override
  String get appGuideCalmItem4 =>
      'Méditation d\'images : changez d\'humeur avec des images de la nature';

  @override
  String get appGuideProfileTitle => 'Pseudo et profil';

  @override
  String get appGuideProfileBody =>
      'Allez dans le menu > Paramètres pour changer votre pseudo et votre avatar.';

  @override
  String get appGuideProfileItem1 =>
      'Pseudonyme : saisissez le vôtre ou générez-en un au hasard';

  @override
  String get appGuideProfileItem2 => 'Avatar : représentez-vous avec un emoji';

  @override
  String get appGuideNotificationTitle => 'Paramètres de notification';

  @override
  String get appGuideNotificationItem1 =>
      'Alertes de rappel : recevez un rappel d\'une note de rage à l\'heure que vous avez définie';

  @override
  String get appGuideNotificationItem2 =>
      'Alertes de commentaires : soyez averti lorsque quelqu\'un commente votre publication';

  @override
  String get appGuideNotificationHint =>
      'Basculez-les dans Paramètres > Notifications';

  @override
  String get appGuideFooterTitle => 'Fury Note App Guide';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Fury Note';

  @override
  String get appKoreanName => 'Fury Note';

  @override
  String get record => 'Kayıt';

  @override
  String get feed => 'Akış';

  @override
  String get stats => 'İstatistik';

  @override
  String get calm => 'Sakinleş';

  @override
  String get settings => 'Ayarlar';

  @override
  String get drawerGuide => 'Uygulama rehberi';

  @override
  String get drawerCalmGuide => 'Sakinleşme rehberi';

  @override
  String get drawerVersion => 'Fury Note v1.0.0';

  @override
  String get menuTooltip => 'Menü';

  @override
  String drawerRecordCount(String count) {
    return '🔥 $count öfke notları';
  }

  @override
  String get drawerSettingsSubtitle => 'Takma ad · bildirimler';

  @override
  String get drawerGuideSubtitle => 'Fury Note nasıl kullanılır';

  @override
  String get drawerCalmGuideSubtitle => 'Sakin kartlar · bugünün ipuçları';

  @override
  String get relativeTimeJustNow => 'Az önce';

  @override
  String relativeTimeMinutesAgo(int count) {
    return '$count dakika önce';
  }

  @override
  String relativeTimeHoursAgo(int count) {
    return '${count}saat önce';
  }

  @override
  String relativeTimeDaysAgo(int count) {
    return '$count gün önce';
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
  String get recordTitle => 'Öfke kaydı';

  @override
  String get stepIntensity => 'Şimdi ne kadar kızgınsın?';

  @override
  String get stepIntensitySub => 'Bir emoji seç';

  @override
  String get stepCategory => 'Buna ne sebep oldu?';

  @override
  String get stepCategorySub => 'Bir kategori seçin';

  @override
  String get stepText => 'Ne oldu?';

  @override
  String get stepTextSub => 'Bunu atlayabilirsiniz';

  @override
  String get stepReminder => 'Daha sonra tekrar ziyaret etmek ister misiniz?';

  @override
  String get stepReminderSub => 'Bunu atlayabilirsiniz';

  @override
  String get stepSave => 'Bu not kaydedilsin mi?';

  @override
  String get stepSaveSub => 'Kaydettikten sonra yayınlayabilirsiniz';

  @override
  String get stepPost => 'Bu duyguyu paylaşıyor musunuz?';

  @override
  String get stepPostSub => 'Anonim olacak';

  @override
  String get voiceInput => 'Ses kaydı';

  @override
  String get next => 'İleri';

  @override
  String get previous => 'Geri';

  @override
  String get skip => 'Atla';

  @override
  String get save => 'Kaydet';

  @override
  String get saveNote => 'Notu kaydet';

  @override
  String get postIt => 'Paylaş';

  @override
  String get saveOnly => 'Sadece kaydet';

  @override
  String get feedPostedToast => 'Beslemeye gönderildi';

  @override
  String get recordPostedToast => 'Gönderildi';

  @override
  String get recordSavedToast => 'Kaydedildi';

  @override
  String get commentPostedToast => 'Yorum gönderildi';

  @override
  String get commentSendFailedToast =>
      'Yorum gönderilemedi. Lütfen tekrar deneyin.';

  @override
  String get commentDeleteTitle => 'Yorumu sil';

  @override
  String get commentDeleteContent => 'Bu yorum silinsin mi?';

  @override
  String commentsCount(int count) {
    return '$count yorum';
  }

  @override
  String get commentsEmpty => 'Henüz yorum yok\nİlk bırakan siz olun 💬';

  @override
  String get commentInputHint => 'Bir yorum yazın...';

  @override
  String get apiErrorContentBlockedUrl =>
      'Bağlantı içeren gönderiler gönderilemez.';

  @override
  String get apiErrorContentBlockedSpam => 'Tanıtım metni gönderilemiyor.';

  @override
  String get apiErrorContentBlockedProfanity =>
      'Küfür içeren içerik gönderilemez.';

  @override
  String get apiErrorContentBlockedModeration => 'Bu içerik gönderilemiyor.';

  @override
  String get apiErrorRateLimitExceeded =>
      'Lütfen kısa bir süre sonra tekrar deneyin.';

  @override
  String get apiErrorInternal =>
      'Bir sunucu hatası oluştu. Lütfen kısa bir süre sonra tekrar deneyin.';

  @override
  String get apiErrorInvalidRequest => 'Geçersiz istek.';

  @override
  String get apiErrorForbidden => 'İzniniz yok.';

  @override
  String get apiErrorPostNotFound => 'Gönderi bulunamadı.';

  @override
  String get apiErrorCommentNotFound => 'Yorum bulunamadı.';

  @override
  String get apiErrorSignatureRequired => 'İstek imzası gerekli.';

  @override
  String get apiErrorSignatureInvalid => 'Geçersiz istek.';

  @override
  String get apiErrorSignatureExpired =>
      'Talebin süresi doldu. Lütfen tekrar deneyin.';

  @override
  String get apiErrorSignatureReplay => 'Bu istek zaten işleme alındı.';

  @override
  String get apiErrorUnknown => 'Bilinmeyen bir hata oluştu.';

  @override
  String get reminderNotification => 'Hatırlatma bildirimi';

  @override
  String get noReminder => 'Ayarlanmadı';

  @override
  String get summaryIntensity => 'Öfke seviyesi';

  @override
  String get summaryCategory => 'Kategori';

  @override
  String get summaryText => 'Metin';

  @override
  String get summaryReminder => 'Hatırlatma';

  @override
  String get none => 'Yok';

  @override
  String get other => 'Diğer';

  @override
  String get family => 'Aile';

  @override
  String get romance => 'romantik';

  @override
  String get work => 'iş';

  @override
  String get people => 'İnsanlar';

  @override
  String get driving => 'Araba kullanmak';

  @override
  String get custom => 'Özel';

  @override
  String get recordCustomCategoryHint => 'Bir kategori girin';

  @override
  String get recordTextHint => 'buraya yaz';

  @override
  String get recordMicPermissionRequired => 'Mikrofon izni gereklidir.';

  @override
  String recordVoiceStartFailed(String label) {
    return '$label başlatılamadı.';
  }

  @override
  String get recordVoiceStopRecording => 'Kaydı durdur';

  @override
  String get recordVoiceRecordAgain => 'Tekrar kaydet';

  @override
  String get recordVoiceSaved => 'Ses kaydı kaydedildi.';

  @override
  String get recordAudioSummaryLabel => 'Ses';

  @override
  String get recordAudioIncluded => 'Kayıt dahil';

  @override
  String get recordSavingInProgress => 'Kaydediliyor...';

  @override
  String get recordPostingInProgress => 'Gönderiliyor...';

  @override
  String get recordSaveFailedToast =>
      'Not kaydedilemedi. Lütfen tekrar deneyin.';

  @override
  String get recordProgressSemantics => 'İlerlemeyi kaydedin';

  @override
  String get hourSuffix => 'sa';

  @override
  String get minuteSuffix => 'm';

  @override
  String get reminderCustom => 'Özel';

  @override
  String get reminderIn30Minutes => '30 dakika içinde';

  @override
  String get reminderIn1Hour => '1 saat içinde';

  @override
  String get reminderIn2Hours => '2 saat içinde';

  @override
  String get reminderIn6Hours => '6 saat içinde';

  @override
  String get reminderTomorrow => 'Yarın';

  @override
  String get annoyed => 'sinirlendim';

  @override
  String get angry => 'kızgın';

  @override
  String get mad => 'deli';

  @override
  String get furious => 'Öfkeli';

  @override
  String get rage => 'Öfke';

  @override
  String get calmed => 'Sakin';

  @override
  String get feedTitle => 'Akış';

  @override
  String get feedSubtitle => 'En son öfke hikayelerine göz atın';

  @override
  String get feedAllTab => 'Tüm akış';

  @override
  String get feedMineTab => 'Benim akışım';

  @override
  String get feedLoadFailed => 'Özet akışı yüklenemedi.';

  @override
  String get feedEmptyMine =>
      'Henüz feed\'e gönderi göndermediniz.\nİlk öfke notunuzu paylaşın!';

  @override
  String get feedEmptyAll =>
      'Henüz yayın gönderisi yok.\nÖfkenizi ilk paylaşan siz olun!';

  @override
  String get feedPostFailedToast =>
      'Feed\'e gönderilemedi. Lütfen tekrar deneyin.';

  @override
  String get like => 'Anlıyorum';

  @override
  String get comment => 'Yorum';

  @override
  String get retry => 'Tekrar dene';

  @override
  String get statsTitle => 'Öfke istatistikleri';

  @override
  String get statsSubtitle => 'Bu haftanın duygusal modelini görün';

  @override
  String get week => '1 hafta';

  @override
  String get month => '1 ay';

  @override
  String get all => 'Hepsi';

  @override
  String get totalRecords => 'Kayıtlar';

  @override
  String get highestLevel => 'En yüksek';

  @override
  String get dailyAverage => 'Günlük ortalama';

  @override
  String get decreaseRate => 'Azalt';

  @override
  String get statsIntensityTrend => 'Öfke yoğunluğu eğilimi';

  @override
  String get statsCategoryDistribution => 'Neden dağıtımı';

  @override
  String get statsNoRecords => 'Gösterilecek kayıt yok.';

  @override
  String get statsCalendarButtonTitle => 'Kayıtları takvime göre görüntüleme';

  @override
  String get statsCalendarButtonSubtitle =>
      'Öfke notlarını tarihe göre kontrol edin ve yönetin';

  @override
  String get statsCalendarTitle => 'Kayıtları takvime göre görüntüleme';

  @override
  String get statsOtherCategory => 'Diğer';

  @override
  String selectedDateRecordsTitle(String date) {
    return '$date kayıtları';
  }

  @override
  String get noRecordsOnSelectedDate =>
      'Seçilen tarihte herhangi bir kayıt yazılmadı.';

  @override
  String get reminderAction => 'Hatırlatma';

  @override
  String get play => 'Oynat';

  @override
  String get statsSummaryButtonTitle => 'Öfke raporunu görüntüle';

  @override
  String get statsSummaryButtonSubtitle =>
      'Öfke kalıplarınızı kategoriye göre inceleyin';

  @override
  String get statsSummaryTitle => 'Öfke Raporu';

  @override
  String get statsSummaryClose => 'Kapat';

  @override
  String get statsSummaryEmptyTitle => 'Henüz özetlenecek kayıt yok';

  @override
  String get statsSummaryEmptyBody =>
      'Öfke notlarını ekledikten sonra kategori desenleri burada görünecektir.';

  @override
  String statsSummaryTopHeadline(String category) {
    return 'Sizi en sık \"$category\" kızdırdı';
  }

  @override
  String statsSummaryCategoryHeadline(String category) {
    return '\"$category\" öğesine bakılıyor';
  }

  @override
  String get statsSummaryComfortGeneric => 'Sorun değil. Bu olabilir.';

  @override
  String get statsSummaryComfortFamily =>
      'Birisi ne kadar yakınsa yere inmesi o kadar zor olur.';

  @override
  String get statsSummaryComfortRomance =>
      'Değerli bir ilişki, küçük anların daha keskin hissetmesini sağlayabilir.';

  @override
  String get statsSummaryComfortWork =>
      'İş, zihninizi gitmek istediğinden daha hızlı zorlamış olabilir.';

  @override
  String get statsSummaryComfortPeople =>
      'Başkalarının sözleri ve ifadeleri beklenenden daha uzun süre akılda kalabilir.';

  @override
  String get statsSummaryComfortDriving =>
      'Yoldaki gerilim çoğu zaman önce vücuda ulaşır.';

  @override
  String get statsSummaryMetricCount => 'Sayım';

  @override
  String get statsSummaryMetricCategory => 'Kategori';

  @override
  String get statsSummaryMetricFeed => 'Yayın gönderileri';

  @override
  String get statsSummaryMetricCalm => 'Sakinleşme çabaları';

  @override
  String get statsSummaryMetricAverage => 'Ortalama seviye';

  @override
  String get statsSummaryMetricPeak => 'Tepe seviyesi';

  @override
  String get statsSummaryConclusion => 'Sonuç';

  @override
  String statsSummaryRecordsUnit(int count) {
    return '$count kez';
  }

  @override
  String statsSummaryAverageValue(String value) {
    return '$value/5';
  }

  @override
  String get statsSummaryConclusionTop =>
      'Bu en çok tekrarlanan öfke sinyalinizdir. Bir dahaki sefere öfkeniz tamamen yükselmeden vücut gerginliğinizi kontrol etmeyi deneyin.';

  @override
  String get statsSummaryConclusionCategory =>
      'Bu kategoriyi henüz küçükken not etmek, modeli daha erken fark etmenize yardımcı olabilir.';

  @override
  String statsSummaryPageIndicator(int current, int total) {
    return '$current/$total';
  }

  @override
  String get statsSummaryCategoryShare => 'Kategori payı';

  @override
  String get statsSummaryCalmRate => 'Sakin oran';

  @override
  String get statsSummaryShareRate => 'Hisse oranı';

  @override
  String get noContent => 'İçerik yok';

  @override
  String get voicePlayback => 'Sesi çal';

  @override
  String get deleteConfirm => 'Silinsin mi?';

  @override
  String get delete => 'Sil';

  @override
  String get cancel => 'İptal';

  @override
  String get calmTitle => 'Sakinleş';

  @override
  String get calmSubtitle => 'Hala devam edeni azaltın';

  @override
  String get reminderNotes => 'Hatırlatma notları';

  @override
  String get breathing => 'Nefes alma';

  @override
  String get timeout => 'Zaman aşımı';

  @override
  String get meditation => 'Görüntü meditasyonu';

  @override
  String get feedSupport => 'Besleme desteği';

  @override
  String get calmReminderEmpty => 'Hatırlatıcılar geldiğinde burada görünecek';

  @override
  String get calmReminderFallbackText => 'Bu öfke şimdi nasıl hissettiriyor?';

  @override
  String get calmCheckTitle => 'Şimdi ne kadar kızgınsın?';

  @override
  String calmCheckSubtitle(String emoji, String label) {
    return '$emoji $label · o önceki öfke';
  }

  @override
  String get calmSavedCalmedToast => 'Sakinleştiğine sevindim.';

  @override
  String get calmSavedUpdatedToast => 'Kaydedildi';

  @override
  String get profileName => 'Kızgın Kaplan';

  @override
  String get nicknameAdjectives =>
      'kızgın,öfkeli,öfkeli,patlayıcı,vahşi,hırıltılı,keskin,boynuzlu,ısıtmalı,kaba,şiddetli,kızgın,ateşli,gürültülü,öffing,kaynayan,kırgın,ateşli,fırtınalı,zehirli';

  @override
  String get nicknameAnimals =>
      'kaplan, aslan, kurt, ayı, kartal, köpekbalığı, leopar, çita, timsah, kobra, boğa, domuzu, gergedan, sırtlan, boz ayı, kuzgun, şahin, kirpi, jaguar, puma';

  @override
  String get notificationSettings => 'Bildirimler';

  @override
  String get commentNotification => 'Yorum uyarıları';

  @override
  String get settingsNotificationsSection => 'Bildirimler';

  @override
  String get settingsReminderSubtitle =>
      'Ayarladığınız saatte öfke notu hatırlatıcısı';

  @override
  String get settingsCommentSubtitle =>
      'Birisi gönderinize yorum yaptığında uyarı alın';

  @override
  String get settingsDataSection => 'Veri';

  @override
  String get settingsDataImportSubtitle =>
      'Kayıtları bir yedekleme dosyasından geri yükleme';

  @override
  String get settingsSupportSection => 'Destek';

  @override
  String get settingsPrivacySubtitle => 'Toplanan bilgiler ve kullanım amacı';

  @override
  String get settingsFeedbackTitle => 'Geri bildirim gönder';

  @override
  String get settingsFeedbackSubtitle => 'Sorunlar veya iyileştirme fikirleri';

  @override
  String get settingsRecordCountUnit => 'kayıtlar';

  @override
  String get settingsPostCountUnit => 'gönderiler';

  @override
  String get proPlan => 'PRO veri aktarımı';

  @override
  String get backupImport => 'Verileri içe aktar';

  @override
  String get settingsDataExportSubtitle =>
      'Yedekleme dosyası · geçmiş · paylaşım';

  @override
  String get dataExportTitle => 'Verileri dışa aktar';

  @override
  String get dataExportProTitle => 'PRO veri aktarımı';

  @override
  String get dataExportDescription =>
      'Tüm yerel uygulama verilerini içeren bir yedekleme dosyası oluşturun ve bunu e-posta veya mesajlaşma yoluyla paylaşın.';

  @override
  String get dataExportOneTimePurchase =>
      'Tek seferlik satın alma · ömür boyu erişim';

  @override
  String get dataExportDebugPrice => 'DEBUG';

  @override
  String get dataExportInProgress => 'Dışa aktarma';

  @override
  String get dataExportPaymentChecking => 'Ödeme kontrol ediliyor';

  @override
  String get dataExportCreateButton => 'Dışa aktarma oluştur';

  @override
  String get dataExportPayAndCreateButton => 'Ödeme ve ihracat';

  @override
  String get dataExportRestorePurchase => 'Satın alma işlemini geri yükle';

  @override
  String get dataExportCreatedToast => 'Dışa aktarma dosyası oluşturuldu.';

  @override
  String get dataExportFailedToast => 'Dışa aktarma dosyası oluşturulamadı.';

  @override
  String get dataExportShareSubject => 'Fury Note veri yedekleme';

  @override
  String get dataExportShareText =>
      'Bu bir Fury Note veri yedekleme dosyasıdır.';

  @override
  String get dataExportShareFailedToast => 'Paylaşım sayfası açılamadı.';

  @override
  String get dataExportAllDataIncluded =>
      'Tüm yerel uygulama verileri yedeklemeye dahil edilir';

  @override
  String get dataExportHistoryTitle => 'Dışa aktarma geçmişi';

  @override
  String dataExportHistoryCount(int count) {
    return '$count';
  }

  @override
  String get dataExportShareTooltip => 'Paylaş';

  @override
  String get dataExportEmptyHistory => 'Henüz dışa aktarma dosyası yok.';

  @override
  String get purchaseUpdateFailed => 'Satın alma güncellemesi işlenemedi.';

  @override
  String get purchaseStatusFailed => 'Satın alma durumu kontrol edilemedi.';

  @override
  String get purchaseProductNotFound => 'Mağaza ürünü bulunamadı.';

  @override
  String get purchaseStoreUnavailable => 'Mağazaya bağlanılamadı.';

  @override
  String get purchaseProductInfoFailed => 'Mağaza ürün bilgileri yüklenemedi.';

  @override
  String get purchaseProductUnavailable => 'Ürün bilgileri henüz hazır değil.';

  @override
  String get purchaseStartFailed => 'Satın alma işlemi başlatılamadı.';

  @override
  String get purchaseCanceled => 'Satın alma iptal edildi.';

  @override
  String get purchaseReceiptInvalid => 'Satın alma makbuzu doğrulanamadı.';

  @override
  String get purchaseReceiptVerifyFailed =>
      'Satın alma makbuzu doğrulaması başarısız oldu.';

  @override
  String get dataImportTitle => 'Verileri içe aktar';

  @override
  String get dataImportPickTitle => 'Yedekleme dosyasını seçin';

  @override
  String get dataImportPickDescription =>
      'Bir .fnbackup dosyası seçin\nFury Note\'dan dışa aktarıldı';

  @override
  String get dataImportPickButton => 'Dosya seç';

  @override
  String get dataImportInProgress => 'İthalat';

  @override
  String dataImportSuccessToast(int count) {
    return 'Yedeklemedeki veriler değiştirildi. ($count kayıtlar)';
  }

  @override
  String get dataImportNoNewDataToast =>
      'Yedeklemedeki veriler değiştirildi. (0 kayıt)';

  @override
  String get dataImportFailedToast => 'Yedekleme dosyası içe aktarılamadı.';

  @override
  String get dataImportInvalidFileToast =>
      'Yalnızca .fnbackup dosyaları içe aktarılabilir.';

  @override
  String get dataImportNoticeTitle => 'İçe aktarmadan önce';

  @override
  String get dataImportNoticeBody =>
      'Mevcut veriler silinecek ve yedekleme dosyasındaki verilerle değiştirilecektir.';

  @override
  String get dataImportTransferTitle => 'Cihazları taşıma';

  @override
  String get dataImportTransferBody =>
      'Uygulamayı yeni bir cihaza yükledikten sonra, mevcut yerel verileri yedek verilerle değiştirmek için bir yedekleme dosyasını içe aktarın.';

  @override
  String get feedDeleteTitle => 'Özet Akışını Sil';

  @override
  String get feedDeleteContent => 'Bu yayın silinsin mi?';

  @override
  String get calmBreathingTitle => 'Nefes alma';

  @override
  String get breathPhaseInhale => 'Nefes al';

  @override
  String get breathPhaseHold => 'Basılı tutun';

  @override
  String get breathPhaseExhale => 'Nefes ver';

  @override
  String durationSeconds(int count) {
    return '${count}saniye';
  }

  @override
  String cycleCount(int count) {
    return '$count döngüsü';
  }

  @override
  String get calmTimeoutRunning => 'Koşu';

  @override
  String get calmTimeoutPaused => 'Duraklatıldı';

  @override
  String get reset => 'Sıfırla';

  @override
  String get start => 'Başlat';

  @override
  String get pause => 'Duraklat';

  @override
  String get stop => 'Durdur';

  @override
  String get calmMeditationSceneWave => 'Dalgalar';

  @override
  String get calmMeditationSceneForest => 'Orman';

  @override
  String get calmMeditationSceneSunset => 'Gün batımı';

  @override
  String get calmMeditationSceneMountain => 'Dağ';

  @override
  String get calmMeditationSceneCherryBlossom => 'Kiraz çiçekleri';

  @override
  String get calmMeditationSceneNightSky => 'Gece gökyüzü';

  @override
  String get calmMeditationPrompt => 'Derin nefes alın, sonra nefes verin';

  @override
  String get autoplay => 'Otomatik oynatma';

  @override
  String get profileEditTitle => 'Profili düzenle';

  @override
  String get nicknameLabel => 'Takma ad';

  @override
  String get nicknameHint => 'Bir takma ad girin';

  @override
  String get nicknameRequiredError => 'Lütfen bir takma ad girin';

  @override
  String get nicknameCodeAutomaticError => 'Kodunuz otomatik olarak eklenir';

  @override
  String get nicknameTooShortError => 'En az 2 karakter kullanın';

  @override
  String profileSavedToast(String name) {
    return '✅ \"$name\" olarak değiştirildi!';
  }

  @override
  String get profileSaveFailedToast => 'Kaydedilirken bir hata oluştu.';

  @override
  String get avatarPickGallery => 'Kütüphaneden seç';

  @override
  String get avatarPickCamera => 'Fotoğraf çek';

  @override
  String get avatarReset => 'Varsayılan avatarı kullan';

  @override
  String get avatarResetToast => 'Varsayılan avatar geri yüklendi.';

  @override
  String get avatarAppliedToast => 'Profil fotoğrafı uygulandı.';

  @override
  String get avatarTooLargeToast =>
      'Yalnızca 5 MB\'a kadar olan fotoğraflar kullanılabilir.';

  @override
  String get avatarLoadFailedToast => 'Fotoğraf yüklenemedi.';

  @override
  String get profileCodeLabel => 'Profil kodu (değiştirilemez)';

  @override
  String get profileSaveButton => 'Değişiklikleri kaydet';

  @override
  String get avatarChangeLabel => 'Profil fotoğrafını değiştir';

  @override
  String get avatarChangeHint => 'Değiştirmek için fotoğrafa dokunun';

  @override
  String get avatarSizeHint => 'JPG, PNG, GIF · 5 MB\'a kadar';

  @override
  String get reminderNotificationFallbackBody =>
      'Bu öfke şimdi nasıl hissettiriyor?';

  @override
  String get calmGuideTitle =>
      'Öfke yükseldiğinde\nönce vücudunuzu güvenli bir şekilde indirin';

  @override
  String get calmGuideSubtitle =>
      'Fury Note\'un sakin rehberi size öfkeden kurtulmanızı söylemiyor. Kimsenin canı yanmadan bu duygunun geçmesine yardımcı olacak kısa bir rehber.';

  @override
  String get calmGuideNotice =>
      '**Eğer acil bir tehlikeyle karşı karşıyaysanız**, lütfen bu uygulamada kalmak yerine etrafınızdaki insanlardan yardım isteyin veya önce acil servislerle iletişime geçin.';

  @override
  String get calmGuideMomentTitle => 'Öfkenin arttığı an';

  @override
  String get calmGuideMomentBody1 =>
      'Öfke, önemsediğiniz bir şeyin ihlal edildiğinin bir işareti olabilir. Ancak güçlü bir öfke durumunda yargılama hızlanır ve sözler ve eylemler normalden daha sert hale gelebilir.';

  @override
  String get calmGuideMomentBody2 =>
      'Şu anda ihtiyaç duyulan şey **tamamen rasyonel** olmak değil, **tepkinizi 30 saniye bile geciktirmek**.';

  @override
  String get calmGuideRoutineTitle => '60 saniyelik sakin rutin';

  @override
  String get calmGuideStep1Title => 'Durdur';

  @override
  String get calmGuideStep1Desc =>
      'Yanıtlamayı, aramayı, yorum yapmayı veya taşımayı duraklatın. Ellerinizi gevşetin ve bir anlığına ekrandan uzaklaşın.';

  @override
  String get calmGuideStep2Title => 'Nefes al';

  @override
  String get calmGuideStep2Desc =>
      '4 saniye nefes alın, 7 saniye tutun, 8 saniye nefes verin. Mükemmel değilse sorun değil.';

  @override
  String get calmGuideStep3Title => 'Vücudunuzu kontrol edin';

  @override
  String get calmGuideStep3Desc =>
      'Çenenizin, omuzlarınızın, yumruklarınızın veya karnınızın gergin olup olmadığını kontrol edin ve yalnızca bir noktayı serbest bırakın.';

  @override
  String get calmGuideStep4Title => 'Bunu yaz';

  @override
  String get calmGuideStep4Desc =>
      '\"Şu anda kızgınım çünkü ___\" gibi bir cümle bile yeterli.';

  @override
  String get calmGuideBreathTitle => '4-7-8 nefes alma';

  @override
  String get calmGuideBreathStep1 => '4 saniye boyunca burnunuzdan nefes alın.';

  @override
  String get calmGuideBreathStep2 => 'Nefesinizi 7 saniye boyunca tutun.';

  @override
  String get calmGuideBreathStep3 =>
      '8 saniye boyunca ağzınızdan yavaşça nefes verin.';

  @override
  String get calmGuideBreathStep4 => 'Mümkünse 3 kez tekrarlayın.';

  @override
  String get calmGuideBreathNote =>
      'Nefesinizi bu kadar uzun süre tutmak zorsa, nefesinizi **3-3-5** gibi rahat bir sayıya kadar kısaltın. En önemli şey yavaş, uzun bir nefes vermedir.';

  @override
  String get calmGuideTimeoutTitle => '10 dakikalık zaman aşımı';

  @override
  String get calmGuideTimeoutBody =>
      'Öfke ne kadar güçlü olursa, onu hemen çözme dürtüsü de o kadar güçlü olur. Ancak şimdi konuşmak, önce incitici kelimelerin ortaya çıkmasına neden olabilir.';

  @override
  String get calmGuideTimeoutExamplesTitle => 'Örnek zaman aşımı ifadeleri';

  @override
  String get calmGuideTimeoutExample1 =>
      '\"Şu anda çok kızgınım, 10 dakika sonra tekrar konuşalım.\"';

  @override
  String get calmGuideTimeoutExample2 =>
      '\"Bir anlığına duruyorum çünkü incitici bir şey söyleyebilirim.\"';

  @override
  String get calmGuideTimeoutExample3 =>
      '\"Kaçmıyorum, sadece tekrar konuşmadan önce sakinleşmem gerekiyor.\"';

  @override
  String get calmGuideSensoryTitle => 'Hızlı duyusal topraklama';

  @override
  String get calmGuideSensory1Title => 'Soğuk su';

  @override
  String get calmGuideSensory1Desc =>
      'Bileklerinize veya yüzünüze yaklaşık 10 saniye boyunca soğuk su tutun';

  @override
  String get calmGuideSensory2Title => 'Ayaklarını hisset';

  @override
  String get calmGuideSensory2Desc =>
      'Ayaklarınızın yere değdiğini yavaşça fark edin';

  @override
  String get calmGuideSensory3Title => 'Etrafına bak';

  @override
  String get calmGuideSensory3Desc =>
      'Gördüğünüz 5 nesneyi sessizce adlandırın';

  @override
  String get calmGuideSensory4Title => 'Omuzlarını düşür';

  @override
  String get calmGuideSensory4Desc =>
      'Nefes verin ve omuzlarınızı sadece 1 cm indirin';

  @override
  String get calmGuideQuestionsTitle => 'Yazarken yardımcı olacak sorular';

  @override
  String get calmGuideQuestion1 => 'Beni tam olarak ne kızdırdı?';

  @override
  String get calmGuideQuestion2 => 'Ne bekliyordum ama alamadım?';

  @override
  String get calmGuideQuestion3 =>
      'Şu anda hangi eylemi yapsaydım pişman olurdum?';

  @override
  String get calmGuideQuestion4 => 'Yarın hangi seçim için minnettar olacağım?';

  @override
  String get calmGuideTag1 => 'Duygu günlüğü';

  @override
  String get calmGuideTag2 => 'Öfke uzaklaştırma';

  @override
  String get calmGuideTag3 => 'Hatırlatma kontrolü';

  @override
  String get calmGuideDangerTitle => 'Bu durumlarda ilk önce yardım isteyin';

  @override
  String get calmGuideDanger1 =>
      'Kendinize veya başkalarına zarar verme dürtüsü güçlü hissettiğinde';

  @override
  String get calmGuideDanger2 =>
      'Bir şeyleri fırlatma ya da kırma dürtüsü durmayınca';

  @override
  String get calmGuideDanger3 =>
      'Diğer kişiyle yüzleşmek veya onu tehdit etmek istediğinizde';

  @override
  String get calmGuideDanger4 =>
      'Alkol, uyuşturucu veya şiddetli uyku yoksunluğu kontrolü sürdürmeyi zorlaştırdığında';

  @override
  String get calmGuideDangerBody =>
      'Bu durumlarda, tek başına sakin rutinle bu durumu atlatmaya çalışmayın; etrafınızdaki insanlardan, profesyonel hizmetlerden veya acil servislerden yardım isteyin.';

  @override
  String get calmGuideFooterTitle => 'Fury Note Calm Guide';

  @override
  String get calmGuideFooterDisclaimer =>
      'Bu belge tıbbi teşhis veya tedavinin yerine geçmez.';

  @override
  String get privacyTitle => 'Gizlilik Politikası';

  @override
  String get privacyLastUpdated => 'Yürürlük Tarihi: 16 Haziran 2026';

  @override
  String get privacySection1Title => '1. Toplanan Bilgilerin Kategorileri';

  @override
  String get privacySection1Body =>
      'Fury Note herhangi bir üyelik kaydı gerektirmeden kullanılabilir. Şirket yalnızca aşağıdaki bilgileri toplar.\n· Cihaz tanımlayıcı — dolandırıcılık amaçlı kullanımı önlemek amacıyla kullanıcıyı kayıt olmadan tanımlamak için kullanılan, rastgele verilen bir değer\n· Öfke kaydı verileri — yoğunluk, kategori ve metin (yalnızca cihazda saklanır)\n· Anonim yayın gönderileri — takma ad, avatar resmi, yoğunluk, kategori ve metin\n· Yorumlar — takma ad ve yorum metni\n· Kayıtları beğen - kullanıcının belirli bir gönderiyi beğenip beğenmediği\n· Anlık bildirim belirteci — bildirim göndermek amacıyla (isteğe bağlı)';

  @override
  String get privacySection2Title => '2. İşleme Amacı';

  @override
  String get privacySection2Body =>
      '· Anonim yayın, yorumlar ve beğeniler dahil olmak üzere topluluk özelliklerinin sağlanması\n· Aynı gönderide yinelenen beğenilerin önlenmesi de dahil olmak üzere hileli kullanımın tespiti\n· Yorum uyarıları da dahil olmak üzere anlık bildirimlerin gönderilmesi\n· Hizmetin işleyişi ve hataların analizi';

  @override
  String get privacySection3Title =>
      '3. Üyelik Kaydı Yapılmaz ve Kişisel Bilgiler Saklanmaz';

  @override
  String get privacySection3Body =>
      'Fury Note üyelik kaydı gerektirmez ve isim, e-posta adresi veya telefon numarası gibi kimliği doğrulanabilen kişisel bilgileri toplamaz.\nTakma ad ya otomatik olarak oluşturulur ya da doğrudan kullanıcı tarafından girilir ve kullanıcının gerçek kimliğiyle bağlantılı değildir. Cihaz tanımlayıcı da aynı şekilde rastgele oluşturulmuş bir değerdir ve belirli bir kişiyi tanımlamak için kullanılamaz.';

  @override
  String get privacySection4Title => '4. Üçüncü Taraflara Bilgi Verilmesi';

  @override
  String get privacySection4Body =>
      'Şirket, toplanan bilgileri üçüncü taraflara sağlamaz veya satmaz.';

  @override
  String get privacySection5Title =>
      '5. Bilgilerin Saklanma ve Kullanım Süresi';

  @override
  String get privacySection5Body =>
      '· Yalnızca kaydedilen öfke kayıtları yalnızca cihazda tutulur ve uygulamanın silinmesiyle birlikte silinir.\n· Anonim akışta paylaşılan gönderiler, avatarlar ve yorumlar, kullanıcı tarafından silinene kadar sunucuda tutulur ve talep üzerine derhal silinir.\n· İlgili gönderinin silinmesiyle beğeni kayıtları birlikte silinir.';

  @override
  String get privacySection6Title => '6. İletişim';

  @override
  String get privacySection6Body =>
      'Kişisel bilgilerle ilgili sorularınız için lütfen aşağıdaki e-posta adresiyle iletişime geçin.\nlunlu.co.kr@gmail.com';

  @override
  String get appGuideTitle => 'Fury Note nasıl kullanılır?';

  @override
  String get appGuideSubtitle =>
      'Öfkeyi günlüğe kaydetme, kalıpları izleme ve akışta destek alma kılavuzu.';

  @override
  String get appGuideRecordTitle => 'Öfkenizi kaydedin';

  @override
  String get appGuideRecordBody =>
      'Kızgın olduğunuzda kayıt başlatmak için alttaki 🔥 düğmesine dokunun.';

  @override
  String get appGuideRecordStep1 =>
      'Yoğunluğu seçin: ne kadar kızgın olduğunuza uygun bir emoji seçin';

  @override
  String get appGuideRecordStep2 => 'Bir kategori seçin: bir neden seçin';

  @override
  String get appGuideRecordStep3 =>
      'Yazın: ne olduğunu anlatın (bunu atlayabilirsiniz)';

  @override
  String get appGuideRecordStep4 =>
      'Hatırlatma: Bunu daha sonra tekrar ziyaret etmek istiyorsanız bir zaman belirleyin';

  @override
  String get appGuideRecordStep5 =>
      'Kaydet veya yayınla: kaydı gizli tutun veya akışta paylaşın';

  @override
  String get appGuideFeedTitle => 'Akışta destek bulun';

  @override
  String get appGuideFeedBody =>
      'Öfkenizi paylaşmak, sizi aynı şekilde hisseden başkalarıyla buluşturabilir.';

  @override
  String get appGuideFeedItem1 =>
      'Kaydettikten sonra özet akışına **anonim olarak** paylaşımda bulunabilirsiniz';

  @override
  String get appGuideFeedItem2 =>
      'Başkalarının gönderilerini beğenin veya yorum yapın';

  @override
  String get appGuideFeedItem3 =>
      'Kendi yayınınızı istediğiniz zaman silebilirsiniz';

  @override
  String get appGuideStatsTitle => 'Duygusal kalıplarınızı takip edin';

  @override
  String get appGuideStatsBody =>
      'İstatistikler sekmesi öfke kalıplarınıza geriye dönüp bakmanıza yardımcı olur.';

  @override
  String get appGuideStatsItem1 =>
      'Dönemlere göre öfke yoğunluğu trend grafiği';

  @override
  String get appGuideStatsItem2 => 'Kategoriye göre neden dağılımı';

  @override
  String get appGuideStatsItem3 =>
      'Kayıtlara tarihe göre göz atmak için takvim görünümü';

  @override
  String get appGuideStatsItem4 =>
      'Kalıpları kategoriye göre analiz etmek için öfke raporu';

  @override
  String get appGuideCalmTitle => 'Öfkeni azalt';

  @override
  String get appGuideCalmBody =>
      'Giriş yaptıktan sonra duygularınızı azaltmayı denemek için sakin sekmesine gidin.';

  @override
  String get appGuideCalmItem1 =>
      'Hatırlatma notları: işaretlediğiniz kayıtları daha sonra yeniden ziyaret edin';

  @override
  String get appGuideCalmItem2 =>
      'Nefes alma: 4-7-8 tekniğiyle zihninizi sakinleştirin';

  @override
  String get appGuideCalmItem3 =>
      'Zaman aşımı: 10 dakikalık bir zamanlayıcıyla reaksiyonunuzu yavaşlatın';

  @override
  String get appGuideCalmItem4 =>
      'İmge meditasyonu: doğa görüntüleriyle ruh halinizi değiştirin';

  @override
  String get appGuideProfileTitle => 'Takma ad ve profil';

  @override
  String get appGuideProfileBody =>
      'Takma adınızı ve avatarınızı değiştirmek için menü > Ayarlar\'a gidin.';

  @override
  String get appGuideProfileItem1 =>
      'Takma ad: kendinizinkini yazın veya rastgele bir tane oluşturun';

  @override
  String get appGuideProfileItem2 =>
      'Avatar: Kendinizi bir emojiyle temsil edin';

  @override
  String get appGuideNotificationTitle => 'Bildirim ayarları';

  @override
  String get appGuideNotificationItem1 =>
      'Hatırlatma uyarıları: Belirlediğiniz saatte bir öfke notu hatırlatılır';

  @override
  String get appGuideNotificationItem2 =>
      'Yorum uyarıları: Birisi gönderinize yorum yaptığında bildirim alın';

  @override
  String get appGuideNotificationHint =>
      'Bunları Ayarlar > Bildirimler\'de değiştirin';

  @override
  String get appGuideFooterTitle => 'Fury Note App Guide';
}

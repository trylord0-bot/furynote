// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Fury Note';

  @override
  String get appKoreanName => 'Fury Note';

  @override
  String get record => 'Catat';

  @override
  String get feed => 'Feed';

  @override
  String get stats => 'Statistik';

  @override
  String get calm => 'Tenang';

  @override
  String get settings => 'Pengaturan';

  @override
  String get drawerGuide => 'Panduan app';

  @override
  String get drawerCalmGuide => 'Panduan tenang';

  @override
  String get drawerVersion => 'Fury Note v1.0.0';

  @override
  String get menuTooltip => 'Menu';

  @override
  String drawerRecordCount(String count) {
    return '🔥 $count catatan kemarahan';
  }

  @override
  String get drawerSettingsSubtitle => 'Nama panggilan · pemberitahuan';

  @override
  String get drawerGuideSubtitle => 'Cara menggunakan Fury Note';

  @override
  String get drawerCalmGuideSubtitle => 'Kartu tenang · tips hari ini';

  @override
  String get relativeTimeJustNow => 'Baru saja';

  @override
  String relativeTimeMinutesAgo(int count) {
    return '$count menit yang lalu';
  }

  @override
  String relativeTimeHoursAgo(int count) {
    return '${count}jam yang lalu';
  }

  @override
  String relativeTimeDaysAgo(int count) {
    return '$count hari yang lalu';
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
  String get recordTitle => 'Catatan marah';

  @override
  String get stepIntensity => 'Seberapa marah kamu sekarang?';

  @override
  String get stepIntensitySub => 'Pilih emoji';

  @override
  String get stepCategory => 'Apa penyebabnya?';

  @override
  String get stepCategorySub => 'Pilih satu kategori';

  @override
  String get stepText => 'Apa yang terjadi?';

  @override
  String get stepTextSub => 'Anda dapat melewati ini';

  @override
  String get stepReminder => 'Ingin mengunjunginya lagi nanti?';

  @override
  String get stepReminderSub => 'Anda dapat melewati ini';

  @override
  String get stepSave => 'Simpan catatan ini?';

  @override
  String get stepSaveSub => 'Anda dapat mempostingnya setelah menyimpannya';

  @override
  String get stepPost => 'Bagikan perasaan ini?';

  @override
  String get stepPostSub => 'Ini akan menjadi anonim';

  @override
  String get voiceInput => 'Rekaman suara';

  @override
  String get next => 'Berikutnya';

  @override
  String get previous => 'Sebelumnya';

  @override
  String get skip => 'Lewati';

  @override
  String get save => 'Simpan';

  @override
  String get saveNote => 'Simpan catatan';

  @override
  String get postIt => 'Posting';

  @override
  String get saveOnly => 'Simpan saja';

  @override
  String get feedPostedToast => 'Dikirim untuk memberi makan';

  @override
  String get recordPostedToast => 'Diposting';

  @override
  String get recordSavedToast => 'Disimpan';

  @override
  String get commentPostedToast => 'Komentar diposting';

  @override
  String get commentSendFailedToast =>
      'Tidak dapat mengirimkan komentar. Silakan coba lagi.';

  @override
  String get commentDeleteTitle => 'Hapus komentar';

  @override
  String get commentDeleteContent => 'Hapus komentar ini?';

  @override
  String commentsCount(int count) {
    return '$count komentar';
  }

  @override
  String get commentsEmpty =>
      'Belum ada komentar\nJadilah orang pertama yang meninggalkannya 💬';

  @override
  String get commentInputHint => 'Tulis komentar...';

  @override
  String get apiErrorContentBlockedUrl =>
      'Postingan dengan tautan tidak dapat dikirimkan.';

  @override
  String get apiErrorContentBlockedSpam =>
      'Teks promosi tidak dapat dikirimkan.';

  @override
  String get apiErrorContentBlockedProfanity =>
      'Konten yang mengandung kata-kata kotor tidak dapat dikirimkan.';

  @override
  String get apiErrorContentBlockedModeration =>
      'Konten ini tidak dapat dikirimkan.';

  @override
  String get apiErrorRateLimitExceeded => 'Silakan coba lagi sebentar lagi.';

  @override
  String get apiErrorInternal =>
      'Terjadi kesalahan server. Silakan coba lagi sebentar lagi.';

  @override
  String get apiErrorInvalidRequest => 'Permintaan tidak valid.';

  @override
  String get apiErrorForbidden => 'Anda tidak memiliki izin.';

  @override
  String get apiErrorPostNotFound => 'Postingan tidak ditemukan.';

  @override
  String get apiErrorCommentNotFound => 'Komentar tidak ditemukan.';

  @override
  String get apiErrorSignatureRequired => 'Tanda tangan permintaan diperlukan.';

  @override
  String get apiErrorSignatureInvalid => 'Permintaan tidak valid.';

  @override
  String get apiErrorSignatureExpired =>
      'Permintaan sudah habis masa berlakunya. Silakan coba lagi.';

  @override
  String get apiErrorSignatureReplay => 'Permintaan ini telah diproses.';

  @override
  String get apiErrorUnknown => 'Terjadi kesalahan yang tidak diketahui.';

  @override
  String get reminderNotification => 'Pemberitahuan pengingat';

  @override
  String get noReminder => 'Tidak disetel';

  @override
  String get summaryIntensity => 'Tingkat kemarahan';

  @override
  String get summaryCategory => 'Kategori';

  @override
  String get summaryText => 'Teks';

  @override
  String get summaryReminder => 'Pengingat';

  @override
  String get none => 'Tidak ada';

  @override
  String get other => 'Lainnya';

  @override
  String get family => 'Keluarga';

  @override
  String get romance => 'Percintaan';

  @override
  String get work => 'Bekerja';

  @override
  String get people => 'Orang-orang';

  @override
  String get driving => 'Mengemudi';

  @override
  String get custom => 'Adat';

  @override
  String get recordCustomCategoryHint => 'Masukkan kategori';

  @override
  String get recordTextHint => 'Tulis di sini';

  @override
  String get recordMicPermissionRequired => 'Izin mikrofon diperlukan.';

  @override
  String recordVoiceStartFailed(String label) {
    return 'Tidak dapat memulai $label.';
  }

  @override
  String get recordVoiceStopRecording => 'Berhenti merekam';

  @override
  String get recordVoiceRecordAgain => 'Rekam lagi';

  @override
  String get recordVoiceSaved => 'Rekaman suara disimpan.';

  @override
  String get recordAudioSummaryLabel => 'Suara';

  @override
  String get recordAudioIncluded => 'Rekaman disertakan';

  @override
  String get recordSavingInProgress => 'Menyimpan...';

  @override
  String get recordPostingInProgress => 'Mengirim...';

  @override
  String get recordSaveFailedToast =>
      'Tidak dapat menyimpan catatan. Silakan coba lagi.';

  @override
  String get recordProgressSemantics => 'Catat kemajuan';

  @override
  String get hourSuffix => 'h';

  @override
  String get minuteSuffix => 'm';

  @override
  String get reminderCustom => 'Adat';

  @override
  String get reminderIn30Minutes => 'Dalam 30 menit';

  @override
  String get reminderIn1Hour => 'Dalam 1 jam';

  @override
  String get reminderIn2Hours => 'Dalam 2 jam';

  @override
  String get reminderIn6Hours => 'Dalam 6 jam';

  @override
  String get reminderTomorrow => 'Besok';

  @override
  String get annoyed => 'Kesal';

  @override
  String get angry => 'Marah';

  @override
  String get mad => 'Gila';

  @override
  String get furious => 'Marah';

  @override
  String get rage => 'Kemarahan';

  @override
  String get calmed => 'Tenang';

  @override
  String get feedTitle => 'Feed';

  @override
  String get feedSubtitle => 'Jelajahi kisah kemarahan terkini';

  @override
  String get feedAllTab => 'Semua feed';

  @override
  String get feedMineTab => 'Feed saya';

  @override
  String get feedLoadFailed => 'Tidak dapat memuat feed.';

  @override
  String get feedEmptyMine =>
      'Anda belum memposting ke feed.\nBagikan catatan kemarahan pertama Anda!';

  @override
  String get feedEmptyAll =>
      'Belum ada postingan feed.\nJadilah orang pertama yang mengungkapkan kemarahan Anda!';

  @override
  String get feedPostFailedToast =>
      'Tidak dapat mengirim ke feed. Silakan coba lagi.';

  @override
  String get like => 'Paham';

  @override
  String get comment => 'Komentar';

  @override
  String get retry => 'Coba lagi';

  @override
  String get statsTitle => 'Statistik marah';

  @override
  String get statsSubtitle => 'Lihat pola emosional minggu ini';

  @override
  String get week => '1 minggu';

  @override
  String get month => '1 bulan';

  @override
  String get all => 'Semua';

  @override
  String get totalRecords => 'Catatan';

  @override
  String get highestLevel => 'Tertinggi';

  @override
  String get dailyAverage => 'Rata-rata harian';

  @override
  String get decreaseRate => 'Mengurangi';

  @override
  String get statsIntensityTrend => 'Tren intensitas kemarahan';

  @override
  String get statsCategoryDistribution => 'Menyebabkan distribusi';

  @override
  String get statsNoRecords => 'Tidak ada catatan untuk ditampilkan.';

  @override
  String get statsCalendarButtonTitle => 'Lihat catatan berdasarkan kalender';

  @override
  String get statsCalendarButtonSubtitle =>
      'Periksa dan kelola catatan kemarahan berdasarkan tanggal';

  @override
  String get statsCalendarTitle => 'Lihat catatan berdasarkan kalender';

  @override
  String get statsOtherCategory => 'Lainnya';

  @override
  String selectedDateRecordsTitle(String date) {
    return '$date catatan';
  }

  @override
  String get noRecordsOnSelectedDate =>
      'Tidak ada catatan yang ditulis pada tanggal yang dipilih.';

  @override
  String get reminderAction => 'Pengingat';

  @override
  String get play => 'Putar';

  @override
  String get statsSummaryButtonTitle => 'Lihat laporan kemarahan';

  @override
  String get statsSummaryButtonSubtitle =>
      'Telusuri pola kemarahan Anda berdasarkan kategori';

  @override
  String get statsSummaryTitle => 'Laporan Kemarahan';

  @override
  String get statsSummaryClose => 'Tutup';

  @override
  String get statsSummaryEmptyTitle => 'Belum ada catatan untuk diringkas';

  @override
  String get statsSummaryEmptyBody =>
      'Setelah Anda menambahkan catatan kemarahan, pola kategori akan muncul di sini.';

  @override
  String statsSummaryTopHeadline(String category) {
    return '\"$category\" paling sering membuat Anda marah';
  }

  @override
  String statsSummaryCategoryHeadline(String category) {
    return 'Melihat \"$category\"';
  }

  @override
  String get statsSummaryComfortGeneric => 'Tidak apa-apa. Itu bisa terjadi.';

  @override
  String get statsSummaryComfortFamily =>
      'Semakin dekat seseorang, semakin sulit ia mendarat.';

  @override
  String get statsSummaryComfortRomance =>
      'Hubungan yang berharga bisa membuat momen kecil terasa lebih tajam.';

  @override
  String get statsSummaryComfortWork =>
      'Pekerjaan mungkin telah mendorong pikiran Anda lebih cepat dari yang diharapkan.';

  @override
  String get statsSummaryComfortPeople =>
      'Kata-kata dan ungkapan dari orang lain bisa bertahan lebih lama dari yang diharapkan.';

  @override
  String get statsSummaryComfortDriving =>
      'Ketegangan di jalan seringkali mencapai tubuh terlebih dahulu.';

  @override
  String get statsSummaryMetricCount => 'Hitung';

  @override
  String get statsSummaryMetricCategory => 'Kategori';

  @override
  String get statsSummaryMetricFeed => 'Postingan umpan';

  @override
  String get statsSummaryMetricCalm => 'Tenang mencoba';

  @override
  String get statsSummaryMetricAverage => 'Rata-rata tingkat';

  @override
  String get statsSummaryMetricPeak => 'Tingkat puncak';

  @override
  String get statsSummaryConclusion => 'Kesimpulan';

  @override
  String statsSummaryRecordsUnit(int count) {
    return '$count kali';
  }

  @override
  String statsSummaryAverageValue(String value) {
    return '$value/5';
  }

  @override
  String get statsSummaryConclusionTop =>
      'Ini adalah sinyal kemarahan Anda yang paling sering diulang. Lain kali, cobalah periksa ketegangan tubuh sebelum amarahnya memuncak sepenuhnya.';

  @override
  String get statsSummaryConclusionCategory =>
      'Menuliskan kategori ini selagi masih kecil dapat membantu Anda melihat polanya lebih cepat.';

  @override
  String statsSummaryPageIndicator(int current, int total) {
    return '$current/$total';
  }

  @override
  String get statsSummaryCategoryShare => 'Pembagian kategori';

  @override
  String get statsSummaryCalmRate => 'Tingkat tenang';

  @override
  String get statsSummaryShareRate => 'Tingkat pembagian';

  @override
  String get noContent => 'Tidak ada konten';

  @override
  String get voicePlayback => 'Putar suara';

  @override
  String get deleteConfirm => 'Hapus?';

  @override
  String get delete => 'Hapus';

  @override
  String get cancel => 'Batal';

  @override
  String get calmTitle => 'Tenang';

  @override
  String get calmSubtitle => 'Turunkan apa yang masih tersisa';

  @override
  String get reminderNotes => 'Catatan pengingat';

  @override
  String get breathing => 'Pernapasan';

  @override
  String get timeout => 'Batas waktu';

  @override
  String get meditation => 'Meditasi gambar';

  @override
  String get feedSupport => 'Dukungan pakan';

  @override
  String get calmReminderEmpty =>
      'Pengingat akan muncul di sini ketika mereka tiba';

  @override
  String get calmReminderFallbackText =>
      'Bagaimana perasaan kemarahan itu sekarang?';

  @override
  String get calmCheckTitle => 'Seberapa marah kamu sekarang?';

  @override
  String calmCheckSubtitle(String emoji, String label) {
    return '$emoji $label · kemarahan yang tadi';
  }

  @override
  String get calmSavedCalmedToast => 'Senang kamu bisa tenang.';

  @override
  String get calmSavedUpdatedToast => 'Disimpan';

  @override
  String get profileName => 'Harimau Marah';

  @override
  String get nicknameAdjectives =>
      'marah, berang, mengamuk, meledak-ledak, ganas, menggeram, tajam, bertanduk, panas, kasar, ganas, mengamuk, berapi-api, menggelegar, terengah-engah, mendidih, sebal, menyala-nyala, penuh badai, berbisa';

  @override
  String get nicknameAnimals =>
      'harimau, singa, serigala, beruang, elang, hiu, macan tutul, cheetah, buaya, kobra, banteng, babi hutan, badak, hyena, grizzly, gagak, elang, landak, jaguar, puma';

  @override
  String get notificationSettings => 'Pemberitahuan';

  @override
  String get commentNotification => 'Peringatan komentar';

  @override
  String get settingsNotificationsSection => 'Pemberitahuan';

  @override
  String get settingsReminderSubtitle =>
      'Pengingat catatan kemarahan pada waktu yang Anda atur';

  @override
  String get settingsCommentSubtitle =>
      'Waspada ketika seseorang mengomentari kiriman Anda';

  @override
  String get settingsDataSection => 'Data';

  @override
  String get settingsDataImportSubtitle =>
      'Pulihkan catatan dari file cadangan';

  @override
  String get settingsSupportSection => 'Dukungan';

  @override
  String get settingsPrivacySubtitle =>
      'Informasi yang dikumpulkan dan tujuan penggunaan';

  @override
  String get settingsFeedbackTitle => 'Kirim masukan';

  @override
  String get settingsFeedbackSubtitle => 'Masalah atau ide perbaikan';

  @override
  String get settingsRecordCountUnit => 'catatan';

  @override
  String get settingsPostCountUnit => 'posting';

  @override
  String get proPlan => 'Ekspor data PRO';

  @override
  String get backupImport => 'Impor data';

  @override
  String get settingsDataExportSubtitle => 'File cadangan · riwayat · berbagi';

  @override
  String get dataExportTitle => 'Ekspor data';

  @override
  String get dataExportProTitle => 'Ekspor data PRO';

  @override
  String get dataExportDescription =>
      'Buat satu file cadangan dengan semua data aplikasi lokal dan bagikan melalui email atau messenger.';

  @override
  String get dataExportOneTimePurchase =>
      'Pembelian satu kali · akses seumur hidup';

  @override
  String get dataExportDebugPrice => 'DEBUG';

  @override
  String get dataExportInProgress => 'Mengekspor';

  @override
  String get dataExportPaymentChecking => 'Memeriksa pembayaran';

  @override
  String get dataExportCreateButton => 'Buat ekspor';

  @override
  String get dataExportPayAndCreateButton => 'Bayar dan ekspor';

  @override
  String get dataExportRestorePurchase => 'Pulihkan pembelian';

  @override
  String get dataExportCreatedToast => 'Ekspor file dibuat.';

  @override
  String get dataExportFailedToast => 'Tidak dapat membuat file ekspor.';

  @override
  String get dataExportShareSubject => 'Cadangan data Fury Note';

  @override
  String get dataExportShareText => 'Ini adalah file cadangan data Fury Note.';

  @override
  String get dataExportShareFailedToast =>
      'Tidak dapat membuka lembar berbagi.';

  @override
  String get dataExportAllDataIncluded =>
      'Semua data aplikasi lokal disertakan dalam cadangan';

  @override
  String get dataExportHistoryTitle => 'Ekspor riwayat';

  @override
  String dataExportHistoryCount(int count) {
    return '$count';
  }

  @override
  String get dataExportShareTooltip => 'Bagikan';

  @override
  String get dataExportEmptyHistory => 'Belum ada file ekspor.';

  @override
  String get purchaseUpdateFailed =>
      'Tidak dapat memproses pembaruan pembelian.';

  @override
  String get purchaseStatusFailed => 'Tidak dapat memeriksa status pembelian.';

  @override
  String get purchaseProductNotFound => 'Produk toko tidak ditemukan.';

  @override
  String get purchaseStoreUnavailable => 'Tidak dapat terhubung ke toko.';

  @override
  String get purchaseProductInfoFailed =>
      'Tidak dapat memuat informasi produk toko.';

  @override
  String get purchaseProductUnavailable => 'Informasi produk belum siap.';

  @override
  String get purchaseStartFailed => 'Tidak dapat memulai pembelian.';

  @override
  String get purchaseCanceled => 'Pembelian dibatalkan.';

  @override
  String get purchaseReceiptInvalid =>
      'Tidak dapat memverifikasi tanda terima pembelian.';

  @override
  String get purchaseReceiptVerifyFailed =>
      'Verifikasi tanda terima pembelian gagal.';

  @override
  String get dataImportTitle => 'Impor data';

  @override
  String get dataImportPickTitle => 'Pilih file cadangan';

  @override
  String get dataImportPickDescription =>
      'Pilih file .fnbackup\ndiekspor dari Fury Note';

  @override
  String get dataImportPickButton => 'Pilih berkas';

  @override
  String get dataImportInProgress => 'Mengimpor';

  @override
  String dataImportSuccessToast(int count) {
    return 'Mengganti data dari cadangan. ($count catatan)';
  }

  @override
  String get dataImportNoNewDataToast =>
      'Mengganti data dari cadangan. (0 catatan)';

  @override
  String get dataImportFailedToast => 'Tidak dapat mengimpor file cadangan.';

  @override
  String get dataImportInvalidFileToast =>
      'Hanya file .fnbackup yang dapat diimpor.';

  @override
  String get dataImportNoticeTitle => 'Sebelum mengimpor';

  @override
  String get dataImportNoticeBody =>
      'Data yang ada akan dihapus dan diganti dengan data yang ada di file cadangan.';

  @override
  String get dataImportTransferTitle => 'Perangkat bergerak';

  @override
  String get dataImportTransferBody =>
      'Setelah menginstal aplikasi pada perangkat baru, impor file cadangan untuk mengganti data lokal saat ini dengan data cadangan.';

  @override
  String get feedDeleteTitle => 'Hapus Umpan';

  @override
  String get feedDeleteContent => 'Hapus umpan ini?';

  @override
  String get calmBreathingTitle => 'Pernapasan';

  @override
  String get breathPhaseInhale => 'Tarik napas';

  @override
  String get breathPhaseHold => 'Tahan';

  @override
  String get breathPhaseExhale => 'Buang napas';

  @override
  String durationSeconds(int count) {
    return '${count}detik';
  }

  @override
  String cycleCount(int count) {
    return 'Siklus $count';
  }

  @override
  String get calmTimeoutRunning => 'Berlari';

  @override
  String get calmTimeoutPaused => 'Dijeda';

  @override
  String get reset => 'Reset';

  @override
  String get start => 'Mulai';

  @override
  String get pause => 'Jeda';

  @override
  String get stop => 'Berhenti';

  @override
  String get calmMeditationSceneWave => 'Gelombang';

  @override
  String get calmMeditationSceneForest => 'Hutan';

  @override
  String get calmMeditationSceneSunset => 'Matahari terbenam';

  @override
  String get calmMeditationSceneMountain => 'Gunung';

  @override
  String get calmMeditationSceneCherryBlossom => 'Bunga sakura';

  @override
  String get calmMeditationSceneNightSky => 'Langit malam';

  @override
  String get calmMeditationPrompt => 'Tarik napas dalam-dalam, lalu hembuskan';

  @override
  String get autoplay => 'Putar otomatis';

  @override
  String get profileEditTitle => 'Sunting profil';

  @override
  String get nicknameLabel => 'Nama panggilan';

  @override
  String get nicknameHint => 'Masukkan nama panggilan';

  @override
  String get nicknameRequiredError => 'Silakan masukkan nama panggilan';

  @override
  String get nicknameCodeAutomaticError =>
      'Kode Anda ditambahkan secara otomatis';

  @override
  String get nicknameTooShortError => 'Gunakan minimal 2 karakter';

  @override
  String profileSavedToast(String name) {
    return '✅ Berubah menjadi \"$name\"!';
  }

  @override
  String get profileSaveFailedToast => 'Terjadi kesalahan saat menyimpan.';

  @override
  String get avatarPickGallery => 'Pilih dari perpustakaan';

  @override
  String get avatarPickCamera => 'Ambil foto';

  @override
  String get avatarReset => 'Gunakan avatar bawaan';

  @override
  String get avatarResetToast => 'Avatar default dipulihkan.';

  @override
  String get avatarAppliedToast => 'Foto profil diterapkan.';

  @override
  String get avatarTooLargeToast =>
      'Hanya foto berukuran maksimal 5 MB yang dapat digunakan.';

  @override
  String get avatarLoadFailedToast => 'Tidak dapat memuat foto.';

  @override
  String get profileCodeLabel => 'Kode profil (tidak dapat diubah)';

  @override
  String get profileSaveButton => 'Simpan perubahan';

  @override
  String get avatarChangeLabel => 'Ganti foto profil';

  @override
  String get avatarChangeHint => 'Ketuk foto untuk mengubahnya';

  @override
  String get avatarSizeHint => 'JPG, PNG, GIF · hingga 5 MB';

  @override
  String get reminderNotificationFallbackBody =>
      'Bagaimana perasaan kemarahan itu sekarang?';

  @override
  String get calmGuideTitle =>
      'Ketika kemarahan meningkat,\nturunkan tubuhmu dengan aman terlebih dahulu';

  @override
  String get calmGuideSubtitle =>
      'Panduan tenang Fury Note tidak menyuruh Anda menghilangkan amarah. Ini adalah panduan singkat untuk membantu perasaan itu berlalu tanpa ada yang terluka.';

  @override
  String get calmGuideNotice =>
      '**Jika Anda berada dalam bahaya**, mintalah bantuan orang-orang di sekitar Anda atau hubungi layanan darurat terlebih dahulu, daripada terus menggunakan aplikasi ini.';

  @override
  String get calmGuideMomentTitle => 'Saat kemarahan meningkat';

  @override
  String get calmGuideMomentBody1 =>
      'Kemarahan bisa menjadi sinyal bahwa sesuatu yang Anda sayangi telah dilanggar. Namun dalam keadaan marah yang kuat, penilaian menjadi lebih cepat, dan perkataan serta tindakan bisa menjadi lebih kasar dari biasanya.';

  @override
  String get calmGuideMomentBody2 =>
      'Apa yang dibutuhkan saat ini bukanlah menjadi **rasional sepenuhnya**, namun **menunda reaksi Anda bahkan selama 30 detik**.';

  @override
  String get calmGuideRoutineTitle => 'Rutinitas tenang 60 detik';

  @override
  String get calmGuideStep1Title => 'Berhenti';

  @override
  String get calmGuideStep1Desc =>
      'Jeda membalas, menelepon, berkomentar, atau memindahkan. Relakskan tangan Anda dan alihkan pandangan dari layar sejenak.';

  @override
  String get calmGuideStep2Title => 'Bernafas';

  @override
  String get calmGuideStep2Desc =>
      'Tarik napas selama 4 detik, tahan selama 7, buang napas selama 8. Tidak apa-apa jika belum sempurna.';

  @override
  String get calmGuideStep3Title => 'Periksa tubuh Anda';

  @override
  String get calmGuideStep3Desc =>
      'Periksa apakah rahang, bahu, kepalan tangan, atau perut Anda tegang, dan lepaskan satu titik saja.';

  @override
  String get calmGuideStep4Title => 'Tuliskan';

  @override
  String get calmGuideStep4Desc =>
      'Bahkan satu kalimat seperti \"Saat ini aku sedang marah karena ___\" sudah cukup.';

  @override
  String get calmGuideBreathTitle => '4-7-8 pernapasan';

  @override
  String get calmGuideBreathStep1 =>
      'Tarik napas melalui hidung selama 4 detik.';

  @override
  String get calmGuideBreathStep2 => 'Tahan napas Anda selama 7 detik.';

  @override
  String get calmGuideBreathStep3 =>
      'Buang napas perlahan melalui mulut selama 8 detik.';

  @override
  String get calmGuideBreathStep4 => 'Ulangi 3 kali jika Anda bisa.';

  @override
  String get calmGuideBreathNote =>
      'Jika sulit menahan napas selama itu, persingkat menjadi hitungan yang nyaman seperti **3-3-5**. Yang paling penting adalah hembusan napas yang perlahan dan panjang.';

  @override
  String get calmGuideTimeoutTitle => 'Batas waktu 10 menit';

  @override
  String get calmGuideTimeoutBody =>
      'Semakin kuat amarahnya, semakin kuat pula dorongan untuk segera menyelesaikannya. Namun berbicara sekarang mungkin akan memunculkan kata-kata yang menyakitkan terlebih dahulu.';

  @override
  String get calmGuideTimeoutExamplesTitle => 'Contoh frasa batas waktu';

  @override
  String get calmGuideTimeoutExample1 =>
      '“Aku terlalu marah sekarang, ayo kita bicara lagi 10 menit lagi.”';

  @override
  String get calmGuideTimeoutExample2 =>
      '“Saya berhenti sejenak karena saya mungkin mengatakan sesuatu yang menyakitkan.”';

  @override
  String get calmGuideTimeoutExample3 =>
      '\"Aku tidak akan melarikan diri, aku hanya perlu menenangkan diri sebelum kita bicara lagi.\"';

  @override
  String get calmGuideSensoryTitle => 'Landasan sensorik yang cepat';

  @override
  String get calmGuideSensory1Title => 'Air dingin';

  @override
  String get calmGuideSensory1Desc =>
      'Tahan air dingin di pergelangan tangan atau wajah Anda selama sekitar 10 detik';

  @override
  String get calmGuideSensory2Title => 'Rasakan kakimu';

  @override
  String get calmGuideSensory2Desc =>
      'Perlahan perhatikan perasaan kaki Anda menyentuh lantai';

  @override
  String get calmGuideSensory3Title => 'Lihatlah sekeliling';

  @override
  String get calmGuideSensory3Desc =>
      'Sebutkan dengan tenang 5 benda yang dapat kamu lihat';

  @override
  String get calmGuideSensory4Title => 'Jatuhkan bahu Anda';

  @override
  String get calmGuideSensory4Desc =>
      'Buang napas dan turunkan bahu Anda hanya 1 cm';

  @override
  String get calmGuideQuestionsTitle => 'Pertanyaan yang membantu saat menulis';

  @override
  String get calmGuideQuestion1 => 'Apa sebenarnya yang membuatku marah?';

  @override
  String get calmGuideQuestion2 =>
      'Apa yang saya harapkan tetapi tidak saya terima?';

  @override
  String get calmGuideQuestion3 =>
      'Tindakan apa yang akan saya sesali jika saya melakukannya sekarang?';

  @override
  String get calmGuideQuestion4 => 'Pilihan apa yang akan saya syukuri besok?';

  @override
  String get calmGuideTag1 => 'Catatan emosi';

  @override
  String get calmGuideTag2 => 'Jarak kemarahan';

  @override
  String get calmGuideTag3 => 'Pemeriksaan pengingat';

  @override
  String get calmGuideDangerTitle =>
      'Mintalah bantuan terlebih dahulu dalam kasus ini';

  @override
  String get calmGuideDanger1 =>
      'Ketika keinginan untuk menyakiti diri sendiri atau orang lain terasa kuat';

  @override
  String get calmGuideDanger2 =>
      'Ketika keinginan untuk melempar atau menghancurkan barang tidak kunjung berhenti';

  @override
  String get calmGuideDanger3 =>
      'Saat Anda merasa ingin berkonfrontasi atau mengancam orang lain';

  @override
  String get calmGuideDanger4 =>
      'Ketika alkohol, obat-obatan, atau kurang tidur membuat Anda sulit mengendalikan diri';

  @override
  String get calmGuideDangerBody =>
      'Dalam kasus ini, jangan mencoba menjalaninya hanya dengan rutinitas yang tenang — mintalah bantuan orang-orang di sekitar Anda, layanan profesional, atau layanan darurat.';

  @override
  String get calmGuideFooterTitle => 'Fury Note Calm Guide';

  @override
  String get calmGuideFooterDisclaimer =>
      'Dokumen ini tidak menggantikan diagnosis atau pengobatan medis.';

  @override
  String get privacyTitle => 'Kebijakan Privasi';

  @override
  String get privacyLastUpdated => 'Tanggal Efektif: 16 Juni 2026';

  @override
  String get privacySection1Title => '1. Kategori Informasi yang Dikumpulkan';

  @override
  String get privacySection1Body =>
      'Fury Note dapat digunakan tanpa registrasi keanggotaan apa pun. Perusahaan hanya mengumpulkan informasi berikut.\n· Pengidentifikasi perangkat — nilai yang dikeluarkan secara acak yang digunakan untuk mengidentifikasi pengguna tanpa registrasi, untuk tujuan mencegah penggunaan yang curang\n· Data rekaman kemarahan — intensitas, kategori, dan teks (disimpan di perangkat saja)\n· Postingan feed anonim — nama panggilan, gambar avatar, intensitas, kategori, dan teks\n· Komentar — nama panggilan dan teks komentar\n· Catatan suka — apakah pengguna menyukai kiriman tertentu\n· Token pemberitahuan push — untuk tujuan pengiriman pemberitahuan (opsional)';

  @override
  String get privacySection2Title => '2. Tujuan Pengolahan';

  @override
  String get privacySection2Body =>
      '· Penyediaan fitur komunitas, termasuk feed anonim, komentar, dan suka\n· Deteksi penggunaan penipuan, termasuk pencegahan duplikat suka pada postingan yang sama\n· Mengirim pemberitahuan push, termasuk peringatan komentar\n· Pengoperasian layanan dan analisis kesalahan';

  @override
  String get privacySection3Title =>
      '3. Tidak Ada Pendaftaran Keanggotaan dan Tidak Ada Penyimpanan Informasi Pribadi';

  @override
  String get privacySection3Body =>
      'Fury Note tidak memerlukan pendaftaran keanggotaan dan tidak mengumpulkan informasi pribadi yang dapat diverifikasi identitas seperti nama, alamat email, atau nomor telepon.\nNama panggilan dibuat secara otomatis atau dimasukkan langsung oleh pengguna dan tidak terkait dengan identitas asli pengguna. Pengidentifikasi perangkat juga merupakan nilai yang dihasilkan secara acak yang tidak dapat digunakan untuk mengidentifikasi individu tertentu.';

  @override
  String get privacySection4Title =>
      '4. Pemberian Informasi kepada Pihak Ketiga';

  @override
  String get privacySection4Body =>
      'Perusahaan tidak menyediakan atau menjual informasi yang dikumpulkan kepada pihak ketiga.';

  @override
  String get privacySection5Title =>
      '5. Periode Penyimpanan dan Penggunaan Informasi';

  @override
  String get privacySection5Body =>
      '· Catatan kemarahan yang hanya disimpan disimpan di perangkat saja dan dihapus bersamaan setelah aplikasi dihapus.\n· Postingan, avatar, dan komentar yang dibagikan ke feed anonim disimpan di server hingga dihapus oleh pengguna, dan segera dihapus setelah permintaan tersebut.\n· Catatan suka dihapus bersamaan setelah penghapusan postingan terkait.';

  @override
  String get privacySection6Title => '6. Kontak';

  @override
  String get privacySection6Body =>
      'Untuk pertanyaan mengenai informasi pribadi, silakan hubungi alamat email di bawah ini.\nlunlu.co.kr@gmail.com';

  @override
  String get appGuideTitle => 'Cara menggunakan Catatan Kemarahan';

  @override
  String get appGuideSubtitle =>
      'Panduan untuk mencatat kemarahan, melacak pola, dan mendapatkan dukungan melalui feed.';

  @override
  String get appGuideRecordTitle => 'Catat kemarahan Anda';

  @override
  String get appGuideRecordBody =>
      'Saat Anda marah, ketuk tombol 🔥 di bagian bawah untuk mulai merekam.';

  @override
  String get appGuideRecordStep1 =>
      'Pilih intensitas: pilih emoji yang sesuai dengan tingkat kemarahan Anda';

  @override
  String get appGuideRecordStep2 => 'Pilih kategori: pilih satu penyebab';

  @override
  String get appGuideRecordStep3 =>
      'Tuliskan: jelaskan apa yang terjadi (Anda dapat melewati ini)';

  @override
  String get appGuideRecordStep4 =>
      'Pengingat: tetapkan waktu jika Anda ingin mengulanginya lagi nanti';

  @override
  String get appGuideRecordStep5 =>
      'Simpan atau poskan: simpan catatan pribadi atau bagikan ke umpan';

  @override
  String get appGuideFeedTitle => 'Temukan dukungan di feed';

  @override
  String get appGuideFeedBody =>
      'Berbagi kemarahan dapat menghubungkan Anda dengan orang lain yang merasakan hal yang sama.';

  @override
  String get appGuideFeedItem1 =>
      'Setelah menyimpan, Anda dapat memposting **secara anonim** ke feed';

  @override
  String get appGuideFeedItem2 => 'Sukai atau komentari postingan orang lain';

  @override
  String get appGuideFeedItem3 =>
      'Anda dapat menghapus postingan Anda sendiri kapan saja';

  @override
  String get appGuideStatsTitle => 'Lacak pola emosional Anda';

  @override
  String get appGuideStatsBody =>
      'Tab statistik membantu Anda melihat kembali pola kemarahan Anda.';

  @override
  String get appGuideStatsItem1 =>
      'Grafik tren intensitas kemarahan berdasarkan periode';

  @override
  String get appGuideStatsItem2 =>
      'Menyebabkan distribusi berdasarkan kategori';

  @override
  String get appGuideStatsItem3 =>
      'Tampilan kalender untuk menelusuri catatan berdasarkan tanggal';

  @override
  String get appGuideStatsItem4 =>
      'Laporan kemarahan untuk menganalisis pola berdasarkan kategori';

  @override
  String get appGuideCalmTitle => 'Turunkan amarahmu';

  @override
  String get appGuideCalmBody =>
      'Setelah masuk, buka tab tenang untuk mencoba menurunkan emosi Anda.';

  @override
  String get appGuideCalmItem1 =>
      'Catatan pengingat: kunjungi kembali catatan yang Anda tandai untuk nanti';

  @override
  String get appGuideCalmItem2 =>
      'Pernafasan: tenangkan pikiran Anda dengan teknik 4-7-8';

  @override
  String get appGuideCalmItem3 =>
      'Batas waktu: memperlambat reaksi Anda dengan pengatur waktu 10 menit';

  @override
  String get appGuideCalmItem4 =>
      'Meditasi gambar: ubah suasana hati Anda dengan gambaran alam';

  @override
  String get appGuideProfileTitle => 'Nama panggilan dan profil';

  @override
  String get appGuideProfileBody =>
      'Buka menu > Pengaturan untuk mengubah nama panggilan dan avatar Anda.';

  @override
  String get appGuideProfileItem1 =>
      'Nama panggilan: ketik sendiri atau buat nama panggilan secara acak';

  @override
  String get appGuideProfileItem2 => 'Avatar: mewakili diri Anda dengan emoji';

  @override
  String get appGuideNotificationTitle => 'Pengaturan notifikasi';

  @override
  String get appGuideNotificationItem1 =>
      'Peringatan pengingat: dapatkan pengingat akan catatan kemarahan pada waktu yang Anda tentukan';

  @override
  String get appGuideNotificationItem2 =>
      'Peringatan komentar: dapatkan pemberitahuan ketika seseorang mengomentari kiriman Anda';

  @override
  String get appGuideNotificationHint =>
      'Alihkan ini di Pengaturan > Pemberitahuan';

  @override
  String get appGuideFooterTitle => 'Fury Note App Guide';
}

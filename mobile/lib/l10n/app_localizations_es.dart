// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Fury Note';

  @override
  String get appKoreanName => 'Fury Note';

  @override
  String get record => 'Registro';

  @override
  String get feed => 'Feed';

  @override
  String get stats => 'Estadísticas';

  @override
  String get calm => 'Calma';

  @override
  String get settings => 'Ajustes';

  @override
  String get drawerGuide => 'Guía de la app';

  @override
  String get drawerCalmGuide => 'Guía de calma';

  @override
  String get drawerVersion => 'Fury Note v1.0.0';

  @override
  String get menuTooltip => 'Menú';

  @override
  String drawerRecordCount(String count) {
    return '🔥 $count notas de rabia';
  }

  @override
  String get drawerSettingsSubtitle => 'Apodo · notificaciones';

  @override
  String get drawerGuideSubtitle => 'Cómo usar Fury Note';

  @override
  String get drawerCalmGuideSubtitle => 'Tarjetas de calma · consejos de hoy';

  @override
  String get relativeTimeJustNow => 'En este momento';

  @override
  String relativeTimeMinutesAgo(int count) {
    return '$count hace minutos';
  }

  @override
  String relativeTimeHoursAgo(int count) {
    return '${count}hace horas';
  }

  @override
  String relativeTimeDaysAgo(int count) {
    return '$count hace días';
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
  String get recordTitle => 'Registro de ira';

  @override
  String get stepIntensity => '¿Qué tan enojado estás ahora?';

  @override
  String get stepIntensitySub => 'Elige un emoji';

  @override
  String get stepCategory => '¿Qué lo causó?';

  @override
  String get stepCategorySub => 'Elige una categoría';

  @override
  String get stepText => '¿Qué pasó?';

  @override
  String get stepTextSub => 'Puedes saltarte esto';

  @override
  String get stepReminder => '¿Quieres volver a visitarlo más tarde?';

  @override
  String get stepReminderSub => 'Puedes saltarte esto';

  @override
  String get stepSave => '¿Guardar esta nota?';

  @override
  String get stepSaveSub => 'Puedes publicarlo después de guardar.';

  @override
  String get stepPost => '¿Compartes este sentimiento?';

  @override
  String get stepPostSub => 'sera anónimo';

  @override
  String get voiceInput => 'Grabación de voz';

  @override
  String get next => 'Siguiente';

  @override
  String get previous => 'Anterior';

  @override
  String get skip => 'Omitir';

  @override
  String get save => 'Guardar';

  @override
  String get saveNote => 'Guardar nota';

  @override
  String get postIt => 'Publicar';

  @override
  String get saveOnly => 'Solo guardar';

  @override
  String get feedPostedToast => 'Enviado a alimentar';

  @override
  String get recordPostedToast => 'Al corriente';

  @override
  String get recordSavedToast => 'Guardado';

  @override
  String get commentPostedToast => 'Comentario publicado';

  @override
  String get commentSendFailedToast =>
      'No se pudo enviar el comentario. Por favor inténtalo de nuevo.';

  @override
  String get commentDeleteTitle => 'Eliminar comentario';

  @override
  String get commentDeleteContent => '¿Eliminar este comentario?';

  @override
  String commentsCount(int count) {
    return '$count comentarios';
  }

  @override
  String get commentsEmpty =>
      'Aún no hay comentarios\nSé el primero en dejar uno 💬';

  @override
  String get commentInputHint => 'Escribe un comentario...';

  @override
  String get apiErrorContentBlockedUrl =>
      'No se pueden enviar publicaciones con enlaces.';

  @override
  String get apiErrorContentBlockedSpam =>
      'No se puede enviar texto promocional.';

  @override
  String get apiErrorContentBlockedProfanity =>
      'No se puede enviar contenido que contenga malas palabras.';

  @override
  String get apiErrorContentBlockedModeration =>
      'Este contenido no se puede enviar.';

  @override
  String get apiErrorRateLimitExceeded => 'Inténtelo de nuevo en un momento.';

  @override
  String get apiErrorInternal =>
      'Se produjo un error en el servidor. Inténtelo de nuevo en un momento.';

  @override
  String get apiErrorInvalidRequest => 'Solicitud no válida.';

  @override
  String get apiErrorForbidden => 'No tienes permiso.';

  @override
  String get apiErrorPostNotFound => 'Publicación no encontrada.';

  @override
  String get apiErrorCommentNotFound => 'Comentario no encontrado.';

  @override
  String get apiErrorSignatureRequired =>
      'Se requiere la firma de la solicitud.';

  @override
  String get apiErrorSignatureInvalid => 'Solicitud no válida.';

  @override
  String get apiErrorSignatureExpired =>
      'La solicitud expiró. Por favor inténtalo de nuevo.';

  @override
  String get apiErrorSignatureReplay => 'Esta solicitud ya ha sido procesada.';

  @override
  String get apiErrorUnknown => 'Se produjo un error desconocido.';

  @override
  String get reminderNotification => 'Notificación de recordatorio';

  @override
  String get noReminder => 'No establecido';

  @override
  String get summaryIntensity => 'nivel de ira';

  @override
  String get summaryCategory => 'Categoría';

  @override
  String get summaryText => 'Texto';

  @override
  String get summaryReminder => 'Recordatorio';

  @override
  String get none => 'Ninguno';

  @override
  String get other => 'Otro';

  @override
  String get family => 'Familia';

  @override
  String get romance => 'romance';

  @override
  String get work => 'Trabajar';

  @override
  String get people => 'Gente';

  @override
  String get driving => 'Conduciendo';

  @override
  String get custom => 'Costumbre';

  @override
  String get recordCustomCategoryHint => 'Introduce una categoría';

  @override
  String get recordTextHint => 'Escríbelo aquí';

  @override
  String get recordMicPermissionRequired =>
      'Se requiere permiso para el micrófono.';

  @override
  String recordVoiceStartFailed(String label) {
    return 'No se pudo iniciar $label.';
  }

  @override
  String get recordVoiceStopRecording => 'dejar de grabar';

  @override
  String get recordVoiceRecordAgain => 'Grabar de nuevo';

  @override
  String get recordVoiceSaved => 'Grabación de voz guardada.';

  @override
  String get recordAudioSummaryLabel => 'Voz';

  @override
  String get recordAudioIncluded => 'Grabación incluida';

  @override
  String get recordSavingInProgress => 'Ahorro...';

  @override
  String get recordPostingInProgress => 'Envío...';

  @override
  String get recordSaveFailedToast =>
      'No se pudo guardar la nota. Por favor inténtalo de nuevo.';

  @override
  String get recordProgressSemantics => 'Progreso récord';

  @override
  String get hourSuffix => 'h';

  @override
  String get minuteSuffix => 'metro';

  @override
  String get reminderCustom => 'Costumbre';

  @override
  String get reminderIn30Minutes => 'en 30 minutos';

  @override
  String get reminderIn1Hour => 'en 1 hora';

  @override
  String get reminderIn2Hours => 'en 2 horas';

  @override
  String get reminderIn6Hours => 'en 6 horas';

  @override
  String get reminderTomorrow => 'Mañana';

  @override
  String get annoyed => 'Enojado';

  @override
  String get angry => 'Enojado';

  @override
  String get mad => 'Enojado';

  @override
  String get furious => 'Furioso';

  @override
  String get rage => 'Furia';

  @override
  String get calmed => 'Calma';

  @override
  String get feedTitle => 'Feed';

  @override
  String get feedSubtitle => 'Explora historias recientes de ira';

  @override
  String get feedAllTab => 'Todo el feed';

  @override
  String get feedMineTab => 'Mi feed';

  @override
  String get feedLoadFailed => 'No se pudo cargar el feed.';

  @override
  String get feedEmptyMine =>
      'Aún no has publicado en el feed.\n¡Comparte tu primera nota de ira!';

  @override
  String get feedEmptyAll =>
      'Aún no hay publicaciones en el feed.\n¡Sé el primero en compartir tu enfado!';

  @override
  String get feedPostFailedToast =>
      'No se pudo enviar al feed. Por favor inténtalo de nuevo.';

  @override
  String get like => 'Me identifico';

  @override
  String get comment => 'Comentario';

  @override
  String get retry => 'Reintentar';

  @override
  String get statsTitle => 'Estadísticas de ira';

  @override
  String get statsSubtitle => 'Observa el patrón emocional de esta semana';

  @override
  String get week => '1 semana';

  @override
  String get month => '1 mes';

  @override
  String get all => 'Todo';

  @override
  String get totalRecords => 'Archivos';

  @override
  String get highestLevel => 'más alto';

  @override
  String get dailyAverage => 'Promedio diario';

  @override
  String get decreaseRate => 'Disminuir';

  @override
  String get statsIntensityTrend => 'Tendencia de intensidad de la ira';

  @override
  String get statsCategoryDistribution => 'Distribución de causas';

  @override
  String get statsNoRecords => 'No hay registros que mostrar.';

  @override
  String get statsCalendarButtonTitle => 'Ver registros por calendario';

  @override
  String get statsCalendarButtonSubtitle =>
      'Verifique y administre notas de ira por fecha';

  @override
  String get statsCalendarTitle => 'Ver registros por calendario';

  @override
  String get statsOtherCategory => 'Otro';

  @override
  String selectedDateRecordsTitle(String date) {
    return '$date registros';
  }

  @override
  String get noRecordsOnSelectedDate =>
      'No se escribieron registros en la fecha seleccionada.';

  @override
  String get reminderAction => 'Recordatorio';

  @override
  String get play => 'Reproducir';

  @override
  String get statsSummaryButtonTitle => 'Ver informe de ira';

  @override
  String get statsSummaryButtonSubtitle =>
      'Hojea tus patrones de ira por categoría';

  @override
  String get statsSummaryTitle => 'Informe de ira';

  @override
  String get statsSummaryClose => 'Cerca';

  @override
  String get statsSummaryEmptyTitle => 'Aún no hay registros para resumir';

  @override
  String get statsSummaryEmptyBody =>
      'Una vez que agregues notas de ira, los patrones de categorías aparecerán aquí.';

  @override
  String statsSummaryTopHeadline(String category) {
    return '\"$category\" te hacía enojar con mayor frecuencia';
  }

  @override
  String statsSummaryCategoryHeadline(String category) {
    return 'Mirando \"$category\"';
  }

  @override
  String get statsSummaryComfortGeneric => 'Está bien. Eso puede suceder.';

  @override
  String get statsSummaryComfortFamily =>
      'Cuanto más cerca esté alguien, más fuerte podrá aterrizar.';

  @override
  String get statsSummaryComfortRomance =>
      'Una relación preciosa puede hacer que los pequeños momentos se sientan más nítidos.';

  @override
  String get statsSummaryComfortWork =>
      'Es posible que el trabajo haya impulsado tu mente más rápido de lo que quería.';

  @override
  String get statsSummaryComfortPeople =>
      'Las palabras y expresiones de los demás pueden durar más de lo esperado.';

  @override
  String get statsSummaryComfortDriving =>
      'La tensión en el camino muchas veces llega primero al cuerpo.';

  @override
  String get statsSummaryMetricCount => 'Contar';

  @override
  String get statsSummaryMetricCategory => 'Categoría';

  @override
  String get statsSummaryMetricFeed => 'Publicaciones de noticias';

  @override
  String get statsSummaryMetricCalm => 'intentos tranquilos';

  @override
  String get statsSummaryMetricAverage => 'Promedio nivel';

  @override
  String get statsSummaryMetricPeak => 'nivel pico';

  @override
  String get statsSummaryConclusion => 'Conclusión';

  @override
  String statsSummaryRecordsUnit(int count) {
    return '$count veces';
  }

  @override
  String statsSummaryAverageValue(String value) {
    return '$value/5';
  }

  @override
  String get statsSummaryConclusionTop =>
      'Esta es tu señal de enojo más repetida. La próxima vez, intenta controlar la tensión corporal antes de que la ira aumente por completo.';

  @override
  String get statsSummaryConclusionCategory =>
      'Anotar esta categoría cuando aún es pequeña puede ayudarte a notar el patrón antes.';

  @override
  String statsSummaryPageIndicator(int current, int total) {
    return '$current/$total';
  }

  @override
  String get statsSummaryCategoryShare => 'Cuota de categoría';

  @override
  String get statsSummaryCalmRate => 'ritmo tranquilo';

  @override
  String get statsSummaryShareRate => 'Tasa de participación';

  @override
  String get noContent => 'Sin contenido';

  @override
  String get voicePlayback => 'reproducir voz';

  @override
  String get deleteConfirm => '¿Borrar?';

  @override
  String get delete => 'Eliminar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get calmTitle => 'Calma';

  @override
  String get calmSubtitle => 'Baja poco a poco lo que aún queda';

  @override
  String get reminderNotes => 'Notas recordatorias';

  @override
  String get breathing => 'Respiración';

  @override
  String get timeout => 'Se acabó el tiempo';

  @override
  String get meditation => 'Meditación de imagen';

  @override
  String get feedSupport => 'Soporte de alimentación';

  @override
  String get calmReminderEmpty =>
      'Los recordatorios aparecerán aquí cuando lleguen.';

  @override
  String get calmReminderFallbackText => '¿Cómo se siente esa ira ahora?';

  @override
  String get calmCheckTitle => '¿Qué tan enojado estás ahora?';

  @override
  String calmCheckSubtitle(String emoji, String label) {
    return '$emoji $label · ese enojo anterior';
  }

  @override
  String get calmSavedCalmedToast => 'Me alegra que te hayas calmado.';

  @override
  String get calmSavedUpdatedToast => 'Guardado';

  @override
  String get profileName => 'tigre enojado';

  @override
  String get nicknameAdjectives =>
      'enojado, furioso, furioso, explosivo, feroz, gruñido, agudo, con cuernos, acalorado, áspero, feroz, furioso, ardiente, atronador, resoplando, hirviendo, resentido, ardiente, tormentoso, venenoso';

  @override
  String get nicknameAnimals =>
      'tigre, león, lobo, oso, águila, tiburón, leopardo, guepardo, cocodrilo, cobra, toro, jabalí, rinoceronte, hiena, oso pardo, cuervo, halcón, erizo, jaguar, puma';

  @override
  String get notificationSettings => 'Notificaciones';

  @override
  String get commentNotification => 'Alertas de comentarios';

  @override
  String get settingsNotificationsSection => 'Notificaciones';

  @override
  String get settingsReminderSubtitle =>
      'Recordatorio de nota de ira en el momento que establezcas';

  @override
  String get settingsCommentSubtitle =>
      'Alerta cuando alguien comenta tu publicación';

  @override
  String get settingsDataSection => 'Datos';

  @override
  String get settingsDataImportSubtitle =>
      'Restaurar registros desde un archivo de respaldo';

  @override
  String get settingsSupportSection => 'Apoyo';

  @override
  String get settingsPrivacySubtitle =>
      'Información recopilada y finalidad de uso.';

  @override
  String get settingsFeedbackTitle => 'Enviar comentarios';

  @override
  String get settingsFeedbackSubtitle => 'Problemas o ideas de mejora.';

  @override
  String get settingsRecordCountUnit => 'archivos';

  @override
  String get settingsPostCountUnit => 'publicaciones';

  @override
  String get proPlan => 'Exportación de datos PRO';

  @override
  String get backupImport => 'Importar datos';

  @override
  String get settingsDataExportSubtitle =>
      'Archivo de copia de seguridad · historial · compartir';

  @override
  String get dataExportTitle => 'Exportar datos';

  @override
  String get dataExportProTitle => 'Exportación de datos PRO';

  @override
  String get dataExportDescription =>
      'Cree un archivo de copia de seguridad con todos los datos de la aplicación local y compártalo por correo electrónico o mensajería.';

  @override
  String get dataExportOneTimePurchase => 'Compra única · acceso de por vida';

  @override
  String get dataExportDebugPrice => 'DEBUG';

  @override
  String get dataExportInProgress => 'Exportador';

  @override
  String get dataExportPaymentChecking => 'Comprobando el pago';

  @override
  String get dataExportCreateButton => 'Crear exportación';

  @override
  String get dataExportPayAndCreateButton => 'Pagar y exportar';

  @override
  String get dataExportRestorePurchase => 'Restaurar compra';

  @override
  String get dataExportCreatedToast => 'Archivo de exportación creado.';

  @override
  String get dataExportFailedToast =>
      'No se pudo crear el archivo de exportación.';

  @override
  String get dataExportShareSubject =>
      'Copia de seguridad de datos de Fury Note';

  @override
  String get dataExportShareText =>
      'Este es un archivo de copia de seguridad de datos de Fury Note.';

  @override
  String get dataExportShareFailedToast =>
      'No se pudo abrir la hoja para compartir.';

  @override
  String get dataExportAllDataIncluded =>
      'Todos los datos de la aplicación local están incluidos en la copia de seguridad.';

  @override
  String get dataExportHistoryTitle => 'Historial de exportación';

  @override
  String dataExportHistoryCount(int count) {
    return '$count';
  }

  @override
  String get dataExportShareTooltip => 'Compartir';

  @override
  String get dataExportEmptyHistory => 'Aún no hay archivos de exportación.';

  @override
  String get purchaseUpdateFailed =>
      'No se pudo procesar la actualización de compra.';

  @override
  String get purchaseStatusFailed =>
      'No se pudo verificar el estado de la compra.';

  @override
  String get purchaseProductNotFound => 'Producto de la tienda no encontrado.';

  @override
  String get purchaseStoreUnavailable => 'No se pudo conectar a la tienda.';

  @override
  String get purchaseProductInfoFailed =>
      'No se pudo cargar la información del producto de la tienda.';

  @override
  String get purchaseProductUnavailable =>
      'La información del producto aún no está lista.';

  @override
  String get purchaseStartFailed => 'No se pudo iniciar la compra.';

  @override
  String get purchaseCanceled => 'La compra fue cancelada.';

  @override
  String get purchaseReceiptInvalid =>
      'No se pudo verificar el recibo de compra.';

  @override
  String get purchaseReceiptVerifyFailed =>
      'Error en la verificación del recibo de compra.';

  @override
  String get dataImportTitle => 'Importar datos';

  @override
  String get dataImportPickTitle => 'Seleccionar archivo de respaldo';

  @override
  String get dataImportPickDescription =>
      'Seleccione un archivo .fnbackup\nexportado desde Fury Note';

  @override
  String get dataImportPickButton => 'Elige el archivo';

  @override
  String get dataImportInProgress => 'Importador';

  @override
  String dataImportSuccessToast(int count) {
    return 'Datos reemplazados de la copia de seguridad. ($count registros)';
  }

  @override
  String get dataImportNoNewDataToast =>
      'Datos reemplazados de la copia de seguridad. (0 registros)';

  @override
  String get dataImportFailedToast =>
      'No se pudo importar el archivo de copia de seguridad.';

  @override
  String get dataImportInvalidFileToast =>
      'Sólo se pueden importar archivos .fnbackup.';

  @override
  String get dataImportNoticeTitle => 'Antes de importar';

  @override
  String get dataImportNoticeBody =>
      'Los datos existentes se eliminarán y reemplazarán con los datos del archivo de copia de seguridad.';

  @override
  String get dataImportTransferTitle => 'Dispositivos en movimiento';

  @override
  String get dataImportTransferBody =>
      'Después de instalar la aplicación en un nuevo dispositivo, importe un archivo de respaldo para reemplazar los datos locales actuales con los datos de respaldo.';

  @override
  String get feedDeleteTitle => 'Eliminar feed';

  @override
  String get feedDeleteContent => '¿Eliminar este feed?';

  @override
  String get calmBreathingTitle => 'Respiración';

  @override
  String get breathPhaseInhale => 'Inhalar';

  @override
  String get breathPhaseHold => 'Sostener';

  @override
  String get breathPhaseExhale => 'Exhalar';

  @override
  String durationSeconds(int count) {
    return '${count}segundos';
  }

  @override
  String cycleCount(int count) {
    return 'Ciclo $count';
  }

  @override
  String get calmTimeoutRunning => 'Correr';

  @override
  String get calmTimeoutPaused => 'En pausa';

  @override
  String get reset => 'Restablecer';

  @override
  String get start => 'Iniciar';

  @override
  String get pause => 'Pausar';

  @override
  String get stop => 'Detener';

  @override
  String get calmMeditationSceneWave => 'Ondas';

  @override
  String get calmMeditationSceneForest => 'Bosque';

  @override
  String get calmMeditationSceneSunset => 'Atardecer';

  @override
  String get calmMeditationSceneMountain => 'Montaña';

  @override
  String get calmMeditationSceneCherryBlossom => 'flores de cerezo';

  @override
  String get calmMeditationSceneNightSky => 'cielo nocturno';

  @override
  String get calmMeditationPrompt => 'Inhale profundamente y luego exhale';

  @override
  String get autoplay => 'reproducción automática';

  @override
  String get profileEditTitle => 'Editar perfil';

  @override
  String get nicknameLabel => 'Apodo';

  @override
  String get nicknameHint => 'Introduce un apodo';

  @override
  String get nicknameRequiredError => 'Por favor ingresa un apodo';

  @override
  String get nicknameCodeAutomaticError =>
      'Tu código se agrega automáticamente';

  @override
  String get nicknameTooShortError => 'Utilice al menos 2 caracteres';

  @override
  String profileSavedToast(String name) {
    return '✅ ¡Cambiado a \"$name\"!';
  }

  @override
  String get profileSaveFailedToast => 'Se produjo un error al guardar.';

  @override
  String get avatarPickGallery => 'Elige de la biblioteca';

  @override
  String get avatarPickCamera => 'tomar una foto';

  @override
  String get avatarReset => 'Usar avatar predeterminado';

  @override
  String get avatarResetToast => 'Avatar predeterminado restaurado.';

  @override
  String get avatarAppliedToast => 'Foto de perfil aplicada.';

  @override
  String get avatarTooLargeToast =>
      'Sólo se pueden utilizar fotografías de hasta 5 MB.';

  @override
  String get avatarLoadFailedToast => 'No se pudo cargar la foto.';

  @override
  String get profileCodeLabel => 'Código de perfil (no se puede cambiar)';

  @override
  String get profileSaveButton => 'Guardar cambios';

  @override
  String get avatarChangeLabel => 'Cambiar foto de perfil';

  @override
  String get avatarChangeHint => 'Toca la foto para cambiarla.';

  @override
  String get avatarSizeHint => 'JPG, PNG, GIF · hasta 5 MB';

  @override
  String get reminderNotificationFallbackBody =>
      '¿Cómo se siente esa ira ahora?';

  @override
  String get calmGuideTitle =>
      'Cuando la ira aumenta,\nprimero baje su cuerpo de manera segura';

  @override
  String get calmGuideSubtitle =>
      'La guía tranquila de Fury Note no te dice que te deshagas de la ira. Es una breve guía para ayudar a que el sentimiento pase sin que nadie salga lastimado.';

  @override
  String get calmGuideNotice =>
      '**Si estás en peligro inmediato**, pide ayuda a las personas que te rodean o comunícate con los servicios de emergencia primero, en lugar de quedarte en esta aplicación.';

  @override
  String get calmGuideMomentTitle => 'En el momento en que aumenta la ira';

  @override
  String get calmGuideMomentBody1 =>
      'La ira puede ser una señal de que se ha violado algo que te importa. Pero en un estado de ira fuerte, el juicio se acelera y las palabras y acciones pueden volverse más duras de lo habitual.';

  @override
  String get calmGuideMomentBody2 =>
      'Lo que se necesita ahora no es ser **perfectamente racional**, sino **retrasar tu reacción incluso 30 segundos**.';

  @override
  String get calmGuideRoutineTitle => 'Rutina de calma de 60 segundos';

  @override
  String get calmGuideStep1Title => 'Detener';

  @override
  String get calmGuideStep1Desc =>
      'Pausa para responder, llamar, comentar o moverte. Relaja tus manos y aparta la mirada de la pantalla por un momento.';

  @override
  String get calmGuideStep2Title => 'Respirar';

  @override
  String get calmGuideStep2Desc =>
      'Inhale durante 4 segundos, sostenga durante 7, exhale durante 8. Está bien si no es perfecto.';

  @override
  String get calmGuideStep3Title => 'revisa tu cuerpo';

  @override
  String get calmGuideStep3Desc =>
      'Comprueba si tu mandíbula, hombros, puños o estómago están tensos y libera solo un punto.';

  @override
  String get calmGuideStep4Title => 'Escríbelo';

  @override
  String get calmGuideStep4Desc =>
      'Incluso una frase como \"Ahora mismo estoy enojado porque ___\" es suficiente.';

  @override
  String get calmGuideBreathTitle => '4-7-8 respiración';

  @override
  String get calmGuideBreathStep1 => 'Inhale por la nariz durante 4 segundos.';

  @override
  String get calmGuideBreathStep2 =>
      'Aguanta la respiración durante 7 segundos.';

  @override
  String get calmGuideBreathStep3 =>
      'Exhale lentamente por la boca durante 8 segundos.';

  @override
  String get calmGuideBreathStep4 => 'Repita 3 veces si puede.';

  @override
  String get calmGuideBreathNote =>
      'Si contener la respiración durante tanto tiempo le resulta difícil, acórtelo a una cuenta cómoda como **3-3-5**. Lo que más importa es una exhalación lenta y larga.';

  @override
  String get calmGuideTimeoutTitle => 'tiempo de espera de 10 minutos';

  @override
  String get calmGuideTimeoutBody =>
      'Cuanto más fuerte es el enojo, más fuerte es la necesidad de resolverlo de inmediato. Pero hablar ahora puede sacar primero palabras hirientes.';

  @override
  String get calmGuideTimeoutExamplesTitle =>
      'Ejemplos de frases de tiempo de espera';

  @override
  String get calmGuideTimeoutExample1 =>
      '\"Estoy demasiado enojado ahora, hablemos de nuevo en 10 minutos\".';

  @override
  String get calmGuideTimeoutExample2 =>
      '\"Hago una pausa por un momento porque podría decir algo hiriente\".';

  @override
  String get calmGuideTimeoutExample3 =>
      '\"No estoy huyendo, sólo necesito calmarme antes de que volvamos a hablar\".';

  @override
  String get calmGuideSensoryTitle => 'Conexión a tierra rápida';

  @override
  String get calmGuideSensory1Title => 'Agua fría';

  @override
  String get calmGuideSensory1Desc =>
      'Mantenga agua fría en sus muñecas o cara durante unos 10 segundos.';

  @override
  String get calmGuideSensory2Title => 'Siente tus pies';

  @override
  String get calmGuideSensory2Desc =>
      'Nota lentamente la sensación de tus pies tocando el suelo.';

  @override
  String get calmGuideSensory3Title => 'Mirar alrededor';

  @override
  String get calmGuideSensory3Desc =>
      'Nombra en voz baja 5 objetos que puedas ver.';

  @override
  String get calmGuideSensory4Title => 'Deja caer tus hombros';

  @override
  String get calmGuideSensory4Desc => 'Exhala y baja los hombros sólo 1 cm.';

  @override
  String get calmGuideQuestionsTitle => 'Preguntas que ayudan al escribir';

  @override
  String get calmGuideQuestion1 => '¿Qué es exactamente lo que me hizo enojar?';

  @override
  String get calmGuideQuestion2 => '¿Qué esperaba pero no recibí?';

  @override
  String get calmGuideQuestion3 =>
      '¿De qué acción me arrepentiría si lo hiciera ahora mismo?';

  @override
  String get calmGuideQuestion4 => '¿Qué elección agradeceré el yo del mañana?';

  @override
  String get calmGuideTag1 => 'Registro de emociones';

  @override
  String get calmGuideTag2 => 'Distanciamiento de la ira';

  @override
  String get calmGuideTag3 => 'verificación de recordatorio';

  @override
  String get calmGuideDangerTitle => 'Pide ayuda primero en estos casos';

  @override
  String get calmGuideDanger1 =>
      'Cuando la necesidad de hacerte daño a ti mismo o a los demás se siente fuerte';

  @override
  String get calmGuideDanger2 =>
      'Cuando las ganas de tirar o romper cosas no cesan';

  @override
  String get calmGuideDanger3 =>
      'Cuando tienes ganas de confrontar o amenazar a la otra persona';

  @override
  String get calmGuideDanger4 =>
      'Cuando el alcohol, las drogas o la falta severa de sueño dificultan mantener el control';

  @override
  String get calmGuideDangerBody =>
      'En estos casos, no intentes superarlo solo con la rutina tranquila: pide ayuda a las personas que te rodean, a los servicios profesionales o a los servicios de emergencia.';

  @override
  String get calmGuideFooterTitle => 'Fury Note Calm Guide';

  @override
  String get calmGuideFooterDisclaimer =>
      'Este documento no reemplaza el diagnóstico o tratamiento médico.';

  @override
  String get privacyTitle => 'política de privacidad';

  @override
  String get privacyLastUpdated => 'Fecha de vigencia: 16 de junio de 2026';

  @override
  String get privacySection1Title => '1. Categorías de información recopilada';

  @override
  String get privacySection1Body =>
      'Fury Note se puede utilizar sin ningún registro de membresía. La Compañía recopila únicamente la siguiente información.\n· Identificador de dispositivo: un valor emitido aleatoriamente que se utiliza para identificar al usuario sin registrarse, con el fin de evitar el uso fraudulento.\n· Datos de registro de ira: intensidad, categoría y texto (almacenados solo en el dispositivo)\n· Publicaciones anónimas en el feed: apodo, imagen de avatar, intensidad, categoría y texto\n· Comentarios: apodo y texto del comentario\n· Registros de Me gusta: si al usuario le ha gustado una publicación determinada\n· Token de notificación push: con el fin de enviar notificaciones (opcional)';

  @override
  String get privacySection2Title => '2. Finalidad del Tratamiento';

  @override
  String get privacySection2Body =>
      '· Provisión de funciones comunitarias, incluido el feed anónimo, comentarios y me gusta\n· Detección de uso fraudulento, incluida la prevención de Me gusta duplicados en la misma publicación.\n· Envío de notificaciones push, incluidas alertas de comentarios\n· Funcionamiento del servicio y análisis de errores';

  @override
  String get privacySection3Title =>
      '3. Sin registro de membresía ni retención de información personal';

  @override
  String get privacySection3Body =>
      'Fury Note no requiere registro de membresía y no recopila información personal de identidad verificable, como nombre, dirección de correo electrónico o número de teléfono.\nEl apodo lo genera automáticamente o lo ingresa directamente el usuario y no está vinculado a la identidad real del usuario. El identificador del dispositivo también es un valor generado aleatoriamente que no se puede utilizar para identificar a un individuo específico.';

  @override
  String get privacySection4Title => '4. Suministro de Información a Terceros';

  @override
  String get privacySection4Body =>
      'La Compañía no proporciona ni vende la información recopilada a terceros.';

  @override
  String get privacySection5Title =>
      '5. Período de conservación y uso de la información';

  @override
  String get privacySection5Body =>
      '· Los registros de ira que solo se han guardado se conservan únicamente en el dispositivo y se eliminan juntos al eliminar la aplicación.\n· Las publicaciones, avatares y comentarios compartidos en el feed anónimo se conservan en el servidor hasta que el usuario los elimine, y se eliminan inmediatamente después de dicha solicitud.\n· Los registros similares se eliminan juntos al eliminar la publicación relacionada.';

  @override
  String get privacySection6Title => '6. Contacto';

  @override
  String get privacySection6Body =>
      'Para consultas sobre información personal, comuníquese con la dirección de correo electrónico a continuación.\nlunlu.co.kr@gmail.com';

  @override
  String get appGuideTitle => 'Cómo utilizar la nota de furia';

  @override
  String get appGuideSubtitle =>
      'Una guía para registrar el enojo, rastrear patrones y obtener apoyo en el feed.';

  @override
  String get appGuideRecordTitle => 'Registra tu ira';

  @override
  String get appGuideRecordBody =>
      'Cuando estés enojado, toca el botón 🔥 en la parte inferior para iniciar un registro.';

  @override
  String get appGuideRecordStep1 =>
      'Elige intensidad: elige un emoji que coincida con lo enojado que estás';

  @override
  String get appGuideRecordStep2 => 'Elige una categoría: elige una causa';

  @override
  String get appGuideRecordStep3 =>
      'Escríbelo: describe lo que pasó (puedes omitir esto)';

  @override
  String get appGuideRecordStep4 =>
      'Recordatorio: establece una hora si quieres volver a visitar esto más tarde';

  @override
  String get appGuideRecordStep5 =>
      'Guardar o publicar: mantenga el registro privado o compártalo en el feed';

  @override
  String get appGuideFeedTitle => 'Encuentre apoyo en el feed';

  @override
  String get appGuideFeedBody =>
      'Compartir su enojo puede conectarlo con otras personas que sienten lo mismo.';

  @override
  String get appGuideFeedItem1 =>
      'Después de guardar, puedes publicar **de forma anónima** en el feed.';

  @override
  String get appGuideFeedItem2 =>
      'Me gusta o comenta las publicaciones de otras personas.';

  @override
  String get appGuideFeedItem3 =>
      'Puedes eliminar tu propia publicación en cualquier momento.';

  @override
  String get appGuideStatsTitle => 'Sigue tus patrones emocionales';

  @override
  String get appGuideStatsBody =>
      'La pestaña de estadísticas te ayuda a revisar tus patrones de ira.';

  @override
  String get appGuideStatsItem1 =>
      'Gráfico de tendencia de intensidad de ira por período';

  @override
  String get appGuideStatsItem2 => 'Distribución de causas por categoría';

  @override
  String get appGuideStatsItem3 =>
      'Vista de calendario para buscar registros por fecha';

  @override
  String get appGuideStatsItem4 =>
      'Informe Rage para analizar patrones por categoría';

  @override
  String get appGuideCalmTitle => 'baja tu ira';

  @override
  String get appGuideCalmBody =>
      'Después de iniciar sesión, dirígete a la pestaña de calma para intentar calmar tus emociones.';

  @override
  String get appGuideCalmItem1 =>
      'Notas recordatorias: revise los registros que marcó para más tarde';

  @override
  String get appGuideCalmItem2 =>
      'Respiración: tranquiliza tu mente con la técnica 4-7-8';

  @override
  String get appGuideCalmItem3 =>
      'Tiempo de espera: ralentiza tu reacción con un cronómetro de 10 minutos';

  @override
  String get appGuideCalmItem4 =>
      'Meditación con imágenes: cambia tu estado de ánimo con imágenes de la naturaleza';

  @override
  String get appGuideProfileTitle => 'Apodo y perfil';

  @override
  String get appGuideProfileBody =>
      'Vaya a menú > Configuración para cambiar su apodo y avatar.';

  @override
  String get appGuideProfileItem1 =>
      'Apodo: escribe el tuyo propio o genera uno aleatoriamente';

  @override
  String get appGuideProfileItem2 => 'Avatar: represéntate con un emoji';

  @override
  String get appGuideNotificationTitle => 'Configuración de notificaciones';

  @override
  String get appGuideNotificationItem1 =>
      'Alertas de recordatorio: recibe un recordatorio de una nota de ira en el momento que establezcas';

  @override
  String get appGuideNotificationItem2 =>
      'Alertas de comentarios: recibe una notificación cuando alguien comente tu publicación';

  @override
  String get appGuideNotificationHint =>
      'Cambie estos en Configuración> Notificaciones';

  @override
  String get appGuideFooterTitle => 'Fury Note App Guide';
}

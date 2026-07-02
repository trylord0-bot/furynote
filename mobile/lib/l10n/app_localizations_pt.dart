// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Fury Note';

  @override
  String get appKoreanName => 'Fury Note';

  @override
  String get record => 'Registro';

  @override
  String get feed => 'Feed';

  @override
  String get stats => 'Estatísticas';

  @override
  String get calm => 'Acalmar';

  @override
  String get settings => 'Configurações';

  @override
  String get drawerGuide => 'Guia do app';

  @override
  String get drawerCalmGuide => 'Guia de calma';

  @override
  String get drawerVersion => 'Fury Note v1.0.0';

  @override
  String get menuTooltip => 'Menu';

  @override
  String drawerRecordCount(String count) {
    return '🔥 $count notas de raiva';
  }

  @override
  String get drawerSettingsSubtitle => 'Apelido · notificações';

  @override
  String get drawerGuideSubtitle => 'Como usar o Fury Note';

  @override
  String get drawerCalmGuideSubtitle => 'Cartões de calma · dicas de hoje';

  @override
  String get relativeTimeJustNow => 'Agora mesmo';

  @override
  String relativeTimeMinutesAgo(int count) {
    return '$count minutos atrás';
  }

  @override
  String relativeTimeHoursAgo(int count) {
    return '${count}horas atrás';
  }

  @override
  String relativeTimeDaysAgo(int count) {
    return '$count dias atrás';
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
  String get recordTitle => 'Registro de raiva';

  @override
  String get stepIntensity => 'Quão bravo você está agora?';

  @override
  String get stepIntensitySub => 'Escolha um emoji';

  @override
  String get stepCategory => 'O que causou isso?';

  @override
  String get stepCategorySub => 'Escolha uma categoria';

  @override
  String get stepText => 'O que aconteceu?';

  @override
  String get stepTextSub => 'Você pode pular isso';

  @override
  String get stepReminder => 'Quer revisitar mais tarde?';

  @override
  String get stepReminderSub => 'Você pode pular isso';

  @override
  String get stepSave => 'Salvar esta nota?';

  @override
  String get stepSaveSub => 'Você pode publicá-lo depois de salvar';

  @override
  String get stepPost => 'Compartilhar esse sentimento?';

  @override
  String get stepPostSub => 'Será anônimo';

  @override
  String get voiceInput => 'Gravação de voz';

  @override
  String get next => 'Próximo';

  @override
  String get previous => 'Anterior';

  @override
  String get skip => 'Pular';

  @override
  String get save => 'Salvar';

  @override
  String get saveNote => 'Salvar nota';

  @override
  String get postIt => 'Publicar';

  @override
  String get saveOnly => 'Só salvar';

  @override
  String get feedPostedToast => 'Enviado para feed';

  @override
  String get recordPostedToast => 'Postado';

  @override
  String get recordSavedToast => 'Salvo';

  @override
  String get commentPostedToast => 'Comentário postado';

  @override
  String get commentSendFailedToast =>
      'Não foi possível enviar o comentário. Por favor, tente novamente.';

  @override
  String get commentDeleteTitle => 'Excluir comentário';

  @override
  String get commentDeleteContent => 'Excluir este comentário?';

  @override
  String commentsCount(int count) {
    return '$count comentários';
  }

  @override
  String get commentsEmpty =>
      'Ainda não há comentários\nSeja o primeiro a deixar um 💬';

  @override
  String get commentInputHint => 'Escreva um comentário...';

  @override
  String get apiErrorContentBlockedUrl =>
      'Postagens com links não podem ser enviadas.';

  @override
  String get apiErrorContentBlockedSpam =>
      'Texto promocional não pode ser enviado.';

  @override
  String get apiErrorContentBlockedProfanity =>
      'Conteúdo contendo palavrões não pode ser enviado.';

  @override
  String get apiErrorContentBlockedModeration =>
      'Este conteúdo não pode ser enviado.';

  @override
  String get apiErrorRateLimitExceeded =>
      'Por favor, tente novamente em alguns instantes.';

  @override
  String get apiErrorInternal =>
      'Ocorreu um erro no servidor. Por favor, tente novamente em alguns instantes.';

  @override
  String get apiErrorInvalidRequest => 'Solicitação inválida.';

  @override
  String get apiErrorForbidden => 'Você não tem permissão.';

  @override
  String get apiErrorPostNotFound => 'Postagem não encontrada.';

  @override
  String get apiErrorCommentNotFound => 'Comentário não encontrado.';

  @override
  String get apiErrorSignatureRequired =>
      'A assinatura da solicitação é necessária.';

  @override
  String get apiErrorSignatureInvalid => 'Solicitação inválida.';

  @override
  String get apiErrorSignatureExpired =>
      'A solicitação expirou. Por favor, tente novamente.';

  @override
  String get apiErrorSignatureReplay => 'Esta solicitação já foi processada.';

  @override
  String get apiErrorUnknown => 'Ocorreu um erro desconhecido.';

  @override
  String get reminderNotification => 'Notificação de lembrete';

  @override
  String get noReminder => 'Não definido';

  @override
  String get summaryIntensity => 'Nível de raiva';

  @override
  String get summaryCategory => 'Categoria';

  @override
  String get summaryText => 'Texto';

  @override
  String get summaryReminder => 'Lembrete';

  @override
  String get none => 'Nenhum';

  @override
  String get other => 'Outro';

  @override
  String get family => 'Família';

  @override
  String get romance => 'Romance';

  @override
  String get work => 'Trabalho';

  @override
  String get people => 'Pessoas';

  @override
  String get driving => 'Dirigindo';

  @override
  String get custom => 'Personalizado';

  @override
  String get recordCustomCategoryHint => 'Insira uma categoria';

  @override
  String get recordTextHint => 'Escreva aqui';

  @override
  String get recordMicPermissionRequired =>
      'É necessária permissão para microfone.';

  @override
  String recordVoiceStartFailed(String label) {
    return 'Não foi possível iniciar $label.';
  }

  @override
  String get recordVoiceStopRecording => 'Pare de gravar';

  @override
  String get recordVoiceRecordAgain => 'Grave novamente';

  @override
  String get recordVoiceSaved => 'Gravação de voz salva.';

  @override
  String get recordAudioSummaryLabel => 'Voz';

  @override
  String get recordAudioIncluded => 'Gravação incluída';

  @override
  String get recordSavingInProgress => 'Salvando...';

  @override
  String get recordPostingInProgress => 'Enviando...';

  @override
  String get recordSaveFailedToast =>
      'Não foi possível salvar a nota. Por favor, tente novamente.';

  @override
  String get recordProgressSemantics => 'Registrar progresso';

  @override
  String get hourSuffix => 'h';

  @override
  String get minuteSuffix => 'eu';

  @override
  String get reminderCustom => 'Personalizado';

  @override
  String get reminderIn30Minutes => 'Em 30 minutos';

  @override
  String get reminderIn1Hour => 'Em 1 hora';

  @override
  String get reminderIn2Hours => 'Em 2 horas';

  @override
  String get reminderIn6Hours => 'Em 6 horas';

  @override
  String get reminderTomorrow => 'Amanhã';

  @override
  String get annoyed => 'Irritado';

  @override
  String get angry => 'Irritado';

  @override
  String get mad => 'Louco';

  @override
  String get furious => 'Furioso';

  @override
  String get rage => 'Raiva';

  @override
  String get calmed => 'Calma';

  @override
  String get feedTitle => 'Feed';

  @override
  String get feedSubtitle => 'Veja histórias recentes de raiva';

  @override
  String get feedAllTab => 'Feed geral';

  @override
  String get feedMineTab => 'Meu feed';

  @override
  String get feedLoadFailed => 'Não foi possível carregar o feed.';

  @override
  String get feedEmptyMine =>
      'Você ainda não postou no feed.\nCompartilhe sua primeira nota de raiva!';

  @override
  String get feedEmptyAll =>
      'Nenhuma postagem no feed ainda.\nSeja o primeiro a compartilhar sua raiva!';

  @override
  String get feedPostFailedToast =>
      'Não foi possível enviar para o feed. Por favor, tente novamente.';

  @override
  String get like => 'Me identifico';

  @override
  String get comment => 'Comentário';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get statsTitle => 'Estatísticas de raiva';

  @override
  String get statsSubtitle => 'Veja o padrão emocional desta semana';

  @override
  String get week => '1 semana';

  @override
  String get month => '1 mês';

  @override
  String get all => 'Todos';

  @override
  String get totalRecords => 'Registros';

  @override
  String get highestLevel => 'Mais alto';

  @override
  String get dailyAverage => 'Média diária';

  @override
  String get decreaseRate => 'Diminuir';

  @override
  String get statsIntensityTrend => 'Tendência de intensidade de raiva';

  @override
  String get statsCategoryDistribution => 'Distribuição de causa';

  @override
  String get statsNoRecords => 'Não há registros para mostrar.';

  @override
  String get statsCalendarButtonTitle => 'Ver registros por calendário';

  @override
  String get statsCalendarButtonSubtitle =>
      'Verifique e gerencie notas de raiva por data';

  @override
  String get statsCalendarTitle => 'Ver registros por calendário';

  @override
  String get statsOtherCategory => 'Outro';

  @override
  String selectedDateRecordsTitle(String date) {
    return '$date registros';
  }

  @override
  String get noRecordsOnSelectedDate =>
      'Nenhum registro foi escrito na data selecionada.';

  @override
  String get reminderAction => 'Lembrete';

  @override
  String get play => 'Reproduzir';

  @override
  String get statsSummaryButtonTitle => 'Ver relatório de raiva';

  @override
  String get statsSummaryButtonSubtitle =>
      'Percorra seus padrões de raiva por categoria';

  @override
  String get statsSummaryTitle => 'Relatório de raiva';

  @override
  String get statsSummaryClose => 'Fechar';

  @override
  String get statsSummaryEmptyTitle => 'Ainda não há registros para resumir';

  @override
  String get statsSummaryEmptyBody =>
      'Depois de adicionar notas de raiva, os padrões de categoria aparecerão aqui.';

  @override
  String statsSummaryTopHeadline(String category) {
    return '\"$category\" deixou você com raiva com mais frequência';
  }

  @override
  String statsSummaryCategoryHeadline(String category) {
    return 'Olhando para \"$category\"';
  }

  @override
  String get statsSummaryComfortGeneric =>
      'Está tudo bem. Isso pode acontecer.';

  @override
  String get statsSummaryComfortFamily =>
      'Quanto mais perto alguém estiver, mais difícil será pousar.';

  @override
  String get statsSummaryComfortRomance =>
      'Um relacionamento precioso pode tornar os pequenos momentos mais nítidos.';

  @override
  String get statsSummaryComfortWork =>
      'O trabalho pode ter levado sua mente mais rápido do que gostaria.';

  @override
  String get statsSummaryComfortPeople =>
      'Palavras e expressões de outras pessoas podem durar mais tempo do que o esperado.';

  @override
  String get statsSummaryComfortDriving =>
      'A tensão na estrada geralmente atinge primeiro o corpo.';

  @override
  String get statsSummaryMetricCount => 'Contar';

  @override
  String get statsSummaryMetricCategory => 'Categoria';

  @override
  String get statsSummaryMetricFeed => 'Postagens de feed';

  @override
  String get statsSummaryMetricCalm => 'Calma tenta';

  @override
  String get statsSummaryMetricAverage => 'Média nível';

  @override
  String get statsSummaryMetricPeak => 'Nível de pico';

  @override
  String get statsSummaryConclusion => 'Conclusão';

  @override
  String statsSummaryRecordsUnit(int count) {
    return '$count vezes';
  }

  @override
  String statsSummaryAverageValue(String value) {
    return '$value/5';
  }

  @override
  String get statsSummaryConclusionTop =>
      'Este é o seu sinal de raiva mais repetido. Da próxima vez, tente verificar a tensão corporal antes que a raiva aumente totalmente.';

  @override
  String get statsSummaryConclusionCategory =>
      'Anotar essa categoria enquanto ela ainda é pequena pode ajudá-lo a perceber o padrão mais cedo.';

  @override
  String statsSummaryPageIndicator(int current, int total) {
    return '$current/$total';
  }

  @override
  String get statsSummaryCategoryShare => 'Compartilhamento de categoria';

  @override
  String get statsSummaryCalmRate => 'Taxa calma';

  @override
  String get statsSummaryShareRate => 'Taxa de compartilhamento';

  @override
  String get noContent => 'Sem conteúdo';

  @override
  String get voicePlayback => 'Reproduzir voz';

  @override
  String get deleteConfirm => 'Excluir?';

  @override
  String get delete => 'Excluir';

  @override
  String get cancel => 'Cancelar';

  @override
  String get calmTitle => 'Acalmar';

  @override
  String get calmSubtitle => 'Abaixe o que ainda permanece';

  @override
  String get reminderNotes => 'Lembretes';

  @override
  String get breathing => 'Respiração';

  @override
  String get timeout => 'Tempo limite';

  @override
  String get meditation => 'Meditação de imagem';

  @override
  String get feedSupport => 'Suporte de feed';

  @override
  String get calmReminderEmpty =>
      'Os lembretes aparecerão aqui quando eles chegarem';

  @override
  String get calmReminderFallbackText => 'Como é essa raiva agora?';

  @override
  String get calmCheckTitle => 'Quão bravo você está agora?';

  @override
  String calmCheckSubtitle(String emoji, String label) {
    return '$emoji $label · aquela raiva anterior';
  }

  @override
  String get calmSavedCalmedToast => 'Que bom que você se acalmou.';

  @override
  String get calmSavedUpdatedToast => 'Salvo';

  @override
  String get profileName => 'Tigre irritado';

  @override
  String get nicknameAdjectives =>
      'zangado, furioso, furioso, explosivo, feroz, rosnando, afiado, com chifres, aquecido, áspero, feroz, violento, ardente, trovejante, bufando, fervendo, ressentido, em chamas, tempestuoso, venenoso';

  @override
  String get nicknameAnimals =>
      'tigre, leão, lobo, urso, águia, tubarão, leopardo, chita, crocodilo, cobra, touro, javali, rinoceronte, hiena, pardo, corvo, falcão, ouriço, onça, puma';

  @override
  String get notificationSettings => 'Notificações';

  @override
  String get commentNotification => 'Alertas de comentários';

  @override
  String get settingsNotificationsSection => 'Notificações';

  @override
  String get settingsReminderSubtitle =>
      'Lembrete de nota de raiva no horário que você definir';

  @override
  String get settingsCommentSubtitle =>
      'Alertar quando alguém comentar em sua postagem';

  @override
  String get settingsDataSection => 'Dados';

  @override
  String get settingsDataImportSubtitle =>
      'Restaurar registros de um arquivo de backup';

  @override
  String get settingsSupportSection => 'Suporte';

  @override
  String get settingsPrivacySubtitle =>
      'Informações coletadas e finalidade de uso';

  @override
  String get settingsFeedbackTitle => 'Enviar comentários';

  @override
  String get settingsFeedbackSubtitle => 'Problemas ou ideias de melhoria';

  @override
  String get settingsRecordCountUnit => 'registros';

  @override
  String get settingsPostCountUnit => 'postagens';

  @override
  String get proPlan => 'Exportação de dados PRO';

  @override
  String get backupImport => 'Importar dados';

  @override
  String get settingsDataExportSubtitle =>
      'Arquivo de backup · histórico · compartilhamento';

  @override
  String get dataExportTitle => 'Exportar dados';

  @override
  String get dataExportProTitle => 'Exportação de dados PRO';

  @override
  String get dataExportDescription =>
      'Crie um arquivo de backup com todos os dados do aplicativo local e compartilhe-o por e-mail ou mensageiro.';

  @override
  String get dataExportOneTimePurchase => 'Compra única · acesso vitalício';

  @override
  String get dataExportDebugPrice => 'DEBUG';

  @override
  String get dataExportInProgress => 'Exportando';

  @override
  String get dataExportPaymentChecking => 'Verificando o pagamento';

  @override
  String get dataExportCreateButton => 'Criar exportação';

  @override
  String get dataExportPayAndCreateButton => 'Pague e exporte';

  @override
  String get dataExportRestorePurchase => 'Restaurar compra';

  @override
  String get dataExportCreatedToast => 'Arquivo de exportação criado.';

  @override
  String get dataExportFailedToast =>
      'Não foi possível criar o arquivo de exportação.';

  @override
  String get dataExportShareSubject => 'Backup de dados do Fury Note';

  @override
  String get dataExportShareText =>
      'Este é um arquivo de backup de dados do Fury Note.';

  @override
  String get dataExportShareFailedToast =>
      'Não foi possível abrir a planilha de compartilhamento.';

  @override
  String get dataExportAllDataIncluded =>
      'Todos os dados locais do aplicativo estão incluídos no backup';

  @override
  String get dataExportHistoryTitle => 'Histórico de exportação';

  @override
  String dataExportHistoryCount(int count) {
    return '$count';
  }

  @override
  String get dataExportShareTooltip => 'Compartilhar';

  @override
  String get dataExportEmptyHistory => 'Ainda não há arquivos de exportação.';

  @override
  String get purchaseUpdateFailed =>
      'Não foi possível processar a atualização da compra.';

  @override
  String get purchaseStatusFailed =>
      'Não foi possível verificar o status da compra.';

  @override
  String get purchaseProductNotFound => 'Produto da loja não encontrado.';

  @override
  String get purchaseStoreUnavailable => 'Não foi possível conectar-se à loja.';

  @override
  String get purchaseProductInfoFailed =>
      'Não foi possível carregar as informações do produto da loja.';

  @override
  String get purchaseProductUnavailable =>
      'As informações do produto ainda não estão prontas.';

  @override
  String get purchaseStartFailed => 'Não foi possível iniciar a compra.';

  @override
  String get purchaseCanceled => 'A compra foi cancelada.';

  @override
  String get purchaseReceiptInvalid =>
      'Não foi possível verificar o recibo de compra.';

  @override
  String get purchaseReceiptVerifyFailed =>
      'Falha na verificação do recibo de compra.';

  @override
  String get dataImportTitle => 'Importar dados';

  @override
  String get dataImportPickTitle => 'Selecione o arquivo de backup';

  @override
  String get dataImportPickDescription =>
      'Selecione um arquivo .fnbackup\nexportado do Fury Note';

  @override
  String get dataImportPickButton => 'Escolha o arquivo';

  @override
  String get dataImportInProgress => 'Importando';

  @override
  String dataImportSuccessToast(int count) {
    return 'Dados substituídos do backup. ($count registros)';
  }

  @override
  String get dataImportNoNewDataToast =>
      'Dados substituídos do backup. (0 registros)';

  @override
  String get dataImportFailedToast =>
      'Não foi possível importar o arquivo de backup.';

  @override
  String get dataImportInvalidFileToast =>
      'Somente arquivos .fnbackup podem ser importados.';

  @override
  String get dataImportNoticeTitle => 'Antes de importar';

  @override
  String get dataImportNoticeBody =>
      'Os dados existentes serão excluídos e substituídos pelos dados do arquivo de backup.';

  @override
  String get dataImportTransferTitle => 'Dispositivos móveis';

  @override
  String get dataImportTransferBody =>
      'Depois de instalar o aplicativo em um novo dispositivo, importe um arquivo de backup para substituir os dados locais atuais pelos dados de backup.';

  @override
  String get feedDeleteTitle => 'Excluir feed';

  @override
  String get feedDeleteContent => 'Excluir este feed?';

  @override
  String get calmBreathingTitle => 'Respiração';

  @override
  String get breathPhaseInhale => 'Inspire';

  @override
  String get breathPhaseHold => 'Espera';

  @override
  String get breathPhaseExhale => 'Expire';

  @override
  String durationSeconds(int count) {
    return '${count}segundos';
  }

  @override
  String cycleCount(int count) {
    return 'Ciclo $count';
  }

  @override
  String get calmTimeoutRunning => 'Correndo';

  @override
  String get calmTimeoutPaused => 'Pausado';

  @override
  String get reset => 'Redefinir';

  @override
  String get start => 'Iniciar';

  @override
  String get pause => 'Pausar';

  @override
  String get stop => 'Parar';

  @override
  String get calmMeditationSceneWave => 'Ondas';

  @override
  String get calmMeditationSceneForest => 'Floresta';

  @override
  String get calmMeditationSceneSunset => 'Pôr do sol';

  @override
  String get calmMeditationSceneMountain => 'Montanha';

  @override
  String get calmMeditationSceneCherryBlossom => 'Flores de cerejeira';

  @override
  String get calmMeditationSceneNightSky => 'Céu noturno';

  @override
  String get calmMeditationPrompt => 'Inspire profundamente e depois expire';

  @override
  String get autoplay => 'Reprodução automática';

  @override
  String get profileEditTitle => 'Editar perfil';

  @override
  String get nicknameLabel => 'Apelido';

  @override
  String get nicknameHint => 'Digite um apelido';

  @override
  String get nicknameRequiredError => 'Por favor insira um apelido';

  @override
  String get nicknameCodeAutomaticError =>
      'Seu código é adicionado automaticamente';

  @override
  String get nicknameTooShortError => 'Use pelo menos 2 caracteres';

  @override
  String profileSavedToast(String name) {
    return '✅ Alterado para \"$name\"!';
  }

  @override
  String get profileSaveFailedToast => 'Ocorreu um erro ao salvar.';

  @override
  String get avatarPickGallery => 'Escolha na biblioteca';

  @override
  String get avatarPickCamera => 'Tire uma foto';

  @override
  String get avatarReset => 'Usar avatar padrão';

  @override
  String get avatarResetToast => 'Avatar padrão restaurado.';

  @override
  String get avatarAppliedToast => 'Foto do perfil aplicada.';

  @override
  String get avatarTooLargeToast =>
      'Somente fotos de até 5 MB podem ser usadas.';

  @override
  String get avatarLoadFailedToast => 'Não foi possível carregar a foto.';

  @override
  String get profileCodeLabel => 'Código do perfil (não pode ser alterado)';

  @override
  String get profileSaveButton => 'Salvar alterações';

  @override
  String get avatarChangeLabel => 'Alterar foto do perfil';

  @override
  String get avatarChangeHint => 'Toque na foto para alterá-la';

  @override
  String get avatarSizeHint => 'JPG, PNG, GIF · até 5 MB';

  @override
  String get reminderNotificationFallbackBody => 'Como é essa raiva agora?';

  @override
  String get calmGuideTitle =>
      'Quando a raiva aumenta,\nabaixe seu corpo com segurança primeiro';

  @override
  String get calmGuideSubtitle =>
      'O guia calmo do Fury Note não diz para você se livrar da raiva. É um pequeno guia para ajudar o sentimento a passar sem que ninguém se machuque.';

  @override
  String get calmGuideNotice =>
      '**Se você estiver em perigo imediato**, peça ajuda às pessoas ao seu redor ou entre em contato com os serviços de emergência primeiro, em vez de permanecer neste aplicativo.';

  @override
  String get calmGuideMomentTitle => 'No momento em que a raiva aumenta';

  @override
  String get calmGuideMomentBody1 =>
      'A raiva pode ser um sinal de que algo que lhe interessa foi violado. Mas num estado de forte raiva, o julgamento acelera e as palavras e ações podem tornar-se mais ásperas do que o habitual.';

  @override
  String get calmGuideMomentBody2 =>
      'O que é necessário agora não é ser **perfeitamente racional**, mas **atrasar sua reação em até 30 segundos**.';

  @override
  String get calmGuideRoutineTitle => 'Rotina calma de 60 segundos';

  @override
  String get calmGuideStep1Title => 'Pare';

  @override
  String get calmGuideStep1Desc =>
      'Pause a resposta, a ligação, o comentário ou a movimentação. Relaxe as mãos e desvie o olhar da tela por um momento.';

  @override
  String get calmGuideStep2Title => 'Respire';

  @override
  String get calmGuideStep2Desc =>
      'Inspire por 4 segundos, segure por 7, expire por 8. Está tudo bem se não estiver perfeito.';

  @override
  String get calmGuideStep3Title => 'Verifique seu corpo';

  @override
  String get calmGuideStep3Desc =>
      'Verifique se sua mandíbula, ombros, punhos ou estômago estão tensos e solte apenas um ponto.';

  @override
  String get calmGuideStep4Title => 'Escreva';

  @override
  String get calmGuideStep4Desc =>
      'Mesmo uma frase como “Agora estou com raiva porque ___” é suficiente.';

  @override
  String get calmGuideBreathTitle => '4-7-8 respiração';

  @override
  String get calmGuideBreathStep1 => 'Inspire pelo nariz por 4 segundos.';

  @override
  String get calmGuideBreathStep2 => 'Prenda a respiração por 7 segundos.';

  @override
  String get calmGuideBreathStep3 =>
      'Expire lentamente pela boca por 8 segundos.';

  @override
  String get calmGuideBreathStep4 => 'Repita 3 vezes, se puder.';

  @override
  String get calmGuideBreathNote =>
      'Se for difícil prender a respiração por tanto tempo, reduza-a para uma contagem confortável como **3-3-5**. O que mais importa é uma expiração lenta e longa.';

  @override
  String get calmGuideTimeoutTitle => 'Tempo limite de 10 minutos';

  @override
  String get calmGuideTimeoutBody =>
      'Quanto mais forte a raiva, mais forte será o desejo de resolvê-la imediatamente. Mas falar agora pode trazer à tona palavras ofensivas primeiro.';

  @override
  String get calmGuideTimeoutExamplesTitle =>
      'Exemplos de frases de tempo limite';

  @override
  String get calmGuideTimeoutExample1 =>
      '“Estou com muita raiva agora, vamos conversar novamente em 10 minutos.”';

  @override
  String get calmGuideTimeoutExample2 =>
      '\"Estou fazendo uma pausa por um momento porque posso dizer algo que magoa.\"';

  @override
  String get calmGuideTimeoutExample3 =>
      '\"Não vou fugir, só preciso me acalmar antes de conversarmos novamente.\"';

  @override
  String get calmGuideSensoryTitle => 'Aterramento sensorial rápido';

  @override
  String get calmGuideSensory1Title => 'Água fria';

  @override
  String get calmGuideSensory1Desc =>
      'Segure água fria nos pulsos ou no rosto por cerca de 10 segundos';

  @override
  String get calmGuideSensory2Title => 'Sinta seus pés';

  @override
  String get calmGuideSensory2Desc =>
      'Observe lentamente a sensação de seus pés tocando o chão';

  @override
  String get calmGuideSensory3Title => 'Olhe ao redor';

  @override
  String get calmGuideSensory3Desc =>
      'Nomeie silenciosamente 5 objetos que você pode ver';

  @override
  String get calmGuideSensory4Title => 'Abaixe seus ombros';

  @override
  String get calmGuideSensory4Desc => 'Expire e abaixe os ombros apenas 1 cm';

  @override
  String get calmGuideQuestionsTitle =>
      'Perguntas que ajudam na hora de escrever';

  @override
  String get calmGuideQuestion1 => 'O que exatamente me deixou com raiva?';

  @override
  String get calmGuideQuestion2 => 'O que eu esperava, mas não recebi?';

  @override
  String get calmGuideQuestion3 =>
      'De que ação eu me arrependeria se fizesse isso agora?';

  @override
  String get calmGuideQuestion4 =>
      'Por qual escolha o meu eu de amanhã será grato?';

  @override
  String get calmGuideTag1 => 'Registro de emoções';

  @override
  String get calmGuideTag2 => 'Distanciamento da raiva';

  @override
  String get calmGuideTag3 => 'Verificação de lembrete';

  @override
  String get calmGuideDangerTitle => 'Peça ajuda primeiro nestes casos';

  @override
  String get calmGuideDanger1 =>
      'Quando a vontade de machucar a si mesmo ou aos outros parece forte';

  @override
  String get calmGuideDanger2 =>
      'Quando a vontade de jogar ou quebrar as coisas não para';

  @override
  String get calmGuideDanger3 =>
      'Quando você sente vontade de confrontar ou ameaçar a outra pessoa';

  @override
  String get calmGuideDanger4 =>
      'Quando álcool, drogas ou privação grave de sono dificultam o controle';

  @override
  String get calmGuideDangerBody =>
      'Nesses casos, não tente superar isso apenas com uma rotina calma - peça ajuda às pessoas ao seu redor, aos serviços profissionais ou aos serviços de emergência.';

  @override
  String get calmGuideFooterTitle => 'Fury Note Calm Guide';

  @override
  String get calmGuideFooterDisclaimer =>
      'Este documento não substitui o diagnóstico ou tratamento médico.';

  @override
  String get privacyTitle => 'Política de Privacidade';

  @override
  String get privacyLastUpdated => 'Data de vigência: 16 de junho de 2026';

  @override
  String get privacySection1Title => '1. Categorias de informações coletadas';

  @override
  String get privacySection1Body =>
      'Fury Note pode ser usado sem qualquer registro de membro. A Empresa coleta apenas as seguintes informações.\n· Identificador do dispositivo — um valor emitido aleatoriamente usado para identificar o usuário sem registro, com a finalidade de prevenir uso fraudulento\n· Dados de registro de raiva — intensidade, categoria e texto (armazenados apenas no dispositivo)\n· Postagens anônimas no feed — apelido, imagem do avatar, intensidade, categoria e texto\n· Comentários — apelido e texto do comentário\n· Registros de curtidas — se o usuário gostou de uma determinada postagem\n· Token de notificação push — para fins de envio de notificações (opcional)';

  @override
  String get privacySection2Title => '2. Finalidade do Processamento';

  @override
  String get privacySection2Body =>
      '· Fornecimento de recursos da comunidade, incluindo feed anônimo, comentários e curtidas\n· Detecção de uso fraudulento, incluindo prevenção de curtidas duplicadas na mesma postagem\n· Envio de notificações push, incluindo alertas de comentários\n· Operação do serviço e análise de erros';

  @override
  String get privacySection3Title =>
      '3. Sem registro de membro e sem retenção de informações pessoais';

  @override
  String get privacySection3Body =>
      'Fury Note não exige registro de membro e não coleta informações pessoais de identidade verificável, como nome, endereço de e-mail ou número de telefone.\nO apelido é gerado automaticamente ou inserido diretamente pelo usuário e não está vinculado à identidade real do usuário. O identificador do dispositivo também é um valor gerado aleatoriamente que não pode ser usado para identificar um indivíduo específico.';

  @override
  String get privacySection4Title =>
      '4. Fornecimento de informações a terceiros';

  @override
  String get privacySection4Body =>
      'A Empresa não fornece nem vende as informações coletadas a terceiros.';

  @override
  String get privacySection5Title =>
      '5. Período de Retenção e Utilização da Informação';

  @override
  String get privacySection5Body =>
      '· Os registros de raiva que foram salvos apenas são retidos apenas no dispositivo e são excluídos juntos após a exclusão do aplicativo.\n· Postagens, avatares e comentários compartilhados no feed anônimo são retidos no servidor até serem excluídos pelo usuário e são excluídos imediatamente mediante solicitação.\n· Registros semelhantes são excluídos juntos após a exclusão da postagem relacionada.';

  @override
  String get privacySection6Title => '6. Contato';

  @override
  String get privacySection6Body =>
      'Para dúvidas sobre informações pessoais, entre em contato com o endereço de e-mail abaixo.\nlunlu.co.kr@gmail.com';

  @override
  String get appGuideTitle => 'Como usar o Fury Note';

  @override
  String get appGuideSubtitle =>
      'Um guia para registrar a raiva, rastrear padrões e obter suporte no feed.';

  @override
  String get appGuideRecordTitle => 'Registre sua raiva';

  @override
  String get appGuideRecordBody =>
      'Quando estiver com raiva, toque no botão 🔥 na parte inferior para iniciar uma gravação.';

  @override
  String get appGuideRecordStep1 =>
      'Escolha a intensidade: escolha um emoji que corresponda ao quão irritado você está';

  @override
  String get appGuideRecordStep2 => 'Escolha uma categoria: escolha uma causa';

  @override
  String get appGuideRecordStep3 =>
      'Escreva: descreva o que aconteceu (você pode pular isso)';

  @override
  String get appGuideRecordStep4 =>
      'Lembrete: defina um horário se quiser revisitar isso mais tarde';

  @override
  String get appGuideRecordStep5 =>
      'Salvar ou postar: mantenha o registro privado ou compartilhe-o no feed';

  @override
  String get appGuideFeedTitle => 'Encontre suporte no feed';

  @override
  String get appGuideFeedBody =>
      'Compartilhar sua raiva pode conectá-lo a outras pessoas que sentem o mesmo.';

  @override
  String get appGuideFeedItem1 =>
      'Depois de salvar, você pode postar **anonimamente** no feed';

  @override
  String get appGuideFeedItem2 =>
      'Curtir ou comentar nas postagens de outras pessoas';

  @override
  String get appGuideFeedItem3 =>
      'Você pode excluir sua própria postagem a qualquer momento';

  @override
  String get appGuideStatsTitle => 'Acompanhe seus padrões emocionais';

  @override
  String get appGuideStatsBody =>
      'A guia de estatísticas ajuda você a analisar seus padrões de raiva.';

  @override
  String get appGuideStatsItem1 =>
      'Gráfico de tendência de intensidade de raiva por período';

  @override
  String get appGuideStatsItem2 => 'Distribuição de causas por categoria';

  @override
  String get appGuideStatsItem3 =>
      'Visualização de calendário para navegar pelos registros por data';

  @override
  String get appGuideStatsItem4 =>
      'Relatório de raiva para analisar padrões por categoria';

  @override
  String get appGuideCalmTitle => 'Abaixe sua raiva';

  @override
  String get appGuideCalmBody =>
      'Após o login, vá para a guia calma para tentar diminuir sua emoção.';

  @override
  String get appGuideCalmItem1 =>
      'Lembretes: revisite os registros sinalizados para uso posterior';

  @override
  String get appGuideCalmItem2 =>
      'Respiração: acalme sua mente com a técnica 4-7-8';

  @override
  String get appGuideCalmItem3 =>
      'Tempo limite: diminua sua reação com um cronômetro de 10 minutos';

  @override
  String get appGuideCalmItem4 =>
      'Meditação com imagens: mude seu humor com imagens da natureza';

  @override
  String get appGuideProfileTitle => 'Apelido e perfil';

  @override
  String get appGuideProfileBody =>
      'Vá em menu > Configurações para alterar seu apelido e avatar.';

  @override
  String get appGuideProfileItem1 =>
      'Apelido: digite o seu próprio ou gere um aleatoriamente';

  @override
  String get appGuideProfileItem2 => 'Avatar: represente-se com um emoji';

  @override
  String get appGuideNotificationTitle => 'Configurações de notificação';

  @override
  String get appGuideNotificationItem1 =>
      'Alertas de lembrete: seja lembrado de uma nota de raiva no horário que você definir';

  @override
  String get appGuideNotificationItem2 =>
      'Alertas de comentários: seja notificado quando alguém comentar em sua postagem';

  @override
  String get appGuideNotificationHint =>
      'Alterne entre Configurações> Notificações';

  @override
  String get appGuideFooterTitle => 'Fury Note App Guide';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appTitle => 'Fury Note';

  @override
  String get appKoreanName => 'Fury Note';

  @override
  String get record => 'Registro';

  @override
  String get feed => 'Feed';

  @override
  String get stats => 'Estatísticas';

  @override
  String get calm => 'Acalmar';

  @override
  String get settings => 'Configurações';

  @override
  String get drawerGuide => 'Guia do app';

  @override
  String get drawerCalmGuide => 'Guia de calma';

  @override
  String get drawerVersion => 'Fury Note v1.0.0';

  @override
  String get menuTooltip => 'Menu';

  @override
  String drawerRecordCount(String count) {
    return '🔥 $count notas de raiva';
  }

  @override
  String get drawerSettingsSubtitle => 'Apelido · notificações';

  @override
  String get drawerGuideSubtitle => 'Como usar o Fury Note';

  @override
  String get drawerCalmGuideSubtitle => 'Cartões de calma · dicas de hoje';

  @override
  String get relativeTimeJustNow => 'Agora mesmo';

  @override
  String relativeTimeMinutesAgo(int count) {
    return '$count minutos atrás';
  }

  @override
  String relativeTimeHoursAgo(int count) {
    return '${count}horas atrás';
  }

  @override
  String relativeTimeDaysAgo(int count) {
    return '$count dias atrás';
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
  String get recordTitle => 'Registro de raiva';

  @override
  String get stepIntensity => 'Quão bravo você está agora?';

  @override
  String get stepIntensitySub => 'Escolha um emoji';

  @override
  String get stepCategory => 'O que causou isso?';

  @override
  String get stepCategorySub => 'Escolha uma categoria';

  @override
  String get stepText => 'O que aconteceu?';

  @override
  String get stepTextSub => 'Você pode pular isso';

  @override
  String get stepReminder => 'Quer revisitar mais tarde?';

  @override
  String get stepReminderSub => 'Você pode pular isso';

  @override
  String get stepSave => 'Salvar esta nota?';

  @override
  String get stepSaveSub => 'Você pode publicá-lo depois de salvar';

  @override
  String get stepPost => 'Compartilhar esse sentimento?';

  @override
  String get stepPostSub => 'Será anônimo';

  @override
  String get voiceInput => 'Gravação de voz';

  @override
  String get next => 'Próximo';

  @override
  String get previous => 'Anterior';

  @override
  String get skip => 'Pular';

  @override
  String get save => 'Salvar';

  @override
  String get saveNote => 'Salvar nota';

  @override
  String get postIt => 'Publicar';

  @override
  String get saveOnly => 'Só salvar';

  @override
  String get feedPostedToast => 'Enviado para feed';

  @override
  String get recordPostedToast => 'Postado';

  @override
  String get recordSavedToast => 'Salvo';

  @override
  String get commentPostedToast => 'Comentário postado';

  @override
  String get commentSendFailedToast =>
      'Não foi possível enviar o comentário. Por favor, tente novamente.';

  @override
  String get commentDeleteTitle => 'Excluir comentário';

  @override
  String get commentDeleteContent => 'Excluir este comentário?';

  @override
  String commentsCount(int count) {
    return '$count comentários';
  }

  @override
  String get commentsEmpty =>
      'Ainda não há comentários\nSeja o primeiro a deixar um 💬';

  @override
  String get commentInputHint => 'Escreva um comentário...';

  @override
  String get apiErrorContentBlockedUrl =>
      'Postagens com links não podem ser enviadas.';

  @override
  String get apiErrorContentBlockedSpam =>
      'Texto promocional não pode ser enviado.';

  @override
  String get apiErrorContentBlockedProfanity =>
      'Conteúdo contendo palavrões não pode ser enviado.';

  @override
  String get apiErrorContentBlockedModeration =>
      'Este conteúdo não pode ser enviado.';

  @override
  String get apiErrorRateLimitExceeded =>
      'Por favor, tente novamente em alguns instantes.';

  @override
  String get apiErrorInternal =>
      'Ocorreu um erro no servidor. Por favor, tente novamente em alguns instantes.';

  @override
  String get apiErrorInvalidRequest => 'Solicitação inválida.';

  @override
  String get apiErrorForbidden => 'Você não tem permissão.';

  @override
  String get apiErrorPostNotFound => 'Postagem não encontrada.';

  @override
  String get apiErrorCommentNotFound => 'Comentário não encontrado.';

  @override
  String get apiErrorSignatureRequired =>
      'A assinatura da solicitação é necessária.';

  @override
  String get apiErrorSignatureInvalid => 'Solicitação inválida.';

  @override
  String get apiErrorSignatureExpired =>
      'A solicitação expirou. Por favor, tente novamente.';

  @override
  String get apiErrorSignatureReplay => 'Esta solicitação já foi processada.';

  @override
  String get apiErrorUnknown => 'Ocorreu um erro desconhecido.';

  @override
  String get reminderNotification => 'Notificação de lembrete';

  @override
  String get noReminder => 'Não definido';

  @override
  String get summaryIntensity => 'Nível de raiva';

  @override
  String get summaryCategory => 'Categoria';

  @override
  String get summaryText => 'Texto';

  @override
  String get summaryReminder => 'Lembrete';

  @override
  String get none => 'Nenhum';

  @override
  String get other => 'Outro';

  @override
  String get family => 'Família';

  @override
  String get romance => 'Romance';

  @override
  String get work => 'Trabalho';

  @override
  String get people => 'Pessoas';

  @override
  String get driving => 'Dirigindo';

  @override
  String get custom => 'Personalizado';

  @override
  String get recordCustomCategoryHint => 'Insira uma categoria';

  @override
  String get recordTextHint => 'Escreva aqui';

  @override
  String get recordMicPermissionRequired =>
      'É necessária permissão para microfone.';

  @override
  String recordVoiceStartFailed(String label) {
    return 'Não foi possível iniciar $label.';
  }

  @override
  String get recordVoiceStopRecording => 'Pare de gravar';

  @override
  String get recordVoiceRecordAgain => 'Grave novamente';

  @override
  String get recordVoiceSaved => 'Gravação de voz salva.';

  @override
  String get recordAudioSummaryLabel => 'Voz';

  @override
  String get recordAudioIncluded => 'Gravação incluída';

  @override
  String get recordSavingInProgress => 'Salvando...';

  @override
  String get recordPostingInProgress => 'Enviando...';

  @override
  String get recordSaveFailedToast =>
      'Não foi possível salvar a nota. Por favor, tente novamente.';

  @override
  String get recordProgressSemantics => 'Registrar progresso';

  @override
  String get hourSuffix => 'h';

  @override
  String get minuteSuffix => 'eu';

  @override
  String get reminderCustom => 'Personalizado';

  @override
  String get reminderIn30Minutes => 'Em 30 minutos';

  @override
  String get reminderIn1Hour => 'Em 1 hora';

  @override
  String get reminderIn2Hours => 'Em 2 horas';

  @override
  String get reminderIn6Hours => 'Em 6 horas';

  @override
  String get reminderTomorrow => 'Amanhã';

  @override
  String get annoyed => 'Irritado';

  @override
  String get angry => 'Irritado';

  @override
  String get mad => 'Louco';

  @override
  String get furious => 'Furioso';

  @override
  String get rage => 'Raiva';

  @override
  String get calmed => 'Calma';

  @override
  String get feedTitle => 'Feed';

  @override
  String get feedSubtitle => 'Veja histórias recentes de raiva';

  @override
  String get feedAllTab => 'Feed geral';

  @override
  String get feedMineTab => 'Meu feed';

  @override
  String get feedLoadFailed => 'Não foi possível carregar o feed.';

  @override
  String get feedEmptyMine =>
      'Você ainda não postou no feed.\nCompartilhe sua primeira nota de raiva!';

  @override
  String get feedEmptyAll =>
      'Nenhuma postagem no feed ainda.\nSeja o primeiro a compartilhar sua raiva!';

  @override
  String get feedPostFailedToast =>
      'Não foi possível enviar para o feed. Por favor, tente novamente.';

  @override
  String get like => 'Me identifico';

  @override
  String get comment => 'Comentário';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get statsTitle => 'Estatísticas de raiva';

  @override
  String get statsSubtitle => 'Veja o padrão emocional desta semana';

  @override
  String get week => '1 semana';

  @override
  String get month => '1 mês';

  @override
  String get all => 'Todos';

  @override
  String get totalRecords => 'Registros';

  @override
  String get highestLevel => 'Mais alto';

  @override
  String get dailyAverage => 'Média diária';

  @override
  String get decreaseRate => 'Diminuir';

  @override
  String get statsIntensityTrend => 'Tendência de intensidade de raiva';

  @override
  String get statsCategoryDistribution => 'Distribuição de causa';

  @override
  String get statsNoRecords => 'Não há registros para mostrar.';

  @override
  String get statsCalendarButtonTitle => 'Ver registros por calendário';

  @override
  String get statsCalendarButtonSubtitle =>
      'Verifique e gerencie notas de raiva por data';

  @override
  String get statsCalendarTitle => 'Ver registros por calendário';

  @override
  String get statsOtherCategory => 'Outro';

  @override
  String selectedDateRecordsTitle(String date) {
    return '$date registros';
  }

  @override
  String get noRecordsOnSelectedDate =>
      'Nenhum registro foi escrito na data selecionada.';

  @override
  String get reminderAction => 'Lembrete';

  @override
  String get play => 'Reproduzir';

  @override
  String get statsSummaryButtonTitle => 'Ver relatório de raiva';

  @override
  String get statsSummaryButtonSubtitle =>
      'Percorra seus padrões de raiva por categoria';

  @override
  String get statsSummaryTitle => 'Relatório de raiva';

  @override
  String get statsSummaryClose => 'Fechar';

  @override
  String get statsSummaryEmptyTitle => 'Ainda não há registros para resumir';

  @override
  String get statsSummaryEmptyBody =>
      'Depois de adicionar notas de raiva, os padrões de categoria aparecerão aqui.';

  @override
  String statsSummaryTopHeadline(String category) {
    return '\"$category\" deixou você com raiva com mais frequência';
  }

  @override
  String statsSummaryCategoryHeadline(String category) {
    return 'Olhando para \"$category\"';
  }

  @override
  String get statsSummaryComfortGeneric =>
      'Está tudo bem. Isso pode acontecer.';

  @override
  String get statsSummaryComfortFamily =>
      'Quanto mais perto alguém estiver, mais difícil será pousar.';

  @override
  String get statsSummaryComfortRomance =>
      'Um relacionamento precioso pode tornar os pequenos momentos mais nítidos.';

  @override
  String get statsSummaryComfortWork =>
      'O trabalho pode ter levado sua mente mais rápido do que gostaria.';

  @override
  String get statsSummaryComfortPeople =>
      'Palavras e expressões de outras pessoas podem durar mais tempo do que o esperado.';

  @override
  String get statsSummaryComfortDriving =>
      'A tensão na estrada geralmente atinge primeiro o corpo.';

  @override
  String get statsSummaryMetricCount => 'Contar';

  @override
  String get statsSummaryMetricCategory => 'Categoria';

  @override
  String get statsSummaryMetricFeed => 'Postagens de feed';

  @override
  String get statsSummaryMetricCalm => 'Calma tenta';

  @override
  String get statsSummaryMetricAverage => 'Média nível';

  @override
  String get statsSummaryMetricPeak => 'Nível de pico';

  @override
  String get statsSummaryConclusion => 'Conclusão';

  @override
  String statsSummaryRecordsUnit(int count) {
    return '$count vezes';
  }

  @override
  String statsSummaryAverageValue(String value) {
    return '$value/5';
  }

  @override
  String get statsSummaryConclusionTop =>
      'Este é o seu sinal de raiva mais repetido. Da próxima vez, tente verificar a tensão corporal antes que a raiva aumente totalmente.';

  @override
  String get statsSummaryConclusionCategory =>
      'Anotar essa categoria enquanto ela ainda é pequena pode ajudá-lo a perceber o padrão mais cedo.';

  @override
  String statsSummaryPageIndicator(int current, int total) {
    return '$current/$total';
  }

  @override
  String get statsSummaryCategoryShare => 'Compartilhamento de categoria';

  @override
  String get statsSummaryCalmRate => 'Taxa calma';

  @override
  String get statsSummaryShareRate => 'Taxa de compartilhamento';

  @override
  String get noContent => 'Sem conteúdo';

  @override
  String get voicePlayback => 'Reproduzir voz';

  @override
  String get deleteConfirm => 'Excluir?';

  @override
  String get delete => 'Excluir';

  @override
  String get cancel => 'Cancelar';

  @override
  String get calmTitle => 'Acalmar';

  @override
  String get calmSubtitle => 'Abaixe o que ainda permanece';

  @override
  String get reminderNotes => 'Lembretes';

  @override
  String get breathing => 'Respiração';

  @override
  String get timeout => 'Tempo limite';

  @override
  String get meditation => 'Meditação de imagem';

  @override
  String get feedSupport => 'Suporte de feed';

  @override
  String get calmReminderEmpty =>
      'Os lembretes aparecerão aqui quando eles chegarem';

  @override
  String get calmReminderFallbackText => 'Como é essa raiva agora?';

  @override
  String get calmCheckTitle => 'Quão bravo você está agora?';

  @override
  String calmCheckSubtitle(String emoji, String label) {
    return '$emoji $label · aquela raiva anterior';
  }

  @override
  String get calmSavedCalmedToast => 'Que bom que você se acalmou.';

  @override
  String get calmSavedUpdatedToast => 'Salvo';

  @override
  String get profileName => 'Tigre irritado';

  @override
  String get nicknameAdjectives =>
      'zangado, furioso, furioso, explosivo, feroz, rosnando, afiado, com chifres, aquecido, áspero, feroz, violento, ardente, trovejante, bufando, fervendo, ressentido, em chamas, tempestuoso, venenoso';

  @override
  String get nicknameAnimals =>
      'tigre, leão, lobo, urso, águia, tubarão, leopardo, chita, crocodilo, cobra, touro, javali, rinoceronte, hiena, pardo, corvo, falcão, ouriço, onça, puma';

  @override
  String get notificationSettings => 'Notificações';

  @override
  String get commentNotification => 'Alertas de comentários';

  @override
  String get settingsNotificationsSection => 'Notificações';

  @override
  String get settingsReminderSubtitle =>
      'Lembrete de nota de raiva no horário que você definir';

  @override
  String get settingsCommentSubtitle =>
      'Alertar quando alguém comentar em sua postagem';

  @override
  String get settingsDataSection => 'Dados';

  @override
  String get settingsDataImportSubtitle =>
      'Restaurar registros de um arquivo de backup';

  @override
  String get settingsSupportSection => 'Suporte';

  @override
  String get settingsPrivacySubtitle =>
      'Informações coletadas e finalidade de uso';

  @override
  String get settingsFeedbackTitle => 'Enviar comentários';

  @override
  String get settingsFeedbackSubtitle => 'Problemas ou ideias de melhoria';

  @override
  String get settingsRecordCountUnit => 'registros';

  @override
  String get settingsPostCountUnit => 'postagens';

  @override
  String get proPlan => 'Exportação de dados PRO';

  @override
  String get backupImport => 'Importar dados';

  @override
  String get settingsDataExportSubtitle =>
      'Arquivo de backup · histórico · compartilhamento';

  @override
  String get dataExportTitle => 'Exportar dados';

  @override
  String get dataExportProTitle => 'Exportação de dados PRO';

  @override
  String get dataExportDescription =>
      'Crie um arquivo de backup com todos os dados do aplicativo local e compartilhe-o por e-mail ou mensageiro.';

  @override
  String get dataExportOneTimePurchase => 'Compra única · acesso vitalício';

  @override
  String get dataExportDebugPrice => 'DEBUG';

  @override
  String get dataExportInProgress => 'Exportando';

  @override
  String get dataExportPaymentChecking => 'Verificando o pagamento';

  @override
  String get dataExportCreateButton => 'Criar exportação';

  @override
  String get dataExportPayAndCreateButton => 'Pague e exporte';

  @override
  String get dataExportRestorePurchase => 'Restaurar compra';

  @override
  String get dataExportCreatedToast => 'Arquivo de exportação criado.';

  @override
  String get dataExportFailedToast =>
      'Não foi possível criar o arquivo de exportação.';

  @override
  String get dataExportShareSubject => 'Backup de dados do Fury Note';

  @override
  String get dataExportShareText =>
      'Este é um arquivo de backup de dados do Fury Note.';

  @override
  String get dataExportShareFailedToast =>
      'Não foi possível abrir a planilha de compartilhamento.';

  @override
  String get dataExportAllDataIncluded =>
      'Todos os dados locais do aplicativo estão incluídos no backup';

  @override
  String get dataExportHistoryTitle => 'Histórico de exportação';

  @override
  String dataExportHistoryCount(int count) {
    return '$count';
  }

  @override
  String get dataExportShareTooltip => 'Compartilhar';

  @override
  String get dataExportEmptyHistory => 'Ainda não há arquivos de exportação.';

  @override
  String get purchaseUpdateFailed =>
      'Não foi possível processar a atualização da compra.';

  @override
  String get purchaseStatusFailed =>
      'Não foi possível verificar o status da compra.';

  @override
  String get purchaseProductNotFound => 'Produto da loja não encontrado.';

  @override
  String get purchaseStoreUnavailable => 'Não foi possível conectar-se à loja.';

  @override
  String get purchaseProductInfoFailed =>
      'Não foi possível carregar as informações do produto da loja.';

  @override
  String get purchaseProductUnavailable =>
      'As informações do produto ainda não estão prontas.';

  @override
  String get purchaseStartFailed => 'Não foi possível iniciar a compra.';

  @override
  String get purchaseCanceled => 'A compra foi cancelada.';

  @override
  String get purchaseReceiptInvalid =>
      'Não foi possível verificar o recibo de compra.';

  @override
  String get purchaseReceiptVerifyFailed =>
      'Falha na verificação do recibo de compra.';

  @override
  String get dataImportTitle => 'Importar dados';

  @override
  String get dataImportPickTitle => 'Selecione o arquivo de backup';

  @override
  String get dataImportPickDescription =>
      'Selecione um arquivo .fnbackup\nexportado do Fury Note';

  @override
  String get dataImportPickButton => 'Escolha o arquivo';

  @override
  String get dataImportInProgress => 'Importando';

  @override
  String dataImportSuccessToast(int count) {
    return 'Dados substituídos do backup. ($count registros)';
  }

  @override
  String get dataImportNoNewDataToast =>
      'Dados substituídos do backup. (0 registros)';

  @override
  String get dataImportFailedToast =>
      'Não foi possível importar o arquivo de backup.';

  @override
  String get dataImportInvalidFileToast =>
      'Somente arquivos .fnbackup podem ser importados.';

  @override
  String get dataImportNoticeTitle => 'Antes de importar';

  @override
  String get dataImportNoticeBody =>
      'Os dados existentes serão excluídos e substituídos pelos dados do arquivo de backup.';

  @override
  String get dataImportTransferTitle => 'Dispositivos móveis';

  @override
  String get dataImportTransferBody =>
      'Depois de instalar o aplicativo em um novo dispositivo, importe um arquivo de backup para substituir os dados locais atuais pelos dados de backup.';

  @override
  String get feedDeleteTitle => 'Excluir feed';

  @override
  String get feedDeleteContent => 'Excluir este feed?';

  @override
  String get calmBreathingTitle => 'Respiração';

  @override
  String get breathPhaseInhale => 'Inspire';

  @override
  String get breathPhaseHold => 'Espera';

  @override
  String get breathPhaseExhale => 'Expire';

  @override
  String durationSeconds(int count) {
    return '${count}segundos';
  }

  @override
  String cycleCount(int count) {
    return 'Ciclo $count';
  }

  @override
  String get calmTimeoutRunning => 'Correndo';

  @override
  String get calmTimeoutPaused => 'Pausado';

  @override
  String get reset => 'Redefinir';

  @override
  String get start => 'Iniciar';

  @override
  String get pause => 'Pausar';

  @override
  String get stop => 'Parar';

  @override
  String get calmMeditationSceneWave => 'Ondas';

  @override
  String get calmMeditationSceneForest => 'Floresta';

  @override
  String get calmMeditationSceneSunset => 'Pôr do sol';

  @override
  String get calmMeditationSceneMountain => 'Montanha';

  @override
  String get calmMeditationSceneCherryBlossom => 'Flores de cerejeira';

  @override
  String get calmMeditationSceneNightSky => 'Céu noturno';

  @override
  String get calmMeditationPrompt => 'Inspire profundamente e depois expire';

  @override
  String get autoplay => 'Reprodução automática';

  @override
  String get profileEditTitle => 'Editar perfil';

  @override
  String get nicknameLabel => 'Apelido';

  @override
  String get nicknameHint => 'Digite um apelido';

  @override
  String get nicknameRequiredError => 'Por favor insira um apelido';

  @override
  String get nicknameCodeAutomaticError =>
      'Seu código é adicionado automaticamente';

  @override
  String get nicknameTooShortError => 'Use pelo menos 2 caracteres';

  @override
  String profileSavedToast(String name) {
    return '✅ Alterado para \"$name\"!';
  }

  @override
  String get profileSaveFailedToast => 'Ocorreu um erro ao salvar.';

  @override
  String get avatarPickGallery => 'Escolha na biblioteca';

  @override
  String get avatarPickCamera => 'Tire uma foto';

  @override
  String get avatarReset => 'Usar avatar padrão';

  @override
  String get avatarResetToast => 'Avatar padrão restaurado.';

  @override
  String get avatarAppliedToast => 'Foto do perfil aplicada.';

  @override
  String get avatarTooLargeToast =>
      'Somente fotos de até 5 MB podem ser usadas.';

  @override
  String get avatarLoadFailedToast => 'Não foi possível carregar a foto.';

  @override
  String get profileCodeLabel => 'Código do perfil (não pode ser alterado)';

  @override
  String get profileSaveButton => 'Salvar alterações';

  @override
  String get avatarChangeLabel => 'Alterar foto do perfil';

  @override
  String get avatarChangeHint => 'Toque na foto para alterá-la';

  @override
  String get avatarSizeHint => 'JPG, PNG, GIF · até 5 MB';

  @override
  String get reminderNotificationFallbackBody => 'Como é essa raiva agora?';

  @override
  String get calmGuideTitle =>
      'Quando a raiva aumenta,\nabaixe seu corpo com segurança primeiro';

  @override
  String get calmGuideSubtitle =>
      'O guia calmo do Fury Note não diz para você se livrar da raiva. É um pequeno guia para ajudar o sentimento a passar sem que ninguém se machuque.';

  @override
  String get calmGuideNotice =>
      '**Se você estiver em perigo imediato**, peça ajuda às pessoas ao seu redor ou entre em contato com os serviços de emergência primeiro, em vez de permanecer neste aplicativo.';

  @override
  String get calmGuideMomentTitle => 'No momento em que a raiva aumenta';

  @override
  String get calmGuideMomentBody1 =>
      'A raiva pode ser um sinal de que algo que lhe interessa foi violado. Mas num estado de forte raiva, o julgamento acelera e as palavras e ações podem tornar-se mais ásperas do que o habitual.';

  @override
  String get calmGuideMomentBody2 =>
      'O que é necessário agora não é ser **perfeitamente racional**, mas **atrasar sua reação em até 30 segundos**.';

  @override
  String get calmGuideRoutineTitle => 'Rotina calma de 60 segundos';

  @override
  String get calmGuideStep1Title => 'Pare';

  @override
  String get calmGuideStep1Desc =>
      'Pause a resposta, a ligação, o comentário ou a movimentação. Relaxe as mãos e desvie o olhar da tela por um momento.';

  @override
  String get calmGuideStep2Title => 'Respire';

  @override
  String get calmGuideStep2Desc =>
      'Inspire por 4 segundos, segure por 7, expire por 8. Está tudo bem se não estiver perfeito.';

  @override
  String get calmGuideStep3Title => 'Verifique seu corpo';

  @override
  String get calmGuideStep3Desc =>
      'Verifique se sua mandíbula, ombros, punhos ou estômago estão tensos e solte apenas um ponto.';

  @override
  String get calmGuideStep4Title => 'Escreva';

  @override
  String get calmGuideStep4Desc =>
      'Mesmo uma frase como “Agora estou com raiva porque ___” é suficiente.';

  @override
  String get calmGuideBreathTitle => '4-7-8 respiração';

  @override
  String get calmGuideBreathStep1 => 'Inspire pelo nariz por 4 segundos.';

  @override
  String get calmGuideBreathStep2 => 'Prenda a respiração por 7 segundos.';

  @override
  String get calmGuideBreathStep3 =>
      'Expire lentamente pela boca por 8 segundos.';

  @override
  String get calmGuideBreathStep4 => 'Repita 3 vezes, se puder.';

  @override
  String get calmGuideBreathNote =>
      'Se for difícil prender a respiração por tanto tempo, reduza-a para uma contagem confortável como **3-3-5**. O que mais importa é uma expiração lenta e longa.';

  @override
  String get calmGuideTimeoutTitle => 'Tempo limite de 10 minutos';

  @override
  String get calmGuideTimeoutBody =>
      'Quanto mais forte a raiva, mais forte será o desejo de resolvê-la imediatamente. Mas falar agora pode trazer à tona palavras ofensivas primeiro.';

  @override
  String get calmGuideTimeoutExamplesTitle =>
      'Exemplos de frases de tempo limite';

  @override
  String get calmGuideTimeoutExample1 =>
      '“Estou com muita raiva agora, vamos conversar novamente em 10 minutos.”';

  @override
  String get calmGuideTimeoutExample2 =>
      '\"Estou fazendo uma pausa por um momento porque posso dizer algo que magoa.\"';

  @override
  String get calmGuideTimeoutExample3 =>
      '\"Não vou fugir, só preciso me acalmar antes de conversarmos novamente.\"';

  @override
  String get calmGuideSensoryTitle => 'Aterramento sensorial rápido';

  @override
  String get calmGuideSensory1Title => 'Água fria';

  @override
  String get calmGuideSensory1Desc =>
      'Segure água fria nos pulsos ou no rosto por cerca de 10 segundos';

  @override
  String get calmGuideSensory2Title => 'Sinta seus pés';

  @override
  String get calmGuideSensory2Desc =>
      'Observe lentamente a sensação de seus pés tocando o chão';

  @override
  String get calmGuideSensory3Title => 'Olhe ao redor';

  @override
  String get calmGuideSensory3Desc =>
      'Nomeie silenciosamente 5 objetos que você pode ver';

  @override
  String get calmGuideSensory4Title => 'Abaixe seus ombros';

  @override
  String get calmGuideSensory4Desc => 'Expire e abaixe os ombros apenas 1 cm';

  @override
  String get calmGuideQuestionsTitle =>
      'Perguntas que ajudam na hora de escrever';

  @override
  String get calmGuideQuestion1 => 'O que exatamente me deixou com raiva?';

  @override
  String get calmGuideQuestion2 => 'O que eu esperava, mas não recebi?';

  @override
  String get calmGuideQuestion3 =>
      'De que ação eu me arrependeria se fizesse isso agora?';

  @override
  String get calmGuideQuestion4 =>
      'Por qual escolha o meu eu de amanhã será grato?';

  @override
  String get calmGuideTag1 => 'Registro de emoções';

  @override
  String get calmGuideTag2 => 'Distanciamento da raiva';

  @override
  String get calmGuideTag3 => 'Verificação de lembrete';

  @override
  String get calmGuideDangerTitle => 'Peça ajuda primeiro nestes casos';

  @override
  String get calmGuideDanger1 =>
      'Quando a vontade de machucar a si mesmo ou aos outros parece forte';

  @override
  String get calmGuideDanger2 =>
      'Quando a vontade de jogar ou quebrar as coisas não para';

  @override
  String get calmGuideDanger3 =>
      'Quando você sente vontade de confrontar ou ameaçar a outra pessoa';

  @override
  String get calmGuideDanger4 =>
      'Quando álcool, drogas ou privação grave de sono dificultam o controle';

  @override
  String get calmGuideDangerBody =>
      'Nesses casos, não tente superar isso apenas com uma rotina calma - peça ajuda às pessoas ao seu redor, aos serviços profissionais ou aos serviços de emergência.';

  @override
  String get calmGuideFooterTitle => 'Fury Note Calm Guide';

  @override
  String get calmGuideFooterDisclaimer =>
      'Este documento não substitui o diagnóstico ou tratamento médico.';

  @override
  String get privacyTitle => 'Política de Privacidade';

  @override
  String get privacyLastUpdated => 'Data de vigência: 16 de junho de 2026';

  @override
  String get privacySection1Title => '1. Categorias de informações coletadas';

  @override
  String get privacySection1Body =>
      'Fury Note pode ser usado sem qualquer registro de membro. A Empresa coleta apenas as seguintes informações.\n· Identificador do dispositivo — um valor emitido aleatoriamente usado para identificar o usuário sem registro, com a finalidade de prevenir uso fraudulento\n· Dados de registro de raiva — intensidade, categoria e texto (armazenados apenas no dispositivo)\n· Postagens anônimas no feed — apelido, imagem do avatar, intensidade, categoria e texto\n· Comentários — apelido e texto do comentário\n· Registros de curtidas — se o usuário gostou de uma determinada postagem\n· Token de notificação push — para fins de envio de notificações (opcional)';

  @override
  String get privacySection2Title => '2. Finalidade do Processamento';

  @override
  String get privacySection2Body =>
      '· Fornecimento de recursos da comunidade, incluindo feed anônimo, comentários e curtidas\n· Detecção de uso fraudulento, incluindo prevenção de curtidas duplicadas na mesma postagem\n· Envio de notificações push, incluindo alertas de comentários\n· Operação do serviço e análise de erros';

  @override
  String get privacySection3Title =>
      '3. Sem registro de membro e sem retenção de informações pessoais';

  @override
  String get privacySection3Body =>
      'Fury Note não exige registro de membro e não coleta informações pessoais de identidade verificável, como nome, endereço de e-mail ou número de telefone.\nO apelido é gerado automaticamente ou inserido diretamente pelo usuário e não está vinculado à identidade real do usuário. O identificador do dispositivo também é um valor gerado aleatoriamente que não pode ser usado para identificar um indivíduo específico.';

  @override
  String get privacySection4Title =>
      '4. Fornecimento de informações a terceiros';

  @override
  String get privacySection4Body =>
      'A Empresa não fornece nem vende as informações coletadas a terceiros.';

  @override
  String get privacySection5Title =>
      '5. Período de Retenção e Utilização da Informação';

  @override
  String get privacySection5Body =>
      '· Os registros de raiva que foram salvos apenas são retidos apenas no dispositivo e são excluídos juntos após a exclusão do aplicativo.\n· Postagens, avatares e comentários compartilhados no feed anônimo são retidos no servidor até serem excluídos pelo usuário e são excluídos imediatamente mediante solicitação.\n· Registros semelhantes são excluídos juntos após a exclusão da postagem relacionada.';

  @override
  String get privacySection6Title => '6. Contato';

  @override
  String get privacySection6Body =>
      'Para dúvidas sobre informações pessoais, entre em contato com o endereço de e-mail abaixo.\nlunlu.co.kr@gmail.com';

  @override
  String get appGuideTitle => 'Como usar o Fury Note';

  @override
  String get appGuideSubtitle =>
      'Um guia para registrar a raiva, rastrear padrões e obter suporte no feed.';

  @override
  String get appGuideRecordTitle => 'Registre sua raiva';

  @override
  String get appGuideRecordBody =>
      'Quando estiver com raiva, toque no botão 🔥 na parte inferior para iniciar uma gravação.';

  @override
  String get appGuideRecordStep1 =>
      'Escolha a intensidade: escolha um emoji que corresponda ao quão irritado você está';

  @override
  String get appGuideRecordStep2 => 'Escolha uma categoria: escolha uma causa';

  @override
  String get appGuideRecordStep3 =>
      'Escreva: descreva o que aconteceu (você pode pular isso)';

  @override
  String get appGuideRecordStep4 =>
      'Lembrete: defina um horário se quiser revisitar isso mais tarde';

  @override
  String get appGuideRecordStep5 =>
      'Salvar ou postar: mantenha o registro privado ou compartilhe-o no feed';

  @override
  String get appGuideFeedTitle => 'Encontre suporte no feed';

  @override
  String get appGuideFeedBody =>
      'Compartilhar sua raiva pode conectá-lo a outras pessoas que sentem o mesmo.';

  @override
  String get appGuideFeedItem1 =>
      'Depois de salvar, você pode postar **anonimamente** no feed';

  @override
  String get appGuideFeedItem2 =>
      'Curtir ou comentar nas postagens de outras pessoas';

  @override
  String get appGuideFeedItem3 =>
      'Você pode excluir sua própria postagem a qualquer momento';

  @override
  String get appGuideStatsTitle => 'Acompanhe seus padrões emocionais';

  @override
  String get appGuideStatsBody =>
      'A guia de estatísticas ajuda você a analisar seus padrões de raiva.';

  @override
  String get appGuideStatsItem1 =>
      'Gráfico de tendência de intensidade de raiva por período';

  @override
  String get appGuideStatsItem2 => 'Distribuição de causas por categoria';

  @override
  String get appGuideStatsItem3 =>
      'Visualização de calendário para navegar pelos registros por data';

  @override
  String get appGuideStatsItem4 =>
      'Relatório de raiva para analisar padrões por categoria';

  @override
  String get appGuideCalmTitle => 'Abaixe sua raiva';

  @override
  String get appGuideCalmBody =>
      'Após o login, vá para a guia calma para tentar diminuir sua emoção.';

  @override
  String get appGuideCalmItem1 =>
      'Lembretes: revisite os registros sinalizados para uso posterior';

  @override
  String get appGuideCalmItem2 =>
      'Respiração: acalme sua mente com a técnica 4-7-8';

  @override
  String get appGuideCalmItem3 =>
      'Tempo limite: diminua sua reação com um cronômetro de 10 minutos';

  @override
  String get appGuideCalmItem4 =>
      'Meditação com imagens: mude seu humor com imagens da natureza';

  @override
  String get appGuideProfileTitle => 'Apelido e perfil';

  @override
  String get appGuideProfileBody =>
      'Vá em menu > Configurações para alterar seu apelido e avatar.';

  @override
  String get appGuideProfileItem1 =>
      'Apelido: digite o seu próprio ou gere um aleatoriamente';

  @override
  String get appGuideProfileItem2 => 'Avatar: represente-se com um emoji';

  @override
  String get appGuideNotificationTitle => 'Configurações de notificação';

  @override
  String get appGuideNotificationItem1 =>
      'Alertas de lembrete: seja lembrado de uma nota de raiva no horário que você definir';

  @override
  String get appGuideNotificationItem2 =>
      'Alertas de comentários: seja notificado quando alguém comentar em sua postagem';

  @override
  String get appGuideNotificationHint =>
      'Alterne entre Configurações> Notificações';

  @override
  String get appGuideFooterTitle => 'Fury Note App Guide';
}

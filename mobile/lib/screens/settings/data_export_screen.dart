import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import 'package:fury_note/src/backup/backup_service.dart';
import 'package:fury_note/src/backup/data_export_service.dart';
import 'package:fury_note/src/profile/app_profile.dart';
import 'package:fury_note/src/purchase/pro_export_purchase_service.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../../main.dart';
import '../../widgets/shared_widgets.dart';

String exportProfileDisplayName(Map<String, Object?> profile) {
  final displayName = (profile['display_name'] as String?)?.trim() ?? '';
  final profileNumber = (profile['profile_number'] as String?)?.trim() ?? '';
  if (displayName.isEmpty) return profileNumber;
  if (profileNumber.isEmpty || displayName.endsWith(profileNumber)) {
    return displayName;
  }
  return '$displayName $profileNumber';
}

class DataExportScreen extends StatefulWidget {
  const DataExportScreen({
    this.purchaseController,
    this.exportService,
    this.historyStore,
    super.key,
  });

  final ProExportPurchaseController? purchaseController;
  final DataExportService? exportService;
  final BackupHistoryStore? historyStore;

  @override
  State<DataExportScreen> createState() => _DataExportScreenState();
}

class _DataExportScreenState extends State<DataExportScreen> {
  late final ProExportPurchaseController _purchaseController;
  late final DataExportService _exportService;
  late final BackupHistoryStore _historyStore;
  late final bool _ownsPurchaseController;
  final _dateFormat = DateFormat('yyyy.MM.dd HH:mm');
  var _history = <BackupHistoryEntry>[];
  var _exporting = false;
  var _exportAfterPurchase = false;

  @override
  void initState() {
    super.initState();
    _ownsPurchaseController = widget.purchaseController == null;
    _purchaseController =
        widget.purchaseController ?? ProExportPurchaseController();
    _exportService = widget.exportService ?? DataExportService();
    _historyStore = widget.historyStore ?? BackupHistoryStore();
    _purchaseController.addListener(_onPurchaseChanged);
    _purchaseController.initialize();
    _loadHistory();
  }

  @override
  void dispose() {
    _purchaseController.removeListener(_onPurchaseChanged);
    if (_ownsPurchaseController) {
      _purchaseController.dispose();
    }
    super.dispose();
  }

  void _onPurchaseChanged() {
    if (!mounted) return;
    setState(() {});

    if (_exportAfterPurchase && _purchaseController.canExport && !_exporting) {
      _exportAfterPurchase = false;
      _createExport();
    }
  }

  Future<void> _loadHistory() async {
    final history = await _historyStore.load();
    if (!mounted) return;
    setState(() => _history = history);
  }

  Future<void> _handleExportTap() async {
    if (!_purchaseController.canExport) {
      _exportAfterPurchase = true;
      await _purchaseController.buy();
      final message = _purchaseController.errorMessage;
      if (mounted && message != null) {
        FurySnackBar.show(context, message);
      }
      return;
    }

    await _createExport();
  }

  Future<void> _createExport() async {
    if (_exporting) return;
    setState(() => _exporting = true);
    try {
      final l10n = AppLocalizations.of(context);
      final entry = await _exportService.createBackupExport(
        fallbackDisplayName: l10n.profileName,
        isPro: _purchaseController.isPro,
        isDebugMode: _purchaseController.isDebugMode,
      );
      await _loadHistory();
      if (!mounted) return;
      FurySnackBar.show(context, l10n.dataExportCreatedToast);
      await _shareEntry(entry);
    } catch (_) {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        FurySnackBar.show(context, l10n.dataExportFailedToast);
      }
    } finally {
      if (mounted) {
        setState(() => _exporting = false);
      }
    }
  }

  Future<void> _shareEntry(BackupHistoryEntry entry) async {
    final box = context.findRenderObject() as RenderBox?;
    final origin = box == null
        ? null
        : box.localToGlobal(Offset.zero) & box.size;
    try {
      await SharePlus.instance.share(
        ShareParams(
          subject: AppLocalizations.of(context).dataExportShareSubject,
          text: AppLocalizations.of(context).dataExportShareText,
          files: [
            XFile(
              entry.filePath,
              name: entry.fileName,
              mimeType: 'application/octet-stream',
            ),
          ],
          fileNameOverrides: [entry.fileName],
          sharePositionOrigin: origin,
        ),
      );
    } catch (_) {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        FurySnackBar.show(context, l10n.dataExportShareFailedToast);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: FuryColors.phone,
      appBar: AppBar(
        backgroundColor: FuryColors.chrome,
        title: Text(l10n.dataExportTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
        children: [
          _ExportHeroCard(
            controller: _purchaseController,
            exporting: _exporting,
            onExportTap: _handleExportTap,
            onRestoreTap: _purchaseController.restore,
          ),
          const SizedBox(height: 16),
          AnimatedBuilder(
            animation: AppProfileController.instance,
            builder: (context, _) {
              final profile = AppProfileController.instance.toExportJson(
                fallbackDisplayName: l10n.profileName,
              );
              return _ExportProfileCard(profile: profile);
            },
          ),
          const SizedBox(height: 20),
          _HistoryHeader(count: _history.length),
          const SizedBox(height: 10),
          if (_history.isEmpty)
            const _EmptyHistory()
          else
            for (final entry in _history) ...[
              _HistoryTile(
                entry: entry,
                dateText: _dateFormat.format(entry.createdAt),
                sizeText: _formatBytes(entry.byteCount),
                onShareTap: () => _shareEntry(entry),
              ),
              const SizedBox(height: 8),
            ],
        ],
      ),
    );
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    final kb = bytes / 1024;
    if (kb < 1024) return '${kb.toStringAsFixed(1)} KB';
    return '${(kb / 1024).toStringAsFixed(1)} MB';
  }
}

class _ExportHeroCard extends StatelessWidget {
  const _ExportHeroCard({
    required this.controller,
    required this.exporting,
    required this.onExportTap,
    required this.onRestoreTap,
  });

  final ProExportPurchaseController controller;
  final bool exporting;
  final VoidCallback onExportTap;
  final VoidCallback onRestoreTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final busy = controller.loading || controller.purchasing || exporting;
    final buttonLabel = switch ((
      controller.canExport,
      exporting,
      controller.purchasing,
    )) {
      (_, true, _) => l10n.dataExportInProgress,
      (_, _, true) => l10n.dataExportPaymentChecking,
      (true, _, _) => l10n.dataExportCreateButton,
      _ => l10n.dataExportPayAndCreateButton,
    };

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2A2000), Color(0xFF1A1500)],
        ),
        border: Border.all(color: const Color(0x40FFD700)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.dataExportProTitle,
                  style: const TextStyle(
                    color: Color(0xFFFFD700),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              if (controller.isDebugMode)
                const _DebugBadge()
              else if (controller.canExport)
                const _ActiveBadge(),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            l10n.dataExportDescription,
            style: const TextStyle(
              color: Color(0xFFAAAAAA),
              fontSize: 12,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                controller.displayPrice,
                style: const TextStyle(
                  color: Color(0xFFFFD700),
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                l10n.dataExportOneTimePurchase,
                style: const TextStyle(color: FuryColors.muted, fontSize: 11),
              ),
            ],
          ),
          if (controller.errorMessage != null) ...[
            const SizedBox(height: 8),
            Text(
              controller.errorMessage!,
              style: const TextStyle(color: FuryColors.red, fontSize: 11),
            ),
          ],
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: busy ? null : onExportTap,
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFFFD700),
                disabledBackgroundColor: const Color(0x55FFD700),
                foregroundColor: const Color(0xFF1A1A1A),
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              icon: busy
                  ? const SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.upload_file, size: 17),
              label: Text(
                buttonLabel,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          if (!controller.canExport && !controller.isDebugMode) ...[
            const SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: busy ? null : onRestoreTap,
                child: Text(l10n.dataExportRestorePurchase),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ExportProfileCard extends StatelessWidget {
  const _ExportProfileCard({required this.profile});

  final Map<String, Object?> profile;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: FuryColors.panel,
        border: Border.all(color: FuryColors.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const FuryProfileAvatar(
            size: 36,
            borderRadius: 12,
            fallbackFontSize: 18,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exportProfileDisplayName(profile),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: FuryColors.text,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  l10n.dataExportAllDataIncluded,
                  style: const TextStyle(color: FuryColors.faint, fontSize: 11),
                ),
              ],
            ),
          ),
          const Icon(Icons.check_circle, color: Color(0xFF2E6B3E), size: 18),
        ],
      ),
    );
  }
}

class _HistoryHeader extends StatelessWidget {
  const _HistoryHeader({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            l10n.dataExportHistoryTitle,
            style: const TextStyle(
              color: FuryColors.text,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Text(
          l10n.dataExportHistoryCount(count),
          style: const TextStyle(color: FuryColors.faint, fontSize: 11),
        ),
      ],
    );
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({
    required this.entry,
    required this.dateText,
    required this.sizeText,
    required this.onShareTap,
  });

  final BackupHistoryEntry entry;
  final String dateText;
  final String sizeText;
  final VoidCallback onShareTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: FuryColors.panel,
        border: Border.all(color: FuryColors.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.insert_drive_file_outlined,
              color: FuryColors.faint,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.fileName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: FuryColors.text,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$dateText · $sizeText',
                  style: const TextStyle(color: FuryColors.faint, fontSize: 11),
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: l10n.dataExportShareTooltip,
            onPressed: onShareTap,
            icon: const Icon(Icons.ios_share, size: 18),
            color: FuryColors.faint,
          ),
        ],
      ),
    );
  }
}

class _EmptyHistory extends StatelessWidget {
  const _EmptyHistory();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      decoration: BoxDecoration(
        color: FuryColors.panel,
        border: Border.all(color: FuryColors.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          l10n.dataExportEmptyHistory,
          style: const TextStyle(color: FuryColors.faint, fontSize: 12),
        ),
      ),
    );
  }
}

class _DebugBadge extends StatelessWidget {
  const _DebugBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        border: Border.all(color: FuryColors.border),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        'DEBUG',
        style: TextStyle(
          color: FuryColors.faint,
          fontSize: 9,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _ActiveBadge extends StatelessWidget {
  const _ActiveBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: const Text(
        'ACTIVE',
        style: TextStyle(
          color: Color(0xFF1A1A1A),
          fontSize: 9,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

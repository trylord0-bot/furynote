import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import 'package:fury_note/src/backup/data_import_service.dart';

import '../../main.dart';
import '../../widgets/shared_widgets.dart';

class DataImportScreen extends StatefulWidget {
  const DataImportScreen({this.importService, super.key});

  final DataImportService? importService;

  @override
  State<DataImportScreen> createState() => _DataImportScreenState();
}

class _DataImportScreenState extends State<DataImportScreen> {
  late final DataImportService _importService =
      widget.importService ?? DataImportService();
  var _importing = false;

  Future<void> _pickAndImport() async {
    if (_importing) return;

    final l10n = AppLocalizations.of(context);
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['fnbackup'],
      allowMultiple: false,
    );
    final path = result?.files.single.path;
    if (path == null) return;
    if (!path.toLowerCase().endsWith('.fnbackup')) {
      if (mounted) FurySnackBar.show(context, l10n.dataImportInvalidFileToast);
      return;
    }

    setState(() => _importing = true);
    try {
      final importResult = await _importService.importBackupFile(File(path));
      if (!mounted) return;
      FurySnackBar.show(
        context,
        l10n.dataImportSuccessToast(importResult.importedNoteCount),
      );
    } catch (_) {
      if (mounted) {
        FurySnackBar.show(context, l10n.dataImportFailedToast);
      }
    } finally {
      if (mounted) {
        setState(() => _importing = false);
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
        title: Text(l10n.dataImportTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: _importing ? null : _pickAndImport,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 36),
              decoration: BoxDecoration(
                color: FuryColors.panel,
                border: Border.all(
                  color: FuryColors.border,
                  style: BorderStyle.solid,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  if (_importing)
                    const SizedBox(
                      width: 36,
                      height: 36,
                      child: CircularProgressIndicator(strokeWidth: 3),
                    )
                  else
                    const Icon(
                      Icons.file_download_outlined,
                      color: FuryColors.muted,
                      size: 36,
                    ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.dataImportPickTitle,
                    style: const TextStyle(
                      color: FuryColors.text,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.dataImportPickDescription,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: FuryColors.faint,
                      fontSize: 11,
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.06),
                      border: Border.all(color: FuryColors.border),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _importing
                          ? l10n.dataImportInProgress
                          : l10n.dataImportPickButton,
                      style: const TextStyle(
                        color: FuryColors.muted,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          _ImportInfoPanel(l10n: l10n),
        ],
      ),
    );
  }
}

class _ImportInfoPanel extends StatelessWidget {
  const _ImportInfoPanel({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FuryColors.panel,
        border: Border.all(color: FuryColors.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _ImportInfoRow(
            icon: Icons.info_outline,
            title: l10n.dataImportNoticeTitle,
            body: l10n.dataImportNoticeBody,
          ),
          const Divider(height: 1, color: Color(0xFF1E1E1E)),
          _ImportInfoRow(
            icon: Icons.phone_android,
            title: l10n.dataImportTransferTitle,
            body: l10n.dataImportTransferBody,
          ),
        ],
      ),
    );
  }
}

class _ImportInfoRow extends StatelessWidget {
  const _ImportInfoRow({
    required this.icon,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: FuryColors.faint, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$title\n',
                    style: const TextStyle(
                      color: Color(0xFFCCCCCC),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: body,
                    style: const TextStyle(
                      color: FuryColors.muted,
                      fontSize: 11,
                      height: 1.7,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

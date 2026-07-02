import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import '../../main.dart';
import '../../src/api/device_service.dart';
import '../../src/profile/app_profile.dart';
import '../../widgets/shared_widgets.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final _nickController = TextEditingController();
  final _imagePicker = ImagePicker();
  bool _hasError = false;
  String _errorMsg = '';
  bool _avatarChanged = false;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    await AppProfileController.instance.load();
    if (!mounted) {
      return;
    }
    final savedName = AppProfileController.instance.savedDisplayName;
    final l10n = AppLocalizations.of(context);
    _nickController.text = savedName == null || savedName.isEmpty
        ? l10n.profileName
        : savedName;
    setState(() {});
  }

  @override
  void dispose() {
    _nickController.dispose();
    super.dispose();
  }

  bool get _canSave {
    final text = _nickController.text.trim();
    return text.length >= 2 && text.length <= 12 && !text.contains('#');
  }

  void _onNickChanged(String value) {
    final text = value.trim();
    final l10n = AppLocalizations.of(context);
    setState(() {
      if (text.isEmpty) {
        _hasError = true;
        _errorMsg = l10n.nicknameRequiredError;
      } else if (text.contains('#')) {
        _hasError = true;
        _errorMsg = l10n.nicknameCodeAutomaticError;
      } else if (text.length < 2) {
        _hasError = true;
        _errorMsg = l10n.nicknameTooShortError;
      } else {
        _hasError = false;
        _errorMsg = '';
      }
    });
  }

  Future<void> _saveNick() async {
    if (!_canSave || _saving) return;
    setState(() => _saving = true);
    try {
      final displayName = _nickController.text.trim();
      await AppProfileController.instance.updateDisplayName(displayName);

      if (_avatarChanged) {
        final avatarBase64 = AppProfileController.instance.avatarBase64;
        if (avatarBase64 != null) {
          await DeviceService.instance.updateAvatar(avatarBase64);
        } else {
          await DeviceService.instance.clearAvatar();
        }
        _avatarChanged = false;
      }

      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      FurySnackBar.show(context, l10n.profileSavedToast(displayName));
      Future.delayed(const Duration(milliseconds: 700), () {
        if (mounted) Navigator.of(context).pop();
      });
    } catch (_) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      _showProfileToast(l10n.profileSaveFailedToast, isError: true);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _showAvatarActions() async {
    final l10n = AppLocalizations.of(context);
    final action = await showModalBottomSheet<_AvatarAction>(
      context: context,
      backgroundColor: FuryColors.panel,
      barrierColor: Colors.black.withValues(alpha: 0.65),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: FuryColors.border,
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
                const SizedBox(height: 14),
                _AvatarActionTile(
                  icon: Icons.photo_library_outlined,
                  title: l10n.avatarPickGallery,
                  onTap: () => Navigator.pop(context, _AvatarAction.gallery),
                ),
                _AvatarActionTile(
                  icon: Icons.photo_camera_outlined,
                  title: l10n.avatarPickCamera,
                  onTap: () => Navigator.pop(context, _AvatarAction.camera),
                ),
                _AvatarActionTile(
                  icon: Icons.restart_alt,
                  title: l10n.avatarReset,
                  isDestructive: true,
                  onTap: () => Navigator.pop(context, _AvatarAction.clear),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (!mounted || action == null) {
      return;
    }

    switch (action) {
      case _AvatarAction.gallery:
        await _pickAvatar(ImageSource.gallery);
        break;
      case _AvatarAction.camera:
        await _pickAvatar(ImageSource.camera);
        break;
      case _AvatarAction.clear:
        await AppProfileController.instance.clearAvatar();
        setState(() => _avatarChanged = true);
        _showProfileToast(l10n.avatarResetToast);
        break;
    }
  }

  Future<void> _pickAvatar(ImageSource source) async {
    final l10n = AppLocalizations.of(context);
    try {
      final image = await _imagePicker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 88,
      );
      if (image == null) {
        return;
      }

      final bytes = await image.readAsBytes();
      await AppProfileController.instance.updateAvatar(bytes);
      setState(() => _avatarChanged = true);
      _showProfileToast(l10n.avatarAppliedToast);
    } on ProfileAvatarTooLargeException {
      _showProfileToast(l10n.avatarTooLargeToast, isError: true);
    } catch (_) {
      _showProfileToast(l10n.avatarLoadFailedToast, isError: true);
    }
  }

  void _showProfileToast(String message, {bool isError = false}) {
    if (!mounted) {
      return;
    }
    FurySnackBar.show(context, message, isError: isError);
  }

  @override
  Widget build(BuildContext context) {
    final len = _nickController.text.length;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: FuryColors.phone,
      appBar: AppBar(
        backgroundColor: FuryColors.chrome,
        title: Text(l10n.profileEditTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 28, 20, 40),
        child: Column(
          children: [
            _AvatarSection(onTap: _showAvatarActions),
            const SizedBox(height: 28),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.nicknameLabel,
                  style: const TextStyle(
                    color: FuryColors.muted,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Stack(
                  children: [
                    TextField(
                      controller: _nickController,
                      maxLength: 12,
                      onChanged: _onNickChanged,
                      style: const TextStyle(
                        color: FuryColors.text,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: InputDecoration(
                        hintText: l10n.nicknameHint,
                        counterText: '',
                        filled: true,
                        fillColor: FuryColors.panel,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _hasError
                                ? FuryColors.red
                                : FuryColors.border,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: FuryColors.red,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                    if (len > 0)
                      Positioned(
                        right: 14,
                        top: 14,
                        child: GestureDetector(
                          onTap: () {
                            _nickController.clear();
                            _onNickChanged('');
                          },
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: const BoxDecoration(
                              color: FuryColors.border,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: FuryColors.muted,
                              size: 11,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      _hasError ? _errorMsg : '',
                      style: const TextStyle(
                        color: FuryColors.red,
                        fontSize: 11,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '$len / 12',
                      style: const TextStyle(
                        color: FuryColors.faint,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 28),
            AnimatedBuilder(
              animation: AppProfileController.instance,
              builder: (context, _) {
                return Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: FuryColors.panel,
                    border: Border.all(color: FuryColors.border),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Text('🔑', style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.profileCodeLabel,
                              style: const TextStyle(
                                color: FuryColors.faint,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              AppProfileController.instance.profileCode,
                              style: const TextStyle(
                                color: FuryColors.muted,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text('🔒', style: TextStyle(fontSize: 13)),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: (_canSave && !_saving) ? _saveNick : null,
                style: FilledButton.styleFrom(
                  backgroundColor: FuryColors.red,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: _saving
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        l10n.profileSaveButton,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _AvatarAction { gallery, camera, clear }

class _AvatarSection extends StatelessWidget {
  const _AvatarSection({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Semantics(
          button: true,
          label: l10n.avatarChangeLabel,
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: onTap,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 92,
                  height: 92,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: const Color(0xFF3A2020),
                      width: 2,
                    ),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF2A1A1A), Color(0xFF1E1E1E)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const FuryProfileAvatar(
                    size: 88,
                    borderRadius: 27,
                    fallbackFontSize: 42,
                  ),
                ),
                Positioned(
                  right: -4,
                  bottom: -4,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: FuryColors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: FuryColors.phone, width: 2),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: l10n.avatarChangeHint,
                style: const TextStyle(
                  color: FuryColors.muted,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: '\n${l10n.avatarSizeHint}',
                style: const TextStyle(color: FuryColors.faint, fontSize: 11),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _AvatarActionTile extends StatelessWidget {
  const _AvatarActionTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isDestructive = false,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? FuryColors.red : FuryColors.text;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 6),
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.11),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: color, size: 18),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 14,
          fontWeight: FontWeight.w800,
        ),
      ),
      onTap: onTap,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../main.dart';
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
    _nickController.text = savedName == null || savedName.isEmpty
        ? '화난 호랑이'
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
    return text.length >= 2 && text.length <= 12;
  }

  void _onNickChanged(String value) {
    final text = value.trim();
    setState(() {
      if (text.isEmpty) {
        _hasError = true;
        _errorMsg = '닉네임을 입력해주세요';
      } else if (text.length < 2) {
        _hasError = true;
        _errorMsg = '2자 이상 입력해주세요';
      } else {
        _hasError = false;
        _errorMsg = '';
      }
    });
  }

  Future<void> _saveNick() async {
    if (!_canSave) return;
    final displayName = _nickController.text.trim();
    await AppProfileController.instance.updateDisplayName(displayName);
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(
            '✅ "$displayName"으로 변경됐어요!',
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xFF2E6B3E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) Navigator.of(context).pop();
    });
  }

  Future<void> _showAvatarActions() async {
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
                  title: '앨범에서 선택',
                  onTap: () => Navigator.pop(context, _AvatarAction.gallery),
                ),
                _AvatarActionTile(
                  icon: Icons.photo_camera_outlined,
                  title: '카메라로 촬영',
                  onTap: () => Navigator.pop(context, _AvatarAction.camera),
                ),
                _AvatarActionTile(
                  icon: Icons.restart_alt,
                  title: '기본 아바타로 변경',
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
        _showProfileToast('기본 아바타로 변경됐어요.');
        break;
    }
  }

  Future<void> _pickAvatar(ImageSource source) async {
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
      _showProfileToast('프로필 사진이 적용됐어요.');
    } on ProfileAvatarTooLargeException {
      _showProfileToast('5MB 이하의 사진만 사용할 수 있어요.', isError: true);
    } catch (_) {
      _showProfileToast('사진을 불러오지 못했어요.', isError: true);
    }
  }

  void _showProfileToast(String message, {bool isError = false}) {
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: isError
              ? FuryColors.deepRed
              : const Color(0xFF2E6B3E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final len = _nickController.text.length;

    return Scaffold(
      backgroundColor: FuryColors.phone,
      appBar: AppBar(
        backgroundColor: FuryColors.chrome,
        title: const Text('프로필 수정'),
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
                const Text(
                  '닉네임',
                  style: TextStyle(
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
                        hintText: '닉네임을 입력하세요',
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
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: FuryColors.panel,
                border: Border.all(color: FuryColors.border),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Text('🔑', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '고유번호 (변경 불가)',
                          style: TextStyle(
                            color: FuryColors.faint,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '#4827',
                          style: TextStyle(
                            color: FuryColors.muted,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text('🔒', style: TextStyle(fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _canSave ? _saveNick : null,
                style: FilledButton.styleFrom(
                  backgroundColor: FuryColors.red,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  '변경 저장',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
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
    return Column(
      children: [
        Semantics(
          button: true,
          label: '프로필 사진 변경',
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
          text: const TextSpan(
            children: [
              TextSpan(
                text: '사진을 탭해서 변경',
                style: TextStyle(
                  color: FuryColors.muted,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: '\nJPG, PNG, GIF · 최대 5MB',
                style: TextStyle(color: FuryColors.faint, fontSize: 11),
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

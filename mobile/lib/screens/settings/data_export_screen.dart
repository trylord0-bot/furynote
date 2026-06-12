import 'package:flutter/material.dart';
import '../../main.dart';

class DataExportScreen extends StatelessWidget {
  const DataExportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FuryColors.phone,
      appBar: AppBar(
        backgroundColor: FuryColors.chrome,
        title: const Text('데이터 내보내기'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2A2000), Color(0xFF1A1500)],
                ),
                border: Border.all(
                  color: const Color(0x40FFD700),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    right: 16,
                    top: 16,
                    child: Text(
                      '✨',
                      style: TextStyle(fontSize: 40, color: Color(0x26FFD700)),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '✨ PRO 기능',
                        style: TextStyle(
                          color: Color(0xFFFFD700),
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '내 모든 분노 기록을 파일로 내보내\n원하는 곳에 보관하거나 분석할 수 있어요.',
                        style: TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 12,
                          height: 1.7,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '₩2,900',
                            style: TextStyle(
                              color: Color(0xFFFFD700),
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            '1회 결제 · 영구 사용',
                            style: TextStyle(
                              color: FuryColors.muted,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                              ..clearSnackBars()
                              ..showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    '✨ 결제 기능은 준비 중이에요!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: const Color(0xFF2E6B3E),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xFFFFD700),
                            foregroundColor: const Color(0xFF1A1A1A),
                            padding: const EdgeInsets.symmetric(vertical: 13),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            '✨ PRO 구매하기',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'PRO 구매 후 아래 형식으로 내보낼 수 있어요',
              textAlign: TextAlign.center,
              style: TextStyle(color: FuryColors.faint, fontSize: 11),
            ),
            const SizedBox(height: 12),
            const _ExportFormatTile(
              icon: '📊',
              title: 'CSV 파일',
              desc: '엑셀·스프레드시트에서 열 수 있어요',
            ),
            const SizedBox(height: 8),
            const _ExportFormatTile(
              icon: '🗂️',
              title: 'JSON 파일',
              desc: '개발자 / 데이터 분석용 원본 형식',
            ),
            const SizedBox(height: 8),
            const _ExportFormatTile(
              icon: '📄',
              title: '백업 파일',
              desc: '다른 기기에서 복원할 수 있는 형식',
            ),
          ],
        ),
      ),
    );
  }
}

class _ExportFormatTile extends StatelessWidget {
  const _ExportFormatTile({
    required this.icon,
    required this.title,
    required this.desc,
  });

  final String icon;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
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
            child: Center(
              child: Text(icon, style: const TextStyle(fontSize: 18)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: FuryColors.text,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  desc,
                  style: const TextStyle(
                    color: FuryColors.faint,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const Text('🔒', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

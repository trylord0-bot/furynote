import 'package:flutter/material.dart';
import '../../main.dart';
import '../../widgets/shared_widgets.dart';

class DataImportScreen extends StatelessWidget {
  const DataImportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FuryColors.phone,
      appBar: AppBar(
        backgroundColor: FuryColors.chrome,
        title: const Text('데이터 가져오기'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                FurySnackBar.show(context, '📥 파일 선택 기능은 준비 중이에요!');
              },
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
                    const Text('📥', style: TextStyle(fontSize: 36)),
                    const SizedBox(height: 12),
                    const Text(
                      '백업 파일 선택',
                      style: TextStyle(
                        color: FuryColors.text,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Fury Note에서 내보낸\n.fnbackup 파일을 선택하세요',
                      textAlign: TextAlign.center,
                      style: TextStyle(
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
                      child: const Text(
                        '파일 선택하기',
                        style: TextStyle(
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
            Container(
              decoration: BoxDecoration(
                color: FuryColors.panel,
                border: Border.all(color: FuryColors.border),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('⚠️', style: TextStyle(fontSize: 16)),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '가져오기 전 주의사항\n',
                                  style: TextStyle(
                                    color: Color(0xFFCCCCCC),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: '기존 데이터에 병합됩니다. 중복 기록은 자동으로 제거돼요.',
                                  style: TextStyle(
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
                  ),
                  Divider(height: 1, color: Color(0xFF1E1E1E)),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('📱', style: TextStyle(fontSize: 16)),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '기기 이전 시\n',
                                  style: TextStyle(
                                    color: Color(0xFFCCCCCC),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '새 기기에서 앱 설치 후 백업 파일을 가져오면 모든 기록이 복원돼요.',
                                  style: TextStyle(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

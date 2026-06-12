import 'package:flutter/material.dart';
import '../../main.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FuryColors.phone,
      appBar: AppBar(
        backgroundColor: FuryColors.chrome,
        title: const Text('개인정보처리방침'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '최종 업데이트: 2026년 6월 10일',
              style: TextStyle(color: FuryColors.faint, fontSize: 10),
            ),
            SizedBox(height: 16),
            _PrivacySection(
              title: '1. 수집하는 정보',
              body: 'Fury Note는 회원가입 없이 사용할 수 있으며, 아래 정보만 수집해요.\n\n'
                  '· 기기 고유 ID — 어뷰징 방지 및 익명 식별\n'
                  '· 분노 기록 데이터 — 강도, 카테고리, 텍스트\n'
                  '· 앱 사용 로그 — 오류 분석 목적',
            ),
            _PrivacyDivider(),
            _PrivacySection(
              title: '2. 정보 이용 목적',
              body: '· 서비스 제공 및 기능 개선\n'
                  '· 포스팅 콘텐츠 필터링 (OpenAI Moderation API)\n'
                  '· 어뷰징 탐지 및 차단',
            ),
            _PrivacyDivider(),
            _PrivacySection(
              title: '3. 제3자 제공',
              body: '수집된 개인정보는 제3자에게 제공하지 않아요.\n'
                  '단, 포스팅 텍스트는 OpenAI Moderation API를 통해 필터링되며, 이 과정에서 OpenAI 서버로 전송될 수 있어요.',
            ),
            _PrivacyDivider(),
            _PrivacySection(
              title: '4. 보관 기간',
              body: '개인 기록은 기기 내에만 저장되며 앱 삭제 시 함께 삭제돼요.\n'
                  '포스팅으로 공개한 데이터는 삭제 요청 시 즉시 삭제해요.',
            ),
            _PrivacyDivider(),
            _PrivacySection(
              title: '5. 문의',
              body: '개인정보 관련 문의는 아래 이메일로 연락해 주세요.\n'
                  'support@furynote.app',
            ),
          ],
        ),
      ),
    );
  }
}

class _PrivacySection extends StatelessWidget {
  const _PrivacySection({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: FuryColors.text,
            fontSize: 13,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          body,
          style: const TextStyle(
            color: FuryColors.faint,
            fontSize: 11,
            height: 1.8,
          ),
        ),
      ],
    );
  }
}

class _PrivacyDivider extends StatelessWidget {
  const _PrivacyDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Divider(height: 1, color: Color(0xFF1E1E1E)),
    );
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:fury_note/screens/settings/data_export_screen.dart';

void main() {
  test('export profile display name does not duplicate profile number', () {
    expect(
      exportProfileDisplayName({
        'display_name': '화난 호랑이#4827',
        'profile_number': '#4827',
      }),
      '화난 호랑이#4827',
    );

    expect(
      exportProfileDisplayName({
        'display_name': '화난 호랑이',
        'profile_number': '#4827',
      }),
      '화난 호랑이 #4827',
    );
  });
}

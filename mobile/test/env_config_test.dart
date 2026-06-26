import 'package:flutter_test/flutter_test.dart';
import 'package:fury_note/src/api/env_config.dart';

void main() {
  test('applies configured API port to the base URL', () {
    expect(
      EnvConfig.applyApiPort('http://192.168.0.10', '8010'),
      'http://192.168.0.10:8010',
    );
  });

  test('configured API port overrides an existing base URL port', () {
    expect(
      EnvConfig.applyApiPort('http://192.168.0.10:8000', '8010'),
      'http://192.168.0.10:8010',
    );
  });

  test('empty API port leaves the base URL unchanged', () {
    expect(
      EnvConfig.applyApiPort('https://api.furynote.com', ''),
      'https://api.furynote.com',
    );
  });
}

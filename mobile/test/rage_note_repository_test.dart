import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fury_note/src/notes/rage_note.dart';
import 'package:fury_note/src/notes/rage_note_repository.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late RageNoteRepository repository;

  setUpAll(sqfliteFfiInit);

  setUp(() {
    repository = RageNoteRepository(
      databaseFactory: databaseFactoryFfi,
      databasePathProvider: () async => inMemoryDatabasePath,
    );
  });

  tearDown(() async {
    await repository.close();
  });

  test('saves a rage note with recording and reminder metadata', () async {
    final createdAt = DateTime(2026, 6, 12, 9, 30);
    final reminderAt = DateTime(2026, 6, 12, 10, 30);

    final id = await repository.insert(
      RageNote(
        createdAt: createdAt,
        rageLevel: 5,
        rageEmoji: '🤬',
        rageLabel: '매우 화남',
        categoryKey: 'work',
        categoryEmoji: '💼',
        categoryLabel: '직장',
        body: '회의가 퇴근 직전에 잡혔다',
        audioPath: 'voice/fury-1.m4a',
        reminderAt: reminderAt,
        posted: true,
      ),
    );

    final notes = await repository.getAll();

    expect(id, greaterThan(0));
    expect(notes, hasLength(1));
    expect(notes.single.id, id);
    expect(notes.single.createdAt, createdAt);
    expect(notes.single.rageLevel, 5);
    expect(notes.single.categoryLabel, '직장');
    expect(notes.single.body, '회의가 퇴근 직전에 잡혔다');
    expect(notes.single.audioPath, 'voice/fury-1.m4a');
    expect(notes.single.reminderAt, reminderAt);
    expect(notes.single.posted, isTrue);
  });

  test('returns notes newest first', () async {
    await repository.insert(
      RageNote(
        createdAt: DateTime(2026, 6, 11, 20),
        rageLevel: 2,
        rageEmoji: '😤',
        rageLabel: '화남',
        categoryKey: 'family',
        categoryEmoji: '👨‍👩‍👧',
        categoryLabel: '가족',
        body: '어제 기록',
      ),
    );
    await repository.insert(
      RageNote(
        createdAt: DateTime(2026, 6, 12, 8),
        rageLevel: 4,
        rageEmoji: '😡',
        rageLabel: '매우 화남',
        categoryKey: 'work',
        categoryEmoji: '💼',
        categoryLabel: '직장',
        body: '오늘 기록',
      ),
    );

    final notes = await repository.getAll();

    expect(notes.map((note) => note.body), ['오늘 기록', '어제 기록']);
  });

  test('marks a saved rage note as posted after feed sharing', () async {
    final id = await repository.insert(
      RageNote(
        createdAt: DateTime(2026, 6, 12, 8),
        rageLevel: 4,
        rageEmoji: '😡',
        rageLabel: '매우 화남',
        categoryKey: 'work',
        categoryEmoji: '💼',
        categoryLabel: '직장',
        body: '공유할 기록',
      ),
    );

    await repository.markPosted(id);

    final notes = await repository.getAll();

    expect(notes.single.posted, isTrue);
  });

  test('migrates a version 1 database before saving new metadata', () async {
    final tempDirectory = await Directory.systemTemp.createTemp(
      'fury_note_repository_test_',
    );
    final databasePath = p.join(tempDirectory.path, 'legacy.db');
    final legacyDatabase = await databaseFactoryFfi.openDatabase(
      databasePath,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
CREATE TABLE ${RageNoteRepository.tableName} (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  created_at TEXT NOT NULL,
  rage_level INTEGER NOT NULL,
  rage_emoji TEXT NOT NULL,
  rage_label TEXT NOT NULL,
  category_key TEXT NOT NULL,
  category_emoji TEXT NOT NULL,
  category_label TEXT NOT NULL,
  body TEXT NOT NULL
)
''');
        },
      ),
    );
    await legacyDatabase.close();

    final migratedRepository = RageNoteRepository(
      databaseFactory: databaseFactoryFfi,
      databasePathProvider: () async => databasePath,
    );
    addTearDown(() async {
      await migratedRepository.close();
      await tempDirectory.delete(recursive: true);
    });

    final reminderAt = DateTime(2026, 6, 12, 18);
    await migratedRepository.insert(
      RageNote(
        createdAt: DateTime(2026, 6, 12, 17),
        rageLevel: 3,
        rageEmoji: '😠',
        rageLabel: '짜증',
        categoryKey: 'people',
        categoryEmoji: '🧑',
        categoryLabel: '사람',
        body: '',
        audioPath: 'voice/rage.m4a',
        reminderAt: reminderAt,
      ),
    );

    final notes = await migratedRepository.getAll();

    expect(notes.single.audioPath, 'voice/rage.m4a');
    expect(notes.single.reminderAt, reminderAt);
    expect(notes.single.posted, isFalse);
  });
}

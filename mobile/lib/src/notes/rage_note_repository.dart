import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

import 'rage_note.dart';

typedef DatabasePathProvider = Future<String> Function();

class RageNoteRepository {
  RageNoteRepository({
    DatabaseFactory? databaseFactory,
    DatabasePathProvider? databasePathProvider,
  }) : _databaseFactory = databaseFactory,
       _databasePathProvider = databasePathProvider ?? _defaultDatabasePath;

  static final RageNoteRepository instance = RageNoteRepository();

  static const tableName = 'rage_notes';

  final DatabaseFactory? _databaseFactory;
  final DatabasePathProvider _databasePathProvider;
  Database? _database;

  Future<int> insert(RageNote note) async {
    final db = await _open();
    return db.insert(tableName, note.toMap()..remove('id'));
  }

  Future<int> importMany(List<RageNote> notes) async {
    final db = await _open();
    var inserted = 0;
    await db.transaction((txn) async {
      for (final note in notes) {
        final existing = await txn.query(
          tableName,
          columns: const ['id'],
          where: '''
created_at = ? AND rage_level = ? AND category_key = ? AND body = ?
''',
          whereArgs: [
            note.createdAt.toIso8601String(),
            note.rageLevel,
            note.categoryKey,
            note.body,
          ],
          limit: 1,
        );
        if (existing.isNotEmpty) continue;

        await txn.insert(tableName, note.toMap()..remove('id'));
        inserted++;
      }
    });
    return inserted;
  }

  Future<int> replaceAll(List<RageNote> notes) async {
    final db = await _open();
    await db.transaction((txn) async {
      await txn.delete(tableName);
      for (final note in notes) {
        await txn.insert(tableName, note.toMap()..remove('id'));
      }
    });
    return notes.length;
  }

  Future<List<RageNote>> getAll() async {
    final db = await _open();
    final rows = await db.query(tableName, orderBy: 'created_at DESC, id DESC');
    return rows.map(RageNote.fromMap).toList();
  }

  Future<void> deleteById(int id) async {
    final db = await _open();
    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateRageLevel(
    int id,
    int rageLevel,
    String rageEmoji,
    String rageLabel,
  ) async {
    final db = await _open();
    await db.update(
      tableName,
      {
        'rage_level': rageLevel,
        'rage_emoji': rageEmoji,
        'rage_label': rageLabel,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> clearReminderAt(int id) async {
    final db = await _open();
    await db.update(
      tableName,
      {'reminder_at': null},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> markPosted(int id) async {
    final db = await _open();
    await db.update(tableName, {'posted': 1}, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> close() async {
    final db = _database;
    _database = null;
    await db?.close();
  }

  Future<Database> _open() async {
    final existing = _database;
    if (existing != null) {
      return existing;
    }

    final factory = _databaseFactory ?? databaseFactory;
    final path = await _databasePathProvider();
    _database = await factory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 2,
        onCreate: (db, version) => _createSchema(db),
        onUpgrade: (db, oldVersion, newVersion) async {
          if (oldVersion < 2) {
            await _addColumnIfMissing(db, 'audio_path', 'TEXT');
            await _addColumnIfMissing(db, 'reminder_at', 'TEXT');
            await _addColumnIfMissing(
              db,
              'posted',
              'INTEGER NOT NULL DEFAULT 0',
            );
          }
        },
      ),
    );
    return _database!;
  }

  Future<void> _createSchema(Database db) async {
    await db.execute('''
CREATE TABLE $tableName (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  created_at TEXT NOT NULL,
  rage_level INTEGER NOT NULL,
  rage_emoji TEXT NOT NULL,
  rage_label TEXT NOT NULL,
  category_key TEXT NOT NULL,
  category_emoji TEXT NOT NULL,
  category_label TEXT NOT NULL,
  body TEXT NOT NULL,
  audio_path TEXT,
  reminder_at TEXT,
  posted INTEGER NOT NULL DEFAULT 0
)
''');
  }

  Future<void> _addColumnIfMissing(
    Database db,
    String column,
    String definition,
  ) async {
    final existingColumns = await db.rawQuery('PRAGMA table_info($tableName)');
    final hasColumn = existingColumns.any((row) => row['name'] == column);
    if (!hasColumn) {
      await db.execute('ALTER TABLE $tableName ADD COLUMN $column $definition');
    }
  }

  static Future<String> _defaultDatabasePath() async {
    final root = await getDatabasesPath();
    return p.join(root, 'fury_note.db');
  }
}

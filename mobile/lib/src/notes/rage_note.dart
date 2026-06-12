class RageNote {
  const RageNote({
    this.id,
    required this.createdAt,
    required this.rageLevel,
    required this.rageEmoji,
    required this.rageLabel,
    required this.categoryKey,
    required this.categoryEmoji,
    required this.categoryLabel,
    required this.body,
    this.audioPath,
    this.reminderAt,
    this.posted = false,
  });

  final int? id;
  final DateTime createdAt;
  final int rageLevel;
  final String rageEmoji;
  final String rageLabel;
  final String categoryKey;
  final String categoryEmoji;
  final String categoryLabel;
  final String body;
  final String? audioPath;
  final DateTime? reminderAt;
  final bool posted;

  RageNote copyWith({
    int? id,
    DateTime? createdAt,
    int? rageLevel,
    String? rageEmoji,
    String? rageLabel,
    String? categoryKey,
    String? categoryEmoji,
    String? categoryLabel,
    String? body,
    String? audioPath,
    DateTime? reminderAt,
    bool? posted,
  }) {
    return RageNote(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      rageLevel: rageLevel ?? this.rageLevel,
      rageEmoji: rageEmoji ?? this.rageEmoji,
      rageLabel: rageLabel ?? this.rageLabel,
      categoryKey: categoryKey ?? this.categoryKey,
      categoryEmoji: categoryEmoji ?? this.categoryEmoji,
      categoryLabel: categoryLabel ?? this.categoryLabel,
      body: body ?? this.body,
      audioPath: audioPath ?? this.audioPath,
      reminderAt: reminderAt ?? this.reminderAt,
      posted: posted ?? this.posted,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'rage_level': rageLevel,
      'rage_emoji': rageEmoji,
      'rage_label': rageLabel,
      'category_key': categoryKey,
      'category_emoji': categoryEmoji,
      'category_label': categoryLabel,
      'body': body,
      'audio_path': audioPath,
      'reminder_at': reminderAt?.toIso8601String(),
      'posted': posted ? 1 : 0,
    };
  }

  static RageNote fromMap(Map<String, Object?> map) {
    return RageNote(
      id: map['id'] as int?,
      createdAt: DateTime.parse(map['created_at'] as String),
      rageLevel: map['rage_level'] as int,
      rageEmoji: map['rage_emoji'] as String,
      rageLabel: map['rage_label'] as String,
      categoryKey: map['category_key'] as String,
      categoryEmoji: map['category_emoji'] as String,
      categoryLabel: map['category_label'] as String,
      body: map['body'] as String,
      audioPath: map['audio_path'] as String?,
      reminderAt: switch (map['reminder_at']) {
        final String value when value.isNotEmpty => DateTime.parse(value),
        _ => null,
      },
      posted: (map['posted'] as int? ?? 0) == 1,
    );
  }
}

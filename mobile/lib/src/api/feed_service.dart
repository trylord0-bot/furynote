import 'api_client.dart';

class FeedPost {
  const FeedPost({
    required this.postId,
    required this.nickname,
    required this.rageLevel,
    required this.category,
    this.text,
    required this.likeCount,
    required this.commentCount,
    required this.isLiked,
    required this.isMine,
    required this.createdAt,
  });

  final String postId;
  final String nickname;
  final int rageLevel;
  final String category;
  final String? text;
  final int likeCount;
  final int commentCount;
  final bool isLiked;
  final bool isMine;
  final DateTime createdAt;

  factory FeedPost.fromJson(Map<String, dynamic> json) {
    return FeedPost(
      postId: json['post_id'] as String,
      nickname: json['nickname'] as String,
      rageLevel: json['rage_level'] as int,
      category: json['category'] as String,
      text: json['text'] as String?,
      likeCount: json['like_count'] as int,
      commentCount: json['comment_count'] as int,
      isLiked: json['is_liked'] as bool,
      isMine: json['is_mine'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  FeedPost copyWith({bool? isLiked, int? likeCount}) {
    return FeedPost(
      postId: postId,
      nickname: nickname,
      rageLevel: rageLevel,
      category: category,
      text: text,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount,
      isLiked: isLiked ?? this.isLiked,
      isMine: isMine,
      createdAt: createdAt,
    );
  }
}

class FeedService {
  static final FeedService instance = FeedService._();
  FeedService._();

  Future<List<FeedPost>> listPosts({String? cursor}) async {
    final query = cursor != null ? {'cursor': cursor} : null;
    final data = await ApiClient.instance.get('/v1/posts', query: query)
        as Map<String, dynamic>;
    final posts = data['posts'] as List<dynamic>;
    return posts
        .map((p) => FeedPost.fromJson(p as Map<String, dynamic>))
        .toList();
  }

  Future<String> createPost({
    required int rageLevel,
    required String category,
    String? text,
  }) async {
    final body = <String, dynamic>{
      'rage_level': rageLevel,
      'category': category,
      if (text != null && text.isNotEmpty) 'text': text,
    };
    final data =
        await ApiClient.instance.post('/v1/posts', body) as Map<String, dynamic>;
    return data['post_id'] as String;
  }

  Future<({bool isLiked, int likeCount})> toggleLike(String postId) async {
    final data = await ApiClient.instance.post('/v1/posts/$postId/like')
        as Map<String, dynamic>;
    return (
      isLiked: data['is_liked'] as bool,
      likeCount: data['like_count'] as int,
    );
  }
}

String rageEmoji(int level) {
  return switch (level) {
    1 => '😒',
    2 => '😤',
    3 => '😠',
    4 => '😡',
    5 => '🤬',
    _ => '😡',
  };
}

String categoryDisplay(String key) {
  return switch (key) {
    'family' => '👨‍👩‍👧 가족',
    'romance' => '💕 연애',
    'work' => '💼 직장',
    'people' => '🧑 사람',
    'driving' => '🚗 운전',
    'custom' => '➕ 기타',
    _ => '➕ $key',
  };
}

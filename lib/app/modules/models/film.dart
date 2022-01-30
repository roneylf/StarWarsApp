import 'dart:convert';

class Film {
  int? uid;
  int apiId;
  String title;
  bool favorite;
  Film({
    this.uid,
    required this.apiId,
    required this.title,
    this.favorite = false,
  });

  Film copyWith({
    int? uid,
    int? apiId,
    String? title,
    bool? favorite,
  }) {
    return Film(
      uid: uid ?? this.uid,
      apiId: apiId ?? this.apiId,
      title: title ?? this.title,
      favorite: favorite ?? this.favorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'apiId': apiId,
      'title': title,
      'favorite': favorite,
    };
  }

  factory Film.fromMap(Map<String, dynamic> map) {
    return Film(
      uid: map['uid'] as int,
      apiId: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      favorite: map['favorite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Film.fromJson(String source) => Film.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Film(uid: $uid, apiId: $apiId, title: $title, favorite: $favorite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Film &&
        other.uid == uid &&
        other.apiId == apiId &&
        other.title == title &&
        other.favorite == favorite;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ apiId.hashCode ^ title.hashCode ^ favorite.hashCode;
  }
}

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
      'favorite': favorite ? 1 : 0,
    };
  }

  factory Film.fromMap(Map<String, dynamic> map) {
    return Film(
      uid: map['uid'] != null ? map['uid'] as int : null,
      apiId: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      //se não for nulo, verifca o tipo e converte para bool
      //necessario fazer isso pois o sqflite não aceita bool
      favorite: map['favorite'] != null
          ? (map['favorite'] is bool ? map['favorite'] : map['favorite'] == 1)
          : false,
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

import 'dart:convert';

class Film {
  int? id;
  String title;
  bool favorite;
  Film({
    this.id,
    required this.title,
    this.favorite = false,
  });

  Film copyWith({
    int? id,
    int? apiId,
    String? title,
    bool? favorite,
  }) {
    return Film(
      id: id ?? this.id,
      title: title ?? this.title,
      favorite: favorite ?? this.favorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'favorite': favorite ? 1 : 0,
    };
  }

  factory Film.fromMap(Map<String, dynamic> map) {
    return Film(
      id: map['id'] != null ? map['id'] as int : null,
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
    return 'Film(id: $id,  title: $title, favorite: $favorite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Film &&
        other.id == id &&
        other.title == title &&
        other.favorite == favorite;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ favorite.hashCode;
  }
}

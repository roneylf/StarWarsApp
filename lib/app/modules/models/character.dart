import 'dart:convert';

class Character {
  int? id;

  String name;
  bool favorite = false;
  Character({
    this.id,
    required this.name,
    required this.favorite,
  });

  Character copyWith({
    int? id,
    int? apiId,
    String? name,
    bool? favorite,
  }) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      favorite: favorite ?? this.favorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'favorite': favorite ? 1 : 0,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] ?? '',
      //se não for nulo, verifca o tipo e converte para bool
      //necessario fazer isso pois o sqflite não aceita bool
      favorite: map['favorite'] != null
          ? (map['favorite'] is bool ? map['favorite'] : map['favorite'] == 1)
          : false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(String source) =>
      Character.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Character(id: $id, name: $name, favorite: $favorite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Character &&
        other.id == id &&
        other.name == name &&
        other.favorite == favorite;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ favorite.hashCode;
  }
}

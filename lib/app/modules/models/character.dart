import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Character {
  int? id;
  int apiId;
  String name;
  bool favorite = false;
  Character({
    this.id,
    required this.apiId,
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
      apiId: apiId ?? this.apiId,
      name: name ?? this.name,
      favorite: favorite ?? this.favorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'apiId': apiId,
      'name': name,
      'favorite': favorite,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      apiId: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      favorite: map['favorite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(String source) =>
      Character.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Character(id: $id, apiId: $apiId, name: $name, favorite: $favorite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Character &&
        other.id == id &&
        other.apiId == apiId &&
        other.name == name &&
        other.favorite == favorite;
  }

  @override
  int get hashCode {
    return id.hashCode ^ apiId.hashCode ^ name.hashCode ^ favorite.hashCode;
  }
}

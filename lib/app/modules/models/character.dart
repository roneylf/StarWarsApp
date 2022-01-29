import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Character {
  int id;
  int apiId;
  String name;
  Character({
    required this.id,
    required this.apiId,
    required this.name,
  });

  Character copyWith({
    int? id,
    int? apiId,
    String? name,
  }) {
    return Character(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'apiId': apiId,
      'name': name,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id']?.toInt() ?? 0,
      apiId: map['apiId']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(String source) =>
      Character.fromMap(json.decode(source));

  @override
  String toString() => 'Character(id: $id, apiId: $apiId, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Character &&
        other.id == id &&
        other.apiId == apiId &&
        other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ apiId.hashCode ^ name.hashCode;
}

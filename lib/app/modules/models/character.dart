import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Character {
  int? uid;
  int apiId;
  String name;
  bool favorite = false;
  Character({
    this.uid,
    required this.apiId,
    required this.name,
    required this.favorite,
  });

  Character copyWith({
    int? uid,
    int? apiId,
    String? name,
    bool? favorite,
  }) {
    return Character(
      uid: uid ?? this.uid,
      apiId: apiId ?? this.apiId,
      name: name ?? this.name,
      favorite: favorite ?? this.favorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'apiId': apiId,
      'name': name,
      'favorite': favorite ? 1 : 0,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      uid: map['uid'] != null ? map['uid'] as int : null,
      apiId: map['id']?.toInt() ?? 0,
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
    return 'Character(uid: $uid, apiId: $apiId, name: $name, favorite: $favorite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Character &&
        other.uid == uid &&
        other.apiId == apiId &&
        other.name == name &&
        other.favorite == favorite;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ apiId.hashCode ^ name.hashCode ^ favorite.hashCode;
  }
}

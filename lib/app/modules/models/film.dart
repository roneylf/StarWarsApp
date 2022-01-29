import 'dart:convert';

class Film {
  int id;
  int apiId;
  String title;
  Film({
    required this.id,
    required this.apiId,
    required this.title,
  });

  Film copyWith({
    int? id,
    int? apiId,
    String? title,
  }) {
    return Film(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'apiId': apiId,
      'title': title,
    };
  }

  factory Film.fromMap(Map<String, dynamic> map) {
    return Film(
      id: map['id']?.toInt() ?? 0,
      apiId: map['apiId']?.toInt() ?? 0,
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Film.fromJson(String source) => Film.fromMap(json.decode(source));

  @override
  String toString() => 'Film(id: $id, apiId: $apiId, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Film &&
        other.id == id &&
        other.apiId == apiId &&
        other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ apiId.hashCode ^ title.hashCode;
}

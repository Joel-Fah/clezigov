class Tag {
  final String id;
  final String name;
  final DateTime createdAt, lastUpdatedAt;

  Tag({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.lastUpdatedAt,
  });

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
      'lastUpdatedAt': lastUpdatedAt.toIso8601String(),
    };
  }

  // fromJson
  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['createdAt']),
      lastUpdatedAt: DateTime.parse(json['lastUpdatedAt']),
    );
  }

  // toString
  @override
  String toString() {
    return 'Tag{id: $id, name: $name, createdAt: $createdAt, lastUpdatedAt: $lastUpdatedAt}';
  }
}

// generate 5 tags about administrative procedures
final List<Tag> tags = [
  Tag(
    id: '1',
    name: 'Administrative',
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  Tag(
    id: '2',
    name: 'University',
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  Tag(
    id: '3',
    name: 'Minor',
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  Tag(
    id: '4',
    name: 'Bureaucracy',
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  Tag(
    id: '5',
    name: 'Paperwork',
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
];
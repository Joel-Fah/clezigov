class Document {
  final String id;
  final String name;
  final String description;
  final String path;
  final String type;
  final DateTime createdAt;
  final DateTime updatedAt;

  Document({
    required this.id,
    required this.name,
    required this.description,
    required this.path,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'path': path,
      'type': type,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  // fromJson
  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      path: json['path'],
      type: json['type'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  //toString
  @override
  String toString() {
    return 'Document{id: $id, name: $name, description: $description, path: $path, type: $type, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}

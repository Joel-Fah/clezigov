class Document {
  String id;
  String name;
  String description;
  String path;
  String type;
  DateTime createdAt;
  DateTime updatedAt;

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

final List<Document> documents = [
  Document(
    id: "1",
    name: "Document 1",
    description: "This is document about nothing that says abything if you read it careful enough. But I know you won't mind.",
    path: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwdwv8qFiuivyYPEn3oZN4vvqhkYSoIl-siQ&s",
    type: "image",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
];
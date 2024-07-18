class ProcedureImage {
  final String id;
  final String path;
  final DateTime createdAt;
  final DateTime lastUpdatedAt;

  ProcedureImage({
    required this.id,
    required this.path,
    required this.createdAt,
    required this.lastUpdatedAt,
  });

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'path': path,
      'createdAt': createdAt.toIso8601String(),
      'lastUpdatedAt': lastUpdatedAt.toIso8601String(),
    };
  }

  // fromJson
  factory ProcedureImage.fromJson(Map<String, dynamic> json) {
    return ProcedureImage(
      id: json['id'],
      path: json['path'],
      createdAt: DateTime.parse(json['createdAt']),
      lastUpdatedAt: DateTime.parse(json['lastUpdatedAt']),
    );
  }

  // toString
  @override
  String toString() {
    return 'Image{id: $id, path: $path, createdAt: $createdAt, lastUpdatedAt: $lastUpdatedAt}';
  }
}

// 5 random images of documents online
final List<ProcedureImage> procedureImages = [
  ProcedureImage(
    id: '1',
    path: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwdwv8qFiuivyYPEn3oZN4vvqhkYSoIl-siQ&s',
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  ProcedureImage(
    id: '2',
    path: 'https://www.cameroon-concord.com/images/concord/nat-id.jpeg',
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  ProcedureImage(
    id: '3',
    path: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSELkFiGkVCkQX10U0ZuiJCnfsRVUhQ68JTgQ&s',
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  ProcedureImage(
    id: '4',
    path: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRafWdUJYCzoUWS-ktn8bIdyvi4hfdxV1btbQ&s',
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  ProcedureImage(
    id: '5',
    path: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_OuUnT8gX9yrqeV6Q2x6uKu2DchtJWHNJiymq9K22ngVaRsXshcqB8ngOIYdAHh0KppY&usqp=CAU',
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
];
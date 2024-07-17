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

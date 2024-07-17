class Category {
  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime lastUpdatedAt;

  Category({
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
  factory Category.fromJson(Map<String, dynamic> data) {
    return Category(
      id: data['id'],
      name: data['name'],
      createdAt: DateTime.parse(data['createdAt']),
      lastUpdatedAt: DateTime.parse(data['lastUpdatedAt']),
    );
  }

  // toString
  @override
  String toString() {
    return 'Category{id: $id, name: $name, createdAt: $createdAt, lastUpdatedAt: $lastUpdatedAt}';
  }
}

List<Category> categories = [
  Category(
    id: "1",
    name: "Justice",
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  Category(
    id: "2",
    name: "Health",
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  Category(
    id: "3",
    name: "Education",
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  Category(
    id: "4",
    name: "Environment",
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  Category(
    id: "5",
    name: "Economy",
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  Category(
    id: "6",
    name: "International",
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  Category(
    id: "7",
    name: "Sports",
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  Category(
    id: "8",
    name: "Civil",
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  Category(
    id: "10",
    name: "Science",
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
];
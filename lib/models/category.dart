class Category {
  final String name;

  Category({required this.name});

  @override
  String toString() {
    return name;
  }
}

List<Category> categories = [
  Category(name: "Business"),
  Category(name: "Legalization"),
  Category(name: "Diplomatic"),
  Category(name: "Health"),
  Category(name: "International"),
  Category(name: "Sports"),
  Category(name: "Justice"),
];
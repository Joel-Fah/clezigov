import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Category {
  String id;
  String name;
  DateTime createdAt;
  DateTime lastUpdatedAt;

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
    id: "9",
    name: "Science",
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
];

List<Map<Category, IconData>> categoryIcons = [
  {categories[0]: LucideIcons.scale},
  {categories[1]: LucideIcons.heartPulse},
  {categories[2]: LucideIcons.library},
  {categories[3]: LucideIcons.sprout},
  {categories[4]: LucideIcons.swissFranc},
  {categories[5]: LucideIcons.globe2},
  {categories[6]: LucideIcons.dumbbell},
  {categories[7]: LucideIcons.hardHat},
  {categories[8]: LucideIcons.atom},
];

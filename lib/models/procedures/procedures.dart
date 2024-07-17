import 'package:clezigov/models/procedures/available.dart';
import 'package:clezigov/models/procedures/category.dart';
import 'package:clezigov/models/procedures/document.dart';
import 'package:clezigov/models/procedures/image.dart';
import 'package:clezigov/models/procedures/tag.dart';

class Procedure {
  final String id;
  final String title;
  final String description;
  final List<ProcedureImage> images;
  final List<Tag> tags;
  final Category category;
  final String estimatedTimeToComplete;
  final double price;
  final List<Available> availability;
  final List<Document> documents;
  final String status;
  final DateTime createdAt;
  final DateTime lastUpdatedAt;

  Procedure({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.tags,
    required this.category,
    required this.estimatedTimeToComplete,
    required this.price,
    required this.availability,
    required this.documents,
    required this.status,
    required this.createdAt,
    required this.lastUpdatedAt,
  });

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'images': images.map((image) => image.toJson()).toList(),
      'tags': tags.map((tag) => tag.toJson()).toList(),
      'category': category.toJson(),
      'estimatedTimeToComplete': estimatedTimeToComplete,
      'price': price,
      'availability': availability.map((available) => available.toJson()).toList(),
      'documents': documents.map((document) => document.toJson()).toList(),
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'lastUpdatedAt': lastUpdatedAt.toIso8601String(),
    };
  }

  // fromJson
  factory Procedure.fromJson(Map<String, dynamic> json) {
    return Procedure(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      images: (json['images'] as List).map((image) => ProcedureImage.fromJson(image)).toList(),
      tags: (json['tags'] as List).map((tag) => Tag.fromJson(tag)).toList(),
      category: Category.fromJson(json['category']),
      estimatedTimeToComplete: json['estimatedTimeToComplete'],
      price: json['price'],
      availability: (json['availability'] as List).map((available) => Available.fromJson(available)).toList(),
      documents: (json['documents'] as List).map((document) => Document.fromJson(document)).toList(),
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      lastUpdatedAt: DateTime.parse(json['lastUpdatedAt']),
    );
  }

  // toString
  @override
  String toString() {
    return 'Procedure{id: $id, title: $title, description: $description, images: $images, tags: $tags, category: $category, estimatedTimeToComplete: $estimatedTimeToComplete, price: $price, availability: $availability, documents: $documents, status: $status, createdAt: $createdAt, lastUpdatedAt: $lastUpdatedAt}';
  }
}

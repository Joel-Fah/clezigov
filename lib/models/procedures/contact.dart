import 'package:clezigov/models/procedures/phone.dart';

class Contact {
  final String id;
  final List<Phone> phoneNumbers;
  final String email;
  final String? address;
  final DateTime createdAt;
  final DateTime lastUpdatedAt;

  Contact({
    required this.id,
    required this.phoneNumbers,
    required this.email,
    this.address,
    required this.createdAt,
    required this.lastUpdatedAt,
  });

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phoneNumbers': phoneNumbers.map((e) => e.toJson()).toList(),
      'email': email,
      'address': address,
      'createdAt': createdAt.toIso8601String(),
      'lastUpdatedAt': lastUpdatedAt.toIso8601String(),
    };
  }

  // fromJson
  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      phoneNumbers: (json['phoneNumbers'] as List).map((e) => Phone.fromJson(e)).toList(),
      email: json['email'],
      address: json['address'],
      createdAt: DateTime.parse(json['createdAt']),
      lastUpdatedAt: DateTime.parse(json['lastUpdatedAt']),
    );
  }

  // toString
  @override
  String toString() {
    return 'Contact{id: $id, phoneNumbers: $phoneNumbers, email: $email, address: $address, createdAt: $createdAt, lastUpdatedAt: $lastUpdatedAt}';
  }
}
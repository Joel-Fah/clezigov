class Phone {
  final String id, phoneNumber;
  final bool isWhatsapp;
  final DateTime createdAt;
  final DateTime lastUpdatedAt;

  Phone({
    required this.id,
    required this.phoneNumber,
    required this.isWhatsapp,
    required this.createdAt,
    required this.lastUpdatedAt,
  });

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'isWhatsapp': isWhatsapp,
      'createdAt': createdAt.toIso8601String(),
      'lastUpdatedAt': lastUpdatedAt.toIso8601String(),
    };
  }

  // fromJson
  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(
      id: json['id'],
      phoneNumber: json['phoneNumber'],
      isWhatsapp: json['isWhatsapp'],
      createdAt: DateTime.parse(json['createdAt']),
      lastUpdatedAt: DateTime.parse(json['lastUpdatedAt']),
    );
  }

  // toString
  @override
  String toString() {
    return 'Phone{id: $id, phoneNumber: $phoneNumber, isWhatsapp: $isWhatsapp, createdAt: $createdAt, lastUpdatedAt: $lastUpdatedAt}';
  }
}
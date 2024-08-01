class Phone {
  String id, phoneNumber;
  bool isWhatsapp;
  DateTime createdAt;
  DateTime lastUpdatedAt;

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

// 5 cameroon phone numbers different and not all whatsapp
final List<Phone> phoneNumbers = [
  Phone(
    id: '1',
    phoneNumber: '+237 6 56 74 74 74',
    isWhatsapp: true,
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  Phone(
    id: '2',
    phoneNumber: '+237 6 74 89 12 75',
    isWhatsapp: false,
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  Phone(
    id: '3',
    phoneNumber: '+237 6 23 79 74 76',
    isWhatsapp: true,
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  Phone(
    id: '4',
    phoneNumber: '+237 6 12 45 65 77',
    isWhatsapp: true,
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
  Phone(
    id: '5',
    phoneNumber: '+237 6 74 00 23 45',
    isWhatsapp: false,
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
  ),
];

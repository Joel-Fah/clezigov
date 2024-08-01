class Available {
  String id;
  DateTime date;
  DateTime fromTime;
  DateTime toTime;
  bool isAvailable;

  Available({
    required this.id,
    required this.date,
    required this.fromTime,
    required this.toTime,
    required this.isAvailable,
  });

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'fromTime': fromTime.toIso8601String(),
      'toTime': toTime.toIso8601String(),
      'isAvailable': isAvailable,
    };
  }

  // fromJson
  factory Available.fromJson(Map<String, dynamic> data) {
    return Available(
      id: data['id'],
      date: DateTime.parse(data['date']),
      fromTime: DateTime.parse(data['fromTime']),
      toTime: DateTime.parse(data['toTime']),
      isAvailable: data['isAvailable'],
    );
  }

  // toString
  @override
  String toString() {
    return 'Available{id: $id, date: $date, fromTime: $fromTime, toTime: $toTime, isAvailable: $isAvailable}';
  }
}

final List<Available> availabilities = [
  Available(
    id: '1',
    date: DateTime.now(),
    fromTime: DateTime.now(),
    toTime: DateTime.now(),
    isAvailable: true,
  ),
  Available(
    id: '2',
    date: DateTime.now(),
    fromTime: DateTime.now(),
    toTime: DateTime.now(),
    isAvailable: true,
  ),
  Available(
    id: '3',
    date: DateTime.now(),
    fromTime: DateTime.now(),
    toTime: DateTime.now(),
    isAvailable: true,
  ),
  Available(
    id: '4',
    date: DateTime.now(),
    fromTime: DateTime.now(),
    toTime: DateTime.now(),
    isAvailable: true,
  ),
  Available(
    id: '5',
    date: DateTime.now(),
    fromTime: DateTime.now(),
    toTime: DateTime.now(),
    isAvailable: true,
  ),
];
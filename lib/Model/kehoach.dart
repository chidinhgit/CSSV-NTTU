class Kehoach {
  String title;
  String context;
  String startTime;
  String endTime;

  Kehoach(
      {required this.title,
      required this.context,
      required this.startTime,
      required this.endTime});

  factory Kehoach.fromString(
      String title, String context, String startTime, String endTime) {
    return Kehoach(
        title: title, context: context, startTime: startTime, endTime: endTime);
  }

  factory Kehoach.fromMap(Map<String, dynamic> map) {
    return Kehoach(
        title: map['title'],
        context: map['context'],
        startTime: map['startTime'],
        endTime: map['endTime']);
  }

  Map<String, dynamic> getMap() {
    return {
      'title': this.title,
      'context': this.context,
      'startTime': this.startTime,
      'endTime': this.endTime
    };
  }

  @override
  String toString() {
    return 'Kehoach(title: $title, context: $context, startTime: $startTime, endTime: $endTime)';
  }
}

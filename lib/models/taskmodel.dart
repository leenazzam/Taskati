class Taskmodel {
  String id;
  String title;
  String note;
  String date;
  String startTime;
  String endTime;
  int Color;
  bool isCompleted;

  Taskmodel({
    required this.id,
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.Color,
    required this.isCompleted,
  });
}

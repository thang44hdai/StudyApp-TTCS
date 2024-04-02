class Event {
  final String title;
  String time;
  String date;
  Event({required this.title, String time = "", required this.date}) : this.time = time;
}

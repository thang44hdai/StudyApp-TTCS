import 'QuestionTotal.dart';

class QuestionIntro {
  int id;
  String title;
  int time;
  String description;
  List<QuestionTotal> question;

  // Constructor
  QuestionIntro(
      {required this.id,
      required this.time,
      required this.title,
      required this.description,
      required this.question});

  factory QuestionIntro.fromJson(Map<dynamic, dynamic> json) {
    return QuestionIntro(
        id: json['id'],
        title: json['title'],
        time: json['time'],
        description: json['description'],
        question: json['option']);
  }
}

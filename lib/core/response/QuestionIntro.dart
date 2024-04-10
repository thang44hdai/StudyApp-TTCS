import 'package:study/core/response/Question.dart';

import 'QuestionTotal.dart';

class QuestionIntro {
  int id;
  String title;
  int time;
  String description;
  List<QuestionTotal> question;

  // Constructor
  QuestionIntro({
    int id = 0,
    required this.time,
    required this.title,
    required this.description,
    required this.question,
  }) : this.id = id;

  QuestionIntro.empty()
      : id = 0,
        title = "",
        time = 0,
        description = "",
        question = [];

  factory QuestionIntro.fromJson(Map<dynamic, dynamic> json) {
    return QuestionIntro(
      id: int.parse(json['id']),
      title: json['title'],
      time: json['time'],
      description: json['description'],
      question: convertJson(json['option']),
    );
  }

  static List<QuestionTotal> convertJson(List<dynamic> l) {
    List<QuestionTotal> ans = [];
    l.forEach((element) {
      Question x = Question(
          question: element['question'],
          cau_a: element['cau_a'],
          cau_b: element['cau_b'],
          cau_c: element['cau_c'],
          cau_d: element['cau_d'],
          true_answer: element['true_answer'] ?? -1,
          is_image: element['is_image'] ?? "");
      QuestionTotal a = QuestionTotal(question: x);
      ans.add(a);
    });
    return ans;
  }
}

class Question {
  String A;
  String B;
  String C;
  String D;
  String image;
  int true_answer;
  String sound;

  Question(
      {required this.A,
      required this.B,
      required this.C,
      required this.D,
      String image = "",
      int true_answer = 0,
      String sound = ""})
      : this.image = image,
        this.true_answer = true_answer,
        this.sound = sound;
}

class QuestionList {
  List<Question> list_question;

  QuestionList({required this.list_question});
}

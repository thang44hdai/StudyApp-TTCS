class Question {
  String question;
  List<String> option = [];
  String cau_a;
  String cau_b;
  String cau_c;
  String cau_d;
  int true_answer;
  String is_image="";

  Question(
      {required this.question,
      required this.cau_a,
      required this.cau_b,
      required this.cau_c,
      required this.cau_d,
      required this.true_answer,
      required this.is_image}) {
    option.addAll([cau_a, cau_b, cau_c, cau_d]);
  }
}

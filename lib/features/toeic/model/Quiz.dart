class Quiz {
  String image;
  String true_answer;

  Quiz({required this.image, required this.true_answer});
}

class ListQuiz {
  String title;
  List<Quiz> list_quiz;

  ListQuiz({required this.title, required this.list_quiz});
}

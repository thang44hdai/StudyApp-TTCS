class QuestionResponse {
  final String question;
  int selected_index = -1;
  bool is_ticked = false;
  bool is_flag = false;
  bool is_image = false;

  Question({required this.question, required this.options});
}

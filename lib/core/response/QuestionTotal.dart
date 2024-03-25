import '../model/Option.dart';

class QuestionTotal {
  final String question;
  final List<String> options;
  int selected_index = -1;
  bool is_ticked = false; // check the question is selected the answer
  bool is_flag = false; // check the question is ticked by the flag
  bool is_image = false;
  int true_answer;

  QuestionTotal({required this.question, required this.options, required this.true_answer});
}

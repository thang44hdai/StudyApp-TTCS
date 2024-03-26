import 'package:study/core/response/Question.dart';

class QuestionTotal {
  Question question;
  int selected_index = -1;
  bool is_ticked = false; // check the question is selected the answer
  bool is_flag = false; // check the question is ticked by the flag

  QuestionTotal({required this.question});
}

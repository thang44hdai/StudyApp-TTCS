import 'Option.dart';

class Question {
  final String question;
  final List<String> options;
  int selected_index = -1;
  bool is_ticked = false;

  Question({required this.question, required this.options});
}

import 'Option.dart';

class Question {
  final String text;
  final List<Option> options;
  final String solution;
  bool isLocked = false;
  Option selectedOption;

  Question(
    this.text,
    this.options,
    this.solution,
    this.isLocked,
    this.selectedOption,
  );
}

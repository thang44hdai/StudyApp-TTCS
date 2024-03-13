import 'Option.dart';

class Question {
  final String text;
  final List<Option> options;
  final String solution;
  bool isLocked;

  Question({
    required this.text,
    required this.options,
    required this.solution,
    this.isLocked = false,
  });
}
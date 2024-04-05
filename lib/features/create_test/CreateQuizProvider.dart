import 'package:flutter/cupertino.dart';
import 'package:study/core/response/Question.dart';

class CreateQuizProvider extends ChangeNotifier {
  int itemCount = 1;
  List<Question> listQuestion = List.generate(100, (index) => Question.empty());

}

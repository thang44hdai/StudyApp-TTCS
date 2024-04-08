import 'package:flutter/cupertino.dart';
import 'package:study/core/response/Question.dart';
import 'package:study/core/service/apiService.dart';

class CreateQuizProvider extends ChangeNotifier {
  int itemCount = 1;
  List<Question> listQuestion = List.generate(100, (index) => Question.empty());

  void updateData() {
    for (int i = 0; i < itemCount; i++) {
      Question element = listQuestion[i];
      ApiService().postQuestion(element);
      print("test" + element.question);
    }
  }
}

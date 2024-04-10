import 'package:flutter/cupertino.dart';
import 'package:study/core/response/Question.dart';
import 'package:study/core/service/apiService.dart';

class CreateQuizProvider extends ChangeNotifier {
  int itemCount = 1;
  List<Question> listQuestion = List.generate(100, (index) => Question.empty());

  void updateData(String title, int time, String description) {
    for (int i = 0; i < itemCount; i++) {
      Question element = listQuestion[i];
      ApiService().postQuestion(element);
    }
    ApiService().postListQuestion(title, time, description);
  }
}

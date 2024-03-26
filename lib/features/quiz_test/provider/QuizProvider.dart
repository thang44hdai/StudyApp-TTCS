import 'package:flutter/material.dart';

import '../../../core/response/QuestionTotal.dart';

class QuestionProvider extends ChangeNotifier {
  List<QuestionTotal> questions = [];

  int selectedQuestionIndex = 0;
  int selectedAnswerIndex = -1;

  void setQuiz(List<QuestionTotal> a) {
    questions = a;
    notifyListeners();
  }

  void updateQuestion(List<QuestionTotal> a) {
    questions = a;
    notifyListeners();
  }

  void updateSelectQuestion(int index) {
    selectedQuestionIndex = index;
    notifyListeners();
  }

  void updateSelectAnswerToQuestion(int questionIndex, int answerIndex) {
    questions[questionIndex].selected_index = answerIndex;
    questions[questionIndex].is_ticked = true;
    notifyListeners();
  }

  void resetData() {
    questions = [];
    selectedQuestionIndex = 0;
    selectedAnswerIndex = -1;
  }
}

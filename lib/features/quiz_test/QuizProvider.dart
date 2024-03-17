import 'package:flutter/material.dart';

import '../../core/model/Question.dart';

class QuestionProvider extends ChangeNotifier {
  List<Question> questions = [
    Question(
      question: "Câu hỏi 11111111111111",
      options: ["Đáp án 1Aqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq", "Đáp án 1B", "Đáp án 1C", "Đáp án 1D"],
    ),
    Question(
      question: "Câu hỏi 2",
      options: ["Đáp án 2A", "Đáp án 2B", "Đáp án 2C", "Đáp án 2D"],
    ),
    Question(
      question: "Câu hỏi 3",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
    ),
    Question(
      question: "Câu hỏi 3",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
    ),
    Question(
      question: "Câu hỏi 3",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
    ),
    Question(
      question: "Câu hỏi 3",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
    ),
    Question(
      question: "Câu hỏi 3",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
    ),
    Question(
      question: "Câu hỏi 3",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
    ),
    Question(
      question: "Câu hỏi 3",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
    ),
    Question(
      question: "Câu hỏi 3",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
    ),
    Question(
      question: "Câu hỏi 3",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
    ),
    Question(
      question: "Câu hỏi 3",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
    ),
  ];

  int selectedQuestionIndex = 0;
  int selectedAnswerIndex = -1;

  void updateQuestion(List<Question> a) {
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

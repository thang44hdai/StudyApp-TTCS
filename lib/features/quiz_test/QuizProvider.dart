import 'package:flutter/material.dart';

import '../../core/response/QuestionTotal.dart';

class QuestionProvider extends ChangeNotifier {
  List<QuestionTotal> questions = [
    QuestionTotal(
      question: "Câu hỏi 1",
      options: ["Đáp án 1A", "Đáp án 1B", "Đáp án 1C", "Đáp án 1D"],
      true_answer: 1,
    ),
    QuestionTotal(
      question: "Câu hỏi 2",
      options: ["Đáp án 2A", "Đáp án 2B", "Đáp án 2C", "Đáp án 2D"],
      true_answer: 1,
    ),
    QuestionTotal(
      question: "Câu hỏi 3",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
      true_answer: 1,
    ),
    QuestionTotal(
      question: "Câu hỏi 4",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
      true_answer: 1,
    ),
    QuestionTotal(
      question: "Câu hỏi 5",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
      true_answer: 1,
    ),
    QuestionTotal(
      question: "Câu hỏi 6",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
      true_answer: 1,
    ),
    QuestionTotal(
      question: "Câu hỏi 7",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
      true_answer: 1,
    ),
    QuestionTotal(
      question: "Câu hỏi 8",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
      true_answer: 1,
    ),
    QuestionTotal(
      question: "Câu hỏi 9",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
      true_answer: 1,
    ),
    QuestionTotal(
      question: "Câu hỏi 10",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
      true_answer: 1,
    ),
    QuestionTotal(
      question: "Câu hỏi 11",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
      true_answer: 1,
    ),
    QuestionTotal(
      question: "Câu hỏi 12",
      options: ["Đáp án 3A", "Đáp án 3B", "Đáp án 3C", "Đáp án 3D"],
      true_answer: 1,
    ),
  ];

  int selectedQuestionIndex = 0;
  int selectedAnswerIndex = -1;

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

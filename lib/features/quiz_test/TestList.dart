import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreen createState() => _TestScreen();
}

class _TestScreen extends State<TestScreen> {
  List<Question> questions = [
    Question(
      question: "Câu hỏi 1",
      options: ["Đáp án 1A", "Đáp án 1B", "Đáp án 1C", "Đáp án 1D"],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    questions[selectedQuestionIndex].question,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ...List.generate(
                      questions[selectedQuestionIndex].options.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedAnswerIndex = index;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: selectedAnswerIndex == index
                              ? MaterialStateProperty.all(Colors.blue)
                              : null,
                        ),
                        child: Text(
                          questions[selectedQuestionIndex].options[index],
                          style: TextStyle(
                              fontSize: 16,
                              color: selectedAnswerIndex == index
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            Container(
              width: 50,
              child: GridView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return IconButton(
                    icon: Icon(Icons.question_answer),
                    onPressed: () {
                      setState(() {
                        selectedQuestionIndex = index;
                        selectedAnswerIndex =
                            -1; // Reset selected answer when changing question
                      });
                    },
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String question;
  final List<String> options;

  Question({required this.question, required this.options});
}

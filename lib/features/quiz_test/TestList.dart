import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/model/Question.dart';
import 'QuizProvider.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreen createState() => _TestScreen();
}

class _TestScreen extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<QuestionProvider>(context);
    List<Question> questions = viewmodel.questions;
    int selectedQuestionIndex = viewmodel.selectedQuestionIndex;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                viewmodel.questions[selectedQuestionIndex]
                                        .is_flag =
                                    !viewmodel.questions[selectedQuestionIndex]
                                        .is_flag;
                              });
                            },
                            icon: Icon(Icons.flag),
                            color: (questions[selectedQuestionIndex].is_flag ==
                                    true)
                                ? Colors.red
                                : null,
                          ),
                          Expanded(
                            child: Text(
                              questions[selectedQuestionIndex].question,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: (questions[selectedQuestionIndex].is_image)
                            ? Image.asset("assets/question.png")
                            : null,
                      ),
                      SizedBox(height: 20),
                      ...List.generate(
                        questions[selectedQuestionIndex].options.length,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextButton(
                              onPressed: () {
                                questions[selectedQuestionIndex]
                                    .selected_index = index;
                                questions[selectedQuestionIndex].is_ticked =
                                    true;
                                viewmodel.updateQuestion(questions);
                                viewmodel.updateSelectAnswerToQuestion(
                                    selectedQuestionIndex, index);
                                viewmodel.updateSelectQuestion(
                                    selectedQuestionIndex);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    questions[selectedQuestionIndex]
                                                .selected_index ==
                                            index
                                        ? MaterialStateProperty.all(Colors.blue)
                                        : null,
                              ),
                              child: Text(
                                questions[selectedQuestionIndex].options[index],
                                style: TextStyle(
                                    fontSize: 16,
                                    color: questions[selectedQuestionIndex]
                                                .selected_index ==
                                            index
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Icon Question
            Container(
              width: 140,
              child: GridView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(4),
                    child: ElevatedButton(
                      onPressed: () {
                        viewmodel.updateSelectQuestion(index);
                      },
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor: MaterialStateProperty.all(
                          setColorQuestion(questions[index]),
                        ),
                      ),
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                            fontSize: 12,
                            color: questions[index].is_ticked ||
                                    questions[index].is_flag
                                ? Colors.white
                                : null),
                      ),
                    ),
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

  Color setColorQuestion(Question a) {
    if (a.is_flag == true) return Colors.red;
    if (a.is_ticked == true) return Colors.blue;
    return Colors.white54;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import '../../common/constant.dart';
import '../../core/response/QuestionTotal.dart';
import '../quiz_test/provider/QuizProvider.dart';

class ListResult extends StatefulWidget {
  @override
  _ListResult createState() => _ListResult();
}

class _ListResult extends State<ListResult> {
  late int selectedQuestionIndex;
  @override
  void initState() {
    super.initState();
    selectedQuestionIndex = 0;
  }
  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<QuestionProvider>(context);
    List<QuestionTotal> questions = viewmodel.questions;
    selectedQuestionIndex = viewmodel.selectedQuestionIndex;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Constants.screenWidth - 100,
              height: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          questions[selectedQuestionIndex].question.question,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                          child: (questions[selectedQuestionIndex]
                                      .question
                                      .is_image !=
                                  "")
                              ? GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return ZoomableImagePopup(
                                            imageUrl:
                                                questions[selectedQuestionIndex]
                                                    .question
                                                    .is_image);
                                      },
                                    );
                                  },
                                  child: Image.network(
                                    questions[selectedQuestionIndex]
                                        .question
                                        .is_image,
                                    // Replace the URL with your actual image URL
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : null,
                        ),
                        SizedBox(height: 20),
                        ...List.generate(
                          4,
                          (index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      setBackgroundAnswer(index,
                                          questions[selectedQuestionIndex])),
                                ),
                                child: Text(
                                  questions[selectedQuestionIndex]
                                      .question
                                      .option[index],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: questions[selectedQuestionIndex]
                                                      .selected_index ==
                                                  index ||
                                              questions[selectedQuestionIndex]
                                                      .question
                                                      .true_answer ==
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
            ),
            // Icon Question
            Container(
              width: 70,
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
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color setColorQuestion(QuestionTotal a) {
    if (a.selected_index == a.question.true_answer) return Colors.green;
    return Colors.red;
  }

  Color setBackgroundAnswer(int option, QuestionTotal a) {
    if (a.question.true_answer == option) return Colors.green;
    if (a.question.true_answer != option) {
      if (option == a.selected_index) return Colors.red;
    }
    return Colors.white54;
  }
}

class ZoomableImagePopup extends StatelessWidget {
  final String imageUrl;

  ZoomableImagePopup({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          child: PhotoView(
            imageProvider: NetworkImage(imageUrl),
            backgroundDecoration: BoxDecoration(color: Colors.transparent),
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 2,
            enableRotation: true, // Cho phép xoay ảnh
          ),
        ),
      ),
    );
  }
}

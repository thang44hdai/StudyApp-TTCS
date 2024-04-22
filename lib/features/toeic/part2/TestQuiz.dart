import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:study/common/constant.dart';
import 'package:study/features/toeic/model/Quiz.dart';

class TestQuiz extends StatefulWidget {
  List<Quiz> quizList;

  TestQuiz({required this.quizList, super.key});

  @override
  State<TestQuiz> createState() => _TestQuizState();
}

class _TestQuizState extends State<TestQuiz> {
  @override
  Widget build(BuildContext context) {
    List<Quiz> questionList = widget.quizList;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: questionList.length,
          itemBuilder: (context, index) {
            Quiz item = questionList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              child: Card(
                child: Column(
                  children: [
                    Container(
                      height: Constants.screenHeight / 3,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ZoomableImagePopup(imageUrl: item.image);
                            },
                          );
                        },
                        child: Image.network(item.image),
                      ),
                    ),
                    QuizItem(item: item),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class QuizItem extends StatefulWidget {
  Quiz item;

  QuizItem({required this.item, super.key});

  @override
  State<QuizItem> createState() => _QuizItemState();
}

class _QuizItemState extends State<QuizItem> {
  int state = 0;
  TextEditingController _input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Quiz item = widget.item;
    return Column(
      children: [
        ListTile(
          title: TextField(
            controller: _input,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: "Enter your text",
            ),
          ),
          trailing: state == 0
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      state = 1;
                    });
                  },
                  icon: Icon(Icons.check),
                )
              : null,
        ),
        state == 0
            ? Text("")
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.true_answer,
                  style: TextStyle(
                      color: _input.text == item.true_answer
                          ? Colors.green
                          : Colors.red,
                      fontSize: 30),
                ),
              ),
      ],
    );
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
            enableRotation: true,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/core/response/QuestionIntro.dart';
import 'package:study/features/tutorial/TutorialScreen.dart';

import '../../common/constant.dart';
import '../quiz_test/provider/QuizProvider.dart';
import '../quiz_test/provider/TimberProvider.dart';

class ItemQuiz extends StatelessWidget {
  final QuestionIntro item;

  const ItemQuiz({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<QuestionProvider>(context);
    final time_viewmodel = Provider.of<TimberProvider>(context);
    void DialogBase() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Are You Sure"),
            content: Text("U want join now?"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No'),
              ),
              TextButton(
                onPressed: () {
                  time_viewmodel.setTime(item.time);
                  viewmodel.setQuiz(item.question);
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TutorialScreen(),
                    ),
                  );
                },
                child: Text('Yes'),
              ),
            ],
          );
        },
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: GestureDetector(
        onTap: () {
          DialogBase();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(35),
          ),
          height: Constants.screenWidth / 2.5,
          width: Constants.screenWidth / 2.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.text_fields,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "${item.title}",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.add_alarm_rounded,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "${item.time}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.description,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "${item.description}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

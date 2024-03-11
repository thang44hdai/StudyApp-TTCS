import 'package:flutter/material.dart';
import 'package:study/common/constant.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Detail Quiz",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.timer_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        height: Constants.screenHeight,
        child: Stack(
          children: [
            Container(
              color: Colors.red,
              height: 60,
            ),
            Body(),
          ],
        ),
      ),
    );
  }
}

Widget Body() {
  return Positioned(
    top: 10,
    bottom: 0,
    right: 0,
    left: 0,
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
    ),
  );
}

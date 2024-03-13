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
            Fab(),
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
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 40),
            child: Container(
              height: 3,
              width: Constants.screenWidth / 6,
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              height: 50,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget Fab() {
  return Positioned(
    width: Constants.screenWidth,
    bottom: 10,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            color: Colors.red,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Padding(
              padding: EdgeInsets.only(
                left: 40,
                right: 40,
                top: 15,
                bottom: 15,
              ),
              child: Text(
                "Submit Quiz",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            color: Colors.red,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

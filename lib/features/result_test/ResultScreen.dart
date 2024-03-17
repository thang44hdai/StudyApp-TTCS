import 'package:flutter/material.dart';
import 'package:study/common/constant.dart';
import 'package:study/features/quiz_test/QuizScreen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreen();
}

class _ResultScreen extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Result",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.account_circle,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                height: 3,
                width: Constants.screenWidth / 6,
                color: Colors.red,
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
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Padding(
              padding: EdgeInsets.only(
                left: 80,
                right: 80,
              ),
              child: Text(
                "Return the Home Screen",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

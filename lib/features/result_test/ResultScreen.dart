import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/common/constant.dart';
import 'package:study/features/main.dart';
import 'package:study/features/profile/ProfileScreen.dart';
import 'package:study/features/quiz_test/QuizScreen.dart';
import 'package:study/features/result_test/ListResult.dart';

import '../home/HomeScreen.dart';
import '../quiz_test/provider/QuizProvider.dart';
import '../quiz_test/TestList.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreen();
}

class _ResultScreen extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Constants.screenHeight,
        child: Stack(
          children: [
            Header(),
            Container(
              color: Colors.red,
              height: 60,
            ),
            Body(),
            Fab(),
            Profile(),
          ],
        ),
      ),
    );
  }

  Widget Header() {
    return Container(
      decoration: BoxDecoration(color: Colors.red),
      height: Constants.screenHeight / 2,
    );
  }

  Widget Body() {
    return Positioned(
      top: Constants.screenHeight / 3,
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
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: Container(
                height: 3,
                width: Constants.screenWidth / 6,
                color: Colors.red,
              ),
            ),
            Expanded(child: ListResult()),
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
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MyApp(),
                ),
                (route) => false,
              );
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

  Widget Profile() {
    return Positioned(
      top: 20,
      right: 5,
      child: IconButton(
        icon: Icon(
          Icons.account_circle,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            ),
          );
        },
      ),
    );
  }
}

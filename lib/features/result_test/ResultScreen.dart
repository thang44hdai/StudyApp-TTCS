import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/common/color_resource.dart';
import 'package:study/common/constant.dart';
import 'package:study/core/response/QuestionTotal.dart';
import 'package:study/features/main.dart';
import 'package:study/features/main_screen.dart';
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
  late QuestionProvider viewmodel;

  @override
  Widget build(BuildContext context) {
    viewmodel = Provider.of<QuestionProvider>(context);
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
      child: Row(
        children: [
          SizedBox(width: 15),
          Text(
            "Bạn đã hoàn thành bài thi\nKết quả là: ${result()}",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
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
          color: Color(0xFFECF1EF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
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
              uploadHistory();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MainScreen(),
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
                "Quay trở lại màn hình chính",
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

  String result() {
    List<QuestionTotal> questions = viewmodel.questions;
    int count = 0;
    questions.forEach((element) {
      if (element.selected_index == element.question.true_answer) count++;
    });
    return "${count}/${questions.length}";
  }

  void uploadHistory() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot documentSnapshot =
        await firestore.collection("users").doc(Constants.userId).get();
    final account = documentSnapshot['account'];
    final name = documentSnapshot['name'];
    final password = documentSnapshot['password'];
    final history = documentSnapshot['history'] as List<dynamic>;
    final _history = history.cast<String>().toList();
    final date = DateTime.now();
    _history.add(
        date.toString().substring(0, 19) + "/${viewmodel.title}/" + result());

    final data = {
      "account": account,
      "name": name,
      "password": password,
      "history": _history,
    };
    await firestore.collection("users").doc(Constants.userId).set(data);
  }
}

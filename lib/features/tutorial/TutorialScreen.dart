import 'package:flutter/material.dart';
import 'package:study/common/constant.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
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
        title: const Text(
          "Tutorial",
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
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Brief explanation about this quiz",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Image.asset("assets/question.png"),
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "10 Question",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("10 point for a correct answer"),
              ],
            ),
          ),
          ListTile(
            leading: Image.asset("assets/time.png"),
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1 hour 15 min",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Total duration of the quiz"),
              ],
            ),
          ),
          ListTile(
            leading: Image.asset("assets/star.png"),
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Win 10 star",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Answer all questions correctly"),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 40, bottom: 10),
            child: Text(
              "Please read the text below carefully so you can understand it",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "• 10 point awarded for a correct answer and no marks for a incorrect answer"),
                Text("• Tap on options to select the correct answer"),
                Text(
                    "• Tap on the bookmark icon to save interesting questions"),
                Text(
                    "• Click submit if you are sure you want to complete all the quizzes"),
              ],
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
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          child: const Padding(
            padding: EdgeInsets.only(
              left: 80,
              right: 80,
            ),
            child: Text(
              "Start Quiz",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    ),
  );
}

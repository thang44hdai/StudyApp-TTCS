import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/common/constant.dart';
import 'package:study/features/toeic/ToeicProvider.dart';
import 'package:study/features/toeic/model/Question.dart';
import 'package:study/features/toeic/part1/TestScreen.dart';
import 'package:study/utils.dart';

List<Color> colors = [
  Colors.cyan,
  Colors.yellow,
  Colors.deepOrangeAccent,
  Colors.blueAccent,
  Colors.lightGreen,
  Colors.purple
];

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    ToeicTestProvider viewmodel = Provider.of<ToeicTestProvider>(context);
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
        title: Text(
          "Luyện Listening",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder(
        stream: viewmodel.getPartIToeicList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<QuestionList> questionList = snapshot.data ?? [];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: questionList.length,
                  itemBuilder: (context, index) {
                    return Item(questionList[index], index);
                  }),
            );
          } else {
            return Container(
              height: 50,
              width: 50,
              child: Utils.Loading(),
            );
          }
        },
      ),
    );
  }

  Widget Item(QuestionList item, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      TestScreen(questionList: item.list_question)));
        },
        child: Container(
          padding: EdgeInsets.only(right: 5, left: 10, top: 8, bottom: 8),
          decoration: BoxDecoration(
            color: colors[index % 6],
            borderRadius: BorderRadius.circular(12),
          ),
          height: Constants.screenHeight / 8,
          width: Constants.screenWidth - 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Đề thi số ${index + 1}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

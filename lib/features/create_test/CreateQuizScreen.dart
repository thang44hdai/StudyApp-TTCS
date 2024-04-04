import 'package:flutter/material.dart';
import 'package:study/common/color_resource.dart';
import 'package:study/common/constant.dart';

TextEditingController _titleEdtController = TextEditingController();

class CreateQuizScreen extends StatefulWidget {
  const CreateQuizScreen({super.key});

  @override
  State<CreateQuizScreen> createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Create",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: Constants.screenHeight,
        child: Stack(
          children: [
            Container(
              height: Constants.screenHeight / 20,
              decoration: BoxDecoration(color: Colors.red),
            ),
            Body(),
          ],
        ),
      ),
    );
  }

  Widget Body() {
    return Positioned(
      top: Constants.screenHeight / 20 - 10,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          color: ColorResources.mainBackGround(),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          ),
        ),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: Constants.screenWidth / 10,
                ),
                child: Text(
                  "Đề thi:",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Constants.screenWidth / 10),
                child: TextField(
                  controller: _titleEdtController,
                  style: TextStyle(color: Colors.black),
                  decoration:
                      InputDecoration(hintText: "Vui lòng nhập tên đề thi:"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: Constants.screenWidth / 10,
                ),
                child: Text(
                  "Thời gian:",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Constants.screenWidth / 10),
                child: TextField(
                  controller: _titleEdtController,
                  style: TextStyle(color: Colors.black),
                  decoration:
                      InputDecoration(hintText: "Vui lòng nhập giới hạn thời gian:"),
                ),
              ),
              SizedBox(
                height: 50,
              ),

              Container(
                height: 50,
                width: 50,
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:study/common/color_resource.dart';
import 'package:study/common/constant.dart';

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
      ),
    );
  }
}

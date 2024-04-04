import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study/common/color_resource.dart';
import 'package:study/common/constant.dart';

TextEditingController _titleEdtController = TextEditingController();
TextEditingController _timeEdtController = TextEditingController();
TextEditingController _descriptionEdtController = TextEditingController();
TextEditingController _questionEdtController = TextEditingController();
TextEditingController _option1EdtController = TextEditingController();
TextEditingController _option2EdtController = TextEditingController();
TextEditingController _option3EdtController = TextEditingController();
TextEditingController _option4EdtController = TextEditingController();
TextEditingController _trueAnswerEdtController = TextEditingController();
TextEditingController _imageEdtController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Container(
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
              padding:
                  EdgeInsets.symmetric(horizontal: Constants.screenWidth / 10),
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
              padding:
                  EdgeInsets.symmetric(horizontal: Constants.screenWidth / 10),
              child: TextField(
                controller: _timeEdtController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: "Vui lòng nhập giới hạn thời gian:"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: Constants.screenWidth / 10,
              ),
              child: Text(
                "Mô tả đề:",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Constants.screenWidth / 10),
              child: TextField(
                controller: _descriptionEdtController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(hintText: "Vui lòng nhập mô tả:"),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CarouselSlider.builder(
              itemCount: 10,
              itemBuilder: (context, index, pageIndex) {
                return FormQuestion(index + 1);
              },
              options: CarouselOptions(
                autoPlay: false,
                autoPlayInterval: Duration(milliseconds: 3000),
                viewportFraction: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget FormQuestion(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          children: [
            TextField(
              controller: _questionEdtController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  label: Text("Câu $index:"), hintText: "Nhập câu hỏi:"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: Constants.screenWidth / 2 - 10,
                  child: TextField(
                    controller: _option1EdtController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(hintText: "Đáp án 1:"),
                  ),
                ),
                Container(
                  width: Constants.screenWidth / 2 - 10,
                  child: TextField(
                    controller: _option2EdtController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(hintText: "Đáp án 2:"),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: Constants.screenWidth / 2 - 10,
                  child: TextField(
                    controller: _option3EdtController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(hintText: "Đáp án 3:"),
                  ),
                ),
                Container(
                  width: Constants.screenWidth / 2 - 10,
                  child: TextField(
                    controller: _option4EdtController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(hintText: "Đáp án 4:"),
                  ),
                ),
              ],
            ),
            TextField(
              controller: _trueAnswerEdtController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(label: Text("Đáp án đúng")),
            ),
            Expanded(
              child: TextField(
                controller: _imageEdtController,
                style: TextStyle(color: Colors.black),
                decoration:
                    InputDecoration(label: Text("Hình ảnh mô tả (Nếu có)")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:study/common/color_resource.dart';
import 'package:study/common/constant.dart';
import 'package:study/core/response/QuestionIntro.dart';
import 'package:study/core/service/apiService.dart';
import 'package:study/features/create_test/CreateQuizProvider.dart';
import 'package:study/utils.dart';

import 'WidgetAddQuestion.dart';

TextEditingController _titleEdtController = TextEditingController();
TextEditingController _timeEdtController = TextEditingController();
TextEditingController _descriptionEdtController = TextEditingController();
TextEditingController _numberOfQuestionEdtController = TextEditingController();

class CreateQuizScreen extends StatefulWidget {
  const CreateQuizScreen({super.key});

  @override
  State<CreateQuizScreen> createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  late CreateQuizProvider viewmodel;

  @override
  void initState() {
    super.initState();
    _numberOfQuestionEdtController.text = "1";
  }

  void _handleNumberOfQuestionsChanged(String value) {
    setState(() {
      viewmodel.itemCount = int.tryParse(value) ?? 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    viewmodel = Provider.of<CreateQuizProvider>(context);
    Future<List<QuestionIntro>> ListQuestionIntroFuture =
        ApiService().getQuestionIntro();

    return FutureBuilder(
        future: ListQuestionIntroFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<QuestionIntro>? ListQuestionIntro = snapshot.data;
            viewmodel.list_question_id =
                ListQuestionIntro![ListQuestionIntro.length - 1].id + 1;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.red,
                title: Text(
                  "Create",
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      viewmodel.updateData(
                          _titleEdtController.text,
                          int.parse(_timeEdtController.text),
                          _descriptionEdtController.text);
                    },
                    icon: Icon(
                      Icons.upload_file_sharp,
                      color: Colors.white,
                    ),
                  )
                ],
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
          } else {
            return Utils.NotConnectServer();
          }
        });
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
              padding: EdgeInsets.only(left: 12, right: 12, top: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 10,
                      ),
                      child: Text(
                        "Đề thi:",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: _titleEdtController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            hintText: "Vui lòng nhập tên đề thi:"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 10,
                      ),
                      child: Text(
                        "Thời gian:",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
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
                        left: 10,
                      ),
                      child: Text(
                        "Số lượng câu hỏi:",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: TextField(
                        controller: _numberOfQuestionEdtController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            hintText: "Vui lòng số lượng câu trong đề:"),
                        onChanged: _handleNumberOfQuestionsChanged,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 10,
                      ),
                      child: Text(
                        "Mô tả đề:",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: TextField(
                        controller: _descriptionEdtController,
                        style: TextStyle(color: Colors.black),
                        decoration:
                            InputDecoration(hintText: "Vui lòng nhập mô tả:"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CarouselSlider.builder(
              itemCount: viewmodel.itemCount,
              itemBuilder: (context, index, pageIndex) {
                return FormQuestion(
                  index: index + 1,
                  question: viewmodel.listQuestion[index],
                );
              },
              options: CarouselOptions(
                aspectRatio: 16 / 10,
                autoPlay: false,
                autoPlayInterval: Duration(milliseconds: 3000),
                viewportFraction: 0.9,
                onPageChanged: (index, result) {
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

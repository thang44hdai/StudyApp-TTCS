import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:study/common/constant.dart';
import 'package:study/core/response/Question.dart';
import 'package:study/features/create_test/CreateQuizProvider.dart';

class FormQuestion extends StatefulWidget {
  int index;
  Question question;

  FormQuestion({required this.index, required this.question, super.key});

  @override
  State<FormQuestion> createState() => _FormQuestionState();
}

class _FormQuestionState extends State<FormQuestion> {
  late CreateQuizProvider viewmodel;
  TextEditingController _questionEdtController = TextEditingController();
  TextEditingController _option1EdtController = TextEditingController();
  TextEditingController _option2EdtController = TextEditingController();
  TextEditingController _option3EdtController = TextEditingController();
  TextEditingController _option4EdtController = TextEditingController();
  TextEditingController _trueAnswerEdtController = TextEditingController();
  TextEditingController _imageEdtController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Question question = widget.question;
    _questionEdtController.text = question.question;
    _option1EdtController.text = question.cau_a;
    _option2EdtController.text = question.cau_b;
    _option3EdtController.text = question.cau_c;
    _option4EdtController.text = question.cau_d;
    _trueAnswerEdtController.text = question.true_answer.toString();
    _imageEdtController.text = question.is_image;
  }

  @override
  Widget build(BuildContext context) {
    viewmodel = Provider.of<CreateQuizProvider>(context);
    int index = widget.index;

    void handleWhenSwipeItem() {
      Question question = Question.empty();
      question.question = _questionEdtController.text;
      question.cau_a = _option1EdtController.text;
      question.cau_b = _option2EdtController.text;
      question.cau_c = _option3EdtController.text;
      question.cau_d = _option4EdtController.text;
      question.true_answer = int.parse(_trueAnswerEdtController.text);
      question.is_image = _imageEdtController.text;
      viewmodel.listQuestion[index - 1] = question;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: Constants.screenWidth,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _questionEdtController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          label: Text("Câu $index:"),
                          hintText: "Nhập câu hỏi:"),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.save),
                      onPressed: () {
                        handleWhenSwipeItem();
                        viewmodel.updateUI();
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _option1EdtController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(hintText: "Đáp án 1:"),
                    ),
                  ),
                  Expanded(
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
                  Expanded(
                    child: TextField(
                      controller: _option3EdtController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(hintText: "Đáp án 3:"),
                    ),
                  ),
                  Expanded(
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
      ),
    );
  }
}

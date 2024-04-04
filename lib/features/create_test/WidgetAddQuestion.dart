import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study/common/constant.dart';

TextEditingController _questionEdtController = TextEditingController();
TextEditingController _option1EdtController = TextEditingController();
TextEditingController _option2EdtController = TextEditingController();
TextEditingController _option3EdtController = TextEditingController();
TextEditingController _option4EdtController = TextEditingController();
TextEditingController _trueAnswerEdtController = TextEditingController();
TextEditingController _imageEdtController = TextEditingController();

class FormQuestion extends StatefulWidget {
  int index;
  FormQuestion({required this.index, super.key});

  @override
  State<FormQuestion> createState() => _FormQuestionState();
}

class _FormQuestionState extends State<FormQuestion> {
  @override
  Widget build(BuildContext context) {
    int index = widget.index;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
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

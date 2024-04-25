import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:study/common/color_resource.dart';
import 'package:study/common/constant.dart';
import 'package:study/core/response/QuestionIntro.dart';
import 'package:study/core/service/apiService.dart';
import 'package:study/features/create_test/CreateQuizProvider.dart';
import 'package:study/utils.dart';

import 'WidgetAddQuestion.dart';

class CreateQuizScreen extends StatefulWidget {
  const CreateQuizScreen({super.key});

  @override
  State<CreateQuizScreen> createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  TextEditingController _titleEdtController = TextEditingController();
  TextEditingController _timeEdtController = TextEditingController();
  TextEditingController _descriptionEdtController = TextEditingController();
  TextEditingController _numberOfQuestionEdtController =
      TextEditingController();
  late CreateQuizProvider viewmodel;
  GlobalKey _qrImageKey = GlobalKey();

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

  Future<void> _captureAndUploadQRImage() async {
    try {
      // Tạo đường dẫn lưu trữ trên Firebase Storage
      String fileName = 'qr_image_${_titleEdtController.text}';
      Reference storageReference =
          FirebaseStorage.instance.ref().child('qr_codes/$fileName');

      // Chụp hình ảnh từ RenderRepaintBoundary
      RenderRepaintBoundary boundary = _qrImageKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List imageBytes = byteData!.buffer.asUint8List();

      // Upload hình ảnh lên Firebase Storage với định dạng image/png
      UploadTask uploadTask = storageReference.putData(
          imageBytes, SettableMetadata(contentType: 'image/png'));
      await uploadTask;

      // Lấy URL công khai của hình ảnh đã upload
      String downloadUrl = await storageReference.getDownloadURL();
      uploadFirebase(_titleEdtController.text, downloadUrl);

      // In ra URL để sử dụng trong ứng dụng web
      print('Download URL: $downloadUrl');
    } catch (e) {
      print('Error uploading QR image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error uploading QR')),
      );
    }
  }

  void uploadFirebase(String title, String url) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final data = <String, dynamic>{
      "title": title,
      "image": url,
    };

    firestore.collection("qr_codes").add(data);
  }

  @override
  Widget build(BuildContext context) {
    viewmodel = Provider.of<CreateQuizProvider>(context);
    Future<List<QuestionIntro>> ListQuestionIntroFuture =
        ApiService().getQuestionIntro();

    return GestureDetector(
      onTap: () {
        Utils.HideKeyBoard();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          title: Text(
            "Create",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _captureAndUploadQRImage();
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
        body: FutureBuilder(
            future: ListQuestionIntroFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<QuestionIntro>? ListQuestionIntro = snapshot.data;
                viewmodel.list_question_id =
                    ListQuestionIntro![ListQuestionIntro.length - 1].id + 1;
                return SingleChildScrollView(
                  child: Container(
                    height: Constants.screenHeight * 2,
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
              } else {
                return Utils.Loading();
              }
            }),
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
                        onChanged: (text) {
                          setState(() {});
                        },
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
              height: 20,
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
                aspectRatio: 16 / 12,
                autoPlay: false,
                enableInfiniteScroll: false,
                autoPlayInterval: Duration(milliseconds: 3000),
                viewportFraction: 0.9,
                onPageChanged: (index, result) {
                  setState(() {});
                },
              ),
            ),
            SizedBox(height: 15),
            // Hiển thị mã QR trong một hình ảnh
            Container(
              width: Constants.screenWidth,
              child: Center(
                child: RepaintBoundary(
                  key: _qrImageKey,
                  child: QrImageView(
                    data: _titleEdtController.text,
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

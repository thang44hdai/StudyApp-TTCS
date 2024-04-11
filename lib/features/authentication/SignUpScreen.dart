import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:study/common/color_resource.dart';
import 'package:study/common/constant.dart';
import 'package:study/features/calendar/event.dart';

//
TextEditingController _tk_registerController = TextEditingController();
TextEditingController _mk_registerController = TextEditingController();
TextEditingController _verifyPassWordController = TextEditingController();
TextEditingController _nameUserController = TextEditingController();

void addUser(String acc, String name, String pw, List<String> history) {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final user = <String, dynamic>{
    "account": acc,
    "name": name,
    "password": pw,
    "history": history,
  };
  final event = <String, List<Map<String, String>>>{
    "doc": [],
  };
  firestore.collection("users").doc(acc + pw).set(user);
  firestore.collection("events").doc(acc + pw).set(event);
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg_login.png'),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
              Color.fromRGBO(1, 81, 152, 1).withOpacity(0.5),
              BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Stack(
            children: [
              Positioned(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  child: Container(
                    color: ColorResources.mainBackGround(),
                    height: Constants.screenHeight * 2 / 3,
                    width: Constants.screenWidth,
                    child: Padding(
                      padding: EdgeInsets.only(left: 32, right: 32),
                      child: ListView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 50),
                              Text(
                                "Welcome",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32),
                              ),
                              Text(
                                "Please fill in your information",
                                style: TextStyle(color: Colors.red),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: _tk_registerController,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    labelText: "Email:",
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    )),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              TextField(
                                controller: _nameUserController,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    labelText: "Họ và tên:",
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    )),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              TextField(
                                obscureText: true,
                                controller: _mk_registerController,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    labelText: "Mật khẩu:",
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    )),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              TextField(
                                obscureText: true,
                                controller: _verifyPassWordController,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    labelText: "Nhập lại mật khẩu:",
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    )),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  final auth = FirebaseAuth.instance;
                                  auth.createUserWithEmailAndPassword(
                                      email: _tk_registerController.text,
                                      password: _mk_registerController.text);
                                  Navigator.pop(context);
                                  addUser(
                                      _tk_registerController.text,
                                      _nameUserController.text,
                                      _mk_registerController.text, []);
                                  _tk_registerController.text =
                                      _mk_registerController.text = "";
                                  // Hiển thị thông báo đăng kí thành công
                                  final snackBar = SnackBar(
                                    content: Text('Đăng kí thành công!'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  // Đóng thông báo sau 2 giây
                                  Timer(
                                    Duration(seconds: 2),
                                    () {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  backgroundColor: Colors.red,
                                  elevation: 20,
                                  shadowColor: Colors.red,
                                  minimumSize: Size.fromHeight(60),
                                ),
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

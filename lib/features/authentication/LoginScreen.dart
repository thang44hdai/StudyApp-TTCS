import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:study/common/constant.dart';
import 'package:study/core/model/User.dart';
import 'package:study/features/authentication/SignUpScreen.dart';
import 'package:study/features/home/HomeScreen.dart';
import 'package:study/features/main_screen.dart';

import '../../common/color_resource.dart';

TextEditingController _tk_loginController = TextEditingController();
TextEditingController _mk_loginController = TextEditingController();

void signIn(BuildContext context, String tk, String mk) async {
  try {
    final auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: tk,
      password: mk,
    );
    Constants.user = UserDoc(account: tk, password: mk);
    Constants.userId = auth.currentUser!.uid;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MainScreen(),
      ),
    );
  } catch (e) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thông báo'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

// Future<user> read_user(String docs) async {
//   DocumentSnapshot documentSnapshot =
//   await FirebaseFirestore.instance.collection("users").doc(docs).get();
//
//   if (documentSnapshot.exists) {
//     var account = documentSnapshot.get("account");
//     var name = documentSnapshot.get("name");
//     var pw = documentSnapshot.get("password");
//     var _ticket = documentSnapshot.get("ticket") as List<dynamic>;
//     var ticket = _ticket.cast<String>().toList();
//
//     return user(name: name, account: account, password: pw, ticket: ticket);
//   } else {
//     print("Error");
//     return user(name: "", account: "", password: "", ticket: []);
//   }
// }

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _tk_loginController.text = "hi@gmail.com";
    _mk_loginController.text = "123456";
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg_login.png'),
          fit: BoxFit.fill,
          colorFilter:
              ColorFilter.mode(Colors.red.withOpacity(0.5), BlendMode.dstATop),
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
                      padding: EdgeInsets.all(32),
                      child: ListView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Center(
                              //   child: Container(
                              //     margin: EdgeInsets.only(bottom: 20),
                              //     child: Image.asset('assets/welcome.png'),
                              //     height: 100,
                              //   ),
                              // ),
                              Text(
                                "Welcome",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32),
                              ),
                              Text(
                                "Please log in your information",
                                style: TextStyle(color: Colors.red),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextField(
                                controller: _tk_loginController,
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
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextField(
                                obscureText: true,
                                controller: _mk_loginController,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  labelText: "Mật khẩu: ",
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  signIn(context, _tk_loginController.text,
                                      _mk_loginController.text);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  backgroundColor: Colors.red,
                                  elevation: 20,
                                  shadowColor: Colors.red,
                                  minimumSize: Size.fromHeight(60),
                                ),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Not a member?"),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUpScreen()));
                                      },
                                      child: Text("Register")),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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

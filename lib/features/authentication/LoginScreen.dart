import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study/common/constant.dart';
import 'package:study/core/model/User.dart';
import 'package:study/features/authentication/SignUpScreen.dart';
import 'package:study/features/home/HomeScreen.dart';
import 'package:study/main_screen.dart';
import 'package:study/utils.dart';

import '../../common/color_resource.dart';

void signIn(BuildContext context, String tk, String mk) async {
  try {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Utils.Loading();
      },
    );
    final auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: tk,
      password: mk,
    );
    Constants.user = UserDoc(account: tk, password: mk);
    Constants.userId = auth.currentUser!.uid;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => MainScreen(),
      ),
      (route) => false,
    );
  } catch (e) {
    Navigator.pop(context);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thông báo'),
          content: Text("Đăng nhập thất bại!"),
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

Future<void> _saveLoginInfo(String email, String password, bool save) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (save) {
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setBool('save', save);
  } else {
    await prefs.remove('email');
    await prefs.remove('password');
    await prefs.remove('save');
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _tk_loginController = TextEditingController();
  TextEditingController _mk_loginController = TextEditingController();
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _loadLoginInfo();
  }

  Future<void> _loadLoginInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _tk_loginController.text = prefs.getString('email') ?? '';
      _mk_loginController.text = prefs.getString('password') ?? '';
      _isChecked = prefs.getBool('save') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Checkbox(
                                    activeColor: Colors.red,
                                    value: _isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        _isChecked = value ?? false;
                                      });
                                    },
                                  ),
                                  Text("Lưu mật khẩu?"),
                                ],
                              ),
                              SizedBox(height: 15),
                              ElevatedButton(
                                onPressed: () {
                                  _saveLoginInfo(_tk_loginController.text,
                                      _mk_loginController.text, _isChecked);
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

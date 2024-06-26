import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:study/common/color_resource.dart';
import 'package:study/features/authentication/LoginScreen.dart';
import 'package:study/features/profile/ProfileProvider.dart';
import 'package:study/main_screen.dart';
import 'package:study/utils.dart';
import '../../common/constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  late ProfileProvider viewmodel = ProfileProvider();
  Uint8List? _image;

  @override
  Widget build(BuildContext context) {
    viewmodel = Provider.of<ProfileProvider>(context);

    return Material(
      child: StreamBuilder(
          stream: viewmodel.getInformation(),
          builder: (context, snap) {
            if (snap.hasData) {
              return Container(
                width: Constants.screenWidth,
                height: Constants.screenHeight,
                child: Stack(
                  children: [
                    Background(),
                    Frame(),
                    Ava(),
                    Profile(snap.data!.name, snap.data!.email),
                    History(),
                    ItemHistory(snap.data!.history),
                    BtnLogout(),
                    BtnChangeAva(),
                  ],
                ),
              );
            } else {
              return Utils.Loading();
            }
          }),
    );
  }

  Widget Background() {
    return Container(
      height: Constants.screenHeight / 3 + 50,
      decoration: BoxDecoration(
        color: Colors.red,
      ),
    );
  }

  Widget Frame() {
    return Positioned(
      top: Constants.screenHeight / 3,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: ColorResources.mainBackGround(),
        ),
      ),
    );
  }

  Widget Ava() {
    return Positioned(
      top: Constants.screenHeight / 3 - Constants.screenWidth / 6,
      left: Constants.screenWidth / 3,
      child: Column(
        children: [
          Container(
            width: Constants.screenWidth / 3,
            height: Constants.screenWidth / 3,
            child: _image != null
                ? CircleAvatar(
                    radius: Constants.screenWidth / 6,
                    backgroundImage: MemoryImage(_image!),
                  )
                : CircleAvatar(
                    radius: Constants.screenWidth / 6,
                    backgroundImage: AssetImage('assets/avatar.png'),
                  ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget Profile(String name, String email) {
    return Positioned(
      top: Constants.screenHeight / 3 + Constants.screenWidth / 6 + 10,
      child: Container(
        width: Constants.screenWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${name} - ${email}",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget History() {
    return Positioned(
      top: Constants.screenHeight / 3 + Constants.screenWidth / 6 + 50,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Lịch sử làm bài:",
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget ItemHistory(List<String> history) {
    return Positioned(
      top: Constants.screenHeight / 3 + Constants.screenWidth / 6 + 80,
      left: 0,
      right: 0,
      bottom: 0,
      child: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          List<String> his = history[index].split("/");
          int n = his.length;
          String title = "";
          for (int i = 1; i < n - 2; i++) title += "${his[i]}/";
          title = title.substring(0, title.length - 1);

          return Padding(
            padding: EdgeInsets.only(bottom: 8, left: 40, right: 40),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                // onTap: () => {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => TutorialScreen()))
                // },
                leading: Text(
                  his[0],
                  style: TextStyle(color: Colors.white),
                ),
                title: Text(
                  "$title",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  "${his[n - 2]}/${his[n - 1]}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget BtnLogout() {
    return Positioned(
      top: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 40, right: 15),
        child: GestureDetector(
          onTap: () {
            Get.find<NavigationController>().selectedIndex.value = 0;
            FirebaseAuth.instance.signOut();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false,
            );
          },
          child: Row(
            children: [
              Icon(
                Icons.logout,
                color: Colors.white,
              ),
              SizedBox(width: 5),
              Text(
                "Đăng xuất",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget BtnChangeAva() {
    return Positioned(
      top: Constants.screenHeight / 3 + 22,
      left: Constants.screenWidth * 2 / 3 - 40,
      child: IconButton(
        onPressed: () {
          selectImage();
        },
        icon: Icon(Icons.camera_alt),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
    );
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }
}

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? file = await _imagePicker.pickImage(source: source);
  if (file != null) return await file.readAsBytes();
}

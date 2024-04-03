import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:study/features/profile/ProfileProvider.dart';

import '../../common/constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  late ProfileProvider viewmodel = ProfileProvider();

  @override
  Widget build(BuildContext context) {
    viewmodel = Provider.of<ProfileProvider>(context);

    return StreamBuilder(
        stream: viewmodel.getInformation(),
        builder: (context, snap) {
          if (snap.hasError) {
            return Text("Error");
          } else if (snap.hasData) {
            return Container(
              width: Constants.screenWidth,
              height: Constants.screenHeight,
              child: Stack(
                children: [
                  Background(),
                  Ava(),
                  Profile(snap.data!.name, snap.data!.email),
                  History(),
                  ItemHistory(),
                ],
              ),
            );
          } else {
            return Text("Xin chờ trong giây lát");
          }
        });
  }

  Widget Background() {
    return Container(
      height: Constants.screenHeight / 3,
      decoration: BoxDecoration(
        color: Colors.red,
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
            child: CircleAvatar(
              radius: Constants.screenWidth / 6,
              backgroundImage: AssetImage('assets/ava.jpg'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
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
        Text("Lịch sử làm bài:"),
        SizedBox(height: 20),
      ],
    ),
  );
}

Widget ItemHistory() {
  return Positioned(
    top: Constants.screenHeight / 3 + Constants.screenWidth / 6 + 80,
    left: 0,
    right: 0,
    bottom: 0,
    child: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 8, left: 40, right: 40),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(
                (index + 1).toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
    ),
  );
}

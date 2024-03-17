import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../common/constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

late double heightScreen, widthScreen;
int fragment = 1;
List<String> ve = [];

class _ProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    heightScreen = MediaQuery.of(context).size.height;
    widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 340,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Background(),
                Ava(),
              ],
            ),
          ),
          Container(
            height: 300,
            child: fragment == 1 ? profile() : ticket(),
          ),
        ],
      ),
      bottomNavigationBar: GNav(
        selectedIndex: 0,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        gap: 10,
        tabBackgroundColor: Colors.red,
        padding: EdgeInsets.all(10),
        tabMargin: EdgeInsets.only(bottom: 10),
        tabs: [
          GButton(
            icon: Icons.person_2,
            text: "Thông tin cá nhân",
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                fragment = 1;
              });
            },
          ),
          GButton(
            icon: Icons.history_edu,
            text: "Lịch sử làm bài",
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                fragment = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget Background() {
    return const SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        child: Image(
          image: AssetImage("assets/counter.png"),
        ),
      ),
    );
  }

  Widget Ava() {
    return Positioned(
      top: 160,
      left: Constants.screenWidth / 3,
      child: Column(
        children: [
          Container(
            width: Constants.screenWidth / 3,
            height: Constants.screenWidth / 3,
            child: CircleAvatar(
              radius: widthScreen / 6,
              backgroundImage: AssetImage('assets/ava.jpg'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "You",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

Widget profile() {
  return Text("Page 1");
}

Widget ticket() {
  return Padding(
    padding: EdgeInsets.only(left: 50, right: 50),
    child: Text("Page 2"),
  );
}

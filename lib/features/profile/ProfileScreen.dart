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
          } else {
            return Scaffold(
              body: Column(
                children: [
                  Container(
                    height: 340,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Background(),
                        Ava(snap.data!.name, snap.data!.email),
                      ],
                    ),
                  ),
                  Container(
                    height: 300,
                    child: profile(),
                  ),
                ],
              ),
            );
          }
        });
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

  Widget Ava(String name, String email) {
    return Positioned(
      top: 160,
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
          Text(
            "${name} - ${email}",
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

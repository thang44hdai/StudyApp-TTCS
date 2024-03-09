import 'package:flutter/material.dart';
import 'package:study/common/constant.dart';

TextEditingController searchController = TextEditingController();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Constants.screenHeight,
        child: Stack(
          children: [
            Header(),
            Body(),
          ],
        ),
      ),
    );
  }
}

Widget Header() {
  return Positioned(
    top: 0,
    left: 0,
    right: 0,
    child: Container(
      height: Constants.screenHeight / 3,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.expand),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Friend",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "Let's test your knowledge",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              labelText: "Search",
              labelStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget Body() {
  return Positioned(
    top: Constants.screenHeight * 7 / 30,
    left: 0,
    right: 0,
    bottom: 0,
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
    ),
  );
}

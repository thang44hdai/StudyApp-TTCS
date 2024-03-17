import 'package:flutter/material.dart';
import 'package:study/common/constant.dart';

TextEditingController searchController = TextEditingController();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Constants.screenHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Header(),
            Body(),
            Fab(),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/btn_expand.png"),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.account_circle),
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Hello Friend",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 15,
              bottom: 5,
            ),
            child: Text(
              "Let's test your knowledge",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: Constants.screenHeight / 10,
              left: 10,
              right: 10,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                    color: Colors.white,
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      controller: searchController,
                      decoration: const InputDecoration(
                        labelText: "Search",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
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
          topRight: Radius.circular(35),
          topLeft: Radius.circular(35),
        ),
      ),
      child: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, indext) {
          return Text("data $indext");
        },
      ),
    ),
  );
}

Widget Fab() {
  return Positioned(
    bottom: 10,
    child: ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red),
      ),
      child: const Padding(
        padding: EdgeInsets.only(
          left: 80,
          right: 80,
        ),
        child: Text(
          "Start Quiz",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

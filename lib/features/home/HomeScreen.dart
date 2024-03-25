import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:study/common/constant.dart';
import 'package:study/core/response/QuestionIntro.dart';
import 'package:study/core/service/apiService.dart';
import 'package:study/features/profile/ProfileScreen.dart';
import 'package:study/features/tutorial/TutorialScreen.dart';

import 'QuizItem.dart';

TextEditingController searchController = TextEditingController();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  late Future<List<QuestionIntro>> ListQuestionIntroFuture;

  @override
  void initState() {
    super.initState();
    ListQuestionIntroFuture = ApiService().getQuestionIntro();
  }

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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    },
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
        child: FutureBuilder(
          future: ListQuestionIntroFuture,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List<QuestionIntro> ListQuestionIntro = snapshot.data;
              return GridView.builder(
                itemCount: ListQuestionIntro.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context1, index) {
                  return ItemQuiz(
                    item: QuestionIntro(
                      id: 1,
                      time: 100,
                      title: 'Math',
                      description: '!',
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Container(
                  color: Colors.amber,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget Fab() {
    return Positioned(
      bottom: 10,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TutorialScreen(),
            ),
          );
        },
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

  Future<Widget> fetchData() async {
    final Dio dio = Dio();
    try {
      var response = await dio.get("http://localhost/backend_php/api_list_qusetion.php");

      List<QuestionIntro> ListQuestionIntro = response.data;
      return GridView.builder(
        itemCount: ListQuestionIntro.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (context1, index) {
          return ItemQuiz(
            item: QuestionIntro(
              id: 1,
              time: 100,
              title: 'Math',
              description: '!',
            ),
          );
        },
      );
    } on DioException catch (e) {
      return Text("${e.error}");
    }
  }
}

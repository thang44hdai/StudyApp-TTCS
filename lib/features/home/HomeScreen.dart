import 'package:flutter/material.dart';
import 'package:study/common/color_resource.dart';
import 'package:study/common/constant.dart';
import 'package:study/core/response/QuestionIntro.dart';
import 'package:study/core/service/apiService.dart';
import 'package:study/features/notification/NotificationScreen.dart';
import 'package:study/features/profile/ProfileScreen.dart';
import 'package:study/features/tutorial/TutorialScreen.dart';
import 'package:study/utils.dart';
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
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationScreen(),
                ),
              );
            },
            icon: Icon(Icons.notifications_active),
            color: Colors.white,
          ),
        ],
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
        backgroundColor: ColorResources.mainBackGround(),
        child: Column(
          children: [
            Text(
              "Setting",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            ListTile(
              leading: Text("Mode:"),
            ),
          ],
        ),
      ),
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
                    color: ColorResources.mainBackGround(),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
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
          color: Color(0xFFECF1EF),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          ),
        ),
        child: FutureBuilder(
          future: ListQuestionIntroFuture,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              List<QuestionIntro> ListQuestionIntro = snapshot.data;
              return GridView.builder(
                itemCount: ListQuestionIntro.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context1, index) {
                  var item = ListQuestionIntro[index];
                  return ItemQuiz(
                    item: QuestionIntro(
                        id: item.id,
                        time: item.time,
                        title: item.title,
                        description: item.description,
                        question: item.question),
                  );
                },
              );
            } else {
              return Utils.NotConnectServer();
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
}

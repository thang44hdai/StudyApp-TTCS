import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/common/color_resource.dart';
import 'package:study/common/constant.dart';
import 'package:study/core/response/QuestionIntro.dart';
import 'package:study/core/service/apiService.dart';
import 'package:study/features/create_test/CreateQuizScreen.dart';
import 'package:study/features/home/DescriptionScreen.dart';
import 'package:study/features/home/TermOfUseScreen.dart';
import 'package:study/features/notification/NotificationScreen.dart';
import 'package:study/features/tutorial/TutorialScreen.dart';
import 'package:study/utils.dart';
import '../calendar/CalendarProvider.dart';
import 'QuizItem.dart';

TextEditingController searchController = TextEditingController();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  late Future<List<QuestionIntro>> ListQuestionIntroFuture;
  List<QuestionIntro> ListQuestionIntro = [];
  String enteredKeyword = "";

  @override
  void initState() {
    super.initState();
    ListQuestionIntroFuture = ApiService().getQuestionIntro();
  }

  @override
  Widget build(BuildContext context) {
    CalendarProvider viewmodel = Provider.of<CalendarProvider>(context);
    return GestureDetector(
      onTap: () {
        Utils.HideKeyBoard();
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            StreamBuilder(
                stream: viewmodel
                    .getEventOfDate(DateTime.now().toString().substring(0, 10)),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data?.length == 0) {
                      return IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationScreen(),
                            ),
                          );
                        },
                        icon: Icon(Icons.notifications),
                        color: Colors.white,
                      );
                    } else {
                      return IconButton(
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
                      );
                    }
                  } else {
                    return Text("");
                  }
                })
          ],
          backgroundColor: Colors.red,
        ),
        drawer: Drawer(
          backgroundColor: Colors.red,
          child: Column(
            children: [
              Container(
                height: Constants.screenHeight / 4,
                width: Constants.screenHeight / 4,
                child: Image.asset("assets/iconapp2.png"),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateQuizScreen()));
                },
                leading: Icon(
                  Icons.menu_book,
                  color: Colors.white,
                ),
                title: Text(
                  "Tạo đề thi",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right_sharp,
                  color: Colors.white,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TermOfUserScreen()));
                },
                leading: Icon(
                  Icons.bookmark_added,
                  color: Colors.white,
                ),
                title: Text(
                  "Điều khoản",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right_sharp,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DescriptionScreen()));
                },
                leading: Icon(
                  Icons.description_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  "Mô tả",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right_sharp,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.verified_user_rounded,
                  color: Colors.white,
                ),
                title: Text(
                  "Version: 1.0.0",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
        body: FutureBuilder(
          future: ListQuestionIntroFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              ListQuestionIntro = snapshot.data!;
              ListQuestionIntro = _runFilter(enteredKeyword);
              return Container(
                height: Constants.screenHeight,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Header(),
                    Body(),
                    // Fab(),
                  ],
                ),
              );
            } else {
              return Utils.Loading();
            }
          },
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
                        onChanged: (value) => setState(() {
                          enteredKeyword = value;
                        }),
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
        child: GridView.builder(
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
        ),
      ),
    );
  }

  List<QuestionIntro> _runFilter(String enteredKeyword) {
    List<QuestionIntro> results = [];
    if (enteredKeyword.isEmpty) {
      results = ListQuestionIntro;
    } else {
      results = ListQuestionIntro.where((user) =>
          (user.title.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
              user.description
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()))).toList();
    }
    return results;
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

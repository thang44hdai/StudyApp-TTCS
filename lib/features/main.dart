import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study/common/constant.dart';
import 'package:study/features/home/HomeScreen.dart';
import 'package:study/features/quiz_test/provider/QuizProvider.dart';
import 'package:study/features/quiz_test/QuizScreen.dart';
import 'package:study/features/quiz_test/provider/TimberProvider.dart';
import 'package:study/features/result_test/ResultScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Constants.screenHeight = MediaQuery.of(context).size.height;
    Constants.screenWidth = MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuestionProvider()),
        ChangeNotifierProvider(create: (context) => TimberProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Study',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:study/common/constant.dart';
import 'package:study/features/home/HomeScreen.dart';
import 'package:study/features/profile/ProfileScreen.dart';
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
    final controller = Get.put(NavigationController());
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
        home: Scaffold(
          body: GetX<NavigationController>(
            builder: (controller) {
              return controller.Screen[controller.selectedIndex.value];
            },
          ),
          bottomNavigationBar: GetX<NavigationController>(
            builder: (controller) {
              return ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0), // Điều chỉnh cong ở đây
                  topRight: Radius.circular(20.0), // Điều chỉnh cong ở đây
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.red,
                  currentIndex: controller.selectedIndex.value,
                  onTap: (index) => controller.selectedIndex.value = index,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.black,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: "Search",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.add_to_drive_outlined),
                      label: "Create",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: "Profile",
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final Screen = [
    HomeScreen(),
    Container(color: Colors.green),
    Container(color: Colors.red),
    ProfileScreen(),
  ];
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:study/common/constant.dart';
import 'package:study/features/calendar/CalendarScreen.dart';
import 'package:study/features/create_test/CreateQuizScreen.dart';
import 'package:study/features/home/HomeScreen.dart';
import 'package:study/features/profile/ProfileScreen.dart';
import 'package:study/features/quiz_test/provider/QuizProvider.dart';
import 'package:study/features/quiz_test/QuizScreen.dart';
import 'package:study/features/quiz_test/provider/TimberProvider.dart';
import 'package:study/features/result_test/ResultScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(NavigationController());

    return Scaffold(
      body: GetX<NavigationController>(
        builder: (controller) {
          return controller.Screen[controller.selectedIndex.value];
        },
      ),
      bottomNavigationBar: GetX<NavigationController>(
        builder: (controller) {
          return ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
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
                  icon: Icon(Icons.calendar_today_sharp),
                  label: "Calendar",
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
    );
  }

}
class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final Screen = [
    HomeScreen(),
    CalendarScreen(),
    CreateQuizScreen(),
    ProfileScreen(),
  ];
}
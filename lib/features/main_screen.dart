import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study/features/calendar/CalendarScreen.dart';
import 'package:study/features/create_test/CreateQuizScreen.dart';
import 'package:study/features/home/HomeScreen.dart';
import 'package:study/features/profile/ProfileScreen.dart';
import 'package:study/features/toeic/ToeicTestScreen.dart';

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
                  icon: Icon(
                    Icons.home_filled,
                    color: CupertinoColors.systemGrey,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.create,
                    color: CupertinoColors.systemGrey,
                  ),
                  label: "Toeic",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_today_sharp,
                    color: CupertinoColors.systemGrey,
                  ),
                  label: "Calendar",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: CupertinoColors.systemGrey,
                  ),
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
    ToeicTestScreen(),
    CalendarScreen(),
    ProfileScreen(),
  ];
}

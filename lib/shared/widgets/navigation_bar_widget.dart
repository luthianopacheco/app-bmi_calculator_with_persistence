import 'package:bmi_calculator/pages/preferences_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/pages/bmi_list_page.dart';
import 'package:bmi_calculator/pages/home_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentPageIndex = 0;
  @override
  void initState() {
    Get.find<BMIController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          height: 70,
          indicatorColor: Colors.transparent,
          backgroundColor: const Color.fromARGB(255, 1, 1, 1),
          onDestinationSelected: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "Home",
              selectedIcon: Icon(
                Icons.home,
                color: Color(0xff0ABF06),
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.list),
              label: "BMI List",
              selectedIcon: Icon(
                Icons.list,
                color: Color(0xff0ABF06),
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: "Preferences",
              selectedIcon: Icon(
                Icons.settings,
                color: Color(0xff0ABF06),
              ),
            ),
          ]),
      body: [
        const HomePage(),
        BMIListPage(Get.find<BMIController>()),
        PreferencesPage(Get.find<BMIController>()),
      ][currentPageIndex],
    );
  }
}

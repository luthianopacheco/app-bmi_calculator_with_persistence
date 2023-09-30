import 'package:bmi_calculator/pages/login_page.dart';
import 'package:bmi_calculator/pages/preferences_page.dart';
import 'package:bmi_calculator/shared/config/hive_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/pages/bmi_list_page.dart';
import 'package:bmi_calculator/pages/home_page.dart';
import 'package:bmi_calculator/shared/widgets/navigation_bar_widget.dart';

import 'bindings/bmi_binding.dart';
import 'pages/result_page.dart';

Future<void> main() async {
  HiveConfig.hiveInit();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 400),
      initialRoute: '/loginPage',
      initialBinding: BMIBinding(),
      getPages: [
        GetPage(
          name: '/loginPage',
          page: () => const LoginPage(),
        ),
        GetPage(
          name: '/homePage',
          page: () => const HomePage(),
          binding: BMIBinding(),
        ),
        GetPage(
          name: '/resultPage',
          page: () => BMIResultPage(Get.find<BMIController>()),
          binding: BMIBinding(),
        ),
        GetPage(
          name: '/listPage',
          page: () => BMIListPage(Get.find<BMIController>()),
          binding: BMIBinding(),
        ),
        GetPage(
          name: '/preferences',
          page: () => PreferencesPage(Get.find<BMIController>()),
          binding: BMIBinding(),
        ),
        GetPage(
          name: '/navigationPage',
          page: () => const NavigationPage(),
        )
      ],
    );
  }
}

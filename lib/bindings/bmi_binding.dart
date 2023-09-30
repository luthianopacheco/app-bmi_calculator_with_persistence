import 'package:get/get.dart';

import '../controllers/bmi_controller.dart';
import '../repositories/bmi_repository.dart';

class BMIBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BMIRepository>(() => BMIRepository());
    Get.lazyPut<BMIController>(() => BMIController(Get.find<BMIRepository>()),
        fenix: true);
  }
}

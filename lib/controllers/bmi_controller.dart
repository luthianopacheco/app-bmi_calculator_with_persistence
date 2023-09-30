import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/bmi_model.dart';
import '../repositories/bmi_repository.dart';

class BMIController extends GetxController {
  final BMIRepository _repository;

  BMIController(this._repository) {
    _initBox();
  }

  Future _initBox() async {
    await _repository.openBox();
  }

  List<BMIModel> bmiList = <BMIModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    isLoading.value = true;
    try {
      final response = await _repository.getData();
      bmiList.clear();
      bmiList.addAll(response);
    } catch (e) {
      debugPrint(e.toString());
    }

    isLoading.value = false;
  }

  addData(BMIModel bmi) async {
    try {
      await _repository.addData(bmi);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  deleteData(int index) {
    try {
      _repository.deleteData(index);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  deleteAllData() {
    try {
      _repository.deleteAllData();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

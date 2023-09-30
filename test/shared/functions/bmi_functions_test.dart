import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/shared/functions/bmi_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final bmiTest = BMIFunctions(weight: 85, height: 1.83);

  test('Test 1 Calculate: must calculate and return the value', () {
    expect(bmiTest.bmiCalculation().toStringAsFixed(2), equals('25.38'));
  });

  test('Test 2 Text Value return: must calculate and return the text value',
      () {
    expect(bmiTest.bmiValueText(), equals('Overweight'));
  });

  test(
      'Test 3 Color Name Value return: must calculate and return the Status Color Name',
      () {
    expect(bmiTest.bmiStatusColorName(), equals(StatusColor.yellow));
  });

  test(
      'Test 4 Status Color Value return: must calculate and return the Status Color',
      () {
    expect(bmiTest.bmiStatusToColor(), equals(const Color(0xffFAFF00)));
  });
}

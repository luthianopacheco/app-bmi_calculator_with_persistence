import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/bmi_model.dart';

class BMIFunctions {
  double? weight;
  double? height;

  BMIFunctions({this.height, this.weight});

  double bmiCalculation() {
    var imc = weight! / pow(height!, 2);
    return imc;
  }

  String bmiValueText() {
    double imc = bmiCalculation();

    if (imc < 16) {
      return 'Severe Thinness';
    } else if (imc < 17) {
      return 'Moderate Thin';
    } else if (imc < 18.5) {
      return 'Underweight';
    } else if (imc < 25) {
      return 'Normal';
    } else if (imc < 30) {
      return 'Overweight';
    } else if (imc < 35) {
      return 'Obese';
    } else if (imc < 40) {
      return 'Obese Class II (severe)';
    } else if (imc >= 40) {
      return 'Obese Class III (morbid)';
    } else {
      return 'Invalid BMI';
    }
  }

  String bmiValuePhrase() {
    double imc = bmiCalculation();

    if (imc < 16) {
      return 'Being underweight may pose certain health risks, including nutrient deficiencies and hormonal changes. Waist-to-hip ratio, waist-to-height ratio, and body fat percentage measurements can provide a more complete picture of any health risks. A person should consult with their healthcare provider and consider making lifestyle changes through healthy eating and fitness to improve their health indicators.';
    } else if (imc < 17) {
      return 'Being underweight may pose certain health risks, including nutrient deficiencies and hormonal changes. Waist-to-hip ratio, waist-to-height ratio, and body fat percentage measurements can provide a more complete picture of any health risks. A person should consult with their healthcare provider and consider making lifestyle changes through healthy eating and fitness to improve their health indicators.';
    } else if (imc < 18.5) {
      return 'Being underweight may pose certain health risks, including nutrient deficiencies and hormonal changes. Waist-to-hip ratio, waist-to-height ratio, and body fat percentage measurements can provide a more complete picture of any health risks. A person should consult with their healthcare provider and consider making lifestyle changes through healthy eating and fitness to improve their health indicators.';
    } else if (imc < 25) {
      return 'Maintaining a healthy weight may lower the risk of developing certain health conditions, including cardiovascular disease and type 2 diabetes. Waist-to-hip ratio, waist-to-height ratio, and body fat percentage measurements can provide a more complete picture of any health risks.';
    } else if (imc < 30) {
      return 'Being overweight may increase the risk of certain health conditions, including cardiovascular disease, high blood pressure, and type 2 diabetes. Waist-to-hip ratio, waist-to-height ratio, and body fat percentage measurements can provide a more complete picture of any health risks. A person should consult with their healthcare provider and consider making lifestyle changes through healthy eating and fitness to improve their health indicators.';
    } else if (imc < 35) {
      return 'People with obesity have increased risk of cardiovascular disease, type 2 diabetes, high blood pressure, and other health conditions. Waist-to-hip ratio, waist-to-height ratio, and body fat percentage measurements can provide a more complete picture of any health risks. A person should consult with their healthcare provider and consider making lifestyle changes through healthy eating and fitness to improve their health indicators.';
    } else if (imc < 40) {
      return 'People with obesity have increased risk of cardiovascular disease, type 2 diabetes, high blood pressure, and other health conditions. Waist-to-hip ratio, waist-to-height ratio, and body fat percentage measurements can provide a more complete picture of any health risks. A person should consult with their healthcare provider and consider making lifestyle changes through healthy eating and fitness to improve their health indicators.';
    } else if (imc >= 40) {
      return 'People with obesity have increased risk of cardiovascular disease, type 2 diabetes, high blood pressure, and other health conditions. Waist-to-hip ratio, waist-to-height ratio, and body fat percentage measurements can provide a more complete picture of any health risks. A person should consult with their healthcare provider and consider making lifestyle changes through healthy eating and fitness to improve their health indicators.';
    } else {
      return 'Invalid BMI';
    }
  }

  Color bmiStatusToColor() {
    double imc = bmiCalculation();

    if (imc < 16) {
      return const Color(0xffFF0000);
    } else if (imc < 17) {
      return const Color(0xffE25F00);
    } else if (imc < 18.5) {
      return const Color(0xffFAFF00);
    } else if (imc < 25) {
      return const Color(0xff0ABF06);
    } else if (imc < 30) {
      return const Color(0xffFAFF00);
    } else if (imc < 35) {
      return const Color(0xffE25F00);
    } else if (imc < 40) {
      return const Color(0xffFF0000);
    } else if (imc >= 40) {
      return const Color(0xffBA0000);
    } else {
      return const Color(0xff545454);
    }
  }

  StatusColor bmiStatusColorName() {
    double imc = bmiCalculation();

    if (imc < 16) {
      return StatusColor.red;
    } else if (imc < 17) {
      return StatusColor.orange;
    } else if (imc < 18.5) {
      return StatusColor.yellow;
    } else if (imc < 25) {
      return StatusColor.green;
    } else if (imc < 30) {
      return StatusColor.yellow;
    } else if (imc < 35) {
      return StatusColor.orange;
    } else if (imc < 40) {
      return StatusColor.red;
    } else if (imc >= 40) {
      return StatusColor.darkRed;
    } else {
      return StatusColor.grey;
    }
  }

  Color bmiStatusColor(StatusColor controller) {
    switch (controller) {
      case StatusColor.green:
        return const Color(0xff0ABF06);
      case StatusColor.yellow:
        return const Color(0xffFAFF00);
      case StatusColor.orange:
        return const Color(0xffE25F00);
      case StatusColor.red:
        return const Color(0xffFF0000);
      case StatusColor.darkRed:
        return const Color(0xffBA0000);
      default:
        return const Color(0xff545454);
    }
  }
}

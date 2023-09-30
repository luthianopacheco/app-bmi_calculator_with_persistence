import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/shared/widgets/snackbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/shared/functions/bmi_functions.dart';

import '../shared/widgets/icon_bmi_info_widget.dart';

class BMIResultPage extends StatefulWidget {
  final BMIController _controller;

  const BMIResultPage(this._controller, {super.key});

  @override
  State<BMIResultPage> createState() => _BMIResultPageState();
}

class _BMIResultPageState extends State<BMIResultPage> {
  late final BMIFunctions resultsBMI;
  final arguments = Get.arguments;
  late String lastId;

  @override
  void initState() {
    Get.find<BMIController>();
    resultsBMI = BMIFunctions(weight: arguments[0], height: arguments[1]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Result'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: const [BMIInfoIcon()],
      ),
      body: widget._controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  _buildResponseCard(),
                  const SizedBox(height: 40),
                  _buildButons(),
                ],
              ),
            ),
    );
  }

  Widget _buildResponseCard() {
    return Card(
      color: const Color.fromARGB(255, 1, 1, 1),
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Column(
        children: [
          const SizedBox(height: 40),
          _buildResponseText(resultsBMI.bmiValueText().toUpperCase(), 20,
              colorPhrase: resultsBMI.bmiStatusToColor()),
          const SizedBox(height: 30),
          _buildResponseText(resultsBMI.bmiCalculation().toStringAsFixed(2), 56,
              fWeight: FontWeight.w500,
              colorPhrase: resultsBMI.bmiStatusToColor()),
          const SizedBox(height: 30),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildResponseText(resultsBMI.bmiValuePhrase(), 16)),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  _buildResponseText(String responseText, double fSize,
      {FontWeight fWeight = FontWeight.normal,
      Color colorPhrase = Colors.white}) {
    return Text(
      responseText,
      style:
          TextStyle(fontSize: fSize, fontWeight: fWeight, color: colorPhrase),
    );
  }

  _buildButons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 35,
          width: 170,
          child: FilledButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xff0ABF06))),
            onPressed: () {
              widget._controller.addData(BMIModel(
                  result: resultsBMI.bmiCalculation(),
                  statusText: resultsBMI.bmiValueText(),
                  statusColor: resultsBMI.bmiStatusColorName()));
              customSnackBar(context,
                  text: 'Your result has been saved successfully!');
              Get.toNamed('navigationPage');
            },
            child: const Text(
              'Save results',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        SizedBox(
          height: 35,
          width: 170,
          child: FilledButton(
              onPressed: () {
                Get.toNamed('navigationPage');
              },
              child: const Text(
                'Re-calculate',
                style: TextStyle(fontSize: 15),
              )),
        )
      ],
    );
  }
}

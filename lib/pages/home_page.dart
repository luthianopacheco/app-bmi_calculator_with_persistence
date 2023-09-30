import 'package:bmi_calculator/shared/widgets/profile_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bmi_calculator/shared/widgets/icon_bmi_info_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double heightValue = 1.60;
  double weightValue = 50;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("BMI Calculator"),
            centerTitle: true,
            actions: const [BMIInfoIcon()],
          ),
          drawer: const ProfileDrawerPage(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: ListView(
              children: [
                _buildValueCard('height', 'm', 1.10, 2.20, true),
                const SizedBox(height: 20),
                _buildValueCard('weight', 'kg', 20, 250, false),
                const SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 75),
                    child: _buildCalculateButton(context))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCalculateButton(BuildContext context) {
    return SizedBox(
      height: 35,
      child: FilledButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Color(0xff0ABF06))),
        onPressed: () {
          Get.toNamed('resultPage', arguments: [weightValue, heightValue]);
        },
        child: const Text(
          "Calculate",
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }

  _buildValueCard(String questionText, String symbol, double minValue,
      double maxValue, bool isHeightValue) {
    return Card(
      color: const Color.fromARGB(255, 1, 1, 1),
      elevation: 8,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
        child: Column(
          children: [
            Text(
              "How $questionText are you?",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    if (isHeightValue == true) {
                      if (heightValue > 1.10) {
                        setState(() {
                          heightValue = heightValue - 0.01;
                        });
                      }
                    } else {
                      if (weightValue > 20) {
                        setState(() {
                          weightValue--;
                        });
                      }
                    }
                  },
                  icon: const Icon(Icons.remove),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: isHeightValue
                              ? heightValue.toStringAsFixed(2)
                              : weightValue.toStringAsFixed(0),
                          style: const TextStyle(
                              fontSize: 48, fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: ' $symbol',
                          style: const TextStyle(fontSize: 20))
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (isHeightValue == true) {
                      if (heightValue < 2.20) {
                        setState(() {
                          heightValue = heightValue + 0.01;
                        });
                      }
                    } else {
                      if (weightValue < 250) {
                        setState(() {
                          weightValue++;
                        });
                      }
                    }
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            Slider(
              thumbColor: const Color(0xff0ABF06),
              activeColor: const Color.fromARGB(255, 2, 110, 0),
              value: isHeightValue ? heightValue : weightValue,
              min: isHeightValue ? 1.10 : 20,
              max: isHeightValue ? 2.20 : 250,
              onChanged: (value) {
                setState(() {
                  if (isHeightValue == true) {
                    setState(() {
                      heightValue = value;
                    });
                  } else {
                    setState(() {
                      weightValue = value;
                    });
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

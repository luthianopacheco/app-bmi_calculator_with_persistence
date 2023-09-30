import 'package:flutter/material.dart';

class BMIInfoIcon extends StatelessWidget {
  const BMIInfoIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: "BMI Info",
      highlightColor: const Color(0xff0ABF06),
      onPressed: () {
        showModalBottomSheet<void>(
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(70),
              topRight: Radius.circular(70),
            ),
          ),
          context: context,
          builder: (context) {
            return SizedBox(
              child: ListView(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.cancel,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 2, height: 0),
                  _buildListTileBottomSheet("< 16                     ",
                      "Severe Thinness", const Color(0xffFF0000)),
                  _buildListTileBottomSheet("16   -   < 17         ",
                      "Moderate Thinness", const Color(0xffE25F00)),
                  _buildListTileBottomSheet("17   -   < 18.5      ",
                      "Underweight", const Color(0xffFAFF00)),
                  _buildListTileBottomSheet("18.5   -   < 25      ", "Normal",
                      const Color(0xff0ABF06)),
                  _buildListTileBottomSheet("25   -   < 30         ",
                      "Overweight", const Color(0xffFAFF00)),
                  _buildListTileBottomSheet("30   -   < 35         ", "Obesity",
                      const Color(0xffE25F00)),
                  _buildListTileBottomSheet("35   -   < 40         ",
                      "Obesity Class II (severe)", const Color(0xffFF0000)),
                  _buildListTileBottomSheet("40 >                     ",
                      "Obesity Class III (morbid)", const Color(0xffBA0000),
                      thicken: 4),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Legend:',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(' "<" = smaller than...'),
                            Text(' ">" = greater than...'),
                            Text(' "-" = ... until ...'),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(' "numbers" = BMI Range Calculation'),
                            Text(' "text" = BMI Classification Result'),
                            Text(' "colors" = Status'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.info),
    );
  }

  _buildListTileBottomSheet(String text1, String text2, Color colorStatus,
      {double thicken = 2}) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$text1  ='),
              Text(text2),
            ],
          ),
          trailing: Container(
            decoration:
                BoxDecoration(color: colorStatus, shape: BoxShape.circle),
            height: 20,
            width: 20,
          ),
        ),
        Divider(thickness: thicken, height: 0),
      ],
    );
  }
}

import 'package:hive/hive.dart';
part 'adapters/bmi_model.g.dart';

@HiveType(typeId: 0)
class BMIModel extends HiveObject {
  @HiveField(0)
  double result;

  @HiveField(1)
  String statusText;

  @HiveField(2)
  StatusColor statusColor;

  BMIModel(
      {
      required this.result,
      required this.statusText,
      required this.statusColor});
}

@HiveType(typeId: 1)
enum StatusColor {
  @HiveField(0)
  darkRed,
  @HiveField(1)
  red,
  @HiveField(2)
  orange,
  @HiveField(3)
  yellow,
  @HiveField(4)
  green,
  @HiveField(5)
  grey
}

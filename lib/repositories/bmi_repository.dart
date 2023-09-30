import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:hive/hive.dart';

class BMIRepository {
  late LazyBox<BMIModel> box;
  String boxName = 'bmiBox';
  final List<BMIModel> _bmiList = <BMIModel>[];

  Future<LazyBox> openBox() async {
    if (Hive.isBoxOpen(boxName)) {
      return box = Hive.lazyBox(boxName);
    } else {
      return box = await Hive.openLazyBox(boxName);
    }
  }

  Future<void> addData(BMIModel bmi) async {
    await box.add(bmi);
  }

  Future<List<BMIModel>> getData() async {
    _bmiList.removeWhere((element) => true);
    for (var element in box.keys) {
      final data = await box.get(element);
      if (data != null) {
        _bmiList.add(data);
      }
    }

    return _bmiList;
  }

  Future<void> deleteData(int id) async {
    await box.deleteAt(id);
  }

  Future<void> deleteAllData() async {
    await box.deleteAll(box.keys);
  }
}

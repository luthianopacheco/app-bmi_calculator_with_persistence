import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/shared/functions/bmi_functions.dart';
import 'package:bmi_calculator/shared/widgets/icon_bmi_info_widget.dart';

import '../shared/widgets/profile_drawer_widget.dart';

class BMIListPage extends StatefulWidget {
  final BMIController _controller;
  const BMIListPage(this._controller, {super.key});

  @override
  State<BMIListPage> createState() => _BMIListPageState();
}

class _BMIListPageState extends State<BMIListPage> {
  final bmiFuntions = BMIFunctions();

  @override
  void initState() {
    widget._controller.getData();
    super.initState();
  }

  getData() async {
    await widget._controller.getData()['bmiBox'];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Your BMI List'),
            centerTitle: true,
            actions: const [BMIInfoIcon()],
          ),
          drawer: const ProfileDrawerPage(),
          body: Obx(
            () {
              return widget._controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : widget._controller.bmiList.isEmpty
                      ? const Center(
                          child: Text("No data found!"),
                        )
                      : _buildListView();
            },
          ),
        ),
      ),
    );
  }

  _buildListView() {
    return ListView.builder(
      itemCount: widget._controller.bmiList.length,
      itemBuilder: (context, index) {
        var item = widget._controller.bmiList[index];
        return Column(
          children: [
            Dismissible(
              key: Key(item.toString()),
              direction: DismissDirection.endToStart,
              background: Container(
                width: double.infinity,
                color: Colors.red,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () {
                      widget._controller.deleteData(index);
                      getData();
                    },
                  ),
                ),
              ),
              onDismissed: (direction) {
                widget._controller.deleteData(index);
              },
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      '${item.result.toStringAsFixed(2)}                     =',
                      style: const TextStyle(fontSize: 15),
                    ),
                    title: Text(
                      item.statusText,
                      textAlign: TextAlign.center,
                    ),
                    titleAlignment: ListTileTitleAlignment.center,
                    trailing: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: bmiFuntions.bmiStatusColor(item.statusColor),
                      ),
                      height: 20,
                      width: 20,
                    ),
                  ),
                  const Divider(thickness: 2, height: 0)
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

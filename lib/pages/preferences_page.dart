import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/shared/widgets/icon_bmi_info_widget.dart';
import 'package:bmi_calculator/shared/widgets/profile_drawer_widget.dart';
import 'package:bmi_calculator/shared/widgets/snackbar_widgets.dart';
import 'package:flutter/material.dart';

class PreferencesPage extends StatefulWidget {
  final BMIController _controller;
  const PreferencesPage(this._controller, {super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  bool isDarkTheme = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Preferences'),
            centerTitle: true,
            actions: const [BMIInfoIcon()],
          ),
          drawer: const ProfileDrawerPage(),
          body: Column(children: [
            //TODO: All the functionality of this page
            _buildPreferencesListTile(
              iconType: Icon(isDarkTheme ? Icons.dark_mode : Icons.light_mode),
              titleText: 'Theme',
              trailingWidget: _buildSwitchButton(),
            ),
            InkWell(
              onTap: () {
                widget._controller.deleteAllData();
                customSnackBar(context,
                    text: 'Your BMI List has been cleared successfully!');
              },
              child: _buildPreferencesListTile(
                iconType: const Icon(Icons.clear_all),
                titleText: 'Clear List',
              ),
            ),
            InkWell(
              onTap: () {},
              child: _buildPreferencesListTile(
                  iconType: const Icon(Icons.privacy_tip),
                  titleText: 'Privacy',
                  trailingWidget: const Icon(Icons.open_in_new_outlined)),
            ),
            InkWell(
              onTap: () {},
              child: _buildPreferencesListTile(
                  iconType: const Icon(Icons.find_in_page_sharp),
                  titleText: 'Terms & Conditions',
                  trailingWidget: const Icon(Icons.open_in_new_outlined)),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildPreferencesListTile(
      {Widget iconType = const Text(''),
      required String titleText,
      Widget trailingWidget = const Text('')}) {
    return Card(
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: ListTile(
          leading: iconType, title: Text(titleText), trailing: trailingWidget),
    );
  }

  _buildSwitchButton() {
    return Switch(
      value: isDarkTheme,
      onChanged: (value) {
        setState(() {
          isDarkTheme = value;
        });
      },
    );
  }
}

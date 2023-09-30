import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDrawerPage extends StatefulWidget {
  const ProfileDrawerPage({super.key});

  @override
  State<ProfileDrawerPage> createState() => _ProfileDrawerPageState();
}

class _ProfileDrawerPageState extends State<ProfileDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xff0ABF06)),
            curve: Curves.ease,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //TODO: All the functionality of this page
                CircleAvatar(
                  maxRadius: 50,
                  child: Icon(
                    Icons.person,
                    size: 70,
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    Text('Luthiano Pacheco'),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: Text(
                        'luthiano@email.com',
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          _buildTextButton(iconType: Icons.edit, textButton: 'Profile Edit'),
          _buildTextButton(
              iconType: Icons.app_settings_alt, textButton: 'Account Settings'),
          Expanded(child: Container()),
          const Divider(thickness: 2, height: 0),
          InkWell(
              onTap: () => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        icon: const Icon(Icons.exit_to_app, color: Colors.red),
                        title: const Text('You are exiting your account.'),
                        content: const Text('Are you sure you want to exit?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(color: Colors.white),
                              )),
                          TextButton(
                            onPressed: () {
                              Get.offAndToNamed('loginPage');
                            },
                            child: const Text('Confirm',
                                style: TextStyle(color: Colors.red)),
                          )
                        ],
                      );
                    },
                  ),
              child: _buildTextButton(
                  iconType: Icons.exit_to_app,
                  iconTypeColor: Colors.red,
                  textButton: 'Exit')),
        ],
      ),
    );
  }

  Widget _buildTextButton(
      {required IconData iconType,
      required String textButton,
      Color iconTypeColor = Colors.white}) {
    return ListTile(
      leading: Icon(iconType),
      iconColor: iconTypeColor,
      minLeadingWidth: 0,
      title: Text(textButton),
    );
  }
}

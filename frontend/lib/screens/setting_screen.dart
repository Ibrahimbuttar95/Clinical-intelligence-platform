import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
const SettingsScreen({super.key});

@override
State<SettingsScreen> createState() =>
_SettingsScreenState();
}

class _SettingsScreenState
extends State<SettingsScreen> {

bool notifications = true;

bool voiceEnabled = true;

@override
Widget build(BuildContext context) {

return Scaffold(

  appBar: AppBar(
    title: const Text(
      "Settings",
    ),
  ),

  body: ListView(
    children: [

      SwitchListTile(
        title: const Text(
          "Enable Notifications",
        ),
        value: notifications,
        onChanged: (value) {
          setState(() {
            notifications = value;
          });
        },
      ),

      SwitchListTile(
        title: const Text(
          "Enable Voice Assistant",
        ),
        value: voiceEnabled,
        onChanged: (value) {
          setState(() {
            voiceEnabled = value;
          });
        },
      ),
    ],
  ),
);

}
}

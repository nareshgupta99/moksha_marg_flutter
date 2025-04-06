import 'package:flutter/material.dart';

class Setting {
  String name;
  IconData icon;

  Setting({required this.name, required this.icon});
}

List<Setting> settingData =[
Setting(name: "Privacy", icon: Icons.arrow_forward_ios),
Setting(name: "Help & Support", icon: Icons.arrow_forward_ios),
Setting(name: "Language", icon: Icons.arrow_forward_ios),
Setting(name: "Logout", icon: Icons.logout_outlined),
];

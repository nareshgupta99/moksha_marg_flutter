import 'package:flutter/material.dart';
import 'package:moksha_marg/util/colors_resources.dart';

void showLogoutDialog(BuildContext context,VoidCallback onTap) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor:ColorsResources.backgroundColor, // Vintage parchment-style color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text(
          "Confirm Logout",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.brown, // Classic brown text color
          ),
        ),
        content: const Text(
          "Are you sure you want to logout?",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), 
            child: const Text("No", style: TextStyle(fontSize: 18, color: Colors.brown)),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); 
              onTap();
            },
            child: const Text("Yes", style: TextStyle(fontSize: 18, color: Colors.redAccent)),
          ),
        ],
      );
    },
  );
}
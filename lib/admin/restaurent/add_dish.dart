import 'package:flutter/material.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/reusable/text_field.dart';

class AddDish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigaton(isLeading: false),
      bottomNavigationBar: bottomNavigaton(),
      body: Column(
        children: [
          customTextField(textFieldLabel: "Dish Name", controller: TextEditingController()),
          customTextField(textFieldLabel: "Price", controller: TextEditingController()),
        ],
      ),
    );
  }
}

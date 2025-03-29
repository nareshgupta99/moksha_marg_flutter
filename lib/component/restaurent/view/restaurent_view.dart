import 'package:flutter/material.dart';
import 'package:moksha_marg/reusable/navigation.dart';

class RestaurentView extends StatelessWidget {
  const RestaurentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigaton(text: "food Details" , isLeading: true),
      bottomNavigationBar: bottomNavigaton(0),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(children: [

    ],);
  }

  
}

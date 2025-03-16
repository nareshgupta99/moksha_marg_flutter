import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/component/home/view/home.dart';
import 'package:moksha_marg/helper/RoutesHelper.dart';

void main() {
  runApp(MokshaMarg());
}

class MokshaMarg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RoutesHelper.getHome(),
      getPages: RoutesHelper.routes,
      home: Home(),
    );
  }
}

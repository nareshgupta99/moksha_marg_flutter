import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/component/authentication/login/login.dart';


void main() {
  runApp(MokshaMarg());
}

class MokshaMarg extends StatelessWidget {
  const MokshaMarg({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: RoutesHelper.getHome(),
      // getPages: RoutesHelper.routes,
      home: LoginView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/component/authentication/reset_password/reset_password_view.dart';

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
      home: ResetPasswordView(),
    );
  }
}

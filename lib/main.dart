import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/helper/routes_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MokshaMarg());
}

 final List<String> _routes = [
    RoutesHelper.getHome(),
    RoutesHelper.getGuide(),
    RoutesHelper.getGuide(),
    RoutesHelper.getGuide(),
  ];

class MokshaMarg extends StatelessWidget {
  const MokshaMarg({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RoutesHelper.getRestaurent(),
            getPages: RoutesHelper.routes,
          );
        });
  }
}

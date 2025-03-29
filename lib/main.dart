import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/component/guides/guides_details_view.dart';
import 'package:moksha_marg/component/guides/guides_view.dart';
import 'package:moksha_marg/helper/routes_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MokshaMarg());
}

class MokshaMarg extends StatelessWidget {
  const MokshaMarg({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RoutesHelper.getLogin(),
            getPages: RoutesHelper.routes,
          );
        });
  }
}

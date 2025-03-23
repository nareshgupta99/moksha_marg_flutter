import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/component/guides/guides_details_view.dart';
import 'package:moksha_marg/component/guides/guides_view.dart';

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
      home: GuidesDetailsView(),
    );
  }
}

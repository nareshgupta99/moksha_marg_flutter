import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/splash/splash_controller.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/images.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<SplashView> {
  
  @override
  void initState() {
    super.initState();

    Get.find<SplashController>().init();
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(Images.temple1), context);
    
    return Scaffold(
      backgroundColor:ColorsResources.backgroundColor,
    );
  }
}
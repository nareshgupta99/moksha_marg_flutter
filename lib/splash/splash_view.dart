import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/splash/splash_controller.dart';
import 'package:moksha_marg/util/images.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashView>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late Animation<double> _logoAnimation;
  late Animation<int> _textAnimation;

  @override
  void initState() {
    super.initState();
    Get.find<SplashController>().init();


    // Animation for logo zoom-out effect
    _logoController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _logoAnimation = Tween<double>(begin: 3.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOut),
    );

    // Animation for text typing effect
    _textController = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );
    _textAnimation = IntTween(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeOut),
    );

    // Start animations
    _logoController.forward();
    _textController.forward();

    // After animation, navigate to the next screen
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Zoom-out Logo
            ScaleTransition(
              scale: _logoAnimation,
              child: Image.asset(Images.appIcon, width: 150.r, height: 150.r),
            ),
            // Typing text animation for app name
            SizedBox(height: 20.r),
            AnimatedBuilder(
              animation: _textController,
              builder: (context, child) {
                String text = "MOKSHAMARG".substring(0, _textAnimation.value);
                return Text(
                  text,
                  style: TextStyle(
                    fontSize: 26.r,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(child: Text("Welcome to the home screen!")),
    );
  }
}

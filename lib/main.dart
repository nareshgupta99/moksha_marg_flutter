// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
// import 'package:moksha_marg/helper/get_directory.dart';
// import 'package:moksha_marg/helper/routes_helper.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//    MapboxOptions.setAccessToken("pk.eyJ1IjoibmFyZXNoZ3VwdGExOTk4IiwiYSI6ImNtOXN0c2JvcjA0aW8ya3NiZmNsc2owN2sifQ.K1BMWLPh6hjs-Gdb96geQA");
//   await init();
//   runApp(MokshaMarg());
// }

// class MokshaMarg extends StatelessWidget {
//   const MokshaMarg({super.key});

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     return ScreenUtilInit(
//         designSize:  Size(375, 812),
//         builder: (context, child) {
//           return GetMaterialApp(
//             debugShowCheckedModeBanner: false,
//             initialRoute: RoutesHelper.getSplash(),
//             getPages: RoutesHelper.routes,
//           );
//         });
//   }
// }

import 'dart:ui' as ui; // Important for Size conflict
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:moksha_marg/helper/get_directory.dart';
import 'package:moksha_marg/helper/routes_helper.dart';
import 'package:moksha_marg/map_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  MapboxOptions.setAccessToken(
      "pk.eyJ1IjoibmFyZXNoZ3VwdGExOTk4IiwiYSI6ImNtOXN0c2JvcjA0aW8ya3NiZmNsc2owN2sifQ.K1BMWLPh6hjs-Gdb96geQA");

  await init();
  runApp(MokshaMarg());
}

class MokshaMarg extends StatelessWidget {
  const MokshaMarg({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
      designSize: const ui.Size(375, 812), // ✅ Notice the use of 'ui.Size'
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: MapScreen(),
          // initialRoute: RoutesHelper.getSplash(),
          // getPages: RoutesHelper.routes,
        );
      },
    );
  }
}

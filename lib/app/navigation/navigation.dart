import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:moksha_marg/app/navigation/navigation_controller.dart';

class NavigationScreen extends StatelessWidget {
  String longitude;
  String latitude;
  NavigationScreen(
      {super.key, required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    print("longitude :: ${longitude} latitude :: $latitude");
    return GetBuilder<NavigationController>(
      builder: (controller) {
        print("controller :: ${controller.destinationLat}");
        return Scaffold(
          appBar: AppBar(
            title: Text("Temple Tracker"),
            centerTitle: true,
          ),
          // body: MapWidget(
          //   onMapCreated: controller.onMapCreated,
          // ),
          body: MapWidget(
            onMapCreated: (mapboxMap) {
              controller.onMapCreated(mapboxMap,
                  lat: latitude, long: longitude);
              // controller.onMapCreated(mapboxMap);
            },
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:moksha_marg/map_controller.dart'; // adjust import path

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Temple Tracker"),
            centerTitle: true,
          ),
          body: MapWidget(
            onMapCreated: controller.onMapCreated,
          ),
        );
      },
    );
  }
}

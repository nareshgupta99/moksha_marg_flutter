import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapController extends GetxController implements GetxService {
  MapboxMap? mapboxMapController;
  geo.Position? currentPosition;
  PointAnnotationManager? _pointAnnotationManager;

  final double destinationLat = 28.957938774409847;
  final double destinationLon = 77.69467120810941;

  void onMapCreated(MapboxMap controller) async {
    mapboxMapController = controller;

    await requestLocationPermission();
    await enableLocationComponent();

    await fetchCurrentLocation();

    if (currentPosition != null) {
      _addTempleMarker();
      flyToCurrentLocation();
      await drawRoute();
    }

    update();
  }

  Future<void> requestLocationPermission() async {
    if (await Permission.location.isDenied) {
      await Permission.location.request();
    }
  }

  Future<void> fetchCurrentLocation() async {
    currentPosition = await geo.Geolocator.getCurrentPosition(
        desiredAccuracy: geo.LocationAccuracy.high);
  }

  Future<void> enableLocationComponent() async {
    await mapboxMapController?.location.updateSettings(
      LocationComponentSettings(
        enabled: true,
        pulsingEnabled: true,
      ),
    );
  }

  void flyToCurrentLocation() {
    if (currentPosition == null) return;

    mapboxMapController?.flyTo(
      CameraOptions(
        center: Point(
          coordinates: Position(
            currentPosition!.longitude,
            currentPosition!.latitude,
          ),
        ),
        zoom: 15.0,
      ),
      MapAnimationOptions(duration: 1500),
    );
  }

  void _addTempleMarker() async {
    final annotationManager =
        await mapboxMapController?.annotations.createPointAnnotationManager();

    await annotationManager?.create(PointAnnotationOptions(
      geometry: Point(
          coordinates:
              Position(destinationLon, destinationLat)), // Temple coords
      textField: '🛕',
      textOffset: [0, 2],
      iconSize: 1.5,
    ));

    _pointAnnotationManager = annotationManager;
    update();
  }

  Future<void> drawRoute() async {
    if (currentPosition == null) return;

    _addTempleMarker();

    final geoJsonSource = GeoJsonSource(
      id: "route",
      data: jsonEncode({
        "type": "Feature",
        "geometry": {
          "type": "LineString",
          "coordinates": [
            [currentPosition!.longitude, currentPosition!.latitude],
            [destinationLon, destinationLat],
          ],
        },
      }),
    );

    await mapboxMapController?.style.addSource(geoJsonSource);

    final lineLayer = LineLayer(
      id: "routeLine",
      sourceId: "route",
      lineColor: Colors.blue.value,
      lineWidth: 5.0,
    );

    await mapboxMapController?.style.addLayer(lineLayer);
  }
}



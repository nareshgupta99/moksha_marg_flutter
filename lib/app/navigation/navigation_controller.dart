import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:http/http.dart' as http;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class NavigationController extends GetxController implements GetxService {
  MapboxMap? mapboxMapController;
  geo.Position? currentPosition;
  PointAnnotationManager? _pointAnnotationManager;

  double destinationLat = 28.957938774409847;
  double destinationLon = 77.69467120810941;

  // Replace with your own access token
  final String mapboxAccessToken =
      'pk.eyJ1IjoibmFyZXNoZ3VwdGExOTk4IiwiYSI6ImNtOXN0c2JvcjA0aW8ya3NiZmNsc2owN2sifQ.K1BMWLPh6hjs-Gdb96geQA';

  void onMapCreated(MapboxMap controller,
      {required String lat, required String long}) async {
    mapboxMapController = controller;
    // destinationLat = double.parse(lat);
    // destinationLon = double.parse(long);
    // update();

    await requestLocationPermission();
    await enableLocationComponent();
    await fetchCurrentLocation();

    if (currentPosition != null) {
      await _addTempleMarker();
      flyToCurrentLocation();
      await fetchAndDrawRoute(); // Use actual route
    }

    update();
  }

  // void onMapCreated(MapboxMap controller) async {
  //   mapboxMapController = controller;

  //   await requestLocationPermission();
  //   await enableLocationComponent();
  //   await fetchCurrentLocation();

  //   if (currentPosition != null) {
  //     await _addTempleMarker();
  //     flyToCurrentLocation();
  //     await fetchAndDrawRoute(); // Use actual route
  //   }

  //   update();
  // }

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

  Future<void> _addTempleMarker() async {
    final annotationManager =
        await mapboxMapController?.annotations.createPointAnnotationManager();

    await annotationManager?.create(PointAnnotationOptions(
      geometry: Point(
        coordinates: Position(destinationLon, destinationLat),
      ),
      textField: '🛕',
      textOffset: [0, 2],
      iconSize: 1.5,
    ));

    _pointAnnotationManager = annotationManager;
    update();
  }

  Future<void> fetchAndDrawRoute() async {
    if (currentPosition == null) return;

    final origin = '${currentPosition!.longitude},${currentPosition!.latitude}';
    final destination = '$destinationLon,$destinationLat';

    final url =
        'https://api.mapbox.com/directions/v5/mapbox/driving/$origin;$destination?geometries=geojson&access_token=$mapboxAccessToken';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final route = data['routes'][0]['geometry'];
      final coordinates = route['coordinates'];

      final geoJsonSource = GeoJsonSource(
        id: "route",
        data: jsonEncode({
          "type": "Feature",
          "geometry": {
            "type": "LineString",
            "coordinates": coordinates,
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
    } else {
      print('Failed to fetch directions: ${response.body}');
    }
  }
}

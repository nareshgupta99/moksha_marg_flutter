// import 'dart:convert';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

// class MapSearchScreen extends StatefulWidget {
//   @override
//   _MapSearchScreenState createState() => _MapSearchScreenState();
// }

// class _MapSearchScreenState extends State<MapSearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   List<Map<String, dynamic>> _searchResults = [];
//   MapboxMap? mapboxMapController;

//   void onMapCreated(MapboxMap controller) {
//     mapboxMapController = controller;
//   }

//   Future<void> searchPlace(String place) async {
//     if (place.isEmpty) {
//       setState(() {
//         _searchResults = [];
//       });
//       return;
//     }

//     final accessToken =
//         "pk.eyJ1IjoibmFyZXNoZ3VwdGExOTk4IiwiYSI6ImNtOXN0c2JvcjA0aW8ya3NiZmNsc2owN2sifQ.K1BMWLPh6hjs-Gdb96geQA"; // Add your token
//     final url =
//         'https://api.mapbox.com/geocoding/v5/mapbox.places/$place.json?access_token=$accessToken&autocomplete=true&limit=5';

//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);

//       List features = data['features'];

//       setState(() {
//         _searchResults = features.map<Map<String, dynamic>>((item) {
//           return {
//             "name": item['place_name'],
//             "latitude": item['geometry']['coordinates'][1],
//             "longitude": item['geometry']['coordinates'][0],
//           };
//         }).toList();
//       });
//     }
//   }

//   void moveCamera(double lat, double lon) {
//     mapboxMapController?.flyTo(
//       CameraOptions(
//         center: Point(coordinates: Position(lon, lat)),
//         zoom: 15,
//       ),
//       MapAnimationOptions(duration: 2000),
//     );
//     setState(() {
//       _searchResults.clear();
//       _searchController.clear();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           MapWidget(
//             onMapCreated: onMapCreated,
//           ),
//           Positioned(
//             top: 50,
//             left: 20,
//             right: 20,
//             child: Column(
//               children: [
//                 Material(
//                   elevation: 5,
//                   borderRadius: BorderRadius.circular(10),
//                   child: TextField(
//                     controller: _searchController,
//                     onChanged: (value) {
//                       if (value.length > 2) {
//                         searchPlace(value);
//                       }
//                     },
//                     decoration: InputDecoration(
//                       hintText: "Search places...",
//                       prefixIcon: Icon(Icons.search),
//                       suffixIcon: _searchController.text.isNotEmpty
//                           ? IconButton(
//                               icon: Icon(Icons.clear),
//                               onPressed: () {
//                                 _searchController.clear();
//                                 setState(() {
//                                   _searchResults.clear();
//                                 });
//                               },
//                             )
//                           : null,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none),
//                       filled: true,
//                       fillColor: Colors.white,
//                       contentPadding: EdgeInsets.symmetric(vertical: 0),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 if (_searchResults.isNotEmpty)
//                   Container(
//                     height: 250,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: ListView.builder(
//                       padding: EdgeInsets.zero,
//                       itemCount: _searchResults.length,
//                       itemBuilder: (context, index) {
//                         final place = _searchResults[index];
//                         return ListTile(
//                           leading: Icon(Icons.location_on),
//                           title: Text(place['name']),
//                           onTap: () {
//                             moveCamera(place['latitude'], place['longitude']);
//                           },
//                         );
//                       },
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

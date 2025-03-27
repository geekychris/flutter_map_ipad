import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chris Mega Maps App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  static const LatLng _london = LatLng(51.5074, -0.1278);
  static const LatLng _paris = LatLng(48.8575, 2.3514);
  
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(50.0, 0.0),
    zoom: 5,
  );

  void _goToLondon() {
    mapController.animateCamera(CameraUpdate.newLatLng(_london));
  }

  void _goToParis() {
    mapController.animateCamera(CameraUpdate.newLatLng(_paris));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chris Mega Maps App')),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialPosition,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _goToLondon,
                  child: const Text('London'),
                ),
                ElevatedButton(
                  onPressed: _goToParis,
                  child: const Text('Paris'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

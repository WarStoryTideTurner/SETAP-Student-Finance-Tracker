import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Maps Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Demo'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194),
          zoom: 12.0,
        ),
        markers: Set<Marker>.from([
          Marker(
            markerId: MarkerId('marker_id'),
            position: LatLng(37.7749, -122.4194),
            infoWindow: InfoWindow(title: 'Marker Title'),
          ),
        ]),
      ),
    );
  }
}

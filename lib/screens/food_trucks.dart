import 'package:flutter/material.dart';
import 'package:taco_tracker/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FoodTruckScreen extends StatefulWidget {
  static const String id = 'truck_screen';

  const FoodTruckScreen({Key key}) : super(key: key);
  @override
  _FoodTruckScreenState createState() => _FoodTruckScreenState();
}

class _FoodTruckScreenState extends State<FoodTruckScreen> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Grub Trucks'),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}

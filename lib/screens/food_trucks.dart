import 'package:flutter/material.dart';
import 'package:taco_tracker/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '/locations.dart' as locations;

class FoodTruckScreen extends StatefulWidget {
  static const String id = 'truck_screen';

  const FoodTruckScreen({Key? key}) : super(key: key);

  @override
  _FoodTruckScreenState createState() => _FoodTruckScreenState();
}

class _FoodTruckScreenState extends State<FoodTruckScreen> {
  //late GoogleMapController mapController;

  final LatLng _center = const LatLng(33.930828, -98.484879);
  late Map<String, Marker> _markers = {};
  late BitmapDescriptor mapMarker;

  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'images/truck_marker.png');
  }

  // void showFoodTruck() {
  //   _markers(truck)
  // }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final truckLocations = await locations.getTruckLocations();
    setState(() {
      _markers.clear();
      for (final truck in truckLocations.trucks) {
        final marker = Marker(
            icon: mapMarker,
            markerId: MarkerId(truck.truck_name),
            position: LatLng(truck.lat, truck.lng),
            infoWindow: InfoWindow(
              title: truck.truck_name,
              snippet: truck.food_type,
            ));
        _markers[truck.truck_name] = marker;
      }
    });
  }

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

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
          markers: _markers.values.toSet(),
        ),
      ),
    );
    // TODO: implement build
    //throw UnimplementedError();
  }
}

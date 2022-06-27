import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/services.dart' show rootBundle;

part 'locations.g.dart';

@JsonSerializable()
class LatLng {
  LatLng({
    required this.lat,
    required this.lng,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngToJson(this);

  final double lat;
  final double lng;
}

@JsonSerializable()
class Truck {
  Truck({
    required this.city,
    required this.email,
    required this.first_name,
    required this.food_type,
    required this.last_name,
    required this.lat,
    required this.lng,
    required this.phone,
    required this.truck_color,
    required this.truck_name,
    required this.url,
  });

  factory Truck.fromJson(Map<String, dynamic> json) => _$TruckFromJson(json);
  Map<String, dynamic> toJson() => _$TruckToJson(this);

  final String city;
  final String email;
  final String first_name;
  final String food_type;
  final String last_name;
  final double lat;
  final double lng;
  final String phone;
  final String truck_color;
  final String truck_name;
  final String url;
}

@JsonSerializable()
class Locations {
  Locations({
    required this.trucks,
  });

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);
  Map<String, dynamic> toJson() => _$LocationsToJson(this);

  final List<Truck> trucks;
}

Future<Locations> getTruckLocations() async {
  const truckLocationsURL =
      'https://github.com/derrk/4443-Mobile-Apps_Summer22/blob/main/Assignments/P02/combined_truck_data.json';

  try {
    final response = await http.get(Uri.parse(truckLocationsURL));
    if (response.statusCode == 200) {
      print(response.body);
      return Locations.fromJson(json.decode(response.body));
    }
  } catch (e) {
    print(e);
  }

  // Fallback for when the above http req fails
  return Locations.fromJson(
    json.decode(
      await rootBundle.loadString('assets/combined_truck_data.json'),
    ),
  );
}

//
// @JsonSerializable()
// class Contact {
//   Contact({
//    required this.phone,
//    required this.email,
//    required this.url,
//    required this.firstname,
//    required this.lastname,
// });
//
//   factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
//   Map<String, dynamic> toJson() => _$ContactToJson(this);
//
//   final String phone;
//   final String email;
//   final String url;
//   final String firstname;
//   final String lastname;
// }
// @JsonSerializable()
// class Info{
//   Info({
//     required this.truckname,
//     required this.foodtype,
//     required this.color,
// });
//
//   factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
//   Map<String, dynamic> toJson() => _$InfoToJson(this);
//
//   final String truckname;
//   final String foodtype;
//   final String color;
// }

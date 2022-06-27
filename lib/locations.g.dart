// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatLng _$LatLngFromJson(Map<String, dynamic> json) => LatLng(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$LatLngToJson(LatLng instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Truck _$TruckFromJson(Map<String, dynamic> json) => Truck(
      city: json['city'] as String,
      email: json['email'] as String,
      first_name: json['first_name'] as String,
      food_type: json['food_type'] as String,
      last_name: json['last_name'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      phone: json['phone'] as String,
      truck_color: json['truck_color'] as String,
      truck_name: json['truck_name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$TruckToJson(Truck instance) => <String, dynamic>{
      'city': instance.city,
      'email': instance.email,
      'first_name': instance.first_name,
      'food_type': instance.food_type,
      'last_name': instance.last_name,
      'lat': instance.lat,
      'lng': instance.lng,
      'phone': instance.phone,
      'truck_color': instance.truck_color,
      'truck_name': instance.truck_name,
      'url': instance.url,
    };

Locations _$LocationsFromJson(Map<String, dynamic> json) => Locations(
      trucks: (json['trucks'] as List<dynamic>)
          .map((e) => Truck.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationsToJson(Locations instance) => <String, dynamic>{
      'trucks': instance.trucks,
    };

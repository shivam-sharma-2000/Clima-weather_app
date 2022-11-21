import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location{

  late LocationPermission permission;
  late double latitude;
  late double longitude;
  late Position position;

  Future getLocation() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
      else{
        position = await Geolocator.getCurrentPosition();
        longitude = position.longitude;
        latitude = position.latitude;
      }
    }
    else{
      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
    }
  }
}

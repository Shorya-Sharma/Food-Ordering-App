import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/location_controller.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as location;
import 'package:permission_handler/permission_handler.dart' as handler;
import 'package:http/http.dart' as http;

class LocationService {
  LocationService.init();
  static LocationService instance = LocationService.init();
  final location.Location _location = location.Location();
  Future<bool> checkForServiceAvailability() async {
    bool isEnabled = await _location.serviceEnabled();
    if (isEnabled) {
      return Future.value(true);
    }
    isEnabled = await _location.requestService();
    if (isEnabled) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> checkForPermission() async {
    location.PermissionStatus status = await _location.hasPermission();
    if (status == location.PermissionStatus.denied) {
      status = await _location.requestPermission();
      if (status == location.PermissionStatus.granted) {
        return true;
      }
      return false;
    }
    if (status == location.PermissionStatus.deniedForever) {
      Get.snackbar("Permission Needed",
          "We use permission to get your location in order to give you",
          onTap: (snack) async {
        await handler.openAppSettings();
      }).show();
      return false;
    }
    return Future.value(true);
  }

  Future<void> getUserLocation(LocationController controller) async {
    controller.updateIsAccessingLocation(true);
    print("nè");
    if (!(await checkForServiceAvailability())) {
      controller.errorDescription.value = 'Service is not available';
      controller.updateIsAccessingLocation(false);
      return;
    }
    if (!(await checkForPermission())) {
      controller.errorDescription.value = 'Permission not given';

      controller.updateIsAccessingLocation(false);
      return;
    }
    final location.LocationData data = await _location.getLocation();
    controller.updateUserLocation(data);
    controller.updateIsAccessingLocation(false);
    print(data);
    final url =
        'https://api.mapbox.com/geocoding/v5/mapbox.places/${data.longitude},${data.latitude}.json?access_token=pk.eyJ1IjoibWFuaGhvZGluaCIsImEiOiJjbGxuaWpyZTMwMHVtM2VuMTdnc29mZWR1In0.xbj1J-Vq2UqbLSVCL0fe9Q';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['features'] != null && data['features'].isNotEmpty) {
        controller.updateAddress(data['features'][0]['place_name'].toString());
      } else {
        throw Exception('Failed to get address: No features found');
      }
    } else {
      throw Exception('Failed to get address');
    }
  }
}

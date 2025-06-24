import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:turf/turf.dart' as turf;

class LocationController extends GetxController {
  final RxBool isAccessingLocation = RxBool(false);
  final RxString errorDescription = RxString("");
  final RxString address = RxString("");
  RxDouble distanceFromRestaurant = RxDouble(0.0);
  RxString selectedAddress = RxString("");

  final Rx<LocationData?> userLocation = Rx<LocationData?>(null);
  void updateIsAccessingLocation(bool b) {
    isAccessingLocation.value = b;
  }

  void updateUserLocation(LocationData data) {
    userLocation.value = data;
  }

  void updateAddress(String data) {
    address.value = data;
    selectedAddress.value = data;
  }

  void setSelectedAddress(String address) {
    selectedAddress.value = address;
  }

  void setDistanceFromRestaurant(Restaurant restaurant) async {
    LocationData? userLocation = this.userLocation.value;
    final LatLng point1 =
        LatLng(userLocation!.latitude ?? 0, userLocation.longitude ?? 0);
    final LatLng point2 = LatLng(
        double.parse(restaurant.latitude), double.parse(restaurant.longitude));
    final distance = Geolocator.distanceBetween(
      point1.latitude,
      point1.longitude,
      point2.latitude,
      point2.longitude,
    );

    final distanceInKm = distance / 1000;
    distanceFromRestaurant.value = distanceInKm;
  }
}

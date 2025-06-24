import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const LatLng googlePlex = LatLng(37.13123, -122.3232);
  static const LatLng damSen = LatLng(10.7660903, 106.6418941);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: googlePlex, zoom: 13),
        markers: {
          Marker(
              markerId: MarkerId("_currentLocation"),
              icon: BitmapDescriptor.defaultMarker,
              position: googlePlex),
              Marker(
              markerId: MarkerId("_subLocation"),
              icon: BitmapDescriptor.defaultMarker,
              position: damSen),
        },
      ),
    );
  }
}

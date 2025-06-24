import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class TrackingOrderPage extends StatefulWidget {
  final Restaurant restaurant;
  const TrackingOrderPage({super.key, required this.restaurant});
  @override
  _TrackingOrderPageState createState() => _TrackingOrderPageState();
}

class _TrackingOrderPageState extends State<TrackingOrderPage> {
  MapboxMapController? mapController;
  bool isCreate = false;
  void _onMapCreated(MapboxMapController controller) {
    setState(() {
      isCreate = true;
    });
    mapController = controller;
  }

  void _addSymbol(LatLng locationName) {
    print("huhu");
    mapController?.addSymbol(
      SymbolOptions(
          geometry:
              locationName, // The location where the symbol should be placed
          iconImage: AppAssets.locationImg, // The icon used for the symbol
          iconSize:
              0.5 // The image used for the symbol. This should be the name of an image asset in your project.
          // You can also specify other properties, such as the size, color, and rotation of the symbol.
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Restaurant restaurant = widget.restaurant;
    LatLng location = LatLng(
        double.parse(restaurant.latitude), double.parse(restaurant.longitude));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Tracking Order"),
      ),
      body: MapboxMap(
        accessToken:
            'pk.eyJ1Ijoidm9jb25nYmluaCIsImEiOiJjbHhibXg0bHQwM2FwMmtwbG8yem42Z2E0In0.-14qM-MN14xSjujzkMN-Kw',
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target:
              LatLng(37.7749, -122.4194), // Initial position (San Francisco)
          zoom: 11.0,
        ),
        onStyleLoadedCallback: () => {_addSymbol(LatLng(37.7749, -122.4194))},
      ),
    );
  }
}

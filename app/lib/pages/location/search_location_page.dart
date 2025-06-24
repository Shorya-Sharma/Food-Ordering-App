import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/controller/location_controller.dart';
import 'package:food_delivery_app/models/autocomplete_prediction.dart';
import 'package:food_delivery_app/resources/utils/networkUtiliti.dart';
import 'package:food_delivery_app/resources/utils/placeAutoCompele.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class SearchLocationPage extends StatefulWidget {
  const SearchLocationPage({super.key});

  @override
  State<SearchLocationPage> createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  TextEditingController searchController = new TextEditingController();
  LocationController locationController = Get.find();
  FocusNode myNode = FocusNode();
  List<AutoCompletePrediction> placePredictions = [];
  List<dynamic> addresses = [];
  List<dynamic> locations = [];

  void placeAutocomplete(String str) async {
    final params = {
      'access_token':
          'pk.eyJ1IjoibWFuaGhvZGluaCIsImEiOiJjbGxuaWpyZTMwMHVtM2VuMTdnc29mZWR1In0.xbj1J-Vq2UqbLSVCL0fe9Q',
      'language': 'vi',
      'country': 'VN',
      'fuzzyMatch': 'true',
      'autocomplete': 'true',
      'routing': 'true',
      'limit': '20'
    };
    final url = Uri.parse(
            'https://api.mapbox.com/geocoding/v5/mapbox.places/${str}.json')
        .replace(queryParameters: params);

    final res = await http.get(url);
    if (res != null) {
      print(res);
      var data = json.decode(res.body);

      setState(() {
        addresses =
            data["features"].map((item) => item['place_name_vi']).toList();
        locations = data["features"]
            .map((item) => item['geometry']['coordinates'])
            .toList();
      });
    }
  }

  @override
  void initState() {
    myNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(children: [
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                      focusNode: myNode,
                      onChanged: (value) {
                        placeAutocomplete(value);
                      },
                      controller: searchController,
                      decoration: InputDecoration(
                        filled: true,
                        hintStyle: TextStyle(color: Color(0xff676767)),
                        fillColor: Color(0xfff6f6f6),
                        border: InputBorder.none,
                        hintText: 'Search location',
                      )),
                ),
                TextButton(
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                  onPressed: () {
                    Get.back(result: '');
                  },
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 100,
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              height: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                          onTap: () {
                            Get.back(result: addresses[index] ?? '');
                            print(locations[index][1]);
                            LocationData location = LocationData.fromMap({
                              'latitude': locations[index][1],
                              'longitude': locations[index][0]
                            });
                            print(location);
                            locationController.updateUserLocation(location);
                          },
                          horizontalTitleGap: 0,
                          leading: Icon(Icons.location_on),
                          title: Text(addresses[index]!,
                              maxLines: 2, overflow: TextOverflow.ellipsis)),
                      const Divider(
                        height: 2,
                        thickness: 2,
                        color: Color.fromARGB(255, 31, 14, 14),
                      )
                    ],
                  );
                },
                itemCount: addresses.length,
              ),
            ))
      ]),
    ));
  }
}

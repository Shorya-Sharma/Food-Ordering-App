import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/data/model/address/address.dart';
import 'package:food_delivery_app/pages/location/search_location_page.dart';
import 'package:food_delivery_app/repository/address_repository.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class SaveLocationPage extends StatefulWidget {
  const SaveLocationPage({super.key});

  @override
  State<SaveLocationPage> createState() => _SaveLocationPageState();
}

class _SaveLocationPageState extends State<SaveLocationPage> {
  String address = '';
  String subAddress = '';
  TextEditingController buildingController = TextEditingController();
  TextEditingController gateController = TextEditingController();

  void saveHandler() async {
    AddressRepository addressRepository = Get.find();
    String building = buildingController.value.text;
    String gate = buildingController.value.text;
    String sub;
    if (building != '' && gate != '') {
      sub = '${building}, ${gate}';
    } else if (building != '' && gate == '') {
      sub = building;
    } else if (building == '' && gate != '') {
      sub = gate;
    } else
      sub = '';
    String newAddress = '[${sub}], ${address}';
    Map<String, dynamic> addressObj = {'address': newAddress, 'userId': 4};
    await addressRepository.addAddress(addressObj);

    setState(() {
      address = '[${sub}], ${address}';
    });
    Get.back(result: address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 239, 239),
      appBar: AppBar(
        leading: IconButton(
            icon: Image.asset(AppAssets.backIcon),
            onPressed: () {
              Get.back();
            },
            style: IconButton.styleFrom(
              backgroundColor: AppColors.bgButtonColor,
            )),
        title: Text(
          'Add New Location',
          style: AppStyles.h4.copyWith(fontSize: 18),
        ),
      ),
      body: Container(
        child: Stack(children: [
          Column(
            children: [
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () async {
                  var data = await Get.to(() => SearchLocationPage());
                  setState(() {
                    if (data != null) {
                      address = data;
                    }
                  });
                },
                child: Container(
                  width: double.infinity,
                  color: AppColors.whiteColor,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        address != '' ? address : 'Select address',
                        style: TextStyle(
                            color: AppColors.subTextColor, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 1),
                child: TextField(
                  controller: buildingController,
                  decoration: InputDecoration(
                      filled: true,
                      contentPadding: EdgeInsets.all(16),
                      fillColor: AppColors.whiteColor,
                      hintText: 'Building, number of floors (optional)',
                      border: InputBorder.none),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 1),
                child: TextField(
                  controller: gateController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      filled: true,
                      fillColor: AppColors.whiteColor,
                      hintText: 'Gate (optional)',
                      border: InputBorder.none),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 30),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        color: AppColors.whiteColor,
                        child: Text(
                          'Delete address',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColors.primaryColor),
                        )),
                  )),
            ],
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 160,
                width: double.infinity,
                child: Center(
                    child: GestureDetector(
                  onTap: saveHandler,
                  child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      color: AppColors.primaryColor,
                      child: Text(
                        'Save',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.whiteColor),
                      )),
                )),
              ))
        ]),
      ),
    );
  }
}

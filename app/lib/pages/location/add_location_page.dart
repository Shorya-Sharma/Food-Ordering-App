import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/controller/location_controller.dart';
import 'package:food_delivery_app/data/api/address/address_api.dart';
import 'package:food_delivery_app/data/model/address/address.dart';
import 'package:food_delivery_app/models/autocomplete_prediction.dart';
import 'package:food_delivery_app/pages/location/saved_location_page.dart';
import 'package:food_delivery_app/pages/location/search_location_page.dart';
import 'package:food_delivery_app/repository/address_repository.dart';
import 'package:food_delivery_app/resources/utils/networkUtiliti.dart';
import 'package:food_delivery_app/resources/utils/placeAutoCompele.dart';
import 'package:food_delivery_app/services/location_service.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class AddLocationPage extends StatefulWidget {
  final bool? canSelect;
  const AddLocationPage({super.key, this.canSelect});

  @override
  State<AddLocationPage> createState() => _AddLocationPageState();
}

class _AddLocationPageState extends State<AddLocationPage> {
  TextEditingController searchController = TextEditingController();
  FocusNode myNode = FocusNode();
  LocationController locationController = Get.find();
  String selectedAddress = '';
  AddressRepository addressRepository = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          'Delivery Location',
          style: AppStyles.h4.copyWith(fontSize: 18),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: TextField(
                onTap: () async {
                  var data = await Get.to(() => SearchLocationPage());
                  FocusScope.of(context).requestFocus(FocusNode());

                  setState(() {
                    if (data != '') {
                      selectedAddress = data;
                      locationController.updateAddress(data);
                      
                    }
                  });
                },
                focusNode: myNode,
                controller: searchController,
                decoration: InputDecoration(
                    filled: true,
                    hintStyle: TextStyle(color: Color(0xff676767)),
                    fillColor: Color(0xfff6f6f6),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Search location',
                    prefixIconColor: Color(0xffa0a5ba),
                    prefixIcon: Image.asset(AppAssets.searchIcon)),
              ),
            ),
            Positioned(
                top: 100,
                right: 0,
                left: 0,
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      return Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.location_on,
                            color: AppColors.primaryColor,
                          ),
                          title: Text(selectedAddress != ''
                              ? selectedAddress
                              : locationController.address.value),
                        ),
                      );
                    }),
                    Text('Save address',
                        style: AppStyles.h4.copyWith(
                          color: AppColors.subTextColor,
                        )),
                    FutureBuilder(
                        future: addressRepository.getAll(4),
                        builder: ((context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else {
                            print(snapshot.data);
                            return Expanded(
                              child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    Address selectedAddress =
                                        snapshot.data![index];
                                    return GestureDetector(
                                      onTap: widget.canSelect != null
                                          ? () {
                                              locationController
                                                  .setSelectedAddress(
                                                      selectedAddress.address);
                                              Get.back();
                                            }
                                          : () {},
                                      child: ListTile(
                                          leading: Icon(
                                            Icons.location_on,
                                            color: AppColors.primaryColor,
                                          ),
                                          title: Text(
                                              snapshot.data![index].address)),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        height: 20,
                                      ),
                                  itemCount: snapshot.data!.length),
                            );
                          }
                        }))
                  ],
                )),
            Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: TextButton(
                    onPressed: () {
                      Get.to(() => SaveLocationPage());
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                      ),
                      child: Text('Add new address',
                          textAlign: TextAlign.center,
                          style: AppStyles.h4.copyWith(
                            color: AppColors.whiteColor,
                          )),
                    )))
          ],
        ),
      ),
    );
  }
}

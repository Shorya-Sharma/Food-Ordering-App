import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controller/new_restaurant_controller.dart';
import 'package:food_delivery_app/pages/new_restaurant/widget/base_card.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:vn_provinces/province.dart';
import 'package:vn_provinces/vn_provinces.dart';

import '../../resources/components/custom_dropdown.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final NewRestaurantController controller =
      Get.find<NewRestaurantController>();

  @override
  void initState() {
    super.initState();
    controller.getProvinceNames();
  }

  List<DropdownMenuItem<String>>? getProvinceItems() {
    return controller.provinceNames.map((Map<String, dynamic> value) {
      return DropdownMenuItem<String>(
        value: value['name'],
        child: Text(
          value['name'],
          style: AppStyles.h4,
        ),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>>? getDistrictItems() {
    return controller.districtNames.map((Map<String, dynamic> value) {
      return DropdownMenuItem<String>(
        value: value['name'],
        child: Text(
          value['name'],
          style: AppStyles.h4,
        ),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>>? getWardItems() {
    return controller.wardNames.map((Map<String, dynamic> value) {
      return DropdownMenuItem<String>(
        value: value['name'],
        child: Text(value['name'], style: AppStyles.h4),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text("Restaurant Address",
            style: AppStyles.customeText(16.sp, Colors.white, FontWeight.w500)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView(
        children: [
          BaseCard(
            title: "Address Information",
            isvisible: true,
            child: Column(
              children: [
                Obx(
                  () => CustomDropdownButton(
                    hint: "Province",
                    value: controller.selectedProvince.value,
                    items: getProvinceItems(),
                    onChanged: (value) {
                      // print type of value
                      controller.changeSelectedProvince(value as String);
                    },
                    onSaved: (value) {
                      controller.changeSelectedProvince(value as String);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => CustomDropdownButton(
                    hint: "Province",
                    value: controller.selectedDistrict.value,
                    items: getDistrictItems(),
                    onChanged: (value) {
                      // print type of value
                      controller.changeSelectedDistrict(value as String);
                    },
                    onSaved: (value) {
                      controller.changeSelectedDistrict(value as String);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => CustomDropdownButton(
                    hint: "Ward",
                    value: controller.selectedWard.value,
                    items: getWardItems(),
                    onChanged: (value) {
                      // print type of value
                      controller.changeSelectedWard(value as String);
                    },
                    onSaved: (value) {
                      controller.changeSelectedWard(value as String);
                    },
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  controller.createAddress();
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(color: Colors.white),
                  elevation: 10,
                  minimumSize: Size(100.w, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Submit'.tr,
                  style: AppStyles.h4
                      .copyWith(color: Colors.white, fontSize: 16.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

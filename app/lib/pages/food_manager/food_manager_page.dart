import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controller/new_restaurant_controller.dart';
import 'package:food_delivery_app/data/constants/restaurant_type.dart';
import 'package:food_delivery_app/data/enum/enums.dart';
import 'package:food_delivery_app/pages/new_restaurant/widget/base_card.dart';
import 'package:food_delivery_app/pages/new_restaurant/widget/image_picker.dart';
import 'package:food_delivery_app/pages/new_restaurant/widget/list_image_picker.dart';
import 'package:food_delivery_app/resources/components/custom_dropdown.dart';
import 'package:food_delivery_app/resources/components/custom_textfield.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

import '../../routes.dart';
import '../../values/text_constant.dart';

class FoodManagerPage extends GetView<NewRestaurantController> {
  const FoodManagerPage({super.key});
  List<DropdownMenuItem<RestaurantTypeEnum>> getRestaurantTypes() {
    return restaurantTypes
        .map((e) => DropdownMenuItem<RestaurantTypeEnum>(
              value: e.name,
              child: Text(e.title, style: AppStyles.h4),
            ))
        .toList();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              title: Text("Add Restaurant",
                  style: AppStyles.customeText(
                      17.sp, Colors.white, FontWeight.w500)),
              foregroundColor: Colors.white,
            ),
            body: ListView(children: [
              Form(
                child: Column(
                  children: [
                    BaseCard(
                      title: 'Name',
                      isvisible: true,
                      child: Column(
                        children: [
                          CustomTextField(
                              controller: controller.restaurantName,
                              hintText: AppStrings.restaurantNameHint,
                              keyboardType: TextInputType.text),
                        ],
                      ),
                    ),
                    BaseCard(
                      title: 'Address',
                      isvisible: true,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: controller.restaurantAddress,
                            keyboardType: TextInputType.text,
                            hintText: AppStrings.restaurantAddressHint,
                            readOnly: true,
                            onTap: () {
                              Get.toNamed(Routes.address);
                            },
                          ),
                        ],
                      ),
                    ),
                    BaseCard(
                      title: 'Restaurant Type',
                      isvisible: true,
                      child: Column(
                        children: [
                          CustomDropdownButton(
                            hint: "Restaurant Type",
                            value: controller.restaurantType,
                            items: getRestaurantTypes(),
                            onChanged: (value) {
                              controller.restaurantType = value as String;
                            },
                            onSaved: (value) {
                              controller.restaurantType = value as String;
                            },
                          ),
                        ],
                      ),
                    ),
                    BaseCard(
                      title: 'Main Dish',
                      isvisible: true,
                      child: Column(
                        children: [
                          CustomTextField(
                              controller: controller.mainDish,
                              hintText: AppStrings.mainDishHint,
                              keyboardType: TextInputType.text),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          SingleImagePicker(
                            title: 'Menu Image',
                            imageFile: controller.avatar,
                            imgFromGallery: controller.avatarFromGallery,
                            imgFromCamera: controller.avatarFromCamera,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          SingleImagePicker(
                            title: 'Restaurant Avatar',
                            imageFile: controller.avatar,
                            imgFromGallery: controller.avatarFromGallery,
                            imgFromCamera: controller.avatarFromCamera,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          SingleImagePicker(
                            title: 'Restaurant Cover Image',
                            imageFile: controller.avatar,
                            imgFromGallery: controller.avatarFromGallery,
                            imgFromCamera: controller.avatarFromCamera,
                          ),
                        ],
                      ),
                    ),
                    BaseCard(
                      title: 'Restaurant Images',
                      isvisible: true,
                      child: Column(
                        children: [
                          ListImagePicker(
                            imageFile: controller.photo,
                            imgFromGallery: controller.imageFromGallery,
                            imgFromCamera: controller.imageFromCamera,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Visibility(
                        visible: true,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: ElevatedButton(
                            onPressed: () {},
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
                              style: AppStyles.h4.copyWith(
                                  color: Colors.white, fontSize: 16.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ])));
  }
}

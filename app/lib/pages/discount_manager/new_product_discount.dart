import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/pages/new_restaurant/widget/base_card.dart';
import 'package:food_delivery_app/resources/components/custom_dropdown.dart';
import 'package:food_delivery_app/resources/components/custom_textfield.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../controller/new_discount_controller.dart';
class NewProductDiscountPage extends StatefulWidget {
  const NewProductDiscountPage({super.key});
  @override
  State<NewProductDiscountPage> createState() => _NewProductDiscountPageState();
}

class _NewProductDiscountPageState extends State<NewProductDiscountPage> {
  final NewProductDiscountController controller = Get.find<NewProductDiscountController>();
  @override
  void initState() {
    super.initState();
    controller.restaurantId = Get.arguments['restaurantId'];
    controller.getAllRestaurantDishes();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [],
          title: Text(
            "Add Discount",
            style: AppStyles.roboto20semiBold,
          ),
        ),
        body: ListView(
          children: [
            Form(
              key: controller.formProductDiscountKey,
              child: Column(
                children: [
                  BaseCard(
                    title: 'Name',
                    isvisible: true,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: controller.productDiscountName,
                          hintText: "Product Discount Name",
                          validator: (value) {
                            if (value == null || value.isEmpty == true) {
                              return 'Please enter product discount name';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                        ),
                      ],
                    ),
                  ),
                  BaseCard(
                    title: 'Dishes',
                    isvisible: true,
                    child: Container(),
                  ),
                  Obx(() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.dishes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 80.0, // Adjust the height as needed
                        child: Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text(controller.dishes[index].name),
                                leading: CachedNetworkImage(
                                  height: 50.h,
                                  width: 50.h,
                                  imageUrl: controller.dishes[index].imageUrl,
                                ),
                                trailing: SizedBox(
                                  height: 20.h,
                                  width: 20.h,
                                  child: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    height: 80,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       Obx(() =>  Container(
                            width: 250,
                            child: CustomDropdownButton(
                              hint: 'Add dishes', value: controller.selectedDish.value,
                              items: controller.restaurantDishes
                                  .map((e) => DropdownMenuItem(
                                child: Text(e.name),
                                value: e,
                              ))
                                  .toList(), onChanged: (Object? item ) {
                              controller.selectedDish.value = item as Dish;
                            }, onSaved: (Object? item) {  },
                            )
                        ),),
                        Container(
                          width: 30,
                          child: IconButton(
                            onPressed: () {
                              controller.addDish();
                            },
                            icon: Icon(
                              Ionicons.add_circle_outline,
                              color: AppColors.black,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // child: Row( children: [
                    // Container(
                    //   width: double.infinity * 0.5,
                    //   height: 100,
                    //   child: CustomTextField(
                    //     controller: controller.category,
                    //     hintText: "Category Name",
                    //     keyboardType: TextInputType.text,
                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         return 'Please enter category name';
                    //       }
                    //       return null;
                    //     },
                    //   ),
                    // ),
                    // TextImagePicker(
                    //   title: 'Image',
                    //   imageFile: controller.menu,
                    //   imgFromGallery: controller.menuFromGallery,
                    //   imgFromCamera: controller.menuFromCamera,
                    // ),
                    // Container(
                    //   width: 20,
                    //   child: IconButton(
                    //     onPressed: (){
                    //     },
                    //     icon: Icon(
                    //       Ionicons.add_circle_outline,
                    //       color: AppColors.black,
                    //       size: 20.sp,
                    //     ),
                    //   ),
                    // ),
                  ),
                  BaseCard(
                    title: 'Conditions',
                    isvisible: true,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: controller.conditions,
                          hintText: "Product Discount Conditions",
                          validator: (value) {
                            if (value == null || value.isEmpty == true) {
                              return 'Please enter product discount conditions';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                        ),
                      ],
                    ),
                  ),
                  BaseCard(
                    title: 'Discount Value',
                    isvisible: true,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: controller.discountValue,
                          hintText: "Product Discount Value",
                          validator: (value) {
                            if (value == null || value.isEmpty == true) {
                              return 'Please enter product discount value';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  BaseCard(
                    title: 'Discount Unit',
                    isvisible: true,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: controller.discountUnit,
                          hintText: "Product Discount Unit",
                          validator: (value) {
                            if (value == null || value.isEmpty == true) {
                              return 'Please enter product discount unit';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  BaseCard(
                    title: 'Max Used',
                    isvisible: true,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: controller.maxUsed,
                          hintText: "Product Discount Max Used",
                          validator: (value) {
                            if (value == null || value.isEmpty == true) {
                              return 'Please enter product discount max used';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  BaseCard(
                    title: 'Discount Active Date Range',
                    isvisible: true,
                    child: Column(
                      children: [
                        CustomTextField(
                          readOnly: true,
                          controller: controller.discountActiveTimeRange,
                          hintText: "Discount Active Date Range",
                          onTap: () {
                            controller.showDateRangePicker(context);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty == true) {
                              return 'Please enter discount active date range';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  // Add more fields as per your requirements
                  Container(
                    width: double.infinity,
                    child: Visibility(
                      visible: true,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            controller.createProductDiscount();
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


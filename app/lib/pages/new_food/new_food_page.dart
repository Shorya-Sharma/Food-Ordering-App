import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controller/new_dish_controller.dart';
import 'package:food_delivery_app/pages/new_restaurant/widget/base_card.dart';
import 'package:food_delivery_app/pages/new_restaurant/widget/image_picker.dart';
import 'package:food_delivery_app/resources/components/custom_dropdown.dart';
import 'package:food_delivery_app/resources/components/custom_textfield.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../resources/components/custom_button.dart';
import '../../values/text_constant.dart';

class NewFoodPage extends StatefulWidget {
  const NewFoodPage({super.key});
  @override
  State<NewFoodPage> createState() => _NewFoodPageState();
}

class _NewFoodPageState extends State<NewFoodPage> {
  final NewDishController controller = Get.find<NewDishController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<int>> categoriesToDropdownMenuItem() {
      return controller.categories.value
          .map((e) => DropdownMenuItem<int>(
                value: e.id,
                child: Text(e.name, style: AppStyles.h4),
              ))
          .toList();
    }

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: [],
              title: Text(
                "Add New Food",
                style: AppStyles.roboto20semiBold,
              ),
            ),
            body: ListView(children: [
              Form(
                key: controller.formDishKey,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          SingleImagePicker(
                            title: 'Image',
                            imageFile: controller.imageFile,
                            imgFromGallery: controller.avatarFromGallery,
                            imgFromCamera: controller.avatarFromCamera,
                          ),
                        ],
                      ),
                    ),
                    BaseCard(
                      title: 'Name',
                      isvisible: true,
                      child: Column(
                        children: [
                          CustomTextField(
                              controller: controller.dishName,
                              hintText: AppStrings.dishNameHint,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter food name';
                                }
                                return null;
                              }),
                        ],
                      ),
                    ),
                    BaseCard(
                      title: 'Price',
                      isvisible: true,
                      child: Column(
                        children: [
                          CustomTextField(
                              controller: controller.dishPrice,
                              hintText: "Price",
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter price';
                                }
                                return null;
                              }),
                        ],
                      ),
                    ),
                    Obx(
                      () => BaseCard(
                        title: 'Category',
                        isvisible: true,
                        child: Column(
                          children: [
                            CustomDropdownButton(
                              hint: "Category",
                              value: controller.selectedCategory,
                              items: categoriesToDropdownMenuItem(),
                              onChanged: (value) {
                                controller.selectedCategory = value as int;
                                print("select category: " + value.toString());
                              },
                              onSaved: (value) {
                                controller.selectedCategory = value as int;
                                print("select category: " + value.toString());
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select category';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    BaseCard(
                      title: 'Description',
                      isvisible: true,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: controller.dishDescription,
                            hintText: "Description",
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter description';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    // BaseCard(isvisible: true, child: CustomExpandPanel()),
                    Container(
                      width: double.infinity,
                      child: Visibility(
                        visible: true,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child:
                          Obx(
                                () => CustomButton(
                                text: "Submit",
                                isLoading: controller.isLoading,
                                onTap: () {
                                  if(controller.isLoading == false){
                                    controller.createDish();
                                  }
                                }
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   width: double.infinity,
                    //   child: Visibility(
                    //     visible: true,
                    //     child: Padding(
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 20, vertical: 10),
                    //       child: ElevatedButton(
                    //         onPressed: () {
                    //           controller.createDish();
                    //         },
                    //         style: ElevatedButton.styleFrom(
                    //           backgroundColor: AppColors.primaryColor,
                    //           padding: const EdgeInsets.symmetric(vertical: 15),
                    //           textStyle: const TextStyle(color: Colors.white),
                    //           elevation: 10,
                    //           minimumSize: Size(100.w, 55),
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(10),
                    //           ),
                    //         ),
                    //         child: Text(
                    //           'Submit'.tr,
                    //           style: AppStyles.h4.copyWith(
                    //               color: Colors.white, fontSize: 16.sp),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              )
            ])));
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controller/new_restaurant_controller.dart';
import 'package:food_delivery_app/data/constants/restaurant_type.dart';
import 'package:food_delivery_app/pages/new_restaurant/widget/base_card.dart';
import 'package:food_delivery_app/pages/new_restaurant/widget/image_picker.dart';
import 'package:food_delivery_app/pages/new_restaurant/widget/list_image_picker.dart';
import 'package:food_delivery_app/pages/new_restaurant/widget/textfileld_image_picker.dart';
import 'package:food_delivery_app/resources/components/custom_dropdown.dart';
import 'package:food_delivery_app/resources/components/custom_textfield.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';

import '../../resources/components/custom_button.dart';
import '../../routes.dart';
import '../../values/text_constant.dart';

class NewRestaurantPage extends GetView<NewRestaurantController> {
  const NewRestaurantPage({super.key});
  List<DropdownMenuItem<String>> getRestaurantTypes() {
    return restaurantTypes
        .map((e) => DropdownMenuItem<String>(
              value: e.name.toString(),
              child: Text(e.title, style: AppStyles.h4),
            ))
        .toList();
  }
  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              const SizedBox(height: 50),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Thư viện"),
                onTap: () {
                  controller.menuFromGallery();
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text("Máy ảnh"),
                onTap: () {
                  controller.menuFromCamera();
                  Get.back();
                },
              )
            ],
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: [
              ],
              title: Text(
                "New Restaurant",
                style: AppStyles.roboto20semiBold,
              ),
            ),
            body: SingleChildScrollView(child:
              Form(
                key: controller.formRestaurantKey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: SingleImagePicker(
                        title: 'Restaurant Image',
                        imageFile: controller.avatar,
                        imgFromGallery: controller.avatarFromGallery,
                        imgFromCamera: controller.avatarFromCamera,
                      ),
                    ),
                    BaseCard(
                      title: 'Name',
                      isvisible: true,
                      child: Column(
                        children: [
                          CustomTextField(
                              controller: controller.restaurantName,
                              hintText: AppStrings.restaurantNameHint,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter restaurant name';
                                }
                                return null;
                              },
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please select address';
                              }
                              return null;
                            },
                            // onTap: () {
                            //   Get.toNamed(Routes.address);
                            // },
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
                            validator: (value) {
                              if (value == null) {
                                return 'Please select restaurant type';
                              }
                              return null;
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter main dish';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text),
                        ],
                      ),
                    ),
                    BaseCard(
                      title: 'Restaurant Description',
                      isvisible: true,
                      child: Column(
                        children: [
                          CustomTextField(
                              controller: controller.restaurantDescription,
                              hintText: "Description",
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter description';
                                }
                                return null;
                              }),
                        ],
                      ),
                    ),
                    BaseCard(
                      title: 'Categories',
                      isvisible: true,
                      child: Container(),
                    ),
                    Obx(() => ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.categories.length,
                      itemBuilder: (BuildContext context, int index) {
                       return Container(
                          height: 80.0, // Adjust the height as needed
                          child: Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text(controller.categories[index].name),
                                  leading: CachedNetworkImage(
                                    height: 50.h,
                                    width: 50.h,
                                    imageUrl: controller.categories[index].imageUrl,
                                  ),
                                  trailing: SizedBox(
                                    height: 20.h,
                                    width: 20.h,
                                    child: IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        controller.categories.removeAt(index);
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
                          Container(
                            width: 220,
                            child: CustomTextField(
                              controller: controller.categoryRequest,
                              hintText: "Category Name",
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (controller.categories.isEmpty) {
                                  return 'Please add category to restaurant';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            child:  Obx(
                                  () => Center(
                                child: Container(
                                  child: controller.menu.value == null
                                      ? Container(
                                    height: 50.w,
                                    width: 50.w,
                                    color: Colors.white,
                                    child: GestureDetector(
                                      onTap: () {
                                        _showPicker(context);
                                      },
                                      child: DottedBorder(
                                        borderType: BorderType.RRect,
                                        radius: const Radius.circular(5),
                                        color: AppColors.primaryColor,
                                        strokeWidth: 1,
                                        dashPattern: const [5, 2],
                                        child: Center(
                                          child: Container(
                                            color: Colors.white,
                                            child: Icon(
                                              Icons.add_a_photo,
                                              color: AppColors.primaryColor,
                                              size: 24.w,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                      : Container(
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 50,
                                          child: Image.file(
                                            controller.menu.value!,
                                            fit: BoxFit.cover,
                                            width: 50.w,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 20,
                            child: IconButton(
                              onPressed: () async{
                                await controller.addCategoryRequest();
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

                    // Container(
                    //   width: double.infinity,
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 10, vertical: 10),
                    //   margin: const EdgeInsets.symmetric(horizontal: 10),
                    //   child: Column(
                    //     children: [
                    //       SingleImagePicker(
                    //         title: 'Restaurant Cover Image',
                    //         imageFile: controller.cover,
                    //         imgFromGallery: controller.coverFromGallery,
                    //         imgFromCamera: controller.coverFromCamera,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // BaseCard(
                    //   title: 'Restaurant Images',
                    //   isvisible: true,
                    //   child: Column(
                    //     children: [
                    //       ListImagePicker(
                    //         imageFile: controller.photo,
                    //         imgFromGallery: controller.imageFromGallery,
                    //         imgFromCamera: controller.imageFromCamera,
                    //       ),
                    //     ],
                    //   ),
                    // ),
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
                                  controller.createRestaurant();
                                }
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            )));
  }
}

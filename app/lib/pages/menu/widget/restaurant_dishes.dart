import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controller/menu_controller.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/pages/food/detail_food_page.dart';
import 'package:food_delivery_app/pages/menu/widget/dish_card.dart';
import 'package:food_delivery_app/resources/components/empty_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';

import '../../../values/app_assets.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_styles.dart';

class RestaurantDishes extends StatelessWidget {
  RestaurantDishes({super.key, required this.isShowAddButton});

  final MenuRestaurantController controller =
      Get.find<MenuRestaurantController>();
  final bool isShowAddButton;

  @override
  Widget build(BuildContext context) {
    // return ConstrainedBox(
    //   constraints: BoxConstraints(
    //     maxHeight: 600.h,
    //     minHeight: 0.h
    //   ),
    //
    //   child:
    return Obx(
      () => FutureBuilder(
        future: controller.dishes.value,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (_, __) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shimmer for the image
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 70.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10)),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Shimmer for the description
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 10.h,
                              width: 100.w,
                              color: Colors.grey[300],
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 10.h,
                              width: 150.w,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text(
                  "",
                  style: AppStyles.roboto16semiBold
                      .apply(color: AppColors.primaryColor),
                ),
              ),
            );
          } else {
            var dishes = snapshot.data!;
            if (dishes.length == 0) {
              return Center(
                child: EmptyDataWidget(
                    text: "No dish found",
                    asset: AppAssets.foodIlus,
                    button: isShowAddButton == true
                        ? OutlinedButton(
                            onPressed: () {
                              controller.goToNewFoodPage();
                            },
                            child: Text(
                              "Create new dish",
                              style: AppStyles.roboto14semiBold,
                            ),
                          )
                        : Container()),
              );
            } else
              return Column(
                children: [
                  GridView.builder(
                    itemCount: min(dishes.length, 6),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 250.h,
                      mainAxisSpacing: 5.h,
                      crossAxisSpacing: 5.h,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var dish = dishes[index];
                      return GestureDetector(
                          onTap: () {
                            Get.to(() => DetailFoodPage(), arguments: dish);
                          },
                          child: DishCard(dish: dish));
                      // Build your grid item here
                    },
                  ),
                  isShowAddButton
                      ? OutlinedButton(
                          onPressed: () async {
                            controller.goToNewFoodPage();
                          },
                          child: Container(
                            width: double.infinity,
                            child: Center(child: Text("Add New Food")),
                          ),
                        )
                      : Container(),
                ],
              );
          }
        },
      ),
    );
  }
}

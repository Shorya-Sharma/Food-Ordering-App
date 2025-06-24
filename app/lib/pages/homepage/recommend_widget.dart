import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/pages/food/detail_food_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/model/dish/dish.dart';
import '../../repository/dish_repository.dart';
import '../../resources/components/empty_widget.dart';
import '../../values/app_assets.dart';
import '../../values/app_colors.dart';
import '../../values/app_styles.dart';
import '../menu/widget/dish_card.dart';

class RecommendDishes extends StatelessWidget {
  const RecommendDishes({super.key, required this.dishes});

  final Future<List<Dish>> dishes;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dishes,
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

          //     return Shimmer.fromColors(
          //   baseColor: Colors.grey[300]!,
          //   highlightColor: Colors.grey[100]!,
          //   child: GridView.builder(
          //     shrinkWrap: true,
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       childAspectRatio: 3 / 2,
          //       crossAxisSpacing: 10,
          //       mainAxisSpacing: 10,
          //     ),
          //     physics: NeverScrollableScrollPhysics(),
          //     itemCount: 6,
          //     // Show 10 shimmer placeholders
          //     itemBuilder: (_, __) => Container(
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       child: Column(
          //         children: [
          //           Container(
          //             height: 100.h,
          //             color: Colors.white,
          //           ),
          //           SizedBox(
          //             height: 5.h,
          //           ),
          //           Container(
          //             height: 10.h,
          //             color: Colors.white,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // );
        } else if (snapshot.hasError) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
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
            return EmptyDataWidget(
                text: "No dish found", asset: AppAssets.foodIlus);
          } else
            return Column(
              children: [
                GridView.builder(
                  itemCount: dishes.length,
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
                    return DishCard(dish: dish);
                    // Build your grid item here
                  },
                ),
              ],
            );
        }
      },
    );
  }
}

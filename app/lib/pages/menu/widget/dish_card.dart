import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/data/model/imageFinder/image_finder.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../data/model/dish/dish.dart';
import '../../../values/app_colors.dart';
import '../../food/detail_food_page.dart';

class DishCard extends StatelessWidget {
  final Dish dish;

  DishCard({required this.dish});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailFoodPage(), arguments: dish);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kDarkGrey.withOpacity(0.04),
          borderRadius: BorderRadius.circular(8.h),
        ),
        // elevation: 5.0,
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(5.0),
        //     color: Colors.white,
        //     ]
        // ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.h),
                  topRight: Radius.circular(8.h),
                ),
                child: FutureBuilder<String>(
                    future: ImageFinder.getImagesLinks(dish.name),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return CachedNetworkImage(
                          imageUrl: snapshot.data!,
                          height: 100.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      } else {
                        return Container();
                      }
                    })),
            Gap(5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40.h,
                    child: Text(
                      dish.name,
                      style: AppStyles.roboto12semiBold,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    height: 40.h,
                    child: Text(
                      dish.description,
                      style: AppStyles.roboto10regular
                          .copyWith(color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${dish.price.toString()}00đ',
                          style: AppStyles.roboto12regular),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 2.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: dish.status == "ACTIVE" || dish.status == ""
                                ? AppColors.primaryColor
                                : AppColors.grey.withOpacity(0.2)),
                        child: Text(
                          dish.status == "ACTIVE" || dish.status == ""
                              ? "Active"
                              : "Inactive",
                          style: AppStyles.roboto10Bold.copyWith(
                              color:
                                  dish.status == "ACTIVE" || dish.status == ""
                                      ? AppColors.white
                                      : AppColors.grey),
                        ),
                      ),
                    ],
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

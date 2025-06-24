import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/model/category/category.dart';
import 'package:food_delivery_app/data/model/dishType/dish_type.dart';
import 'package:food_delivery_app/pages/search/search_result_page.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class CategoryItemWidget extends StatelessWidget {
  final DishType item;

  CategoryItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => SearchResultPage(), arguments: item);
      },
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
        // margin: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.primaryColor.withOpacity(0.4),
            width: 1,
          ),
          // color: AppColors.secondary.withOpacity(0.3),
          // boxShadow: [
          //   BoxShadow(
          //       color: Color.fromARGB(255, 209, 203, 203),
          //       spreadRadius: 2,
          //       blurRadius: 8)
          // ]
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.food_bank_outlined,
                color: AppColors.primaryColor,
                size: 30,
              ),
            ),
            Text(
              '${item.name}',
              textAlign: TextAlign.center,
              style: AppStyles.roboto12semiBold,
            )
          ],
        ),
      ),
    );
  }
}

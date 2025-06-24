import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/model/category/category.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/dishType/dish_type.dart';
import 'package:food_delivery_app/data/model/imageFinder/image_finder.dart';
import 'package:food_delivery_app/pages/food/detail_food_page.dart';
import 'package:food_delivery_app/pages/search/search_result_page.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class RecommendDishItem extends StatelessWidget {
  final Dish item;
  const RecommendDishItem({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailFoodPage(), arguments: item);
      },
      child: Container(
        width: 80,

        // margin: const EdgeInsets.only(left: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            FutureBuilder<String>(
                future: ImageFinder.getImagesLinks(item.name),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        image: DecorationImage(
                            image: NetworkImage(snapshot.data!),
                            fit: BoxFit.cover),
                      ),
                    );
                  }
                  return Container();
                }),
            Text(
              '${item.name}',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppStyles.h4.copyWith(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

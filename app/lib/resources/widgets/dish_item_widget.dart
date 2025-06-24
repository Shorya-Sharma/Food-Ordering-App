import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/imageFinder/image_finder.dart';
import 'package:food_delivery_app/pages/food/detail_food_page.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class DishItemWidget extends StatelessWidget {
  final Dish item;
  final bool? showPrice;
  const DishItemWidget({super.key, required this.item, this.showPrice});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailFoodPage(), arguments: item);
      },
      child: Container(
        child: Stack(
          children: [
            Container(
              width: 150,
              height: showPrice == null ? 180 : 220,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white, // Set the color of the container
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.5), // Set the color of the shadow
                      spreadRadius: 5, // Set the spread radius of the shadow
                      blurRadius: 7, // Set the blur radius of the shadow
                      offset: Offset(0, 3), // Set the offset of the shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: 150,
                height: showPrice == null ? 100 : 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: showPrice == null ? 30 : 50),
                    Text(
                      item.name,
                      style: AppStyles.h4.copyWith(fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Uttora Coffee House',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff646982)),
                      textAlign: TextAlign.center,
                    ),
                    showPrice != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.price.toString(),
                                style: AppStyles.h4
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              IconButton(
                                icon: Container(
                                  child: Icon(
                                    Icons.add,
                                    color: AppColors.whiteColor,
                                  ),
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                onPressed: () {},
                              )
                            ],
                          )
                        : Container()
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 14,
              child: FutureBuilder<String>(
                  future: ImageFinder.getImagesLinks(item.name),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                          width: 122,
                          height: 84,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(snapshot.data!),
                                fit: BoxFit.cover),
                          ));
                    }
                    return Container();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

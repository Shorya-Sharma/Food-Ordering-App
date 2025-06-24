import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/imageFinder/image_finder.dart';
import 'package:food_delivery_app/values/app_styles.dart';

class DishStatisticItem extends StatelessWidget {
  final Dish dish;
  const DishStatisticItem({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white, // Set the color of the container
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Set the color of the shadow
            spreadRadius: 5, // Set the spread radius of the shadow
            blurRadius: 7, // Set the blur radius of the shadow
            offset: Offset(0, 3), // Set the offset of the shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder<String>(
              future: ImageFinder.getImagesLinks(dish.name),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                      width: 160,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16)),
                          image: DecorationImage(
                              image: NetworkImage(snapshot.data!),
                              fit: BoxFit.cover)));
                }
                return Container();
              }),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dish.name,
                  style: AppStyles.h4.copyWith(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  dish.description,
                  style:
                      AppStyles.subText.copyWith(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

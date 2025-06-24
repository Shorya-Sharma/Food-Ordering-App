import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/data/model/Order/order.dart';

import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/resources/widgets/dish_item_widget.dart';
import 'package:food_delivery_app/values/app_styles.dart';

class DishesWidget extends StatelessWidget {
  final String title;
  final List<Dish> dishes;
  const DishesWidget({super.key, required this.title, required this.dishes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.header,
        ),
        GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: dishes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 170 / 220),
            itemBuilder: ((context, index) {
              return Container(
                  height: 220,
                  child: DishItemWidget(
                    item: dishes[index],
                    showPrice: true,
                  ));
            }))
      ],
    );
  }
}

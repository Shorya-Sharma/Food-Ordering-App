import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/data/model/restaurantOfDish/restaurant_of_dish.dart';
import 'package:food_delivery_app/pages/cart/cart_restaurant_page.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class RestaurantItemWidget extends StatelessWidget {
  final RestaurantOfDish item;

  const RestaurantItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CartRestaurantPage(restaurant: item.restaurant!));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(item.restaurant!.imageUrl),
                      fit: BoxFit.cover))),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    item.restaurant!.name,
                    style: AppStyles.h4.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      item.restaurant!.address ?? '',
                      style: TextStyle(
                        color: AppColors.subTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '${item.totalPrice.toStringAsFixed(0)}',
                      style: AppStyles.h4
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' (${item.quantity} dishes)',
                            style: AppStyles.h4
                                .copyWith(fontWeight: FontWeight.normal)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            flex: 3,
          ),
        ],
      ),
    );
  }
}

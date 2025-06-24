import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/pages/restaurant/detail_restaurant_page.dart';
import 'package:food_delivery_app/pages/restaurant_manager/restaurant_manager_page2.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RestaurantItemWidget extends StatefulWidget {
  final Restaurant item;

  const RestaurantItemWidget({super.key, required this.item});

  @override
  State<RestaurantItemWidget> createState() => _RestaurantItemWidgetState();
}

class _RestaurantItemWidgetState extends State<RestaurantItemWidget> {
  @override
  Widget build(BuildContext context) {
    String listDish = widget.item.dishes.map((e) => e.name).join(" - ");
    return GestureDetector(
      onTap: () {
        Get.to(
            () => RestaurantManagerPage2(
                  restaurantId: widget.item.id,
                ),
            arguments: widget.item);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.kDarkGrey.withOpacity(0.08),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180.h,
              decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.item.imageUrl),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(5),
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset(AppAssets.rateIcon),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              widget.item.rate.toStringAsFixed(1),
                              style: AppStyles.h4
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          Image.asset(AppAssets.deliveryIcon),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text('free', style: AppStyles.h4),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          Image.asset(AppAssets.clockIcon),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text('20 min', style: AppStyles.h4),
                          )
                        ],
                      ),
                    ],
                  ),
                  Gap(10),
                  Text(
                    '${widget.item.name}',
                    style: AppStyles.roboto16regular,
                  ),
                  Text(
                    '${widget.item.address ?? 'Quận Tân Bình, Hồ Chí Minh'}',
                    style: AppStyles.h4.copyWith(color: AppColors.subTextColor),
                  ),
                  Text(listDish,
                      style:
                          AppStyles.h4.copyWith(color: AppColors.subTextColor)),
                  SizedBox(
                    height: 10,
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

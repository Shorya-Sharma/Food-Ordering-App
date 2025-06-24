import 'package:flutter/material.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

import '../../values/app_colors.dart';

Widget HeaderWidget(text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        '${text}',
        style: AppStyles.roboto16semiBold,
      ),
      TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 3),
              child: Text(
                'See All',
                style: AppStyles.roboto12semiBold.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primaryColor,
              size: 12,
            )
          ],
        ),
      )
    ],
  );
}

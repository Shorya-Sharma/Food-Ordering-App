import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:get/get.dart';

Widget BackButtonWidget(VoidCallback onPressed) {
  return IconButton(
      icon: Image.asset(AppAssets.backIcon),
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: AppColors.bgButtonColor,
      ));
}

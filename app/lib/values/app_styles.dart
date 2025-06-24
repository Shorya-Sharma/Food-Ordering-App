import 'package:flutter/material.dart';
import 'package:food_delivery_app/values/app_colors.dart';

class AppStyles {
  static TextStyle h4 =
      TextStyle(fontSize: 16, color: AppColors.blackColor, fontFamily: 'Sen');
  static TextStyle header =
      TextStyle(fontSize: 20, color: AppColors.blackColor, fontFamily: 'Sen');
  static TextStyle subText =
      TextStyle(fontSize: 16, color: AppColors.subTextColor, fontFamily: 'Sen');
  static TextStyle roboto10regular = const TextStyle(
    fontSize: 10,
  );
  static TextStyle roboto10semiBold = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
  );
  static TextStyle roboto10Bold = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );
  static TextStyle roboto11regular = const TextStyle(
    fontSize: 11,
  );
  static TextStyle roboto11semiBold = const TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
  );
  static TextStyle roboto11Bold = const TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
  );
  static TextStyle roboto12regular = const TextStyle(
    fontSize: 12,
  );
  static TextStyle roboto12semiBold = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
  static TextStyle roboto12Bold = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static TextStyle roboto14regular = const TextStyle(
    fontSize: 14,
  );
  static TextStyle roboto14semiBold = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static TextStyle roboto14Bold = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static TextStyle roboto15regular = const TextStyle(
    fontSize: 15,
  );
  static TextStyle roboto15semiBold = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
  static TextStyle roboto15Bold = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

  static TextStyle roboto16regular = const TextStyle(
    fontSize: 16,
  );
  static TextStyle roboto16semiBold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static TextStyle roboto16Bold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  static TextStyle roboto18regular = const TextStyle(
    fontSize: 18,
  );
  static TextStyle roboto18semiBold = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static TextStyle roboto18Bold = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static TextStyle roboto20regular = const TextStyle(
    fontSize: 20,
  );
  static TextStyle roboto20semiBold = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static TextStyle roboto20Bold = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static TextStyle customeText(
      double size, Color color, FontWeight fontWeight) {
    return TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
        fontFamily: 'Sen');
  }

  static BoxDecoration boxOutline = BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: AppColors.whiteColor,
      boxShadow: [
        BoxShadow(
            color: Color.fromARGB(255, 209, 203, 203),
            spreadRadius: 2,
            blurRadius: 8)
      ]);
}

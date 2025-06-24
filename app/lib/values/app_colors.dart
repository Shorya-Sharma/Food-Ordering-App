import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xffff7622);
  static const Color bgButtonColor = Color(0xffecf0f4);
  static const Color blackColor = Color(0xff000000);
  static const Color whiteColor = Color(0xffffffff);
  static const Color subTextColor = Color(0xffa0a5ba);
  static const kDark = Color(0xFF000000);
  static const kLightGrey = Color(0x95D1CECE);
  static const kDarkGrey = Color(0xFF9B9B9B);
  static const kShadowColor = Color(0x3322292E);
  static const bgTextField = Color.fromRGBO(240, 245, 250, 1);
  static const bgButton = Color(0xffF0F5FA);
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color backgroundColor = fromHex("f4f4f4");
  static Color red = fromHex("C71518");
  static Color green = fromHex("12A054");
  static Color secondary = fromHex("FFE9C2");
  static Color grey = fromHex("90959A");
  static Color blue = fromHex("00B4FF");
  static Color gery2 = grey;
  static Color fromHex(String hexColorString) {
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}

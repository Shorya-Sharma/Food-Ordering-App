import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

import '../../repository/user_repository.dart';

class UsernameWithTickLabel extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double labelSize;
  final int uid;
  UsernameWithTickLabel(this.text,
      {this.style, this.labelSize = 16, super.key, required this.uid});

  final UserRepository userRepo = Get.find<UserRepository>();
  @override
  Widget build(BuildContext context) {
    return RichText(
        maxLines: 1,
        text: TextSpan(children: [
          TextSpan(
            text: text,
            style: style ??
                AppStyles.roboto16semiBold.copyWith(
                  color: AppColors.black,
                ),
          ),
          TextSpan(
            text: "  ",
            style: AppStyles.roboto16semiBold.copyWith(
              color: AppColors.black,
            ),
          ),
        ]));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../values/app_colors.dart';
import '../../values/app_styles.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({super.key, required this.text, required this.asset, this.button});
  final String text;
  final String asset;
  final Widget? button;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            asset,
            width: 288,
            height: 279,
          ),
          Text(
            text,
            style: AppStyles.roboto16regular.copyWith(
              color: AppColors.grey,
            ),
          ),
          if(button != null) button!,
        ],
      ),
    );
  }
}

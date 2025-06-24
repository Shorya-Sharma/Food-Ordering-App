import 'package:flutter/material.dart';
import 'package:food_delivery_app/values/app_colors.dart';

class BackButtonText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
          ),
          Text(
            'Back',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.primaryColor,
                ),
          ),
        ],
      ),
    );
  }
}

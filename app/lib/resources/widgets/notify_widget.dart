import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';

class NotifyWidget extends StatelessWidget {
  const NotifyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, top: 10),
      child: badges.Badge(
        child: IconButton(
          icon: Icon(Icons.notifications_sharp),
          color: AppColors.black,
          onPressed: () {},
          style: IconButton.styleFrom(
              backgroundColor: AppColors.grey.withOpacity(0.4)),
        ),
        badgeContent: Container(
          child: Center(
            child: Text('2+',
                style: AppStyles.roboto10regular.copyWith(
                  color: AppColors.white,
                )),
          ),
          padding: EdgeInsets.all(2),
        ),
        badgeStyle: badges.BadgeStyle(badgeColor: AppColors.primaryColor),
      ),
    );
  }
}

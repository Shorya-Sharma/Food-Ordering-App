import 'package:flutter/material.dart';
import 'package:food_delivery_app/values/app_styles.dart';

class TabTitle extends StatelessWidget {
  final String title;
  final String actionText;
  final Function seeAll;
  final double padding;

  const TabTitle(
      {super.key,
      required this.title,
      required this.actionText,
      required this.seeAll,
      required this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppStyles.roboto16regular,
            ),
          ),
          TextButton(
            onPressed: () {
              seeAll();
            },
            child: Text(
              actionText,
            ),
          ),
        ],
      ),
    );
  }
}

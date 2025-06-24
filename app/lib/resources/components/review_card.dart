import 'package:flutter/material.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: (8.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.grey,
                      radius: (24.0),
                    ),
                    SizedBox(
                      width: (8),
                    ),
                    UserDetails(),
                  ],
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.',
                  style: AppStyles.roboto12regular,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shoo Thar Mien',
                style: TextStyle(
                  fontSize: (17.0),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(Icons.more_vert_rounded),
            ],
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/star_rating.png',
              ),
              SizedBox(
                width: (4),
              ),
              Image.asset(
                'assets/images/star_rating.png',
              ),
              SizedBox(
                width: (4),
              ),
              Image.asset(
                'assets/images/star_rating.png',
              ),
              SizedBox(
                width: (4),
              ),
              Image.asset(
                'assets/images/star_rating.png',
              ),
              SizedBox(
                width: (4),
              ),
              Image.asset(
                'assets/images/star_rating.png',
              ),
              Text(
                '29 February, 2099',
                style: AppStyles.subText,
              ),
            ],
          )
        ],
      ),
    );
  }
}

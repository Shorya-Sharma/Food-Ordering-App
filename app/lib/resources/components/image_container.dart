import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/values/app_assets.dart';

import '../../values/app_colors.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112.h,
      width: 112.h,
      child: Stack(
        children: [
          Container(
            decoration: ShapeDecoration(
              shape: CircleBorder(
              ),
              color: AppColors.grey,
              image: DecorationImage(
                image: AssetImage(AppAssets.avatar),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.all(
                8.w,
              ),
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                color: AppColors.primaryColor,
              ),
              child: Image.asset(AppAssets.camera),
            ),
          )
        ],
      ),
    );
  }
}

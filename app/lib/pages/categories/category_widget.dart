import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/model/category/category.dart';
import '../../values/app_styles.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  CategoryWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.h,
          width: 40.h,
          child:
        CircleAvatar(
          radius: 40.w,

          backgroundImage: category.imageUrl.isNotEmpty ? CachedNetworkImageProvider(category.imageUrl)
            : AssetImage("assets/images/food_default.png",) as ImageProvider<Object>
          ,
          backgroundColor: Colors.transparent,
        ),),
        SizedBox(height: 5.h),
        Text(
          category.name,
          style: AppStyles.roboto10regular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

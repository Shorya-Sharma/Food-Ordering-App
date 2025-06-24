import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/pages/categories/category_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';
import '../../controller/menu_controller.dart';
import '../../data/model/category/category.dart';
import '../../values/app_colors.dart';
import '../../values/app_styles.dart';

class RestaurantCategories extends StatelessWidget {
  RestaurantCategories({super.key});

  final MenuRestaurantController controller =
      Get.find<MenuRestaurantController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => FutureBuilder(
          future: controller.categories.value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  shrinkWrap: true,
                  itemCount: 5, // Show 10 shimmer placeholders
                  itemBuilder: (_, __) => Container(
                    color: Colors.white,
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Đã xảy ra lỗi",
                  style: AppStyles.roboto16semiBold
                      .apply(color: AppColors.primaryColor),
                ),
              );
            } else {
              var categories = snapshot.data!;
              return GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisExtent: 100.h,
                  mainAxisSpacing: 5.h,
                  crossAxisSpacing: 5.h,
                ),
                itemBuilder: (context, index) {
                  Category category = categories[index];
                  return CategoryWidget(category: category);
                  // Build your grid item here
                },
              );
            }
          },
        ),
      ),
    );
  }
}

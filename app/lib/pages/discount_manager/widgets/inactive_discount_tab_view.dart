import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/pages/discount_manager/widgets/discount_item.dart';
import 'package:food_delivery_app/values/app_constant.dart';
import 'package:get/get.dart';

import '../../../controller/discount_manager_controller.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_styles.dart';

class TabInactiveProductDiscountView extends StatelessWidget {
  const TabInactiveProductDiscountView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductDiscountController>();
    return Container(
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Container(
            height: height * 0.7,
            child: FutureBuilder(
              future: controller.inactiveProductDiscounts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.data!.isBlank == true) {
                  return Center(
                    child: Text(
                      "Don't have any inactive voucher",
                      style: AppStyles.roboto16semiBold
                          .apply(color: AppColors.primaryColor),
                    ),
                  );
                } else if (snapshot.data!.isNotEmpty) {
                  var activeProductDiscounts = snapshot.data;
                  return Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: ListView.builder(
                      padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0),
                      itemCount: activeProductDiscounts?.length,
                      itemBuilder: (context, index) {
                        var productDiscountItem =
                            activeProductDiscounts![index];
                        return ProductDiscountItem(
                            productDiscount: productDiscountItem);
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      "Đã xảy ra lỗi",
                      style: AppStyles.roboto16semiBold
                          .apply(color: AppColors.primaryColor),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

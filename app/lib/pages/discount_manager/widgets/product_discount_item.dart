import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../data/model/product_discount/product_discount.dart';
import '../../../data/model/restaurant_discount/restaurant_discount.dart';
import '../../../data/model/voucher/voucher.dart';
import '../../../routes.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_styles.dart';

class VoucherItem extends StatelessWidget {
  const VoucherItem({Key? key, required this.voucher}) : super(key: key);
  final Voucher voucher;

  String dateConvert(DateTime? discountFrom, DateTime? discountTo) {
    return "${discountFrom?.day}/${discountFrom?.month}/${discountFrom?.year} - ${discountTo?.day}/${discountTo?.month}/${discountTo?.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.discountDetail, arguments: {'discount': voucher});
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.12,
          decoration: BoxDecoration(
              color: AppColors.kDarkGrey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.h)),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0),
            minLeadingWidth: 0,
            minVerticalPadding: 0,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                AppAssets.discountIcon, // Use imageUrl from Dish model
                fit: BoxFit.cover,
              ),
            ),
            title: Container(
              width: 200.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    voucher.productDiscount.name, // Use name from Dish model
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppStyles.roboto16semiBold,
                  ),
                  Gap(4),
                  Text(
                      dateConvert(voucher.productDiscount.validFrom,
                          voucher.productDiscount.validTo),
                      // Use description from Dish model
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.roboto12regular),
                ],
              ),
            ),
            trailing: SizedBox(
              width: 80.w,
              height: double.maxFinite,
              child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                            color: AppColors.primaryColor,
                          ),
                          child: Text(
                            "x${voucher.productDiscount.maxUsed}",
                            // Use maxUsed from ProductDiscount model
                            style: AppStyles.roboto12regular
                                .apply(color: AppColors.white),
                          ),
                        ),
                        const Icon(Ionicons.arrow_forward_circle_outline)
                      ])),
            ),
          ),
        ),
      ),
    );
  }
}

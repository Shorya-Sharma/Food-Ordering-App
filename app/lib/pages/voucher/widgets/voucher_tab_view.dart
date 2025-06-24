import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controller/voucher_controller.dart';
import 'package:food_delivery_app/pages/discount_manager/widgets/discount_item.dart';
import 'package:food_delivery_app/pages/discount_manager/widgets/product_discount_item.dart';
import 'package:food_delivery_app/resources/components/empty_widget.dart';
import 'package:food_delivery_app/routes.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_constant.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../values/app_colors.dart';
import '../../../values/app_styles.dart';

class TabActiveVoucherView extends StatelessWidget {
  const TabActiveVoucherView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VoucherController>();
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
              future: controller.activeVouchers,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.data == null ||
                    snapshot.data?.isBlank == true) {
                  return EmptyDataWidget(
                      text: "You don't have any active vouchers",
                      asset: AppAssets.discountIlus);
                } else if (snapshot.data!.isNotEmpty) {
                  var activeVouchers = snapshot.data;
                  return Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: ListView.builder(
                      padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0),
                      itemCount: activeVouchers?.length,
                      itemBuilder: (context, index) {
                        var voucher = activeVouchers![index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.voucherDetail,
                                  arguments: {'voucher': voucher});
                            },
                            child: VoucherItem(
                              voucher: voucher,
                            ),
                            // child: Container(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 10.0),
                            //   width: MediaQuery.of(context).size.width,
                            //   height: MediaQuery.of(context).size.height * 0.12,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(8.h),
                            //       color: Colors.white60),
                            //   child: ListTile(
                            //     contentPadding: EdgeInsets.symmetric(
                            //         horizontal: 4.w, vertical: 0),
                            //     // horizontalTitleGap: 6,
                            //     minLeadingWidth: 0,
                            //     minVerticalPadding: 0,
                            //     leading: ClipRRect(
                            //       borderRadius: BorderRadius.circular(8),
                            //       child: Image.asset(
                            //         AppAssets.avatar,
                            //         fit: BoxFit.cover,
                            //       ),
                            //     ),
                            //     title: Container(
                            //       width: 200.w,
                            //       child: Column(
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         crossAxisAlignment:
                            //             CrossAxisAlignment.start,
                            //         children: [
                            //           Text(
                            //             voucher.productDiscount.name,
                            //             overflow: TextOverflow.ellipsis,
                            //             maxLines: 2,
                            //             style: AppStyles.roboto16semiBold,
                            //           ),
                            //           Gap(4),
                            //           Text(
                            //               "Expire: " +
                            //                   voucher.productDiscount.validTo
                            //                       .toString(),
                            //               maxLines: 1,
                            //               overflow: TextOverflow.ellipsis,
                            //               style: AppStyles.roboto12regular),
                            //         ],
                            //       ),
                            //     ),
                            //     trailing: SizedBox(
                            //       width: 80.w,
                            //       height: double.maxFinite,
                            //       child: Container(
                            //           height: double.maxFinite,
                            //           width: double.maxFinite,
                            //           decoration: BoxDecoration(
                            //             borderRadius: BorderRadius.circular(8),
                            //           ),
                            //           child: Column(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.spaceBetween,
                            //               crossAxisAlignment:
                            //                   CrossAxisAlignment.end,
                            //               children: [
                            //                 Container(
                            //                   padding: EdgeInsets.symmetric(
                            //                       horizontal: 6.w),
                            //                   decoration: BoxDecoration(
                            //                     borderRadius: BorderRadius.only(
                            //                       topLeft: Radius.circular(8),
                            //                       bottomLeft:
                            //                           Radius.circular(8),
                            //                       topRight: Radius.circular(8),
                            //                       bottomRight:
                            //                           Radius.circular(8),
                            //                     ),
                            //                     color: AppColors.primaryColor,
                            //                   ),
                            //                   child: Text(
                            //                     "x${voucher.remainingUsage}",
                            //                     style: AppStyles.roboto12regular
                            //                         .apply(
                            //                             color: AppColors.white),
                            //                   ),
                            //                 ),
                            //                 const Icon(Ionicons
                            //                     .arrow_forward_circle_outline)
                            //               ])),
                            //     ),
                            //   ),
                            // ),
                          ),
                        );
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

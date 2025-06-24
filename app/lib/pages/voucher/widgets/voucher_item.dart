import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

import '../../../data/model/voucher/voucher.dart';
import '../../../values/app_assets.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_styles.dart';

class VoucherItem extends StatelessWidget {
  const VoucherItem({super.key, required this.voucher});
  final Voucher voucher;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.h), color: Colors.white60),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0),
            // horizontalTitleGap: 6,
            minLeadingWidth: 0,
            minVerticalPadding: 0,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                AppAssets.voucherIcon,
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
                    voucher.productDiscount.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppStyles.roboto16semiBold,
                  ),
                  Gap(4),
                  Row(
                    children: [
                      // Text("Price: " + .price.toString() + "VND",
                      //     maxLines: 1,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: AppStyles.roboto12regular),
                      Gap(4),
                      const SizedBox.square(
                        dimension: 10,
                      ),
                    ],
                  ),
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
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 10.h,
                        child: Switch(
                            activeColor: Colors.green,
                            value: true,
                            inactiveThumbColor: Colors.transparent,
                            inactiveTrackColor: AppColors.grey,
                            onChanged: (value) {
                              print("Switch");
                            }),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        const Icon(Icons.edit),
                        const Icon(Ionicons.arrow_forward_circle_outline)
                      ])
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

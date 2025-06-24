import 'package:flutter/material.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

import '../../values/app_colors.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  MyAppbar({
    required this.title,
    this.isShowBack = true,
    required this.actions,
    super.key,
  });

  final String title;
  bool? isShowBack;
  List<Widget> actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // return Row(
    //   children: [
    //     Expanded(child: BackButtonText()),
    //     Text(
    //       title,
    //       style: AppStyles.roboto16semiBold,
    //     ),
    //     Expanded(
    //       child:
    //           Row(mainAxisAlignment: MainAxisAlignment.end, children: actions),
    //     ),
    //   ],
    // );
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: Text(
        title,
        style: AppStyles.roboto20semiBold,
      ),
      leading: (isShowBack == true)
          ? Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                  color: AppColors.primaryColor,
                ),
                color: AppColors.black,
                onPressed: () {
                  Get.back();
                },
              ),
            )
          : const SizedBox(),
      // ),
      actions: actions,
    );
  }
}

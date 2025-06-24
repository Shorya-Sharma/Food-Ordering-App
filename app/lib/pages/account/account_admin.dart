import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/resources/components/my_appbar.dart';
import 'package:food_delivery_app/routes.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

import '../../controller/account_controller.dart';
import '../../resources/components/image_container.dart';
import '../../values/app_colors.dart';

class AccountAdminScreen extends StatefulWidget {
  const AccountAdminScreen({super.key});

  @override
  State<AccountAdminScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountAdminScreen> {
  late AccountController controller;

  @override
  void initState() {
    controller = Get.find<AccountController>();
    controller.getProfile(); // Fetch profile data
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.servicePack = 1;
    return Scaffold(
      appBar: MyAppbar(title: "Account", isShowBack: false, actions: []),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: (8.0),
            ),
            Container(
              height: 112.h,
              width: 112.h,
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                color: AppColors.grey,
                image: DecorationImage(
                  image: AssetImage(AppAssets.avatar),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: (8.0),
            ),
            Obx(
              () => Text(
                controller.me.value?.username ?? '',
                style: AppStyles.roboto16semiBold,
              ),
            ),
            Obx(
              () => Text(
                controller.me.value?.fullname ?? '',
                style: AppStyles.roboto16regular,
              ),
            ),
            Divider(
              height: (32.0),
            ),
            ProfileCard(
              image: 'assets/images/profile_user.png',
              color: AppColors.white,
              title: 'My Profile',
              tapHandler: () {
                Get.toNamed(Routes.profile);
              },
            ),
            SizedBox(
              height: (8.0),
            ),
            ProfileCard(
              image: 'assets/images/map_user.png',
              color: AppColors.white,
              title: 'My restaurants',
              tapHandler: () {
                Get.toNamed(Routes.myRestaurant);
              },
            ),
            SizedBox(
              height: (8.0),
            ),
            ProfileCard(
              image: 'assets/images/noti_user.png',
              color: AppColors.white,
              title: 'Conversations',
              tapHandler: () {
                Get.toNamed(Routes.conversation);
              },
            ),
            // SizedBox(
            //   height: (8.0),
            // ),
            // ProfileCard(
            //   image: 'assets/images/check_user.png',
            //   color: AppColors.white,
            //   title: 'My Voucher',
            //   tapHandler: () {
            //     Get.toNamed(Routes.myVoucher);
            //   },
            // ),
            SizedBox(
              height: (8.0),
            ),
            ProfileCard(
              image: 'assets/images/arrow_user.png',
              color: AppColors.white,
              title: 'Discounts',
              tapHandler: () {
                Get.toNamed(Routes.myVoucher);
              },
            ),
            SizedBox(
              height: (8.0),
            ),
            ProfileCard(
              image: 'assets/images/arrow_user.png',
              color: AppColors.white,
              title: 'Statistic',
              tapHandler: () {
                Get.toNamed(Routes.statistic);
              },
            ),
            SizedBox(
              height: (8.0),
            ),
            ProfileCard(
              image: 'assets/images/arrow_user.png',
              color: AppColors.white,
              title: 'Swich to user view',
              tapHandler: () {
                Get.offAndToNamed(Routes.navigationHome);
              },
            ),
            SizedBox(
              height: (8.0),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  ProfileCard(
      {super.key,
      required this.image,
      required this.title,
      this.tapHandler,
      required this.color});

  final String image;
  final String title;
  Function? tapHandler;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (tapHandler != null) tapHandler!();
      },
      child: Container(
        padding: EdgeInsets.all(
          8.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              color: AppColors.kShadowColor.withOpacity(0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(
                8.h,
              ),
              decoration: ShapeDecoration(
                color: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    8.h,
                  ),
                ),
              ),
              // child: Container(
              //   height: 100.h,
              //   width: 100.h,
              child: Image.asset(image),
              // ),
            ),
            SizedBox(
              width: 8.h,
            ),
            Expanded(
              child: Text(
                title,
                style: AppStyles.roboto16semiBold,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}

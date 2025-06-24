import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controller/account_controller.dart';
import 'package:food_delivery_app/resources/components/my_appbar.dart';
import 'package:food_delivery_app/routes.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../values/app_colors.dart';
import '../../../values/app_styles.dart';

class MyRestaurants extends StatefulWidget {
  const MyRestaurants({super.key});

  @override
  State<MyRestaurants> createState() => _MyRestaurantsState();
}

class _MyRestaurantsState extends State<MyRestaurants> {
  final AccountController controller = Get.find<AccountController>();

  @override
  void initState() {
    super.initState();
    controller.getMyRestaurants();
  }

  Widget buildShimmerItem() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.h),
            border: Border.all(color: AppColors.grey, width: 1.h),
            color: Colors.white,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 70,
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 20.h,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      width: double.maxFinite,
                      height: 20.h,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              var isAdd = await Get.toNamed(Routes.newRestaurant,
                  arguments: controller.me.value!.id);
              if (isAdd == true) {
                controller.getMyRestaurants();
              }
            },
            icon: Icon(
              Ionicons.add_circle_outline,
              color: AppColors.black,
              size: 30.sp,
            ),
          ),
        ],
        title: Text(
          "My Restaurants",
          style: AppStyles.roboto20semiBold,
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => FutureBuilder(
            future: controller.restaurants.value,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0),
                  itemCount: 10,
                  // Số lượng item skeleton bạn muốn hiển thị
                  itemBuilder: (context, index) {
                    return buildShimmerItem();
                  },
                );
              } else if (snapshot.hasError) {
                print("Error is ${snapshot.error}");
                return Center(
                  child: Text(
                    "Đã xảy ra lỗi",
                    style: AppStyles.roboto16semiBold
                        .apply(color: AppColors.primaryColor),
                  ),
                );
              } else {
                var data = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0),
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    var restaurant = data?[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: GestureDetector(
                        onTap: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setInt("restaurantId", restaurant!.id);
                          Get.offAllNamed(Routes.admin, arguments: {
                            "restaurantId": restaurant.id,
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 8.0),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.h),
                              border:
                                  Border.all(color: AppColors.grey, width: 1.h),
                              color: Colors.white),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 0),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                width: 60,
                                height: 70,
                                imageUrl: restaurant?.imageUrl ?? "",
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    width: 60,
                                    height: 70,
                                    color: Colors.grey[300],
                                  ),
                                ),
                                errorWidget: (context, error, stackTrace) {
                                  return Image.asset(
                                    "assets/images/default_image.png",
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                            title: Container(
                              width: double.maxFinite,
                              height: 200.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurant?.name ?? "Restaurant Name",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: AppStyles.roboto16semiBold,
                                  ),
                                  Gap(4),
                                  Text(
                                      restaurant?.address ??
                                          "Restaurant Address",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyles.roboto12regular),
                                ],
                              ),
                            ),
                            trailing: SizedBox(
                                width: 30.w,
                                height: double.maxFinite,
                                child: Container(
                                    height: double.maxFinite,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(Ionicons
                                        .arrow_forward_circle_outline))),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

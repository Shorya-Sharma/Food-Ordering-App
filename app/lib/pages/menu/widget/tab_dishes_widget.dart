import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/values/app_constant.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../controller/menu_controller.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_styles.dart';

class TabDishesView extends StatelessWidget {
  const TabDishesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MenuRestaurantController>();
    return Container(
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          // Container(
          //   width: double.infinity,
          //   height: 50.h,
          //   margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //   child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Container(
          //           width: width * 0.8,
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(5),
          //           ),
          //           child: TextField(
          //             decoration: InputDecoration(
          //               prefixIcon: const Icon(Icons.search),
          //               hintText: 'Search...'.tr,
          //               border: InputBorder.none,
          //             ),
          //             controller: controller.seachController,
          //             onTap: () {
          //               controller.runFilter(controller.seachController.text);
          //             },
          //           ),
          //         ),
          //         InkWell(
          //             onTap: () {
          //               Get.toNamed(Routes.newFood);
          //             },
          //             child: Container(
          //               height: double.infinity,
          //               padding: const EdgeInsets.symmetric(horizontal: 10),
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(5),
          //                 color: Colors.white,
          //               ),
          //               // width: 50.w,
          //               child: Icon(
          //                 Icons.add_circle_outline,
          //                 color: AppColors.black,
          //                 size: 24.w,
          //               ),
          //             ))
          //       ]),
          // ),
          Container(
            height: height * 0.7,
            child: Obx(
              () => FutureBuilder(
                future: controller.dishes.value,
                builder: (context, snapshot) {
                  controller.resultDishes = snapshot.data ?? [];
                  controller.runFilter(controller.seachController.text);
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.data!.isBlank == true) {
                    return Center(
                      child: Text(
                        "Không có tin chờ duyệt mới",
                        style: AppStyles.roboto16semiBold
                            .apply(color: AppColors.primaryColor),
                      ),
                    );
                  } else if (snapshot.data!.isNotEmpty) {
                    return Container(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: Obx(
                        () => ListView.builder(
                          padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0),
                          itemCount: controller.filterDishes.value.length,
                          itemBuilder: (context, index) {
                            var dish = controller.filterDishes.value[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.12,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.h),
                                      color: Colors.white60),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 4.w, vertical: 0),
                                    // horizontalTitleGap: 6,
                                    minLeadingWidth: 0,
                                    minVerticalPadding: 0,
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CachedNetworkImage(
                                        width: 60,
                                        height: 70,
                                        imageUrl: dish.imageUrl,
                                        fit: BoxFit.cover,
                                        errorWidget:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            "assets/images/default_image.png",
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      ),
                                    ),
                                    title: Container(
                                      width: 200.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            dish.name,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: AppStyles.roboto16semiBold,
                                          ),
                                          Gap(4),
                                          Row(
                                            children: [
                                              Text(
                                                  "Price: " +
                                                      dish.price.toString() +
                                                      "VND",
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style:
                                                      AppStyles.roboto12regular),
                                              Gap(4),
                                              const SizedBox.square(
                                                dimension: 10,
                                              ),
                                            ],
                                          ),
                                          Text(dish.description,
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
                                        child: Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 10.h,
                                                child: Switch(
                                                    activeColor: Colors.green,
                                                    value: true,
                                                    inactiveThumbColor:
                                                        Colors.transparent,
                                                    inactiveTrackColor:
                                                        AppColors.grey,
                                                    onChanged: (value) {
                                                      print("Switch");
                                                    }),
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    const Icon(Icons.edit),
                                                    const Icon(Ionicons
                                                        .arrow_forward_circle_outline)
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
                          },
                        ),
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
          ),
        ],
      ),
    );
  }
}

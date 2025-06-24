import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controller/menu_controller.dart';
import 'package:food_delivery_app/pages/categories/restaurant_categories.dart';
import 'package:food_delivery_app/pages/discount_manager/widgets/discount_tab_view.dart';
import 'package:food_delivery_app/pages/menu/widget/restaurant_dishes.dart';
import 'package:food_delivery_app/pages/menu/widget/tab_dishes_widget.dart';
import 'package:food_delivery_app/pages/menu/widget/tab_group_options_widget.dart';
import 'package:food_delivery_app/routes.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_constant.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class MenuRestaurantPage extends StatefulWidget {
  const MenuRestaurantPage({super.key, required this.restaurantId});

  final int restaurantId;

  @override
  State<MenuRestaurantPage> createState() => _MenuRestaurantPageState();
}

class _MenuRestaurantPageState extends State<MenuRestaurantPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  late MenuRestaurantController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<MenuRestaurantController>();
    tabController = TabController(length: 2, vsync: this);
    controller.restaurantId.value = widget.restaurantId;
    controller.getDishes();
    controller.getCategories();
    controller.runFilter("");
    controller.getRestaurantDiscounts();
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              const SizedBox(height: 50),
              ListTile(
                leading: const Icon(Icons.food_bank),
                title: const Text("Add food"),
                onTap: () {
                  Get.toNamed(Routes.newFood);
                },
              ),
              ListTile(
                leading: const Icon(Icons.group),
                title: const Text("Add discount"),
                onTap: () {
                  // Get.toNamed(Routes.newGroupOption);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [],
        title: Text(
          "Restaurant Menu",
          style: AppStyles.roboto20semiBold,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              // Container(
              //   width: double.infinity,
              //   height: 50.h,
              //   // margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(5),
              //   ),
              //   child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Container(
              //           width: width * 0.85,
              //           height: double.infinity,
              //           decoration: BoxDecoration(
              //             color: AppColors.bgButtonColor,
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
              //               controller
              //                   .runFilter(controller.seachController.text);
              //             },
              //           ),
              //         ),
              //         InkWell(
              //             onTap: () {
              //               _showPicker(context);
              //             },
              //             child: Container(
              //               height: double.infinity,
              //               padding: const EdgeInsets.symmetric(horizontal: 10),
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(5),
              //                 color: AppColors.bgButtonColor,
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
              // SizedBox.square(
              //   dimension: 10.h,
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: AppColors.bgButtonColor,
              //     borderRadius: const BorderRadius.all(Radius.circular(12)),
              //   ),
              //   child: TabBar(
              //     labelPadding: EdgeInsets.zero,
              //     isScrollable: false,
              //     labelColor: AppColors.primaryColor,
              //     unselectedLabelColor: AppColors.gery2,
              //     indicatorSize: TabBarIndicatorSize.label,
              //     indicator: BoxDecoration(
              //         color: AppColors.secondary,
              //         borderRadius:
              //             const BorderRadius.all(Radius.circular(12))),
              //     controller: tabController,
              //     onTap: (index) {
              //       controller.currentTabIndex = index;
              //     },
              //     tabs: [
              //       Tab(
              //         child: SizedBox(
              //           // color: AppColors.backgroundColor,
              //           height: height * 0.3,
              //           child: Center(
              //             child: Text("Dishes", style: AppStyles.roboto16semiBold
              //                 // .apply(color: AppColors.black),
              //                 ),
              //           ),
              //         ),
              //       ),
              //       Tab(
              //         child: SizedBox(
              //           // color: AppColors.backgroundColor,
              //           height: height * 0.3,
              //           child: Center(
              //             child: Text("Discounts",
              //                 style: AppStyles.roboto16semiBold
              //                 // .apply(color: AppColors.black),
              //                 ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox.square(
              //   dimension: 10.h,
              // ),
              // Expanded(
              //   child: ClipRRect(
              //     borderRadius: const BorderRadius.all(Radius.circular(12)),
              //     child: TabBarView(
              //       controller: tabController,
              //       children: [
              //         Container(
              //           decoration: BoxDecoration(
              //             color: AppColors.backgroundColor,
              //           ),
              //           child: TabDishesView(),
              //         ),
              //         Container(
              //           decoration: BoxDecoration(
              //             color: AppColors.backgroundColor,
              //           ),
              //           child: TabActiveProductDiscountView(),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox.square(
              //   dimension: 10.h,
              // ),
              RestaurantCategories(),
              _headerItem(),
              RestaurantDishes(
                isShowAddButton: true,
              ),
              TabActiveProductDiscountView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Dishes",
          style: AppStyles.roboto12semiBold,
        ),
        Text(
          "View all",
          style: AppStyles.roboto10regular,
        ),
      ],
    );
  }
}

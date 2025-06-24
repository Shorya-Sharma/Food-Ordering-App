import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controller/voucher_controller.dart';
import 'package:food_delivery_app/pages/voucher/widgets/inactive_voucher_tab_view.dart';
import 'package:food_delivery_app/pages/voucher/widgets/voucher_tab_view.dart';
import 'package:food_delivery_app/resources/components/my_appbar.dart';
import 'package:get/get.dart';

import '../../values/app_colors.dart';
import '../../values/app_constant.dart';
import '../../values/app_styles.dart';

class MyVoucherPage extends StatefulWidget {
  const MyVoucherPage({super.key});

  @override
  State<MyVoucherPage> createState() => _MyVoucherPageState();
}

class _MyVoucherPageState extends State<MyVoucherPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  late VoucherController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<VoucherController>();
    tabController = TabController(length: 2, vsync: this);
    controller.getActiveVouchers();
    controller.getInActiveVouchers();
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
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.group),
                title: const Text("Add group option"),
                onTap: () {
                  // Get.toNamed(Routes.newGroupOption);
                },
              ),
              ListTile(
                leading: const Icon(Icons.category),
                title: const Text("Add category"),
                onTap: () {},
              )
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
      appBar: MyAppbar(
        title: 'Vouchers',
        actions: [],
        isShowBack: false,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              SizedBox.square(
                dimension: 10.h,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.bgButtonColor,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: TabBar(
                  labelPadding: EdgeInsets.zero,
                  isScrollable: false,
                  labelColor: AppColors.primaryColor,
                  unselectedLabelColor: AppColors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25))),
                  controller: tabController,
                  dividerColor: AppColors.white,
                  onTap: (index) {
                    controller.currentTabIndex = index;
                  },
                  tabs: [
                    Tab(
                      child: SizedBox(
                        // color: AppColors.backgroundColor,
                        height: height * 0.3,
                        child: Center(
                          child: Text("Active Voucher",
                              style: AppStyles.roboto14semiBold
                              // .apply(color: AppColors.black),
                              ),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        // color: AppColors.backgroundColor,
                        height: height * 0.3,
                        child: Center(
                          child: Text("Inactive Voucher",
                              style: AppStyles.roboto14semiBold
                              // .apply(color: AppColors.black),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox.square(
                dimension: 10.h,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                        ),
                        child: TabActiveVoucherView(),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                        ),
                        child: TabInactiveVoucherView(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox.square(
                dimension: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

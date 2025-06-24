import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/pages/my_order/tabs/history.dart';
import 'package:food_delivery_app/pages/my_order/tabs/ongoing.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';

import '../../resources/components/my_appbar.dart';
import '../../values/app_constant.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController!.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: MyAppbar(
            title: 'My Order',
            actions: [],
            isShowBack: false,
          ),

          // appBar: AppBar(
          //   centerTitle: true,
          //   automaticallyImplyLeading: false,
          //   title: Text("My Orders"),
          //   bottom: TabBar(
          //     labelPadding: EdgeInsets.zero,
          //     isScrollable: false,
          //     labelColor: AppColors.primaryColor,
          //     unselectedLabelColor: AppColors.black,
          //     indicatorSize: TabBarIndicatorSize.label,
          //     indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
          //     indicator: BoxDecoration(
          //         color: AppColors.secondary,
          //         borderRadius: const BorderRadius.all(Radius.circular(25))),
          //     controller: _tabController,
          //     dividerColor: AppColors.white,
          //     tabs: [
          //       Tab(
          //         child: SizedBox(
          //           // color: AppColors.backgroundColor,
          //           height: height * 0.3,
          //           child: Center(
          //             child: Text("Active Voucher",
          //                 style: AppStyles.roboto14semiBold
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
          //             child: Text("Inactive Voucher",
          //                 style: AppStyles.roboto14semiBold
          //                 // .apply(color: AppColors.black),
          //                 ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // bottom: TabBar(
          //   labelColor: AppColors.primaryColor,
          //   unselectedLabelColor: AppColors.subTextColor,
          //   // controller: _tabController,
          //   indicatorSize: TabBarIndicatorSize.tab,
          //   indicatorWeight: 4,
          //   indicatorColor: AppColors.primaryColor,
          //   padding: EdgeInsets.symmetric(horizontal: 16),
          //   tabs: [
          //     Tab(
          //         icon: Text(
          //       'Ongoing',
          //       style: AppStyles.subText,
          //     )),
          //     Tab(
          //         icon: Text(
          //       'History',
          //       style: AppStyles.subText,
          //     )),
          //   ],
          // ),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                      controller: _tabController,
                      dividerColor: AppColors.white,
                      onTap: (index) {
                        // controller.currentTabIndex = index;
                      },
                      tabs: [
                        Tab(
                          child: SizedBox(
                            // color: AppColors.backgroundColor,
                            height: height * 0.3,
                            child: Center(
                              child: Text("Outgoing",
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
                              child: Text("History",
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
                        controller: _tabController,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                            ),
                            child: Ongoing(),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                            ),
                            child: History(),
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
        ));
  }
}

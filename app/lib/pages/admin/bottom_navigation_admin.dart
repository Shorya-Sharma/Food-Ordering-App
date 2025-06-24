import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/account/account_admin.dart';
import 'package:food_delivery_app/pages/discount_manager/discount_manager_page.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/pages/order_manager/order_manager.dart';
import 'package:food_delivery_app/pages/restaurant_manager/restaurant_manager_page.dart';
import 'package:food_delivery_app/pages/statistic/statistic_page.dart';
import 'package:food_delivery_app/resources/widgets/bottom_navigation_view/bottom_bar_view.dart';
import 'package:food_delivery_app/resources/widgets/tabIcon_data.dart';
import 'package:food_delivery_app/values/app_colors.dart';

import '../menu/menu_restaurant_page.dart';
import '../menu/menu_restaurant_page_2.dart';
import '../restaurant_manager/restaurant_manager_page2.dart';

class AdminBottomHomeScreen extends StatefulWidget {
  final int restaurantId;

  const AdminBottomHomeScreen({Key? key, required this.restaurantId})
      : super(key: key);

  @override
  _AdminBottomHomeScreenState createState() => _AdminBottomHomeScreenState();
}

class _AdminBottomHomeScreenState extends State<AdminBottomHomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: Colors.red,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = false;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = MenuRestaurantPage2(restaurantId: this.widget.restaurantId);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 80),
                    color: AppColors.white,
                    child: tabBody,
                  ),
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {
            print("binh");
            animationController?.reverse().then<dynamic>((data) {
              if (!mounted) {
                return;
              }
              setState(() {
                tabBody =
                    MenuRestaurantPage2(restaurantId: this.widget.restaurantId);
              });
            });
          },
          changeIndex: (int index) {
            if (index == 1) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = OrderManagementScreen();
                });
              });
            } else if (index == 2) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = StatisticPage();
                });
              });
            } else if (index == 3) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = AccountAdminScreen();
                });
              });
            }
          },
        ),
      ],
    );
  }
}

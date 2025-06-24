import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../custom_drawer/home_drawer.dart';
import 'bottom_navigation_admin.dart';

class AdminNavigationHome extends StatefulWidget {
  const AdminNavigationHome({super.key});
  static final String routeName = 'navigation_screen';

  @override
  State<AdminNavigationHome> createState() => _AdminNavigationHomeState();
}

class _AdminNavigationHomeState extends State<AdminNavigationHome> {
  Widget? screenView;
  DrawerIndex? drawerIndex;
  int restaurantId = Get.arguments['restaurantId'];
  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = AdminBottomHomeScreen(
      restaurantId: restaurantId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            backgroundColor: Colors.white12,
            body: screenView,
            // ),
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = AdminBottomHomeScreen(
              restaurantId: restaurantId,
            );
          });
          break;
        case DrawerIndex.Help:
          setState(() {
            screenView = AdminBottomHomeScreen(
              restaurantId: restaurantId,
            );
          });
          break;
        case DrawerIndex.FeedBack:
          setState(() {
            screenView = AdminBottomHomeScreen(
              restaurantId: restaurantId,
            );
          });
          break;
        case DrawerIndex.Invite:
          setState(() {
            screenView = AdminBottomHomeScreen(
              restaurantId: restaurantId,
            );
          });
          break;
        case DrawerIndex.SetTarget:
          setState(() {
            screenView = AdminBottomHomeScreen(
              restaurantId: restaurantId,
            );
          });
          break;
        case DrawerIndex.RunTarget:
          setState(() {
            screenView = AdminBottomHomeScreen(
              restaurantId: restaurantId,
            );
          });
          break;

        default:
          break;
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/chatbot/chatbot.dart';
import 'package:food_delivery_app/pages/home/bottom_navigation_home.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import '../../../../custom_drawer/drawer_user_controller.dart';
import '../../../../custom_drawer/home_drawer.dart';
import 'package:get/get.dart';

class NavigationHome extends StatefulWidget {
  const NavigationHome({super.key});
  static final String routeName = 'navigation_screen';

  @override
  State<NavigationHome> createState() => _NavigationHomeState();
}

class _NavigationHomeState extends State<NavigationHome> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = BottomHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 60),
        child: FloatingActionButton(
            onPressed: () {
              setState(() {
                Get.to(() => ChatPage());
              });
            },
            foregroundColor: Colors.white,
            shape: CircleBorder(),
            backgroundColor: AppColors.primaryColor,
            child: const Icon(Icons.forum)),
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            backgroundColor: Colors.white12,
            body:
                //  DrawerUserController(
                //   screenIndex: drawerIndex,
                //   drawerWidth: MediaQuery.of(context).size.width * 0.75,
                //   onDrawerCall: (DrawerIndex drawerIndexdata) {
                //     changeIndex(drawerIndexdata);
                //     //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
                //   },
                // screenView:
                screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
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
            screenView = BottomHomeScreen();
          });
          break;
        case DrawerIndex.Help:
          setState(() {
            screenView = BottomHomeScreen();
          });
          break;
        case DrawerIndex.FeedBack:
          setState(() {
            screenView = BottomHomeScreen();
          });
          break;
        case DrawerIndex.Invite:
          setState(() {
            screenView = BottomHomeScreen();
          });
          break;
        case DrawerIndex.SetTarget:
          setState(() {
            screenView = BottomHomeScreen();
          });
          break;
        case DrawerIndex.RunTarget:
          setState(() {
            screenView = BottomHomeScreen();
          });
          break;

        default:
          break;
      }
    }
  }
}

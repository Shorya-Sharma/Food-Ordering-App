import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/account/account_page.dart';
import 'package:food_delivery_app/pages/cart/cart_page.dart';
import 'package:food_delivery_app/pages/discount/discount_page.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/pages/my_order/my_order_page.dart';
import 'package:food_delivery_app/pages/voucher/my_voucher_page.dart';
import 'package:food_delivery_app/resources/widgets/bottom_navigation_view/bottom_bar_view.dart';
import 'package:food_delivery_app/resources/widgets/tabIcon_data.dart';
import 'package:food_delivery_app/values/app_colors.dart';

class BottomHomeScreen extends StatefulWidget {
  @override
  _BottomHomeScreenState createState() => _BottomHomeScreenState();
}

class _BottomHomeScreenState extends State<BottomHomeScreen>
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
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = HomePage(animationController: animationController);
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
                  GestureDetector(
                    behavior: HitTestBehavior.deferToChild,
                    child: bottomBar(),
                  ),
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
    var homePage = HomePage();
    var myOrderPage = MyOrderPage();
    var accountScreen = AccountScreen();
    var cartPage = CartPage();
    var discount = MyVoucherPage();
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
                tabBody = homePage;
              });
            });
          },
          changeIndex: (int index) {
            if (index == 0) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = myOrderPage;
                });
              });
            } else if (index == 3) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = accountScreen;
                });
              });
            } else if (index == 1) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = cartPage;
                });
              });
            } else if (index == 2) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = discount;
                });
              });
            }
          },
        ),
      ],
    );
  }
}

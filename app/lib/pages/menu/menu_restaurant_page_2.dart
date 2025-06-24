import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/menu/widget/restaurant_dishes.dart';
import 'package:food_delivery_app/pages/new_food/new_food_page.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../controller/menu_controller.dart';
import '../../routes.dart';
import '../../values/app_styles.dart';
import '../categories/restaurant_categories.dart';
import '../discount_manager/widgets/discount_tab_view.dart';

class MenuRestaurantPage2 extends StatefulWidget {
  const MenuRestaurantPage2({super.key, required this.restaurantId});

  final int restaurantId;

  @override
  State<MenuRestaurantPage2> createState() => _MenuRestaurantPage2State();
}

class _MenuRestaurantPage2State extends State<MenuRestaurantPage2>
    with TickerProviderStateMixin {
  late TabController tabController;
  late ScrollController scrollController;
  late MenuRestaurantController controller;

  final categoryKey = GlobalKey();
  final discountKey = GlobalKey();
  final dishesKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller = Get.find<MenuRestaurantController>();
    tabController = TabController(length: 3, vsync: this);
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);

    controller.restaurantId.value = widget.restaurantId;
    controller.getDishes();
    controller.getCategories();
    controller.runFilter("");
    controller.getRestaurantDiscounts();
  }

  @override
  void dispose() {
    tabController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void _scrollListener() {
    // Determine the offset positions for each section
    final categoryPosition = _getPosition(categoryKey);
    final discountPosition = _getPosition(discountKey);
    final dishesPosition = _getPosition(dishesKey);

    final scrollOffset = scrollController.offset;

    if (scrollOffset >= dishesPosition - 20) {
      tabController.animateTo(1);
    } else if (scrollOffset >= discountPosition - 20) {
      tabController.animateTo(2);
    } else if (scrollOffset >= categoryPosition - 20) {
      tabController.animateTo(0);
    }
  }

  double _getPosition(GlobalKey key) {
    final RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    return box.localToGlobal(Offset.zero).dy + scrollController.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Restaurant Menu",
          style: AppStyles.roboto20semiBold,
        ),
        bottom: TabBar(
          controller: tabController,
          onTap: (index) {
            switch (index) {
              case 0:
                _scrollToSection(categoryKey);
                break;
              case 2:
                _scrollToSection(discountKey);
                break;
              case 1:
                _scrollToSection(dishesKey);
                break;
            }
          },
          tabs: [
            Tab(text: 'Categories'),
            Tab(text: 'Discounts'),
            Tab(text: 'Dishes'),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              _headerItem("Restaurant Categories", () => () {}),
              SizedBox(height: 10), // Space between sections
              Container(
                key: categoryKey,
                child: RestaurantCategories(),
              ),
              SizedBox(height: 10), // Space between sections
              _headerItem("Restaurant Dishes", () => () {}),
              Gap(4),
              Container(
                key: dishesKey,
                child: RestaurantDishes(
                  isShowAddButton: true,
                ),
              ),
              _headerItem("Restaurant Discounts", () => () {}),
              SizedBox(height: 10), // Space between sections
              Container(
                key: discountKey,
                child: TabActiveProductDiscountView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerItem(String title, Function onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.roboto14semiBold,
        ),
        GestureDetector(
          onTap: onTap(),
          child: Row(
            children: [
              Text(
                "View all",
                style: AppStyles.roboto12regular.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Icon(
                Icons.arrow_right,
                color: AppColors.primaryColor,
              )
            ],
          ),
        ),
      ],
    );
  }
}

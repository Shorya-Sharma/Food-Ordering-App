import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/values/app_assets.dart';

class TabIconData {
  TabIconData({
    this.icon,
    this.index = 0,
    this.isSelected = false,
    this.animationController,
  });

  IconData? icon;
  bool isSelected;
  int index;

  AnimationController? animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      icon: Icons.food_bank,
      index: 0,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      icon: Icons.shopping_cart,
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      icon: Icons.discount,
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      icon: Icons.person,
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}

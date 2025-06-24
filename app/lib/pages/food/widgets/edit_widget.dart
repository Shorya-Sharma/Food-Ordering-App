import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/data/model/cartItem/cart_item.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/groupOption.dart/group_option.dart';
import 'package:food_delivery_app/pages/food/widgets/cart_item.dart';

import 'package:food_delivery_app/pages/food/widgets/options_layout.dart';
import 'package:food_delivery_app/repository/cart_repository.dart';
import 'package:food_delivery_app/resources/widgets/button_widget.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class EditWidget extends StatefulWidget {
  final int userId;
  final Dish dish;
  const EditWidget({super.key, required this.userId, required this.dish});

  @override
  State<EditWidget> createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {
  CartRepository cartRepository = Get.find();
  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    cartController.updateCartItems(widget.userId, widget.dish.id);
    return StatefulBuilder(
      builder: ((context, setState) {
        return Container(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          decoration: BoxDecoration(
              color: AppColors.bgButton,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Center(
                          child: Text(
                    'Edit Quantity',
                    style: AppStyles.h4.copyWith(fontSize: 18),
                  ))),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close,
                        color: AppColors.subTextColor,
                      ))
                ],
              ),
              ButtonWidget(
                onPress: () {},
                width: 200,
                text: 'Add dish',
                type: 'outline',
              ),
              SizedBox(height: 20),
              Obx(() {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CartEditWidget(
                              cart: cartController.cartItems[index]);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: cartController.cartItems.length));
              }),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      }),
    );
  }
}

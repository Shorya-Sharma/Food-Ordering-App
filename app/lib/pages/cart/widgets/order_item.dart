import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/data/model/cartItem/cart_item.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/imageFinder/image_finder.dart';
import 'package:food_delivery_app/data/model/itemCartGroupOption/item_cart_group_option.dart';
import 'package:food_delivery_app/pages/cart/cart_page.dart';
import 'package:food_delivery_app/pages/food/widgets/cart_item.dart';
import 'package:food_delivery_app/repository/cart_repository.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderItem extends StatefulWidget {
  final CartItem cart;

  const OrderItem({super.key, required this.cart});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  CartRepository cartRepository = Get.find();
  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<ItemCartGroupOption> itemCartGroupOptions =
        widget.cart.itemCartGroupOptions;
    ;
    List<String> optionNames = [];
    itemCartGroupOptions.forEach((item) {
      item.cartItemOptions.forEach((element) {
        optionNames.add(element.optionItem!.name);
      });
    });
    String options = optionNames.join(", ");

    Dish dish = widget.cart.dish!;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder<String>(
            future: ImageFinder.getImagesLinks(dish.name),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(snapshot.data!),
                            fit: BoxFit.cover)));
              }
              return Container();
            }),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${widget.cart.quantity} x ${dish.name}',
                            style: AppStyles.h4.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            options,
                            style: AppStyles.h4
                                .copyWith(color: AppColors.subTextColor),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      widget.cart.total.toStringAsFixed(0),
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void deleteHandler() async {
    if (widget.cart.quantity > 1) {
      await cartRepository.updateCart(widget.cart.id, widget.cart.quantity - 1);
    } else
      await cartRepository.deleteCart(widget.cart.id);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt("userId") ?? 0;
    cartController.updateCartOfUser(userId, widget.cart.dish!.restaurant!.id);
  }

  void addHandler() async {
    await cartRepository.updateCart(widget.cart.id, widget.cart.quantity + 1);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt("userId") ?? 0;
    cartController.updateCartOfUser(userId, widget.cart.dish!.restaurant!.id);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/data/model/cartItem/cart_item.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/imageFinder/image_finder.dart';
import 'package:food_delivery_app/data/model/itemCartGroupOption/item_cart_group_option.dart';
import 'package:food_delivery_app/pages/cart/cart_page.dart';
import 'package:food_delivery_app/repository/cart_repository.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class CartEditWidget extends StatefulWidget {
  final CartItem cart;
  const CartEditWidget({super.key, required this.cart});

  @override
  State<CartEditWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartEditWidget> {
  CartRepository cartRepository = Get.find();
  CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    Dish dish = widget.cart.dish!;
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

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder<String>(
            future: ImageFinder.getImagesLinks(dish.name),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Image.network(
                  snapshot.data!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                );
              }
              return Container();
            }),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dish.name.toUpperCase(),
                  style: AppStyles.h4
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  options,
                  style: AppStyles.h4
                      .copyWith(fontSize: 14, color: AppColors.subTextColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.cart.total.toStringAsFixed(0)),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: IconButton(
                            padding: EdgeInsets.all(0.0),
                            iconSize: 30,
                            onPressed: deleteHandler,
                            icon: Icon(
                              Icons.remove,
                              size: 18,
                              color: Colors.white,
                            ),
                            style: IconButton.styleFrom(
                                backgroundColor: AppColors.primaryColor),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              widget.cart.quantity.toString(),
                              style: TextStyle(fontSize: 14),
                            )),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: IconButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: addHandler,
                            icon: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.white,
                            ),
                            style: IconButton.styleFrom(
                                backgroundColor: AppColors.primaryColor),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void deleteHandler() async {
    if (widget.cart.quantity > 1) {
      await cartRepository.updateCart(widget.cart.id, widget.cart.quantity - 1);
    } else
      await cartRepository.deleteCart(widget.cart.id);
    cartController.updateCartItems(5, widget.cart.dish!.id);
  }

  void addHandler() async {
    await cartRepository.updateCart(widget.cart.id, widget.cart.quantity + 1);
    cartController.updateCartItems(5, widget.cart.dish!.id);
  }
}

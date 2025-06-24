import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class CartItemWidget extends StatefulWidget {
  final CartItem cart;

  const CartItemWidget({super.key, required this.cart});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
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
        Flexible(
          child: FutureBuilder<String>(
              future: ImageFinder.getImagesLinks(dish.name),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(snapshot.data!),
                              fit: BoxFit.cover)));
                }
                return Container();
              }),
          flex: 2,
        ),
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
                            dish.name,
                            style: AppStyles.h4.copyWith(
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            options,
                            style: AppStyles.h4
                                .copyWith(color: AppColors.subTextColor),
                          ),
                        ],
                      ),
                    ),
                    Obx(() {
                      return !cartController.isEdit.value
                          ? Container()
                          : IconButton(
                              onPressed: () async {
                                await cartRepository.deleteCart(widget.cart.id);
                                cartController.updateCartOfUser(
                                    5, dish.restaurant!.id);
                              },
                              icon: Icon(
                                size: 24,
                                Icons.cancel,
                                color: Colors.red,
                              ));
                    })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${dish.price.toStringAsFixed(0)} VND',
                      style: AppStyles.h4
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Row(
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
          flex: 5,
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

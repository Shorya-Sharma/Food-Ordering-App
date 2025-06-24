import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/pages/cart/confirm_order_page.dart';
import 'package:food_delivery_app/pages/cart/confirm_order_page_2.dart';
import 'package:food_delivery_app/pages/cart/widgets/cart_item_widget.dart';
import 'package:food_delivery_app/repository/cart_repository.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRestaurantPage extends StatefulWidget {
  final Restaurant restaurant;

  const CartRestaurantPage({super.key, required this.restaurant});

  @override
  State<CartRestaurantPage> createState() => _CartRestaurantPageState();
}

class _CartRestaurantPageState extends State<CartRestaurantPage> {
  CartController controller = Get.find();
  CartRepository cartRepository = Get.find();
  int userId = 0;

  void setUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("userId") ?? 0;
    setState(() {
      userId = id;
    });
  }

  @override
  void initState() {
    setUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.updateCartOfUser(userId, widget.restaurant.id);
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: Color(0xffffffff),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 16,
              ),
              onPressed: () {
                Get.back();
              },
              style: IconButton.styleFrom(
                backgroundColor: AppColors.bgButtonColor,
              )),
          title: Text(
            'Cart',
            style: AppStyles.h4.copyWith(fontSize: 18),
          ),
          actions: [
            Obx(() {
              return controller.isEdit.value
                  ? TextButton(
                      onPressed: () {
                        controller.isEdit.value = false;
                      },
                      child: Text('DONE',
                          style: AppStyles.h4.copyWith(
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xff059C6A),
                            color: Color(0xff059C6A),
                          )))
                  : TextButton(
                      onPressed: () {
                        controller.isEdit.value = true;
                      },
                      child: Text('EDIT ITEMS',
                          style: AppStyles.h4.copyWith(
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryColor,
                            color: AppColors.primaryColor,
                          )));
            }),
          ],
        ),
        body: Obx(() {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
                child: ListView.separated(
                    itemBuilder: ((context, index) {
                      return CartItemWidget(
                        cart: controller.myCartItems[index],
                      );
                    }),
                    separatorBuilder: ((context, index) => SizedBox(
                          height: 40,
                        )),
                    itemCount: controller.myCartItems.length),
              ),
              Obx(() {
                return Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      padding: EdgeInsets.only(bottom: 16, left: 16),
                      height: 80,
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.subTextColor,
                                offset: Offset(0, -1),
                                blurRadius: 10)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: 'Total: ',
                                  style: AppStyles.h4.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                  children: [
                                TextSpan(
                                    text: controller.total.value
                                        .toStringAsFixed(0),
                                    style: AppStyles.h4.copyWith(
                                        color: AppColors.primaryColor,
                                        fontSize: 20))
                              ])),
                          SizedBox(
                            width: 40,
                          ),
                          SizedBox(
                            height: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => ConfirmOrderPage(),
                                    arguments: widget.restaurant);
                              },
                              child: Text('Order',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      horizontal:
                                          40), // Adjust padding as needed
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.primaryColor),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                );
              })
            ],
          );
        }));
  }
}

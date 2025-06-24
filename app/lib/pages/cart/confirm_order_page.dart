import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_zalopay_sdk/flutter_zalopay_sdk.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/controller/location_controller.dart';
import 'package:food_delivery_app/controller/order_controller.dart';
import 'package:food_delivery_app/data/constants/snackbar_type.dart';
import 'package:food_delivery_app/data/enum/enums.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/data/request/order_request/order_request.dart';
import 'package:food_delivery_app/pages/cart/order_request_builder/order_request_builder.dart';
import 'package:food_delivery_app/pages/cart/payment_manager/cash_payment_strategy.dart';
import 'package:food_delivery_app/pages/cart/payment_manager/payment_strategy_interface.dart';
import 'package:food_delivery_app/pages/cart/payment_manager/zalo_payment_strategy.dart';
import 'package:food_delivery_app/pages/cart/widgets/order_item.dart';
import 'package:food_delivery_app/pages/cart/widgets/voucher_cart_item.dart';
import 'package:food_delivery_app/pages/cart/widgets/voucher_sheet.dart';
import 'package:food_delivery_app/pages/location/add_location_page.dart';
import 'package:food_delivery_app/pages/payment.dart';
import 'package:food_delivery_app/repository/order_repository.dart';
import 'package:food_delivery_app/resources/snackbar/snackbar_factory.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:food_delivery_app/repository/cart_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/payment_repository.dart';

class ConfirmOrderPage extends StatefulWidget {
  const ConfirmOrderPage({super.key});

  @override
  State<ConfirmOrderPage> createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
  int convertValue(double val) {
    return ((val / 1000).round() * 1000).toInt();
  }

  LocationController locationController = Get.find();
  OrderController orderController = Get.find();
  CartController cartController = Get.find();
  Restaurant restaurant = Get.arguments;
  bool isCash = true;
  double deliveryFee = 0;
  double total = 0;
  OrderRepository orderRepository = Get.find();
  CartRepository cartRepository = Get.find();
  List<int> voucherIds = [];

  @override
  Widget build(BuildContext context) {
    total = cartController.total.value + deliveryFee;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
          'Confirm Order',
          style: AppStyles.h4.copyWith(fontSize: 18),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: height,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('DELIVERY ADDRESS',
                              style: AppStyles.h4
                                  .copyWith(color: AppColors.subTextColor)),
                          TextButton(
                              onPressed: () {
                                Get.to(() => AddLocationPage(
                                      canSelect: true,
                                    ));
                              },
                              child: Text(
                                'EDIT',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primaryColor,
                                    color: AppColors.primaryColor),
                              ))
                        ]),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Color(0xffF0F5FA),
                          borderRadius: BorderRadius.circular(16)),
                      child: Obx(() {
                        return Text(locationController.selectedAddress.value,
                            style: AppStyles.h4.copyWith(
                              color: AppColors.subTextColor,
                            ));
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        restaurant.name,
                        style: AppStyles.h4.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            OrderItem(cart: cartController.myCartItems[index]),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                        itemCount: cartController.myCartItems.length),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              'Total (${cartController.myCartItems.length} dish)',
                              style: AppStyles.subText),
                          Text(cartController.total.value.toStringAsFixed(0),
                              style: AppStyles.subText)
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 0.2,
                      color: Color.fromARGB(255, 147, 146, 145),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery fee: ', style: AppStyles.subText),
                          Text(deliveryFee.toStringAsFixed(0),
                              style: AppStyles.subText)
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 0.2,
                      color: Color.fromARGB(255, 147, 146, 145),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total: ',
                              style: AppStyles.h4.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          Text(total.toStringAsFixed(0),
                              style: AppStyles.h4.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.card_giftcard,
                                size: 24,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Add vouchers', style: AppStyles.h4),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.bottomSheet(
                                  VoucherSheet(
                                    voucherIds: voucherIds,
                                  ),
                                  isScrollControlled: true);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Select vouchers',
                                    style: AppStyles.h4.copyWith(
                                        color: AppColors.subTextColor)),
                                Icon(
                                  Icons.chevron_right,
                                  size: 24,
                                  color: AppColors.subTextColor,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 0.2,
                      color: Color.fromARGB(255, 147, 146, 145),
                    ),
                    Obx(() {
                      return orderController.vouchers.length > 0
                          ? ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Image.asset(
                                    'assets/images/voucher.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  title: Text(
                                      orderController
                                          .vouchers[index].productDiscount.name,
                                      style: AppStyles.h4),
                                  subtitle: Text(
                                      'Discount ${orderController.vouchers[index].productDiscount.discountValue}',
                                      style: AppStyles.h4.copyWith(
                                          color: AppColors.subTextColor)),
                                );
                              },
                              separatorBuilder: (context, index) => Divider(
                                    height: 1,
                                    thickness: 0.2,
                                    color: Color.fromARGB(255, 147, 146, 145),
                                  ),
                              itemCount: orderController.vouchers.length)
                          : Container();
                    })
                  ]),
            ),
          )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration:
                    BoxDecoration(color: AppColors.whiteColor, boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 214, 215, 219),
                      offset: Offset(0, -1),
                      blurRadius: 4)
                ]),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: (width - 50) / 2,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      side: BorderSide(
                                          color: isCash
                                              ? AppColors.subTextColor
                                              : AppColors.primaryColor)),
                                ),
                              ),
                              child: Text(
                                'ZaloPay wallet',
                                style: AppStyles.subText.copyWith(
                                    color: isCash
                                        ? AppColors.subTextColor
                                        : AppColors.primaryColor),
                              ),
                              onPressed: () {
                                setState(() {
                                  isCash = false;
                                });
                              },
                            )),
                        SizedBox(
                            width: (width - 50) / 2,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      side: BorderSide(
                                          color: !isCash
                                              ? AppColors.subTextColor
                                              : AppColors.primaryColor)),
                                ),
                              ),
                              child: Text(
                                'Cash',
                                style: AppStyles.subText.copyWith(
                                    color: !isCash
                                        ? AppColors.subTextColor
                                        : AppColors.primaryColor),
                              ),
                              onPressed: () {
                                setState(() {
                                  isCash = true;
                                });
                              },
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.primaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Text(
                            'Order - ${total.toStringAsFixed(0)}000d',
                            style: AppStyles.subText
                                .copyWith(color: AppColors.whiteColor),
                          ),
                          onPressed: orderHandle,
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }

  void orderHandle() async {
    // double subTotalPrice = 0;
    // cartController.myCartItems.forEach((element) {
    //   for (var item in element.itemCartGroupOptions) {
    //     for (var e in item.cartItemOptions) {
    //       subTotalPrice += e.price * e.quantity;
    //     }
    //   }
    // });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt("userId") ?? 0;
    OrderRequest orderRequest = OrderRequestBuilder()
        .setUserId(userId)
        .addVouchers(orderController.vouchers)
        .addItems(cartController.myCartItems)
        .setDeliveryFee(deliveryFee)
        .setAddress(locationController.selectedAddress.value)
        .build();
    // Map<String, dynamic> data = {
    //   "user_id": 5,
    //   "total_price": total,
    //   "address": locationController.selectedAddress.value,
    //   "voucher_ids": orderController.vouchers.map((e) => e.id).toList(),
    //   "order_items": cartController.myCartItems
    //       .map((item) => {
    //             "dish_id": item.dish!.id,
    //             "quantity": item.quantity,
    //             "item_group_options": item.itemCartGroupOptions
    //                 .map((e) => {
    //                       "group_option_id": e.groupOption!.id,
    //                       "item_options": e.cartItemOptions
    //                           .map((itemOption) => {
    //                                 "option_item_id": itemOption.optionItem!.id,
    //                                 "quantity": itemOption.quantity
    //                               })
    //                           .toList(),
    //                       "sub_total_price": subTotalPrice
    //                     })
    //                 .toList()
    //           })
    //       .toList()
    // };
    PaymentStrategy paymentStrategy;
    if (!isCash) {
      paymentStrategy = ZaloPayStrategy();
    } else {
      paymentStrategy = CashPaymentStrategy();
    }
    paymentStrategy.executePayment(orderRequest).then((value) {
      if (value == PaymentStatus.SUCCESS) {
        orderRepository.createOrder(orderRequest).then((value) {
          SnackbarFactory.instance.showCustomSnackbar(
              context, SnackBarType.success, "Order success!");
        }).catchError((err) {
          SnackbarFactory.instance
              .showCustomSnackbar(context, SnackBarType.error, "Order failed!");
        });
        // for (var cart in cartController.myCartItems) {
        //   cartRepository.deleteCart(cart.id)
        // },
        // cartController.updateCartOfUser(userId, restaurant.id)
      }
    });
    // var result = await createOrder(total.toInt());
    // if (result != null) {
    //   String zpTransToken = result.zptranstoken!;
    //   FlutterZaloPaySdk.payOrder(zpToken: zpTransToken).then((event) {
    //     String paymentStatus;
    //     switch (event) {
    //       case FlutterZaloPayStatus.cancelled:
    //         paymentStatus = "CANCELED";
    //         break;
    //       case FlutterZaloPayStatus.success:
    //         paymentStatus = "PAID";
    //         break;
    //       case FlutterZaloPayStatus.failed:
    //         paymentStatus = "FAILED";
    //         break;
    //       default:
    //         paymentStatus = "FAILED";
    //         break;
    //     }
    // orderRepository.createOrder(orderRequest);
    // for (var cart in cartController.myCartItems) {
    //   cartRepository.deleteCart(cart.id);
    // }
    //
    // int id = prefs.getInt("userId") ?? 0;
    // cartController.updateCartOfUser(userId, restaurant.id);
    // }
  }
}

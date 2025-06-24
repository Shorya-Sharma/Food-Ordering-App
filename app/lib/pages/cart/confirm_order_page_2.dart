import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/enum/enums.dart';
import 'package:get/get.dart';
import 'package:food_delivery_app/controller/confirm_order_controller.dart';
import 'package:food_delivery_app/pages/cart/widgets/order_item.dart';
import 'package:food_delivery_app/pages/cart/widgets/voucher_sheet.dart';
import 'package:food_delivery_app/pages/location/add_location_page.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';

import '../../resources/widgets/back_button_widget.dart';

class ConfirmOrderPage2 extends StatelessWidget {
  final ConfirmOrderController controller = Get.put(ConfirmOrderController());

  @override
  Widget build(BuildContext context) {
    controller.init();
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButtonWidget(() {
          Get.back();
        }),
        title: Text(
          'Confirm Order',
          style: AppStyles.header,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Delivery Address
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'DELIVERY ADDRESS',
                              style: AppStyles.h4
                                  .copyWith(color: AppColors.subTextColor),
                            ),
                            TextButton(
                              onPressed: controller.editLocation,
                              child: Text(
                                'EDIT',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.primaryColor,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(0xffF0F5FA),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Obx(
                            () => Text(
                              controller
                                  .locationController.selectedAddress.value,
                              style: AppStyles.h4
                                  .copyWith(color: AppColors.subTextColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      print(controller.locationController.userLocation.value);
                      controller.locationController
                          .setDistanceFromRestaurant(controller.restaurant);
                      double distance = controller
                          .locationController.distanceFromRestaurant.value;
                      return Text(
                        '* The restaurant is ${distance.toStringAsFixed(2)} km away from you',
                        style: AppStyles.h4,
                      );
                    }),
                    SizedBox(height: 20),
                    // Restaurant Name
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        controller.restaurant.name,
                        style: AppStyles.h4.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                    // Order Items
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => OrderItem(
                          cart: controller.cartController.myCartItems[index]),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemCount: controller.cartController.myCartItems.length,
                    ),
                    SizedBox(height: 20),
                    // Total Amount
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total (${controller.cartController.myCartItems.length} dish)',
                            style: AppStyles.subText,
                          ),
                          Obx(
                            () => Text(
                              controller.cartController.total.value
                                  .toStringAsFixed(0),
                              style: AppStyles.subText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                        height: 1,
                        thickness: 0.2,
                        color: Color.fromARGB(255, 147, 146, 145)),
                    // Delivery Fee
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery fee: ',
                            style: AppStyles.subText,
                          ),
                          Text(
                            controller.deliveryFee.toStringAsFixed(0),
                            style: AppStyles.subText,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                        height: 1,
                        thickness: 0.2,
                        color: Color.fromARGB(255, 147, 146, 145)),
                    // Total Amount with Fee
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total: ',
                            style: AppStyles.h4.copyWith(fontSize: 18),
                          ),
                          Text(
                            controller.total.toStringAsFixed(0),
                            style: AppStyles.h4.copyWith(
                                fontSize: 18, color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    // Add Vouchers
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.card_giftcard,
                                size: 24, color: AppColors.primaryColor),
                            SizedBox(width: 10),
                            Text('Add vouchers', style: AppStyles.h4),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.selectVouchers();
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Select vouchers',
                                  style: AppStyles.h4
                                      .copyWith(color: AppColors.subTextColor)),
                              Icon(Icons.chevron_right,
                                  size: 24, color: AppColors.subTextColor),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // List of Selected Vouchers
                    Obx(
                      () => controller.orderController.vouchers.length > 0
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
                                    controller.orderController.vouchers[index]
                                        .productDiscount.name,
                                    style: AppStyles.h4,
                                  ),
                                  subtitle: Text(
                                    'Discount ${controller.orderController.vouchers[index].productDiscount.discountValue}',
                                    style: AppStyles.h4.copyWith(
                                        color: AppColors.subTextColor),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => Divider(
                                height: 1,
                                thickness: 0.2,
                                color: Color.fromARGB(255, 147, 146, 145),
                              ),
                              itemCount:
                                  controller.orderController.vouchers.length,
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 214, 215, 219),
                    offset: Offset(0, -1),
                    blurRadius: 4,
                  ),
                ],
              ),
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
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.white,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                                side: BorderSide(
                                  color: controller.paymentMethod !=
                                          PaymentMethod.ZALO_PAY
                                      ? AppColors.subTextColor
                                      : AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () => controller
                              .setPaymentStrategy(PaymentMethod.ZALO_PAY),
                          child: Text(
                            'ZaloPay wallet',
                            style: AppStyles.subText.copyWith(
                              color: controller.paymentMethod !=
                                      PaymentMethod.ZALO_PAY
                                  ? AppColors.subTextColor
                                  : AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: (width - 50) / 2,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.white,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                                side: BorderSide(
                                  color: controller.paymentMethod !=
                                          PaymentMethod.CASH
                                      ? AppColors.subTextColor
                                      : AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () =>
                              controller.setPaymentStrategy(PaymentMethod.CASH),
                          child: Text(
                            'Cash',
                            style: AppStyles.subText.copyWith(
                              color:
                                  controller.paymentMethod != PaymentMethod.CASH
                                      ? AppColors.subTextColor
                                      : AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Obx(() {
                    return controller.locationController.distanceFromRestaurant
                                .value >
                            10
                        ? Text(
                            'The app only delivers within a 10 km radius',
                            style: AppStyles.h4.copyWith(color: Colors.red),
                          )
                        : Container();
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(() {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.locationController
                                    .distanceFromRestaurant.value >
                                10
                            ? null
                            : controller.placeOrder,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.grey;
                              }
                              return AppColors
                                  .primaryColor; // Use the component's default.
                            },
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: Text(
                          'Order - ${controller.total.toStringAsFixed(0)}',
                          style: AppStyles.subText
                              .copyWith(color: AppColors.whiteColor),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

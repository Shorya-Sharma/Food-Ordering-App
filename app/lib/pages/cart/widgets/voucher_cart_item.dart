import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/controller/order_controller.dart';
import 'package:food_delivery_app/data/model/product_discount/product_discount.dart';
import 'package:food_delivery_app/data/model/voucher/voucher.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:get/get.dart';

class VoucherCartItem extends StatefulWidget {
  final Voucher voucher;
  VoucherCartItem({super.key, required this.voucher});

  @override
  State<VoucherCartItem> createState() => _VoucherCartItemState();
}

class _VoucherCartItemState extends State<VoucherCartItem> {
  OrderController orderController = Get.find();
  @override
  Widget build(BuildContext context) {
    ProductDiscount discount = widget.voucher.productDiscount;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white, // Change this to your desired color
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              AppAssets.voucherImg,
              width: 50,
              height: 50,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          discount.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Discount ${discount.discountValue}',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    Checkbox(
                        value: orderController.vouchers
                            .map((element) => element.id)
                            .toList()
                            .contains(widget.voucher.id),
                        onChanged: (value) {
                          setState(() {
                            if (orderController.vouchers
                                .map((element) => element.id)
                                .toList()
                                .contains(widget.voucher.id)) {
                              orderController.removeVoucher(widget.voucher);
                            } else {
                              orderController.addVoucher(widget.voucher);
                            }
                          });
                        })
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

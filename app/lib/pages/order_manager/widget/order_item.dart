import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/pages/order_manager/order_state_manager/order_context.dart';
import 'package:food_delivery_app/routes.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

import '../order_state_manager/order_state/canceled_order_state.dart';
import '../order_state_manager/order_state/delivered_order_state.dart';
import '../order_state_manager/order_state/pending_order_state.dart';
import '../order_state_manager/order_state/processing_order_state.dart';

class ItemOrder extends StatefulWidget {
  OrderContext orderContext;
  List<String> funcs;
  List<IconData> iconFuncs;
  Function onSelectedMenu;
  Function onTap;

  ItemOrder({
    required this.orderContext,
    required this.funcs,
    required this.iconFuncs,
    required this.onSelectedMenu,
    required this.onTap,
    super.key,
  });

  @override
  State<ItemOrder> createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder> {
  double sizeImage = 80;

  int selectedMenu = 0;
  Color getColorStatus() {
    if (widget.orderContext.orderState is PendingOrderState) {
      return const Color(0xff49454F);
    } else if (widget.orderContext.orderState is ProcessingOrderState) {
      return AppColors.primaryColor;
    } else if (widget.orderContext.orderState is DeliveredOrderState) {
      return AppColors.grey;
    } else if (widget.orderContext.orderState is CanceledOrderState) {
      return AppColors.red;
    } else {
      return Colors
          .transparent; // default color in case none of the conditions are met
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.orderContext);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // image
                  Container(
                    margin: EdgeInsets.only(top: 25.h, right: 8),
                    height: 40.h,
                    width: 30.w,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      widget.orderContext.order.id.toString(),
                      style: AppStyles.roboto20semiBold
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.orderContext.order.user != null
                              ? widget.orderContext.order.user!.fullname
                                  .toString()
                              : "",
                          style: AppStyles.roboto16semiBold
                              .copyWith(color: getColorStatus()),
                        ),
                        const SizedBox(height: 5),
                        Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Text(
                                "${widget.orderContext.order.items.length} Dishes   ${widget.orderContext.order.price.toString()}VND",
                                style: AppStyles.roboto14semiBold,
                              ),
                              ...widget.orderContext.order.items
                                  .map((e) => Text(
                                        "${e.quantity.toString()}x ${e.dish!.name.toString()}",
                                        style: AppStyles.roboto12regular,
                                      ))
                                  .toList(),
                            ])),
                        const SizedBox(height: 5),
                        Text(widget.orderContext.order.address.toString(),
                            style: AppStyles.roboto14regular.copyWith(
                              color: const Color(0xff49454F),
                            )),
                      ],
                    ),
                  ),
                  // column text
                  const SizedBox(width: 8),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                PopupMenuButton<int>(
                  initialValue: selectedMenu,
                  // Callback that sets the selected popup menu item.
                  onSelected: (int item) {
                    setState(() {
                      selectedMenu = item;
                      widget.onSelectedMenu(item, widget.orderContext);
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                      widget.funcs.asMap().entries.map(
                    (e) {
                      int i = e.key;
                      String val = e.value;
                      return PopupMenuItem<int>(
                        value: i,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(widget.iconFuncs[i]),
                            const SizedBox(width: 15),
                            Text(val),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.orderDetailManager, arguments: {
                      "orderContext": widget.orderContext,
                    });
                  },
                  child: Container(
                    height: 35.h,
                    width: 90.h,
                    decoration: BoxDecoration(
                        color: AppColors.bgButtonColor,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      "View more",
                      style: AppStyles.roboto12regular.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                )
              ],
            ),
            // more icon
          ],
        ),
      ),
    );
  }
}

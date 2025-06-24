import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/order_manager_controller.dart';
import 'package:food_delivery_app/pages/order_manager/order_state_manager/order_context.dart';
import 'package:food_delivery_app/pages/order_manager/widget/order_item.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class PendingOrders extends StatelessWidget {
  PendingOrders({super.key});
  final OrderManagerController controller = Get.find<OrderManagerController>();

  void onSelectedMenu(int i, OrderContext order) {
    if (i == 0) {
      order.acceptOrder();
    } else if (i == 1) {
      order.rejectOrder();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.rxPendingOrders.isEmpty
        ? Center(
            child: Text(
              "Don't have any pending orders yet",
              style: AppStyles.roboto14regular,
            ),
          )
        : ListView.builder(
            itemCount: controller.rxPendingOrders.length,
            itemBuilder: (context, index) {
              return ItemOrder(
                orderContext: controller.rxPendingOrders[index],
                funcs: const [
                  "Accept",
                  "Reject",
                ],
                iconFuncs: const [
                  Icons.check,
                  Icons.close,
                ],
                onSelectedMenu: onSelectedMenu,
                onTap: (OrderContext order) {},
              );
            },
          ));
  }
}

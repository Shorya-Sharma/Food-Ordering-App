import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/order_manager_controller.dart';
import 'package:food_delivery_app/data/constants/order_status.dart';
import 'package:food_delivery_app/pages/order_manager/widget/canceled_order.dart';
import 'package:food_delivery_app/pages/order_manager/widget/delivered_order.dart';
import 'package:food_delivery_app/pages/order_manager/widget/delivering_order.dart';
import 'package:food_delivery_app/pages/order_manager/widget/pending_order.dart';
import 'package:food_delivery_app/pages/order_manager/widget/processing_order.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_extension.dart';
import 'package:get/get.dart';

import '../../values/app_styles.dart';

class OrderManagementScreen extends StatefulWidget {
  OrderManagementScreen({super.key});

  @override
  State<OrderManagementScreen> createState() => _OrderManagementScreenState();
}

class _OrderManagementScreenState extends State<OrderManagementScreen> {
  final OrderManagerController controller = Get.find<OrderManagerController>();

  @override
  void initState() {
    controller.getPrefs().then((value) => controller.getPendingOrders());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: Text(
              'Order Management',
              style: AppStyles.roboto20semiBold,
            ),
            elevation: 0,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50.0),
                child: ColoredBox(
                  color: AppColors.white,
                  child: TabBar(
                      isScrollable: true,
                      unselectedLabelColor:
                          const Color.fromARGB(206, 73, 69, 79),
                      indicator: UnderlineTabIndicator(
                        borderSide:
                            BorderSide(color: AppColors.primaryColor, width: 2),
                      ),
                      dividerColor: AppColors.gery2,
                      labelColor: AppColors.primaryColor,
                      labelStyle: AppStyles.roboto12semiBold,
                      onTap: (index) {
                        switch (index) {
                          case 0:
                            controller.getPendingOrders();
                            break;
                          case 1:
                            controller.getProcessingOrders();
                            break;
                          case 2:
                            controller.getDeliveredOrders();
                            break;
                          case 3:
                            controller.getCanceledOrders();
                            break;
                          case 4:
                            controller.getDeliveringOrders();
                        }
                      },
                      tabs: OrderStatus.values.map((e) {
                        return Tab(
                          child: Text(e.toString().split('.').last.toCapital),
                        );
                      }).toList()),
                )),
          ),
          body: TabBarView(
            children: <Widget>[
              PendingOrders(),
              ProcessingOrders(),
              DeliveringOrders(),
              DeliveredOrders(),
              CanceledOrders()
            ],
          )),
    );
  }
}

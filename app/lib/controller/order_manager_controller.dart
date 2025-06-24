import 'dart:async';

import 'package:food_delivery_app/pages/order_manager/order_state_manager/order_context.dart';
import 'package:food_delivery_app/repository/order_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/constants/order_status.dart';
import '../data/model/Order/order.dart';

class OrderManagerController extends GetxController {
  final OrderRepository orderRepository;
  OrderManagerController({required this.orderRepository});
  RxList<OrderContext> rxPendingOrders = RxList<OrderContext>([]);
  RxList<OrderContext> rxDeliveredOrders = RxList<OrderContext>([]);
  RxList<OrderContext> rxCanceledOrders = RxList<OrderContext>([]);
  RxList<OrderContext> rxProcessingOrders = RxList<OrderContext>([]);
  RxList<OrderContext> rxDeliveringOrders = RxList<OrderContext>([]);
  Future<bool> changeStatus(OrderContext orderContext, OrderStatus status) async{
    bool result = await orderRepository.updateOrderStatus(orderContext.order.id, status);
    if(result == true) {
      getOrdersListByStatus(orderContext.orderState.getStatusName()).remove(orderContext);
      getOrdersListByStatus(status).add(orderContext);
    }
    return result;
  }

  late Future<List<Order>> pendingOrders;
  late Future<List<Order>> deliveredOrders;
  late Future<List<Order>> canceledOrders;
  late Future<List<Order>> processingOrders;
  late Future<List<Order>> deliveringOrders;
  Future<void> getPrefs() async{
    final prefs = await SharedPreferences.getInstance();
    restaurantId.value = prefs.getInt('restaurantId')!;
  }
  RxInt restaurantId = 1.obs;
  void getPendingOrders() {
    pendingOrders = orderRepository.getPendingOrderByRestaurant(restaurantId.value);
    pendingOrders.then((value) {
      rxPendingOrders.clear();
      rxPendingOrders
          .addAll(value.map((order) => OrderContext(order, this)).toList());
    });
  }

  void getDeliveredOrders() {
    deliveredOrders =
        orderRepository.getDeliveredOrderByRestaurant(restaurantId.value);
    deliveredOrders.then((value) {
      rxDeliveredOrders.clear();
      rxDeliveredOrders
          .addAll(value.map((order) => OrderContext(order, this)).toList());
    });
  }

  void getProcessingOrders() {
    processingOrders =
        orderRepository.getProcessingOrderByRestaurant(restaurantId.value);
    processingOrders.then((value) {
      rxProcessingOrders.clear();
      rxProcessingOrders
          .addAll(value.map((order) => OrderContext(order, this)).toList());
    });
  }

  void getCanceledOrders() {
    canceledOrders = orderRepository.getCanceledOrderByRestaurant(restaurantId.value);
    canceledOrders.then((value) {
      rxCanceledOrders.clear();
      rxCanceledOrders
          .addAll(value.map((order) => OrderContext(order, this)).toList());
    });
  }

  void getDeliveringOrders() {
    deliveringOrders =
        orderRepository.getDeliveringOrderByRestaurant(restaurantId.value);
    deliveringOrders.then((value) {
      rxDeliveringOrders.clear();
      rxDeliveringOrders
          .addAll(value.map((order) => OrderContext(order, this)).toList());
    });
  }
  RxList<OrderContext> getOrdersListByStatus(OrderStatus status){
    switch (status) {
      case OrderStatus.PENDING:
        return rxPendingOrders;
      case OrderStatus.PROCESSING:
        return rxProcessingOrders;
      case OrderStatus.DELIVERED:
        return rxDeliveredOrders;
      case OrderStatus.CANCELED:
        return rxCanceledOrders;
      case OrderStatus.DELIVERING:
        return rxDeliveringOrders;
    }
  }
}

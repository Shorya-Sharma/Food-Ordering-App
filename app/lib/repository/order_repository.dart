import 'package:dartz/dartz.dart';
import 'package:food_delivery_app/common/repository/repository_helper.dart';
import 'package:food_delivery_app/data/api/order/order_api.dart';
import 'package:food_delivery_app/data/constants/order_status.dart';
import 'package:food_delivery_app/data/model/Order/order.dart' as orderModel;
import 'package:food_delivery_app/data/request/order_request/order_request.dart';

class OrderRepository with RepositoryHelper<orderModel.Order> {
  final OrderApi orderApi;

  const OrderRepository({required this.orderApi});

  Future<Either<String, bool>> createOrder(OrderRequest orderRequest) async {
    return checkItemFailOrSuccess(orderApi.createOrder(orderRequest.toJson()));
  }

  Future<List<orderModel.Order>> getByUser(int userId) async {
    return orderApi.getByUser(userId);
  }

  Future<List<orderModel.Order>> getCanceledOrderByRestaurant(
      int restaurantId) async {
    return orderApi.getOrderByRestaurantAndStatus(
        restaurantId, OrderStatus.CANCELED);
  }

  Future<List<orderModel.Order>> getPendingOrderByRestaurant(
      int restaurantId) async {
    return orderApi.getOrderByRestaurantAndStatus(
        restaurantId, OrderStatus.PENDING);
  }

  Future<List<orderModel.Order>> getDeliveredOrderByRestaurant(
      int restaurantId) async {
    return orderApi.getOrderByRestaurantAndStatus(
        restaurantId, OrderStatus.DELIVERED);
  }

  Future<List<orderModel.Order>> getProcessingOrderByRestaurant(
      int restaurantId) async {
    return orderApi.getOrderByRestaurantAndStatus(
        restaurantId, OrderStatus.PROCESSING);
  }

  Future<List<orderModel.Order>> getDeliveringOrderByRestaurant(
      int restaurantId) async {
    return orderApi.getOrderByRestaurantAndStatus(
        restaurantId, OrderStatus.DELIVERING);
  }
  Future<bool> updateOrderStatus(int orderId, OrderStatus status) async {
    return  orderApi.updateOrderStatus(status, orderId);
  }
}

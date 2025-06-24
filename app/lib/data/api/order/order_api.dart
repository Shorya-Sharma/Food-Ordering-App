import 'package:food_delivery_app/common/network/api_helper.dart';
import 'package:food_delivery_app/common/network/dio_client.dart';
import 'package:food_delivery_app/common/network/dio_client_2.dart';
import 'package:food_delivery_app/data/constants/order_status.dart';
import 'package:food_delivery_app/data/model/Order/order.dart';
import 'package:food_delivery_app/values/app_config.dart';

class OrderApi with ApiHelper<Order> {
  final DioClient dioClient;

  OrderApi({required this.dioClient});

  Future<bool> createOrder(Map<String, dynamic> Order) async {
    return await makePostRequest(
        DioClient2.dio.post("${ApiConfig.order}", data: Order));
  }

  Future<List<Order>> getByUser(int userId) async {
    var listOrder = await makeGetRequest(
        DioClient2.dio.get("${ApiConfig.order}/user",
            queryParameters: {"userId": userId}),
        Order.fromJson);
    return listOrder;
  }

  Future<List<Order>> getOrderByRestaurantAndStatus(
      int restaurantId, OrderStatus orderStatus) async {
    var listOrder = await makeGetRequest(
        DioClient2.dio.get("${ApiConfig.order}/restaurant", queryParameters: {
          "restaurantId": restaurantId,
          "orderStatus": OrderStatusType.getStringName(orderStatus)
        }),
        Order.fromJson);
    return listOrder;
  }

  Future<bool> updateOrderStatus(OrderStatus orderStatus, int orderId) async {
    return await makePutRequest(
      DioClient2.dio.put("${ApiConfig.order}/$orderId", queryParameters: {
        "orderStatus": OrderStatusType.getStringName(orderStatus)
      }),
    );
  }
}

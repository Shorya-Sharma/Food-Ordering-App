import 'package:food_delivery_app/data/model/orderLineItem/order_line_item.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/data/model/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order.g.dart';
part 'order.freezed.dart';

@Freezed()
class Order with _$Order {
  const factory Order({
    @Default(0) int id,
    User? user,
    Restaurant? restaurant,
    @Default("") String orderStatus,
    @Default("") String deliveryStatus,
    @Default("") String failureMessages,
    @Default(0) double price,
    @Default("") String address,
    @Default([]) List<OrderLineItem> items,
  }) = _Order;
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

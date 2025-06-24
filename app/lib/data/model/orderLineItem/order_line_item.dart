import 'package:food_delivery_app/data/model/address/address.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/dishType/dish_type.dart';
import 'package:food_delivery_app/data/model/order/order.dart';
import 'package:food_delivery_app/data/model/orderLineItemGroupOption/order_line_item_group_option.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/data/model/category/category.dart';
import 'package:food_delivery_app/data/model/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_line_item.g.dart';
part 'order_line_item.freezed.dart';

@Freezed()
class OrderLineItem with _$OrderLineItem {
  const factory OrderLineItem({
    @Default(0) int id,
    Order? order,
    @Default([]) List<OrderLineItemGroupOption> orderLineItemGroupOptions,
    Dish? dish,
    @Default(0) int quantity,
    @Default(0) double subTotal,
  }) = _OrderLineItem;
  factory OrderLineItem.fromJson(Map<String, dynamic> json) =>
      _$OrderLineItemFromJson(json);
}

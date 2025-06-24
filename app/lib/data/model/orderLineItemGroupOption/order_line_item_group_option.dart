import 'package:food_delivery_app/data/model/address/address.dart';
import 'package:food_delivery_app/data/model/dishType/dish_type.dart';
import 'package:food_delivery_app/data/model/groupOption.dart/group_option.dart';
import 'package:food_delivery_app/data/model/orderLineItemOptionItem/order_line_item_option_item.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/data/model/category/category.dart';
import 'package:food_delivery_app/data/model/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../orderLineItem/order_line_item.dart';
part 'order_line_item_group_option.g.dart';
part 'order_line_item_group_option.freezed.dart';

@Freezed()
class OrderLineItemGroupOption with _$OrderLineItemGroupOption {
  const factory OrderLineItemGroupOption(
      {@Default(0) int id,
      OrderLineItem? orderLineItem,
      GroupOption? groupOption,
      @Default([]) List<OrderLineItemOptionItem> orderLineItemOptions,
      @Default(0) double groupOptionSubtotal}) = _OrderLineItemGroupOption;
  factory OrderLineItemGroupOption.fromJson(Map<String, dynamic> json) =>
      _$OrderLineItemGroupOptionFromJson(json);
}

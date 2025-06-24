import 'package:food_delivery_app/data/model/address/address.dart';
import 'package:food_delivery_app/data/model/dishType/dish_type.dart';
import 'package:food_delivery_app/data/model/optionItem/option_item.dart';
import 'package:food_delivery_app/data/model/orderLineItem/order_line_item.dart';
import 'package:food_delivery_app/data/model/orderLineItemGroupOption/order_line_item_group_option.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/data/model/category/category.dart';
import 'package:food_delivery_app/data/model/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_line_item_option_item.g.dart';
part 'order_line_item_option_item.freezed.dart';

@Freezed()
class OrderLineItemOptionItem with _$OrderLineItemOptionItem {
  const factory OrderLineItemOptionItem(
      {@Default(0) int id,
      OrderLineItemGroupOption? orderLineItem_GroupOption,
      OptionItem? optionItem,
      @Default(0) int quantity,
      @Default(0) double price}) = _OrderLineItemOptionItem;
  factory OrderLineItemOptionItem.fromJson(Map<String, dynamic> json) =>
      _$OrderLineItemOptionItemFromJson(json);
}

import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/dishType/dish_type.dart';
import 'package:food_delivery_app/data/model/itemCartGroupOption/item_cart_group_option.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/data/model/category/category.dart';
import 'package:food_delivery_app/data/model/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cart_item.g.dart';
part 'cart_item.freezed.dart';

@Freezed()
class CartItem with _$CartItem {
  const factory CartItem({
    @Default(0) int id,
    User? user,
    Dish? dish,
    @JsonKey(name: "cartItem_groupOptions")
    @Default([])
    List<ItemCartGroupOption> itemCartGroupOptions,
    @Default(0) int quantity,
    @Default(0) double total,
  }) = _CartItem;
  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}

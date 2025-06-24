import 'package:food_delivery_app/data/model/cartItem/cart_item.dart';
import 'package:food_delivery_app/data/model/cartItemOptionItem/cart_item_option_item.dart';
import 'package:food_delivery_app/data/model/groupOption.dart/group_option.dart';
import 'package:food_delivery_app/data/model/category/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'item_cart_group_option.freezed.dart';
part 'item_cart_group_option.g.dart';

@Freezed()
class ItemCartGroupOption with _$ItemCartGroupOption {
  const factory ItemCartGroupOption({
    @Default(0) int id,
    CartItem? cartItem,
    Category? category,
    GroupOption? groupOption,
    @Default([]) List<CartItemOptionItem> cartItemOptions,
    @Default(0) double groupOptionSubtotal,
  }) = _ItemCartGroupOption;
  factory ItemCartGroupOption.fromJson(Map<String, dynamic> json) =>
      _$ItemCartGroupOptionFromJson(json);
}

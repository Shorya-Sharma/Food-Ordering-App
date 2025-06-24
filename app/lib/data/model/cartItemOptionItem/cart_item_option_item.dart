import 'package:food_delivery_app/data/model/groupOption.dart/group_option.dart';
import 'package:food_delivery_app/data/model/optionItem/option_item.dart';
import 'package:food_delivery_app/data/model/itemCartGroupOption/item_cart_group_option.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cart_item_option_item.g.dart';
part 'cart_item_option_item.freezed.dart';

@Freezed()
class CartItemOptionItem with _$CartItemOptionItem {
  const factory CartItemOptionItem({
    @Default(0) int id,
    @JsonKey(name: "cartItem_groupOption")
    ItemCartGroupOption? itemCartGroupOption,
    OptionItem? optionItem,
    GroupOption? groupOption,
    @Default(0) int quantity,
    @Default(0) double price,
  }) = _CartItemOptionItem;
  factory CartItemOptionItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemOptionItemFromJson(json);
}

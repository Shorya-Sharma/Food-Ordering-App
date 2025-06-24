import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/groupOption.dart/group_option.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'option_item.g.dart';
part 'option_item.freezed.dart';

@Freezed()
class OptionItem with _$OptionItem {
  const factory OptionItem({
    @Default(0) int id,
    GroupOption? groupOption,
    @Default("") String name,
    @Default(0) double price,
    @Default("") String description,
  }) = _OptionItem;
  factory OptionItem.fromJson(Map<String, dynamic> json) =>
      _$OptionItemFromJson(json);
}

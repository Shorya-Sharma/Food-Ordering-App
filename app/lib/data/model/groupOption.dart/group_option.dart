import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/optionItem/option_item.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'group_option.g.dart';
part 'group_option.freezed.dart';

@Freezed()
class GroupOption with _$GroupOption {
  const factory GroupOption({
    @Default(0) int id,
    Restaurant? restaurant,
    @Default([]) List<OptionItem> optionItems,
    @Default("") String name,
    @Default(0) int minimum,
    @Default(0) int maximum,
    @Default(true) bool optional,
  }) = _GroupOption;
  factory GroupOption.fromJson(Map<String, dynamic> json) =>
      _$GroupOptionFromJson(json);
}

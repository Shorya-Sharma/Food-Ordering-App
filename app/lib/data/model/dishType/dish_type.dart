import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'dish_type.g.dart';
part 'dish_type.freezed.dart';

@Freezed()
class DishType with _$DishType {
  const factory DishType({
    @Default(0) int id,
    @Default("") String name,
    @Default([]) List<Dish> dishes,
  }) = _DishType;
  factory DishType.fromJson(Map<String, dynamic> json) =>
      _$DishTypeFromJson(json);
}

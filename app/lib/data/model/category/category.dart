import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'category.g.dart';
part 'category.freezed.dart';

@Freezed()
class Category with _$Category {
  const factory Category({
    @Default(0) int id,
    @Default("") String name,
    @Default(0) int dish_quantity,
    @Default(false) bool is_active,
    @Default("") String imageUrl,
    @Default(0) int restaurant_id,
    @Default([]) List<Dish> dishes,
  }) = _Category;
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

import 'package:food_delivery_app/data/model/category/category.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/data/model/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'restaurant_of_dish.g.dart';
part 'restaurant_of_dish.freezed.dart';

@Freezed()
class RestaurantOfDish with _$RestaurantOfDish {
  const factory RestaurantOfDish(
      {Restaurant? restaurant, //
      //
      @Default(0) double totalPrice,
      @Default(0) int quantity}) = _RestaurantOfDish;
  factory RestaurantOfDish.fromJson(Map<String, dynamic> json) =>
      _$RestaurantOfDishFromJson(json);
}

import 'package:food_delivery_app/data/model/dishType/dish_type.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/data/model/category/category.dart';
import 'package:food_delivery_app/repository/restaurant_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'dish.g.dart';

part 'dish.freezed.dart';

@Freezed()
class Dish with _$Dish {
  const factory Dish({
    @Default(0) int id,
    Restaurant? restaurant,
    Category? category,
    DishType? dishType,
    @Default("") String name,
    @Default("") String description,
    @Default("") String imageUrl,
    @Default("") String status,
    @Default(0) double price,
    @Default(4) int restaurantId,
  }) = _Dish;

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);
}

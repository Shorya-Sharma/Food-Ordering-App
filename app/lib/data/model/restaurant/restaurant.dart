import 'package:food_delivery_app/data/model/address/address.dart';
import 'package:food_delivery_app/data/model/category/category.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@Freezed()
class Restaurant with _$Restaurant {
  const factory Restaurant({
    @Default(0) int id, //
    @Default("") String name, //
    @Default(0) double rate,
    @Default([]) List<Dish> dishes,
    @Default("") String imageUrl, //
    @Default("") String description, //
    @Default("") String coverImageUrl, //
    @Default("") String mainDish,
    @Default("") String status,
    @Default([]) List<Category> categories, //
    String? address,
    User? owner, //
    @Default("") String latitude,
    @Default("") String longitude,
    @Default("") String locationId,
    @Default(0) int numReviews,
    @Default("0") String rating,
  }) = _Restaurant;
  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}

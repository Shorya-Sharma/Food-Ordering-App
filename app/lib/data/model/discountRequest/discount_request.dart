import 'package:food_delivery_app/data/model/dishType/dish_type.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/data/model/category/category.dart';
import 'package:food_delivery_app/repository/restaurant_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
part 'discount_request.g.dart';
part 'discount_request.freezed.dart';

@Freezed()
class DiscountRequest with _$DiscountRequest {
  const factory DiscountRequest(
      {@Default(0) int dishId,
      @Default(0) int restaurantId,
      @Default("") String name,
      @Default("") String conditions,
      @Default(0) double discountValue,
      @Default("") String discountType,
      @Default(0) int discountUnit,
      required DateTime validFrom,
      required DateTime validTo,
      @Default("") String couponCode,
      @Default(0) double minimumOrderValue,
      @Default(0) double maximumDiscountValue}) = _DiscountRequest;
  factory DiscountRequest.fromJson(Map<String, dynamic> json) =>
      _$DiscountRequestFromJson(json);
}

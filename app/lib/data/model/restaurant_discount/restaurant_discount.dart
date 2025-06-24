import 'package:freezed_annotation/freezed_annotation.dart';
import '../dish/dish.dart';

part 'restaurant_discount.freezed.dart';
part 'restaurant_discount.g.dart';

@freezed
class RestaurantDiscount with _$RestaurantDiscount {
  const factory RestaurantDiscount({
    @Default(0) int id,
    required DateTime createdAt,
    @Default("") String name,
    @Default("") String conditions,
    @Default("") String couponCode,
    double? discountValue,
    @Default(1) int maxUsed,
    DateTime? validFrom,
    DateTime? validTo,
    @Default(0.0) double minimumOrderValue,
    double? maximumDiscountValue,
    @Default("") String discountType,
    int? restaurantId,
  }) = _RestaurantDiscount;

  factory RestaurantDiscount.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDiscountFromJson(json);
}

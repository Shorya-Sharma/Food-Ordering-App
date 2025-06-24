import 'package:freezed_annotation/freezed_annotation.dart';

import '../dish/dish.dart';

part 'product_discount.freezed.dart';
part 'product_discount.g.dart';

@Freezed()
class ProductDiscount with _$ProductDiscount {
  const factory ProductDiscount({
    @Default(0) int id,
    required Dish dish,
    @Default("") String name,
    @Default("") String conditions,
    @Default(0) double discountValue,
    @Default(0) int discountUnit,
    @Default(0) int maxUsed,
    DateTime? validFrom,
    DateTime? validTo,
    DateTime? createdTime,
    @Default("") String couponCode,
    @Default(0.0) double minimumOrderValue,
    @Default(0.0) double maximumDiscountValue,
    @Default("") String discountType,
  }) = _ProductDiscount;

  factory ProductDiscount.fromJson(Map<String, dynamic> json) =>
      _$ProductDiscountFromJson(json);
}

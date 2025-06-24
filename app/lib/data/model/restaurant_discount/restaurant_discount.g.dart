// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantDiscountImpl _$$RestaurantDiscountImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantDiscountImpl(
      id: json['id'] as int? ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      name: json['name'] as String? ?? "",
      conditions: json['conditions'] as String? ?? "",
      couponCode: json['couponCode'] as String? ?? "",
      discountValue: (json['discountValue'] as num?)?.toDouble(),
      maxUsed: json['maxUsed'] as int? ?? 1,
      validFrom: json['validFrom'] == null
          ? null
          : DateTime.parse(json['validFrom'] as String),
      validTo: json['validTo'] == null
          ? null
          : DateTime.parse(json['validTo'] as String),
      minimumOrderValue: (json['minimumOrderValue'] as num?)?.toDouble() ?? 0.0,
      maximumDiscountValue: (json['maximumDiscountValue'] as num?)?.toDouble(),
      discountType: json['discountType'] as String? ?? "",
      restaurantId: json['restaurantId'] as int?,
    );

Map<String, dynamic> _$$RestaurantDiscountImplToJson(
        _$RestaurantDiscountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'name': instance.name,
      'conditions': instance.conditions,
      'couponCode': instance.couponCode,
      'discountValue': instance.discountValue,
      'maxUsed': instance.maxUsed,
      'validFrom': instance.validFrom?.toIso8601String(),
      'validTo': instance.validTo?.toIso8601String(),
      'minimumOrderValue': instance.minimumOrderValue,
      'maximumDiscountValue': instance.maximumDiscountValue,
      'discountType': instance.discountType,
      'restaurantId': instance.restaurantId,
    };

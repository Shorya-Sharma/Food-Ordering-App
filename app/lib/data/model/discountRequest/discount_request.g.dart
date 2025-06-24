// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiscountRequestImpl _$$DiscountRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$DiscountRequestImpl(
      dishId: json['dishId'] as int? ?? 0,
      restaurantId: json['restaurantId'] as int? ?? 0,
      name: json['name'] as String? ?? "",
      conditions: json['conditions'] as String? ?? "",
      discountValue: (json['discountValue'] as num?)?.toDouble() ?? 0,
      discountType: json['discountType'] as String? ?? "",
      discountUnit: json['discountUnit'] as int? ?? 0,
      validFrom: DateTime.parse(json['validFrom'] as String),
      validTo: DateTime.parse(json['validTo'] as String),
      couponCode: json['couponCode'] as String? ?? "",
      minimumOrderValue: (json['minimumOrderValue'] as num?)?.toDouble() ?? 0,
      maximumDiscountValue:
          (json['maximumDiscountValue'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$DiscountRequestImplToJson(
        _$DiscountRequestImpl instance) =>
    <String, dynamic>{
      'dishId': instance.dishId,
      'restaurantId': instance.restaurantId,
      'name': instance.name,
      'conditions': instance.conditions,
      'discountValue': instance.discountValue,
      'discountType': instance.discountType,
      'discountUnit': instance.discountUnit,
      'validFrom': instance.validFrom.toIso8601String(),
      'validTo': instance.validTo.toIso8601String(),
      'couponCode': instance.couponCode,
      'minimumOrderValue': instance.minimumOrderValue,
      'maximumDiscountValue': instance.maximumDiscountValue,
    };

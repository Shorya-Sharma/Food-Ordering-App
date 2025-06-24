// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDiscountImpl _$$ProductDiscountImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductDiscountImpl(
      id: json['id'] as int? ?? 0,
      dish: Dish.fromJson(json['dish'] as Map<String, dynamic>),
      name: json['name'] as String? ?? "",
      conditions: json['conditions'] as String? ?? "",
      discountValue: (json['discountValue'] as num?)?.toDouble() ?? 0,
      discountUnit: json['discountUnit'] as int? ?? 0,
      maxUsed: json['maxUsed'] as int? ?? 0,
      validFrom: json['validFrom'] == null
          ? null
          : DateTime.parse(json['validFrom'] as String),
      validTo: json['validTo'] == null
          ? null
          : DateTime.parse(json['validTo'] as String),
      createdTime: json['createdTime'] == null
          ? null
          : DateTime.parse(json['createdTime'] as String),
      couponCode: json['couponCode'] as String? ?? "",
      minimumOrderValue: (json['minimumOrderValue'] as num?)?.toDouble() ?? 0.0,
      maximumDiscountValue:
          (json['maximumDiscountValue'] as num?)?.toDouble() ?? 0.0,
      discountType: json['discountType'] as String? ?? "",
    );

Map<String, dynamic> _$$ProductDiscountImplToJson(
        _$ProductDiscountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dish': instance.dish,
      'name': instance.name,
      'conditions': instance.conditions,
      'discountValue': instance.discountValue,
      'discountUnit': instance.discountUnit,
      'maxUsed': instance.maxUsed,
      'validFrom': instance.validFrom?.toIso8601String(),
      'validTo': instance.validTo?.toIso8601String(),
      'createdTime': instance.createdTime?.toIso8601String(),
      'couponCode': instance.couponCode,
      'minimumOrderValue': instance.minimumOrderValue,
      'maximumDiscountValue': instance.maximumDiscountValue,
      'discountType': instance.discountType,
    };

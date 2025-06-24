// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryRequestImpl _$$CategoryRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryRequestImpl(
      name: json['name'] as String? ?? "",
      dish_quantity: json['dish_quantity'] as int? ?? 0,
      is_active: json['is_active'] as bool? ?? true,
      imageUrl: json['imageUrl'] as String? ?? "",
      restaurant_id: json['restaurant_id'] as int? ?? 0,
    );

Map<String, dynamic> _$$CategoryRequestImplToJson(
        _$CategoryRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dish_quantity': instance.dish_quantity,
      'is_active': instance.is_active,
      'imageUrl': instance.imageUrl,
      'restaurant_id': instance.restaurant_id,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "",
      dish_quantity: json['dish_quantity'] as int? ?? 0,
      is_active: json['is_active'] as bool? ?? false,
      imageUrl: json['imageUrl'] as String? ?? "",
      restaurant_id: json['restaurant_id'] as int? ?? 0,
      dishes: (json['dishes'] as List<dynamic>?)
              ?.map((e) => Dish.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dish_quantity': instance.dish_quantity,
      'is_active': instance.is_active,
      'imageUrl': instance.imageUrl,
      'restaurant_id': instance.restaurant_id,
      'dishes': instance.dishes,
    };

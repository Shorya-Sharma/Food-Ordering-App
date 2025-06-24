// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DishTypeImpl _$$DishTypeImplFromJson(Map<String, dynamic> json) =>
    _$DishTypeImpl(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "",
      dishes: (json['dishes'] as List<dynamic>?)
              ?.map((e) => Dish.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DishTypeImplToJson(_$DishTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dishes': instance.dishes,
    };

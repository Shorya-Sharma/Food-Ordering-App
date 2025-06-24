// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DishRequestImpl _$$DishRequestImplFromJson(Map<String, dynamic> json) =>
    _$DishRequestImpl(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      restaurantId: json['restaurantId'] as int,
      categoryId: json['categoryId'] as int,
      dishTypeId: json['dishTypeId'] as int,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$DishRequestImplToJson(_$DishRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'restaurantId': instance.restaurantId,
      'categoryId': instance.categoryId,
      'dishTypeId': instance.dishTypeId,
      'description': instance.description,
    };

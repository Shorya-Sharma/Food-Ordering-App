// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_of_dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantOfDishImpl _$$RestaurantOfDishImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantOfDishImpl(
      restaurant: json['restaurant'] == null
          ? null
          : Restaurant.fromJson(json['restaurant'] as Map<String, dynamic>),
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0,
      quantity: json['quantity'] as int? ?? 0,
    );

Map<String, dynamic> _$$RestaurantOfDishImplToJson(
        _$RestaurantOfDishImpl instance) =>
    <String, dynamic>{
      'restaurant': instance.restaurant,
      'totalPrice': instance.totalPrice,
      'quantity': instance.quantity,
    };

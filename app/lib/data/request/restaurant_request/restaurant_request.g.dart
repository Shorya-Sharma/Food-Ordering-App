// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantRequestImpl _$$RestaurantRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantRequestImpl(
      imageUrl: json['imageUrl'] as String,
      coverImageUrl: json['coverImageUrl'] as String,
      name: json['name'] as String,
      mainDish: json['mainDish'] as String,
      ownerId: json['ownerId'] as int,
      description: json['description'] as String,
      menuImageUrl: json['menuImageUrl'] as String,
      photoUrls: json['photoUrls'] as String,
      restaurantType: json['restaurantType'] as String,
      addressRequest: AddressRequest.fromJson(
          json['addressRequest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RestaurantRequestImplToJson(
        _$RestaurantRequestImpl instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'coverImageUrl': instance.coverImageUrl,
      'name': instance.name,
      'mainDish': instance.mainDish,
      'ownerId': instance.ownerId,
      'description': instance.description,
      'menuImageUrl': instance.menuImageUrl,
      'photoUrls': instance.photoUrls,
      'restaurantType': instance.restaurantType,
      'addressRequest': instance.addressRequest,
    };

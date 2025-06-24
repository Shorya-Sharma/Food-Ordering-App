// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantImpl _$$RestaurantImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantImpl(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "",
      rate: (json['rate'] as num?)?.toDouble() ?? 0,
      dishes: (json['dishes'] as List<dynamic>?)
              ?.map((e) => Dish.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      imageUrl: json['imageUrl'] as String? ?? "",
      description: json['description'] as String? ?? "",
      coverImageUrl: json['coverImageUrl'] as String? ?? "",
      mainDish: json['mainDish'] as String? ?? "",
      status: json['status'] as String? ?? "",
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      address: json['address'] as String?,
      owner: json['owner'] == null
          ? null
          : User.fromJson(json['owner'] as Map<String, dynamic>),
      latitude: json['latitude'] as String? ?? "",
      longitude: json['longitude'] as String? ?? "",
      locationId: json['locationId'] as String? ?? "",
      numReviews: json['numReviews'] as int? ?? 0,
      rating: json['rating'] as String? ?? "0",
    );

Map<String, dynamic> _$$RestaurantImplToJson(_$RestaurantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rate': instance.rate,
      'dishes': instance.dishes,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'coverImageUrl': instance.coverImageUrl,
      'mainDish': instance.mainDish,
      'status': instance.status,
      'categories': instance.categories,
      'address': instance.address,
      'owner': instance.owner,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'locationId': instance.locationId,
      'numReviews': instance.numReviews,
      'rating': instance.rating,
    };

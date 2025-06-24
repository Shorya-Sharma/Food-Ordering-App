// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************
_$DishImpl _$$DishImplFromJson(Map<String, dynamic> json) => _$DishImpl(
      id: json['id'] as int? ?? 0,
      restaurant: json['restaurant'] == null
          ? null
          : Restaurant(id: 5, name: "Opical's restaurant", imageUrl: ""),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      dishType: json['dishType'] == null
          ? null
          : DishType.fromJson(json['dishType'] as Map<String, dynamic>),
      name: json['name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      imageUrl: json['imageUrl'] as String? ?? "",
      status: json['status'] as String? ?? "",
      price: (json['price'] as num?)?.toDouble() ?? 0,
      restaurantId: json['restaurantId'] as int? ?? 4,
    );

Map<String, dynamic> _$$DishImplToJson(_$DishImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'restaurant': instance.restaurant,
      'category': instance.category,
      'dishType': instance.dishType,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'status': instance.status,
      'price': instance.price,
      'restaurantId': instance.restaurantId,
    };

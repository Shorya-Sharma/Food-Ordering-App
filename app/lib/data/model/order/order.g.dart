// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as int? ?? 0,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      restaurant: json['restaurant'] == null
          ? null
          : Restaurant.fromJson(json['restaurant'] as Map<String, dynamic>),
      orderStatus: json['orderStatus'] as String? ?? "",
      deliveryStatus: json['deliveryStatus'] as String? ?? "",
      failureMessages: json['failureMessages'] as String? ?? "",
      price: (json['price'] as num?)?.toDouble() ?? 0,
      address: json['address'] as String? ?? "",
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => OrderLineItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'restaurant': instance.restaurant,
      'orderStatus': instance.orderStatus,
      'deliveryStatus': instance.deliveryStatus,
      'failureMessages': instance.failureMessages,
      'price': instance.price,
      'address': instance.address,
      'items': instance.items,
    };

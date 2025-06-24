// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      id: json['id'] as int? ?? 0,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      dish: json['dish'] == null
          ? null
          : Dish.fromJson(json['dish'] as Map<String, dynamic>),
      itemCartGroupOptions: (json['cartItem_groupOptions'] as List<dynamic>?)
              ?.map((e) =>
                  ItemCartGroupOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      quantity: json['quantity'] as int? ?? 0,
      total: (json['total'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'dish': instance.dish,
      'cartItem_groupOptions': instance.itemCartGroupOptions,
      'quantity': instance.quantity,
      'total': instance.total,
    };

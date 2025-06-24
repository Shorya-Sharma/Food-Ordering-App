// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_cart_group_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemCartGroupOptionImpl _$$ItemCartGroupOptionImplFromJson(
        Map<String, dynamic> json) =>
    _$ItemCartGroupOptionImpl(
      id: json['id'] as int? ?? 0,
      cartItem: json['cartItem'] == null
          ? null
          : CartItem.fromJson(json['cartItem'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      groupOption: json['groupOption'] == null
          ? null
          : GroupOption.fromJson(json['groupOption'] as Map<String, dynamic>),
      cartItemOptions: (json['cartItemOptions'] as List<dynamic>?)
              ?.map(
                  (e) => CartItemOptionItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      groupOptionSubtotal:
          (json['groupOptionSubtotal'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$ItemCartGroupOptionImplToJson(
        _$ItemCartGroupOptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cartItem': instance.cartItem,
      'category': instance.category,
      'groupOption': instance.groupOption,
      'cartItemOptions': instance.cartItemOptions,
      'groupOptionSubtotal': instance.groupOptionSubtotal,
    };

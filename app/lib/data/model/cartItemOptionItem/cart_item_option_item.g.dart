// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_option_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemOptionItemImpl _$$CartItemOptionItemImplFromJson(
        Map<String, dynamic> json) =>
    _$CartItemOptionItemImpl(
      id: json['id'] as int? ?? 0,
      itemCartGroupOption: json['cartItem_groupOption'] == null
          ? null
          : ItemCartGroupOption.fromJson(
              json['cartItem_groupOption'] as Map<String, dynamic>),
      optionItem: json['optionItem'] == null
          ? null
          : OptionItem.fromJson(json['optionItem'] as Map<String, dynamic>),
      groupOption: json['groupOption'] == null
          ? null
          : GroupOption.fromJson(json['groupOption'] as Map<String, dynamic>),
      quantity: json['quantity'] as int? ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$CartItemOptionItemImplToJson(
        _$CartItemOptionItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cartItem_groupOption': instance.itemCartGroupOption,
      'optionItem': instance.optionItem,
      'groupOption': instance.groupOption,
      'quantity': instance.quantity,
      'price': instance.price,
    };

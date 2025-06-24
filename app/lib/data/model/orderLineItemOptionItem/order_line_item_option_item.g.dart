// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_line_item_option_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderLineItemOptionItemImpl _$$OrderLineItemOptionItemImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderLineItemOptionItemImpl(
      id: json['id'] as int? ?? 0,
      orderLineItem_GroupOption: json['orderLineItem_GroupOption'] == null
          ? null
          : OrderLineItemGroupOption.fromJson(
              json['orderLineItem_GroupOption'] as Map<String, dynamic>),
      optionItem: json['optionItem'] == null
          ? null
          : OptionItem.fromJson(json['optionItem'] as Map<String, dynamic>),
      quantity: json['quantity'] as int? ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$OrderLineItemOptionItemImplToJson(
        _$OrderLineItemOptionItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderLineItem_GroupOption': instance.orderLineItem_GroupOption,
      'optionItem': instance.optionItem,
      'quantity': instance.quantity,
      'price': instance.price,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_line_item_group_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderLineItemGroupOptionImpl _$$OrderLineItemGroupOptionImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderLineItemGroupOptionImpl(
      id: json['id'] as int? ?? 0,
      orderLineItem: json['orderLineItem'] == null
          ? null
          : OrderLineItem.fromJson(
              json['orderLineItem'] as Map<String, dynamic>),
      groupOption: json['groupOption'] == null
          ? null
          : GroupOption.fromJson(json['groupOption'] as Map<String, dynamic>),
      orderLineItemOptions: (json['orderLineItemOptions'] as List<dynamic>?)
              ?.map((e) =>
                  OrderLineItemOptionItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      groupOptionSubtotal:
          (json['groupOptionSubtotal'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$OrderLineItemGroupOptionImplToJson(
        _$OrderLineItemGroupOptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderLineItem': instance.orderLineItem,
      'groupOption': instance.groupOption,
      'orderLineItemOptions': instance.orderLineItemOptions,
      'groupOptionSubtotal': instance.groupOptionSubtotal,
    };

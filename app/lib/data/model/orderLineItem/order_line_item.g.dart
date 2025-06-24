// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_line_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderLineItemImpl _$$OrderLineItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderLineItemImpl(
      id: json['id'] as int? ?? 0,
      order: json['order'] == null
          ? null
          : Order.fromJson(json['order'] as Map<String, dynamic>),
      orderLineItemGroupOptions: (json['orderLineItemGroupOptions']
                  as List<dynamic>?)
              ?.map((e) =>
                  OrderLineItemGroupOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      dish: json['dish'] == null
          ? null
          : Dish.fromJson(json['dish'] as Map<String, dynamic>),
      quantity: json['quantity'] as int? ?? 0,
      subTotal: (json['subTotal'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$OrderLineItemImplToJson(_$OrderLineItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'orderLineItemGroupOptions': instance.orderLineItemGroupOptions,
      'dish': instance.dish,
      'quantity': instance.quantity,
      'subTotal': instance.subTotal,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderRequestImpl _$$OrderRequestImplFromJson(Map<String, dynamic> json) =>
    _$OrderRequestImpl(
      user_id: json['user_id'] as int,
      total_price: (json['total_price'] as num).toDouble(),
      address: json['address'] as String,
      voucher_ids:
          (json['voucher_ids'] as List<dynamic>).map((e) => e as int).toList(),
      order_items: (json['order_items'] as List<dynamic>)
          .map((e) => OrderItemRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderRequestImplToJson(_$OrderRequestImpl instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'total_price': instance.total_price,
      'address': instance.address,
      'voucher_ids': instance.voucher_ids,
      'order_items': instance.order_items,
    };

_$OrderItemRequestImpl _$$OrderItemRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderItemRequestImpl(
      dish_id: json['dish_id'] as int,
      quantity: json['quantity'] as int,
      item_price: (json['item_price'] as num).toDouble(),
      item_group_options: (json['item_group_options'] as List<dynamic>)
          .map(
              (e) => ItemGroupOptionRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderItemRequestImplToJson(
        _$OrderItemRequestImpl instance) =>
    <String, dynamic>{
      'dish_id': instance.dish_id,
      'quantity': instance.quantity,
      'item_price': instance.item_price,
      'item_group_options': instance.item_group_options,
    };

_$ItemGroupOptionRequestImpl _$$ItemGroupOptionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ItemGroupOptionRequestImpl(
      group_option_id: json['group_option_id'] as int,
      item_options: (json['item_options'] as List<dynamic>)
          .map((e) => ItemOptionRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      sub_total_price: (json['sub_total_price'] as num).toDouble(),
    );

Map<String, dynamic> _$$ItemGroupOptionRequestImplToJson(
        _$ItemGroupOptionRequestImpl instance) =>
    <String, dynamic>{
      'group_option_id': instance.group_option_id,
      'item_options': instance.item_options,
      'sub_total_price': instance.sub_total_price,
    };

_$ItemOptionRequestImpl _$$ItemOptionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ItemOptionRequestImpl(
      option_item_id: json['option_item_id'] as int,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$$ItemOptionRequestImplToJson(
        _$ItemOptionRequestImpl instance) =>
    <String, dynamic>{
      'option_item_id': instance.option_item_id,
      'quantity': instance.quantity,
    };

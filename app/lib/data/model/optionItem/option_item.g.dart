// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OptionItemImpl _$$OptionItemImplFromJson(Map<String, dynamic> json) =>
    _$OptionItemImpl(
      id: json['id'] as int? ?? 0,
      groupOption: json['groupOption'] == null
          ? null
          : GroupOption.fromJson(json['groupOption'] as Map<String, dynamic>),
      name: json['name'] as String? ?? "",
      price: (json['price'] as num?)?.toDouble() ?? 0,
      description: json['description'] as String? ?? "",
    );

Map<String, dynamic> _$$OptionItemImplToJson(_$OptionItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupOption': instance.groupOption,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupOptionImpl _$$GroupOptionImplFromJson(Map<String, dynamic> json) =>
    _$GroupOptionImpl(
      id: json['id'] as int? ?? 0,
      restaurant: json['restaurant'] == null
          ? null
          : Restaurant.fromJson(json['restaurant'] as Map<String, dynamic>),
      optionItems: (json['optionItems'] as List<dynamic>?)
              ?.map((e) => OptionItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      name: json['name'] as String? ?? "",
      minimum: json['minimum'] as int? ?? 0,
      maximum: json['maximum'] as int? ?? 0,
      optional: json['optional'] as bool? ?? true,
    );

Map<String, dynamic> _$$GroupOptionImplToJson(_$GroupOptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'restaurant': instance.restaurant,
      'optionItems': instance.optionItems,
      'name': instance.name,
      'minimum': instance.minimum,
      'maximum': instance.maximum,
      'optional': instance.optional,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      id: json['id'] as int? ?? 0,
      users: json['users'] == null
          ? null
          : User.fromJson(json['users'] as Map<String, dynamic>),
      rate: (json['rate'] as num?)?.toDouble() ?? 0,
      comment: json['comment'] as String? ?? '',
      created_at: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'users': instance.users,
      'rate': instance.rate,
      'comment': instance.comment,
      'created_at': instance.created_at.toIso8601String(),
    };

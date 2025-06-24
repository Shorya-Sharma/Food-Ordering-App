// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "",
      fullname: json['fullname'] as String? ?? "",
      avatarUrl: json['avatarUrl'] as String? ?? "",
      gender:
          $enumDecodeNullable(_$GenderEnumMap, json['gender']) ?? Gender.male,
      username: json['username'] as String? ?? "",
      password: json['password'] as String? ?? "",
      email: json['email'] as String? ?? "",
      status: $enumDecodeNullable(_$UserStatusEnumMap, json['status']) ??
          UserStatus.active,
      roles: (json['roles'] as List<dynamic>?)
              ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      age: json['age'] as int? ?? 0,
      weight: json['weight'] as int? ?? 0,
      height: json['height'] as int? ?? 0,
      activity: json['activity'] as String? ?? "",
      mealPerDay: json['mealPerDay'] as int? ?? 3,
      weightLoss: json['weightLoss'] as String? ?? "",
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fullname': instance.fullname,
      'avatarUrl': instance.avatarUrl,
      'gender': _$GenderEnumMap[instance.gender]!,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'status': _$UserStatusEnumMap[instance.status]!,
      'roles': instance.roles,
      'age': instance.age,
      'weight': instance.weight,
      'height': instance.height,
      'activity': instance.activity,
      'mealPerDay': instance.mealPerDay,
      'weightLoss': instance.weightLoss,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.all: 'all',
};

const _$UserStatusEnumMap = {
  UserStatus.inactive: 'inactive',
  UserStatus.active: 'active',
  UserStatus.all: 'all',
};

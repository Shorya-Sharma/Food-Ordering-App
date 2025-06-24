// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressRequestImpl _$$AddressRequestImplFromJson(Map<String, dynamic> json) =>
    _$AddressRequestImpl(
      address: json['address'] as String,
      provinceCode: json['provinceCode'] as int,
      districtCode: json['districtCode'] as int,
      wardCode: json['wardCode'] as int,
    );

Map<String, dynamic> _$$AddressRequestImplToJson(
        _$AddressRequestImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'provinceCode': instance.provinceCode,
      'districtCode': instance.districtCode,
      'wardCode': instance.wardCode,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoucherImpl _$$VoucherImplFromJson(Map<String, dynamic> json) =>
    _$VoucherImpl(
      id: json['id'] as int? ?? 0,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      productDiscount: ProductDiscount.fromJson(
          json['productDiscount'] as Map<String, dynamic>),
      status: $enumDecode(_$VoucherStatusEnumMap, json['status']),
      remainingUsage: json['remainingUsage'] as int? ?? 0,
    );

Map<String, dynamic> _$$VoucherImplToJson(_$VoucherImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'productDiscount': instance.productDiscount,
      'status': _$VoucherStatusEnumMap[instance.status]!,
      'remainingUsage': instance.remainingUsage,
    };

const _$VoucherStatusEnumMap = {
  VoucherStatus.ACTIVE: 'ACTIVE',
  VoucherStatus.INACTIVE: 'INACTIVE',
  VoucherStatus.EXPIRED: 'EXPIRED',
  VoucherStatus.USED: 'USED',
};

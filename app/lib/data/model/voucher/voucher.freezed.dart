// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voucher.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Voucher _$VoucherFromJson(Map<String, dynamic> json) {
  return _Voucher.fromJson(json);
}

/// @nodoc
mixin _$Voucher {
  int get id => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  ProductDiscount get productDiscount => throw _privateConstructorUsedError;
  VoucherStatus get status => throw _privateConstructorUsedError;
  int get remainingUsage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VoucherCopyWith<Voucher> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoucherCopyWith<$Res> {
  factory $VoucherCopyWith(Voucher value, $Res Function(Voucher) then) =
      _$VoucherCopyWithImpl<$Res, Voucher>;
  @useResult
  $Res call(
      {int id,
      User user,
      ProductDiscount productDiscount,
      VoucherStatus status,
      int remainingUsage});

  $UserCopyWith<$Res> get user;
  $ProductDiscountCopyWith<$Res> get productDiscount;
}

/// @nodoc
class _$VoucherCopyWithImpl<$Res, $Val extends Voucher>
    implements $VoucherCopyWith<$Res> {
  _$VoucherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? productDiscount = null,
    Object? status = null,
    Object? remainingUsage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      productDiscount: null == productDiscount
          ? _value.productDiscount
          : productDiscount // ignore: cast_nullable_to_non_nullable
              as ProductDiscount,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as VoucherStatus,
      remainingUsage: null == remainingUsage
          ? _value.remainingUsage
          : remainingUsage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductDiscountCopyWith<$Res> get productDiscount {
    return $ProductDiscountCopyWith<$Res>(_value.productDiscount, (value) {
      return _then(_value.copyWith(productDiscount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VoucherImplCopyWith<$Res> implements $VoucherCopyWith<$Res> {
  factory _$$VoucherImplCopyWith(
          _$VoucherImpl value, $Res Function(_$VoucherImpl) then) =
      __$$VoucherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      User user,
      ProductDiscount productDiscount,
      VoucherStatus status,
      int remainingUsage});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $ProductDiscountCopyWith<$Res> get productDiscount;
}

/// @nodoc
class __$$VoucherImplCopyWithImpl<$Res>
    extends _$VoucherCopyWithImpl<$Res, _$VoucherImpl>
    implements _$$VoucherImplCopyWith<$Res> {
  __$$VoucherImplCopyWithImpl(
      _$VoucherImpl _value, $Res Function(_$VoucherImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? productDiscount = null,
    Object? status = null,
    Object? remainingUsage = null,
  }) {
    return _then(_$VoucherImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      productDiscount: null == productDiscount
          ? _value.productDiscount
          : productDiscount // ignore: cast_nullable_to_non_nullable
              as ProductDiscount,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as VoucherStatus,
      remainingUsage: null == remainingUsage
          ? _value.remainingUsage
          : remainingUsage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoucherImpl implements _Voucher {
  const _$VoucherImpl(
      {this.id = 0,
      required this.user,
      required this.productDiscount,
      required this.status,
      this.remainingUsage = 0});

  factory _$VoucherImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoucherImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final User user;
  @override
  final ProductDiscount productDiscount;
  @override
  final VoucherStatus status;
  @override
  @JsonKey()
  final int remainingUsage;

  @override
  String toString() {
    return 'Voucher(id: $id, user: $user, productDiscount: $productDiscount, status: $status, remainingUsage: $remainingUsage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoucherImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.productDiscount, productDiscount) ||
                other.productDiscount == productDiscount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.remainingUsage, remainingUsage) ||
                other.remainingUsage == remainingUsage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, user, productDiscount, status, remainingUsage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VoucherImplCopyWith<_$VoucherImpl> get copyWith =>
      __$$VoucherImplCopyWithImpl<_$VoucherImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoucherImplToJson(
      this,
    );
  }
}

abstract class _Voucher implements Voucher {
  const factory _Voucher(
      {final int id,
      required final User user,
      required final ProductDiscount productDiscount,
      required final VoucherStatus status,
      final int remainingUsage}) = _$VoucherImpl;

  factory _Voucher.fromJson(Map<String, dynamic> json) = _$VoucherImpl.fromJson;

  @override
  int get id;
  @override
  User get user;
  @override
  ProductDiscount get productDiscount;
  @override
  VoucherStatus get status;
  @override
  int get remainingUsage;
  @override
  @JsonKey(ignore: true)
  _$$VoucherImplCopyWith<_$VoucherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

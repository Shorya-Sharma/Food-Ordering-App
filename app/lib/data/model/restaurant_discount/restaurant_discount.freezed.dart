// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_discount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestaurantDiscount _$RestaurantDiscountFromJson(Map<String, dynamic> json) {
  return _RestaurantDiscount.fromJson(json);
}

/// @nodoc
mixin _$RestaurantDiscount {
  int get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get conditions => throw _privateConstructorUsedError;
  String get couponCode => throw _privateConstructorUsedError;
  double? get discountValue => throw _privateConstructorUsedError;
  int get maxUsed => throw _privateConstructorUsedError;
  DateTime? get validFrom => throw _privateConstructorUsedError;
  DateTime? get validTo => throw _privateConstructorUsedError;
  double get minimumOrderValue => throw _privateConstructorUsedError;
  double? get maximumDiscountValue => throw _privateConstructorUsedError;
  String get discountType => throw _privateConstructorUsedError;
  int? get restaurantId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantDiscountCopyWith<RestaurantDiscount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantDiscountCopyWith<$Res> {
  factory $RestaurantDiscountCopyWith(
          RestaurantDiscount value, $Res Function(RestaurantDiscount) then) =
      _$RestaurantDiscountCopyWithImpl<$Res, RestaurantDiscount>;
  @useResult
  $Res call(
      {int id,
      DateTime createdAt,
      String name,
      String conditions,
      String couponCode,
      double? discountValue,
      int maxUsed,
      DateTime? validFrom,
      DateTime? validTo,
      double minimumOrderValue,
      double? maximumDiscountValue,
      String discountType,
      int? restaurantId});
}

/// @nodoc
class _$RestaurantDiscountCopyWithImpl<$Res, $Val extends RestaurantDiscount>
    implements $RestaurantDiscountCopyWith<$Res> {
  _$RestaurantDiscountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? name = null,
    Object? conditions = null,
    Object? couponCode = null,
    Object? discountValue = freezed,
    Object? maxUsed = null,
    Object? validFrom = freezed,
    Object? validTo = freezed,
    Object? minimumOrderValue = null,
    Object? maximumDiscountValue = freezed,
    Object? discountType = null,
    Object? restaurantId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as String,
      couponCode: null == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
      discountValue: freezed == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      maxUsed: null == maxUsed
          ? _value.maxUsed
          : maxUsed // ignore: cast_nullable_to_non_nullable
              as int,
      validFrom: freezed == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validTo: freezed == validTo
          ? _value.validTo
          : validTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minimumOrderValue: null == minimumOrderValue
          ? _value.minimumOrderValue
          : minimumOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      maximumDiscountValue: freezed == maximumDiscountValue
          ? _value.maximumDiscountValue
          : maximumDiscountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      discountType: null == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: freezed == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantDiscountImplCopyWith<$Res>
    implements $RestaurantDiscountCopyWith<$Res> {
  factory _$$RestaurantDiscountImplCopyWith(_$RestaurantDiscountImpl value,
          $Res Function(_$RestaurantDiscountImpl) then) =
      __$$RestaurantDiscountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime createdAt,
      String name,
      String conditions,
      String couponCode,
      double? discountValue,
      int maxUsed,
      DateTime? validFrom,
      DateTime? validTo,
      double minimumOrderValue,
      double? maximumDiscountValue,
      String discountType,
      int? restaurantId});
}

/// @nodoc
class __$$RestaurantDiscountImplCopyWithImpl<$Res>
    extends _$RestaurantDiscountCopyWithImpl<$Res, _$RestaurantDiscountImpl>
    implements _$$RestaurantDiscountImplCopyWith<$Res> {
  __$$RestaurantDiscountImplCopyWithImpl(_$RestaurantDiscountImpl _value,
      $Res Function(_$RestaurantDiscountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? name = null,
    Object? conditions = null,
    Object? couponCode = null,
    Object? discountValue = freezed,
    Object? maxUsed = null,
    Object? validFrom = freezed,
    Object? validTo = freezed,
    Object? minimumOrderValue = null,
    Object? maximumDiscountValue = freezed,
    Object? discountType = null,
    Object? restaurantId = freezed,
  }) {
    return _then(_$RestaurantDiscountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as String,
      couponCode: null == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
      discountValue: freezed == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      maxUsed: null == maxUsed
          ? _value.maxUsed
          : maxUsed // ignore: cast_nullable_to_non_nullable
              as int,
      validFrom: freezed == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validTo: freezed == validTo
          ? _value.validTo
          : validTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minimumOrderValue: null == minimumOrderValue
          ? _value.minimumOrderValue
          : minimumOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      maximumDiscountValue: freezed == maximumDiscountValue
          ? _value.maximumDiscountValue
          : maximumDiscountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      discountType: null == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: freezed == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantDiscountImpl implements _RestaurantDiscount {
  const _$RestaurantDiscountImpl(
      {this.id = 0,
      required this.createdAt,
      this.name = "",
      this.conditions = "",
      this.couponCode = "",
      this.discountValue,
      this.maxUsed = 1,
      this.validFrom,
      this.validTo,
      this.minimumOrderValue = 0.0,
      this.maximumDiscountValue,
      this.discountType = "",
      this.restaurantId});

  factory _$RestaurantDiscountImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantDiscountImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String conditions;
  @override
  @JsonKey()
  final String couponCode;
  @override
  final double? discountValue;
  @override
  @JsonKey()
  final int maxUsed;
  @override
  final DateTime? validFrom;
  @override
  final DateTime? validTo;
  @override
  @JsonKey()
  final double minimumOrderValue;
  @override
  final double? maximumDiscountValue;
  @override
  @JsonKey()
  final String discountType;
  @override
  final int? restaurantId;

  @override
  String toString() {
    return 'RestaurantDiscount(id: $id, createdAt: $createdAt, name: $name, conditions: $conditions, couponCode: $couponCode, discountValue: $discountValue, maxUsed: $maxUsed, validFrom: $validFrom, validTo: $validTo, minimumOrderValue: $minimumOrderValue, maximumDiscountValue: $maximumDiscountValue, discountType: $discountType, restaurantId: $restaurantId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantDiscountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.conditions, conditions) ||
                other.conditions == conditions) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.maxUsed, maxUsed) || other.maxUsed == maxUsed) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validTo, validTo) || other.validTo == validTo) &&
            (identical(other.minimumOrderValue, minimumOrderValue) ||
                other.minimumOrderValue == minimumOrderValue) &&
            (identical(other.maximumDiscountValue, maximumDiscountValue) ||
                other.maximumDiscountValue == maximumDiscountValue) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      name,
      conditions,
      couponCode,
      discountValue,
      maxUsed,
      validFrom,
      validTo,
      minimumOrderValue,
      maximumDiscountValue,
      discountType,
      restaurantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantDiscountImplCopyWith<_$RestaurantDiscountImpl> get copyWith =>
      __$$RestaurantDiscountImplCopyWithImpl<_$RestaurantDiscountImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantDiscountImplToJson(
      this,
    );
  }
}

abstract class _RestaurantDiscount implements RestaurantDiscount {
  const factory _RestaurantDiscount(
      {final int id,
      required final DateTime createdAt,
      final String name,
      final String conditions,
      final String couponCode,
      final double? discountValue,
      final int maxUsed,
      final DateTime? validFrom,
      final DateTime? validTo,
      final double minimumOrderValue,
      final double? maximumDiscountValue,
      final String discountType,
      final int? restaurantId}) = _$RestaurantDiscountImpl;

  factory _RestaurantDiscount.fromJson(Map<String, dynamic> json) =
      _$RestaurantDiscountImpl.fromJson;

  @override
  int get id;
  @override
  DateTime get createdAt;
  @override
  String get name;
  @override
  String get conditions;
  @override
  String get couponCode;
  @override
  double? get discountValue;
  @override
  int get maxUsed;
  @override
  DateTime? get validFrom;
  @override
  DateTime? get validTo;
  @override
  double get minimumOrderValue;
  @override
  double? get maximumDiscountValue;
  @override
  String get discountType;
  @override
  int? get restaurantId;
  @override
  @JsonKey(ignore: true)
  _$$RestaurantDiscountImplCopyWith<_$RestaurantDiscountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

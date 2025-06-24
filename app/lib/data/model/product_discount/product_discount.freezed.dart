// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_discount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductDiscount _$ProductDiscountFromJson(Map<String, dynamic> json) {
  return _ProductDiscount.fromJson(json);
}

/// @nodoc
mixin _$ProductDiscount {
  int get id => throw _privateConstructorUsedError;
  Dish get dish => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get conditions => throw _privateConstructorUsedError;
  double get discountValue => throw _privateConstructorUsedError;
  int get discountUnit => throw _privateConstructorUsedError;
  int get maxUsed => throw _privateConstructorUsedError;
  DateTime? get validFrom => throw _privateConstructorUsedError;
  DateTime? get validTo => throw _privateConstructorUsedError;
  DateTime? get createdTime => throw _privateConstructorUsedError;
  String get couponCode => throw _privateConstructorUsedError;
  double get minimumOrderValue => throw _privateConstructorUsedError;
  double get maximumDiscountValue => throw _privateConstructorUsedError;
  String get discountType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDiscountCopyWith<ProductDiscount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDiscountCopyWith<$Res> {
  factory $ProductDiscountCopyWith(
          ProductDiscount value, $Res Function(ProductDiscount) then) =
      _$ProductDiscountCopyWithImpl<$Res, ProductDiscount>;
  @useResult
  $Res call(
      {int id,
      Dish dish,
      String name,
      String conditions,
      double discountValue,
      int discountUnit,
      int maxUsed,
      DateTime? validFrom,
      DateTime? validTo,
      DateTime? createdTime,
      String couponCode,
      double minimumOrderValue,
      double maximumDiscountValue,
      String discountType});

  $DishCopyWith<$Res> get dish;
}

/// @nodoc
class _$ProductDiscountCopyWithImpl<$Res, $Val extends ProductDiscount>
    implements $ProductDiscountCopyWith<$Res> {
  _$ProductDiscountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dish = null,
    Object? name = null,
    Object? conditions = null,
    Object? discountValue = null,
    Object? discountUnit = null,
    Object? maxUsed = null,
    Object? validFrom = freezed,
    Object? validTo = freezed,
    Object? createdTime = freezed,
    Object? couponCode = null,
    Object? minimumOrderValue = null,
    Object? maximumDiscountValue = null,
    Object? discountType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dish: null == dish
          ? _value.dish
          : dish // ignore: cast_nullable_to_non_nullable
              as Dish,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as String,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      discountUnit: null == discountUnit
          ? _value.discountUnit
          : discountUnit // ignore: cast_nullable_to_non_nullable
              as int,
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
      createdTime: freezed == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      couponCode: null == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
      minimumOrderValue: null == minimumOrderValue
          ? _value.minimumOrderValue
          : minimumOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      maximumDiscountValue: null == maximumDiscountValue
          ? _value.maximumDiscountValue
          : maximumDiscountValue // ignore: cast_nullable_to_non_nullable
              as double,
      discountType: null == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DishCopyWith<$Res> get dish {
    return $DishCopyWith<$Res>(_value.dish, (value) {
      return _then(_value.copyWith(dish: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductDiscountImplCopyWith<$Res>
    implements $ProductDiscountCopyWith<$Res> {
  factory _$$ProductDiscountImplCopyWith(_$ProductDiscountImpl value,
          $Res Function(_$ProductDiscountImpl) then) =
      __$$ProductDiscountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      Dish dish,
      String name,
      String conditions,
      double discountValue,
      int discountUnit,
      int maxUsed,
      DateTime? validFrom,
      DateTime? validTo,
      DateTime? createdTime,
      String couponCode,
      double minimumOrderValue,
      double maximumDiscountValue,
      String discountType});

  @override
  $DishCopyWith<$Res> get dish;
}

/// @nodoc
class __$$ProductDiscountImplCopyWithImpl<$Res>
    extends _$ProductDiscountCopyWithImpl<$Res, _$ProductDiscountImpl>
    implements _$$ProductDiscountImplCopyWith<$Res> {
  __$$ProductDiscountImplCopyWithImpl(
      _$ProductDiscountImpl _value, $Res Function(_$ProductDiscountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dish = null,
    Object? name = null,
    Object? conditions = null,
    Object? discountValue = null,
    Object? discountUnit = null,
    Object? maxUsed = null,
    Object? validFrom = freezed,
    Object? validTo = freezed,
    Object? createdTime = freezed,
    Object? couponCode = null,
    Object? minimumOrderValue = null,
    Object? maximumDiscountValue = null,
    Object? discountType = null,
  }) {
    return _then(_$ProductDiscountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dish: null == dish
          ? _value.dish
          : dish // ignore: cast_nullable_to_non_nullable
              as Dish,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as String,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      discountUnit: null == discountUnit
          ? _value.discountUnit
          : discountUnit // ignore: cast_nullable_to_non_nullable
              as int,
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
      createdTime: freezed == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      couponCode: null == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
      minimumOrderValue: null == minimumOrderValue
          ? _value.minimumOrderValue
          : minimumOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      maximumDiscountValue: null == maximumDiscountValue
          ? _value.maximumDiscountValue
          : maximumDiscountValue // ignore: cast_nullable_to_non_nullable
              as double,
      discountType: null == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductDiscountImpl implements _ProductDiscount {
  const _$ProductDiscountImpl(
      {this.id = 0,
      required this.dish,
      this.name = "",
      this.conditions = "",
      this.discountValue = 0,
      this.discountUnit = 0,
      this.maxUsed = 0,
      this.validFrom,
      this.validTo,
      this.createdTime,
      this.couponCode = "",
      this.minimumOrderValue = 0.0,
      this.maximumDiscountValue = 0.0,
      this.discountType = ""});

  factory _$ProductDiscountImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductDiscountImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final Dish dish;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String conditions;
  @override
  @JsonKey()
  final double discountValue;
  @override
  @JsonKey()
  final int discountUnit;
  @override
  @JsonKey()
  final int maxUsed;
  @override
  final DateTime? validFrom;
  @override
  final DateTime? validTo;
  @override
  final DateTime? createdTime;
  @override
  @JsonKey()
  final String couponCode;
  @override
  @JsonKey()
  final double minimumOrderValue;
  @override
  @JsonKey()
  final double maximumDiscountValue;
  @override
  @JsonKey()
  final String discountType;

  @override
  String toString() {
    return 'ProductDiscount(id: $id, dish: $dish, name: $name, conditions: $conditions, discountValue: $discountValue, discountUnit: $discountUnit, maxUsed: $maxUsed, validFrom: $validFrom, validTo: $validTo, createdTime: $createdTime, couponCode: $couponCode, minimumOrderValue: $minimumOrderValue, maximumDiscountValue: $maximumDiscountValue, discountType: $discountType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDiscountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dish, dish) || other.dish == dish) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.conditions, conditions) ||
                other.conditions == conditions) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.discountUnit, discountUnit) ||
                other.discountUnit == discountUnit) &&
            (identical(other.maxUsed, maxUsed) || other.maxUsed == maxUsed) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validTo, validTo) || other.validTo == validTo) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.minimumOrderValue, minimumOrderValue) ||
                other.minimumOrderValue == minimumOrderValue) &&
            (identical(other.maximumDiscountValue, maximumDiscountValue) ||
                other.maximumDiscountValue == maximumDiscountValue) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      dish,
      name,
      conditions,
      discountValue,
      discountUnit,
      maxUsed,
      validFrom,
      validTo,
      createdTime,
      couponCode,
      minimumOrderValue,
      maximumDiscountValue,
      discountType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDiscountImplCopyWith<_$ProductDiscountImpl> get copyWith =>
      __$$ProductDiscountImplCopyWithImpl<_$ProductDiscountImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductDiscountImplToJson(
      this,
    );
  }
}

abstract class _ProductDiscount implements ProductDiscount {
  const factory _ProductDiscount(
      {final int id,
      required final Dish dish,
      final String name,
      final String conditions,
      final double discountValue,
      final int discountUnit,
      final int maxUsed,
      final DateTime? validFrom,
      final DateTime? validTo,
      final DateTime? createdTime,
      final String couponCode,
      final double minimumOrderValue,
      final double maximumDiscountValue,
      final String discountType}) = _$ProductDiscountImpl;

  factory _ProductDiscount.fromJson(Map<String, dynamic> json) =
      _$ProductDiscountImpl.fromJson;

  @override
  int get id;
  @override
  Dish get dish;
  @override
  String get name;
  @override
  String get conditions;
  @override
  double get discountValue;
  @override
  int get discountUnit;
  @override
  int get maxUsed;
  @override
  DateTime? get validFrom;
  @override
  DateTime? get validTo;
  @override
  DateTime? get createdTime;
  @override
  String get couponCode;
  @override
  double get minimumOrderValue;
  @override
  double get maximumDiscountValue;
  @override
  String get discountType;
  @override
  @JsonKey(ignore: true)
  _$$ProductDiscountImplCopyWith<_$ProductDiscountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

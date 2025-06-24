// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_of_dish.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestaurantOfDish _$RestaurantOfDishFromJson(Map<String, dynamic> json) {
  return _RestaurantOfDish.fromJson(json);
}

/// @nodoc
mixin _$RestaurantOfDish {
  Restaurant? get restaurant => throw _privateConstructorUsedError; //
//
  double get totalPrice => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantOfDishCopyWith<RestaurantOfDish> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantOfDishCopyWith<$Res> {
  factory $RestaurantOfDishCopyWith(
          RestaurantOfDish value, $Res Function(RestaurantOfDish) then) =
      _$RestaurantOfDishCopyWithImpl<$Res, RestaurantOfDish>;
  @useResult
  $Res call({Restaurant? restaurant, double totalPrice, int quantity});

  $RestaurantCopyWith<$Res>? get restaurant;
}

/// @nodoc
class _$RestaurantOfDishCopyWithImpl<$Res, $Val extends RestaurantOfDish>
    implements $RestaurantOfDishCopyWith<$Res> {
  _$RestaurantOfDishCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurant = freezed,
    Object? totalPrice = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      restaurant: freezed == restaurant
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as Restaurant?,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RestaurantCopyWith<$Res>? get restaurant {
    if (_value.restaurant == null) {
      return null;
    }

    return $RestaurantCopyWith<$Res>(_value.restaurant!, (value) {
      return _then(_value.copyWith(restaurant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RestaurantOfDishImplCopyWith<$Res>
    implements $RestaurantOfDishCopyWith<$Res> {
  factory _$$RestaurantOfDishImplCopyWith(_$RestaurantOfDishImpl value,
          $Res Function(_$RestaurantOfDishImpl) then) =
      __$$RestaurantOfDishImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Restaurant? restaurant, double totalPrice, int quantity});

  @override
  $RestaurantCopyWith<$Res>? get restaurant;
}

/// @nodoc
class __$$RestaurantOfDishImplCopyWithImpl<$Res>
    extends _$RestaurantOfDishCopyWithImpl<$Res, _$RestaurantOfDishImpl>
    implements _$$RestaurantOfDishImplCopyWith<$Res> {
  __$$RestaurantOfDishImplCopyWithImpl(_$RestaurantOfDishImpl _value,
      $Res Function(_$RestaurantOfDishImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurant = freezed,
    Object? totalPrice = null,
    Object? quantity = null,
  }) {
    return _then(_$RestaurantOfDishImpl(
      restaurant: freezed == restaurant
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as Restaurant?,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantOfDishImpl implements _RestaurantOfDish {
  const _$RestaurantOfDishImpl(
      {this.restaurant, this.totalPrice = 0, this.quantity = 0});

  factory _$RestaurantOfDishImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantOfDishImplFromJson(json);

  @override
  final Restaurant? restaurant;
//
//
  @override
  @JsonKey()
  final double totalPrice;
  @override
  @JsonKey()
  final int quantity;

  @override
  String toString() {
    return 'RestaurantOfDish(restaurant: $restaurant, totalPrice: $totalPrice, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantOfDishImpl &&
            (identical(other.restaurant, restaurant) ||
                other.restaurant == restaurant) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, restaurant, totalPrice, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantOfDishImplCopyWith<_$RestaurantOfDishImpl> get copyWith =>
      __$$RestaurantOfDishImplCopyWithImpl<_$RestaurantOfDishImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantOfDishImplToJson(
      this,
    );
  }
}

abstract class _RestaurantOfDish implements RestaurantOfDish {
  const factory _RestaurantOfDish(
      {final Restaurant? restaurant,
      final double totalPrice,
      final int quantity}) = _$RestaurantOfDishImpl;

  factory _RestaurantOfDish.fromJson(Map<String, dynamic> json) =
      _$RestaurantOfDishImpl.fromJson;

  @override
  Restaurant? get restaurant;
  @override //
//
  double get totalPrice;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$RestaurantOfDishImplCopyWith<_$RestaurantOfDishImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

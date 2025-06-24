// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  int get id => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  Dish? get dish => throw _privateConstructorUsedError;
  @JsonKey(name: "cartItem_groupOptions")
  List<ItemCartGroupOption> get itemCartGroupOptions =>
      throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call(
      {int id,
      User? user,
      Dish? dish,
      @JsonKey(name: "cartItem_groupOptions")
      List<ItemCartGroupOption> itemCartGroupOptions,
      int quantity,
      double total});

  $UserCopyWith<$Res>? get user;
  $DishCopyWith<$Res>? get dish;
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = freezed,
    Object? dish = freezed,
    Object? itemCartGroupOptions = null,
    Object? quantity = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      dish: freezed == dish
          ? _value.dish
          : dish // ignore: cast_nullable_to_non_nullable
              as Dish?,
      itemCartGroupOptions: null == itemCartGroupOptions
          ? _value.itemCartGroupOptions
          : itemCartGroupOptions // ignore: cast_nullable_to_non_nullable
              as List<ItemCartGroupOption>,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DishCopyWith<$Res>? get dish {
    if (_value.dish == null) {
      return null;
    }

    return $DishCopyWith<$Res>(_value.dish!, (value) {
      return _then(_value.copyWith(dish: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
          _$CartItemImpl value, $Res Function(_$CartItemImpl) then) =
      __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      User? user,
      Dish? dish,
      @JsonKey(name: "cartItem_groupOptions")
      List<ItemCartGroupOption> itemCartGroupOptions,
      int quantity,
      double total});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $DishCopyWith<$Res>? get dish;
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
      _$CartItemImpl _value, $Res Function(_$CartItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = freezed,
    Object? dish = freezed,
    Object? itemCartGroupOptions = null,
    Object? quantity = null,
    Object? total = null,
  }) {
    return _then(_$CartItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      dish: freezed == dish
          ? _value.dish
          : dish // ignore: cast_nullable_to_non_nullable
              as Dish?,
      itemCartGroupOptions: null == itemCartGroupOptions
          ? _value._itemCartGroupOptions
          : itemCartGroupOptions // ignore: cast_nullable_to_non_nullable
              as List<ItemCartGroupOption>,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemImpl implements _CartItem {
  const _$CartItemImpl(
      {this.id = 0,
      this.user,
      this.dish,
      @JsonKey(name: "cartItem_groupOptions")
      final List<ItemCartGroupOption> itemCartGroupOptions = const [],
      this.quantity = 0,
      this.total = 0})
      : _itemCartGroupOptions = itemCartGroupOptions;

  factory _$CartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final User? user;
  @override
  final Dish? dish;
  final List<ItemCartGroupOption> _itemCartGroupOptions;
  @override
  @JsonKey(name: "cartItem_groupOptions")
  List<ItemCartGroupOption> get itemCartGroupOptions {
    if (_itemCartGroupOptions is EqualUnmodifiableListView)
      return _itemCartGroupOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemCartGroupOptions);
  }

  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final double total;

  @override
  String toString() {
    return 'CartItem(id: $id, user: $user, dish: $dish, itemCartGroupOptions: $itemCartGroupOptions, quantity: $quantity, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.dish, dish) || other.dish == dish) &&
            const DeepCollectionEquality()
                .equals(other._itemCartGroupOptions, _itemCartGroupOptions) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      user,
      dish,
      const DeepCollectionEquality().hash(_itemCartGroupOptions),
      quantity,
      total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemImplToJson(
      this,
    );
  }
}

abstract class _CartItem implements CartItem {
  const factory _CartItem(
      {final int id,
      final User? user,
      final Dish? dish,
      @JsonKey(name: "cartItem_groupOptions")
      final List<ItemCartGroupOption> itemCartGroupOptions,
      final int quantity,
      final double total}) = _$CartItemImpl;

  factory _CartItem.fromJson(Map<String, dynamic> json) =
      _$CartItemImpl.fromJson;

  @override
  int get id;
  @override
  User? get user;
  @override
  Dish? get dish;
  @override
  @JsonKey(name: "cartItem_groupOptions")
  List<ItemCartGroupOption> get itemCartGroupOptions;
  @override
  int get quantity;
  @override
  double get total;
  @override
  @JsonKey(ignore: true)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

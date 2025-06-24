// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_line_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderLineItem _$OrderLineItemFromJson(Map<String, dynamic> json) {
  return _OrderLineItem.fromJson(json);
}

/// @nodoc
mixin _$OrderLineItem {
  int get id => throw _privateConstructorUsedError;
  Order? get order => throw _privateConstructorUsedError;
  List<OrderLineItemGroupOption> get orderLineItemGroupOptions =>
      throw _privateConstructorUsedError;
  Dish? get dish => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get subTotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderLineItemCopyWith<OrderLineItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderLineItemCopyWith<$Res> {
  factory $OrderLineItemCopyWith(
          OrderLineItem value, $Res Function(OrderLineItem) then) =
      _$OrderLineItemCopyWithImpl<$Res, OrderLineItem>;
  @useResult
  $Res call(
      {int id,
      Order? order,
      List<OrderLineItemGroupOption> orderLineItemGroupOptions,
      Dish? dish,
      int quantity,
      double subTotal});

  $OrderCopyWith<$Res>? get order;
  $DishCopyWith<$Res>? get dish;
}

/// @nodoc
class _$OrderLineItemCopyWithImpl<$Res, $Val extends OrderLineItem>
    implements $OrderLineItemCopyWith<$Res> {
  _$OrderLineItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? order = freezed,
    Object? orderLineItemGroupOptions = null,
    Object? dish = freezed,
    Object? quantity = null,
    Object? subTotal = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order?,
      orderLineItemGroupOptions: null == orderLineItemGroupOptions
          ? _value.orderLineItemGroupOptions
          : orderLineItemGroupOptions // ignore: cast_nullable_to_non_nullable
              as List<OrderLineItemGroupOption>,
      dish: freezed == dish
          ? _value.dish
          : dish // ignore: cast_nullable_to_non_nullable
              as Dish?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderCopyWith<$Res>? get order {
    if (_value.order == null) {
      return null;
    }

    return $OrderCopyWith<$Res>(_value.order!, (value) {
      return _then(_value.copyWith(order: value) as $Val);
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
abstract class _$$OrderLineItemImplCopyWith<$Res>
    implements $OrderLineItemCopyWith<$Res> {
  factory _$$OrderLineItemImplCopyWith(
          _$OrderLineItemImpl value, $Res Function(_$OrderLineItemImpl) then) =
      __$$OrderLineItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      Order? order,
      List<OrderLineItemGroupOption> orderLineItemGroupOptions,
      Dish? dish,
      int quantity,
      double subTotal});

  @override
  $OrderCopyWith<$Res>? get order;
  @override
  $DishCopyWith<$Res>? get dish;
}

/// @nodoc
class __$$OrderLineItemImplCopyWithImpl<$Res>
    extends _$OrderLineItemCopyWithImpl<$Res, _$OrderLineItemImpl>
    implements _$$OrderLineItemImplCopyWith<$Res> {
  __$$OrderLineItemImplCopyWithImpl(
      _$OrderLineItemImpl _value, $Res Function(_$OrderLineItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? order = freezed,
    Object? orderLineItemGroupOptions = null,
    Object? dish = freezed,
    Object? quantity = null,
    Object? subTotal = null,
  }) {
    return _then(_$OrderLineItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order?,
      orderLineItemGroupOptions: null == orderLineItemGroupOptions
          ? _value._orderLineItemGroupOptions
          : orderLineItemGroupOptions // ignore: cast_nullable_to_non_nullable
              as List<OrderLineItemGroupOption>,
      dish: freezed == dish
          ? _value.dish
          : dish // ignore: cast_nullable_to_non_nullable
              as Dish?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderLineItemImpl implements _OrderLineItem {
  const _$OrderLineItemImpl(
      {this.id = 0,
      this.order,
      final List<OrderLineItemGroupOption> orderLineItemGroupOptions = const [],
      this.dish,
      this.quantity = 0,
      this.subTotal = 0})
      : _orderLineItemGroupOptions = orderLineItemGroupOptions;

  factory _$OrderLineItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderLineItemImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final Order? order;
  final List<OrderLineItemGroupOption> _orderLineItemGroupOptions;
  @override
  @JsonKey()
  List<OrderLineItemGroupOption> get orderLineItemGroupOptions {
    if (_orderLineItemGroupOptions is EqualUnmodifiableListView)
      return _orderLineItemGroupOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderLineItemGroupOptions);
  }

  @override
  final Dish? dish;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final double subTotal;

  @override
  String toString() {
    return 'OrderLineItem(id: $id, order: $order, orderLineItemGroupOptions: $orderLineItemGroupOptions, dish: $dish, quantity: $quantity, subTotal: $subTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderLineItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.order, order) || other.order == order) &&
            const DeepCollectionEquality().equals(
                other._orderLineItemGroupOptions, _orderLineItemGroupOptions) &&
            (identical(other.dish, dish) || other.dish == dish) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      order,
      const DeepCollectionEquality().hash(_orderLineItemGroupOptions),
      dish,
      quantity,
      subTotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderLineItemImplCopyWith<_$OrderLineItemImpl> get copyWith =>
      __$$OrderLineItemImplCopyWithImpl<_$OrderLineItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderLineItemImplToJson(
      this,
    );
  }
}

abstract class _OrderLineItem implements OrderLineItem {
  const factory _OrderLineItem(
      {final int id,
      final Order? order,
      final List<OrderLineItemGroupOption> orderLineItemGroupOptions,
      final Dish? dish,
      final int quantity,
      final double subTotal}) = _$OrderLineItemImpl;

  factory _OrderLineItem.fromJson(Map<String, dynamic> json) =
      _$OrderLineItemImpl.fromJson;

  @override
  int get id;
  @override
  Order? get order;
  @override
  List<OrderLineItemGroupOption> get orderLineItemGroupOptions;
  @override
  Dish? get dish;
  @override
  int get quantity;
  @override
  double get subTotal;
  @override
  @JsonKey(ignore: true)
  _$$OrderLineItemImplCopyWith<_$OrderLineItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_line_item_option_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderLineItemOptionItem _$OrderLineItemOptionItemFromJson(
    Map<String, dynamic> json) {
  return _OrderLineItemOptionItem.fromJson(json);
}

/// @nodoc
mixin _$OrderLineItemOptionItem {
  int get id => throw _privateConstructorUsedError;
  OrderLineItemGroupOption? get orderLineItem_GroupOption =>
      throw _privateConstructorUsedError;
  OptionItem? get optionItem => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderLineItemOptionItemCopyWith<OrderLineItemOptionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderLineItemOptionItemCopyWith<$Res> {
  factory $OrderLineItemOptionItemCopyWith(OrderLineItemOptionItem value,
          $Res Function(OrderLineItemOptionItem) then) =
      _$OrderLineItemOptionItemCopyWithImpl<$Res, OrderLineItemOptionItem>;
  @useResult
  $Res call(
      {int id,
      OrderLineItemGroupOption? orderLineItem_GroupOption,
      OptionItem? optionItem,
      int quantity,
      double price});

  $OrderLineItemGroupOptionCopyWith<$Res>? get orderLineItem_GroupOption;
  $OptionItemCopyWith<$Res>? get optionItem;
}

/// @nodoc
class _$OrderLineItemOptionItemCopyWithImpl<$Res,
        $Val extends OrderLineItemOptionItem>
    implements $OrderLineItemOptionItemCopyWith<$Res> {
  _$OrderLineItemOptionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderLineItem_GroupOption = freezed,
    Object? optionItem = freezed,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderLineItem_GroupOption: freezed == orderLineItem_GroupOption
          ? _value.orderLineItem_GroupOption
          : orderLineItem_GroupOption // ignore: cast_nullable_to_non_nullable
              as OrderLineItemGroupOption?,
      optionItem: freezed == optionItem
          ? _value.optionItem
          : optionItem // ignore: cast_nullable_to_non_nullable
              as OptionItem?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderLineItemGroupOptionCopyWith<$Res>? get orderLineItem_GroupOption {
    if (_value.orderLineItem_GroupOption == null) {
      return null;
    }

    return $OrderLineItemGroupOptionCopyWith<$Res>(
        _value.orderLineItem_GroupOption!, (value) {
      return _then(_value.copyWith(orderLineItem_GroupOption: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OptionItemCopyWith<$Res>? get optionItem {
    if (_value.optionItem == null) {
      return null;
    }

    return $OptionItemCopyWith<$Res>(_value.optionItem!, (value) {
      return _then(_value.copyWith(optionItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderLineItemOptionItemImplCopyWith<$Res>
    implements $OrderLineItemOptionItemCopyWith<$Res> {
  factory _$$OrderLineItemOptionItemImplCopyWith(
          _$OrderLineItemOptionItemImpl value,
          $Res Function(_$OrderLineItemOptionItemImpl) then) =
      __$$OrderLineItemOptionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      OrderLineItemGroupOption? orderLineItem_GroupOption,
      OptionItem? optionItem,
      int quantity,
      double price});

  @override
  $OrderLineItemGroupOptionCopyWith<$Res>? get orderLineItem_GroupOption;
  @override
  $OptionItemCopyWith<$Res>? get optionItem;
}

/// @nodoc
class __$$OrderLineItemOptionItemImplCopyWithImpl<$Res>
    extends _$OrderLineItemOptionItemCopyWithImpl<$Res,
        _$OrderLineItemOptionItemImpl>
    implements _$$OrderLineItemOptionItemImplCopyWith<$Res> {
  __$$OrderLineItemOptionItemImplCopyWithImpl(
      _$OrderLineItemOptionItemImpl _value,
      $Res Function(_$OrderLineItemOptionItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderLineItem_GroupOption = freezed,
    Object? optionItem = freezed,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_$OrderLineItemOptionItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderLineItem_GroupOption: freezed == orderLineItem_GroupOption
          ? _value.orderLineItem_GroupOption
          : orderLineItem_GroupOption // ignore: cast_nullable_to_non_nullable
              as OrderLineItemGroupOption?,
      optionItem: freezed == optionItem
          ? _value.optionItem
          : optionItem // ignore: cast_nullable_to_non_nullable
              as OptionItem?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderLineItemOptionItemImpl implements _OrderLineItemOptionItem {
  const _$OrderLineItemOptionItemImpl(
      {this.id = 0,
      this.orderLineItem_GroupOption,
      this.optionItem,
      this.quantity = 0,
      this.price = 0});

  factory _$OrderLineItemOptionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderLineItemOptionItemImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final OrderLineItemGroupOption? orderLineItem_GroupOption;
  @override
  final OptionItem? optionItem;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final double price;

  @override
  String toString() {
    return 'OrderLineItemOptionItem(id: $id, orderLineItem_GroupOption: $orderLineItem_GroupOption, optionItem: $optionItem, quantity: $quantity, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderLineItemOptionItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderLineItem_GroupOption,
                    orderLineItem_GroupOption) ||
                other.orderLineItem_GroupOption == orderLineItem_GroupOption) &&
            (identical(other.optionItem, optionItem) ||
                other.optionItem == optionItem) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, orderLineItem_GroupOption, optionItem, quantity, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderLineItemOptionItemImplCopyWith<_$OrderLineItemOptionItemImpl>
      get copyWith => __$$OrderLineItemOptionItemImplCopyWithImpl<
          _$OrderLineItemOptionItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderLineItemOptionItemImplToJson(
      this,
    );
  }
}

abstract class _OrderLineItemOptionItem implements OrderLineItemOptionItem {
  const factory _OrderLineItemOptionItem(
      {final int id,
      final OrderLineItemGroupOption? orderLineItem_GroupOption,
      final OptionItem? optionItem,
      final int quantity,
      final double price}) = _$OrderLineItemOptionItemImpl;

  factory _OrderLineItemOptionItem.fromJson(Map<String, dynamic> json) =
      _$OrderLineItemOptionItemImpl.fromJson;

  @override
  int get id;
  @override
  OrderLineItemGroupOption? get orderLineItem_GroupOption;
  @override
  OptionItem? get optionItem;
  @override
  int get quantity;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$OrderLineItemOptionItemImplCopyWith<_$OrderLineItemOptionItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_line_item_group_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderLineItemGroupOption _$OrderLineItemGroupOptionFromJson(
    Map<String, dynamic> json) {
  return _OrderLineItemGroupOption.fromJson(json);
}

/// @nodoc
mixin _$OrderLineItemGroupOption {
  int get id => throw _privateConstructorUsedError;
  OrderLineItem? get orderLineItem => throw _privateConstructorUsedError;
  GroupOption? get groupOption => throw _privateConstructorUsedError;
  List<OrderLineItemOptionItem> get orderLineItemOptions =>
      throw _privateConstructorUsedError;
  double get groupOptionSubtotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderLineItemGroupOptionCopyWith<OrderLineItemGroupOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderLineItemGroupOptionCopyWith<$Res> {
  factory $OrderLineItemGroupOptionCopyWith(OrderLineItemGroupOption value,
          $Res Function(OrderLineItemGroupOption) then) =
      _$OrderLineItemGroupOptionCopyWithImpl<$Res, OrderLineItemGroupOption>;
  @useResult
  $Res call(
      {int id,
      OrderLineItem? orderLineItem,
      GroupOption? groupOption,
      List<OrderLineItemOptionItem> orderLineItemOptions,
      double groupOptionSubtotal});

  $OrderLineItemCopyWith<$Res>? get orderLineItem;
  $GroupOptionCopyWith<$Res>? get groupOption;
}

/// @nodoc
class _$OrderLineItemGroupOptionCopyWithImpl<$Res,
        $Val extends OrderLineItemGroupOption>
    implements $OrderLineItemGroupOptionCopyWith<$Res> {
  _$OrderLineItemGroupOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderLineItem = freezed,
    Object? groupOption = freezed,
    Object? orderLineItemOptions = null,
    Object? groupOptionSubtotal = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderLineItem: freezed == orderLineItem
          ? _value.orderLineItem
          : orderLineItem // ignore: cast_nullable_to_non_nullable
              as OrderLineItem?,
      groupOption: freezed == groupOption
          ? _value.groupOption
          : groupOption // ignore: cast_nullable_to_non_nullable
              as GroupOption?,
      orderLineItemOptions: null == orderLineItemOptions
          ? _value.orderLineItemOptions
          : orderLineItemOptions // ignore: cast_nullable_to_non_nullable
              as List<OrderLineItemOptionItem>,
      groupOptionSubtotal: null == groupOptionSubtotal
          ? _value.groupOptionSubtotal
          : groupOptionSubtotal // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderLineItemCopyWith<$Res>? get orderLineItem {
    if (_value.orderLineItem == null) {
      return null;
    }

    return $OrderLineItemCopyWith<$Res>(_value.orderLineItem!, (value) {
      return _then(_value.copyWith(orderLineItem: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupOptionCopyWith<$Res>? get groupOption {
    if (_value.groupOption == null) {
      return null;
    }

    return $GroupOptionCopyWith<$Res>(_value.groupOption!, (value) {
      return _then(_value.copyWith(groupOption: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderLineItemGroupOptionImplCopyWith<$Res>
    implements $OrderLineItemGroupOptionCopyWith<$Res> {
  factory _$$OrderLineItemGroupOptionImplCopyWith(
          _$OrderLineItemGroupOptionImpl value,
          $Res Function(_$OrderLineItemGroupOptionImpl) then) =
      __$$OrderLineItemGroupOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      OrderLineItem? orderLineItem,
      GroupOption? groupOption,
      List<OrderLineItemOptionItem> orderLineItemOptions,
      double groupOptionSubtotal});

  @override
  $OrderLineItemCopyWith<$Res>? get orderLineItem;
  @override
  $GroupOptionCopyWith<$Res>? get groupOption;
}

/// @nodoc
class __$$OrderLineItemGroupOptionImplCopyWithImpl<$Res>
    extends _$OrderLineItemGroupOptionCopyWithImpl<$Res,
        _$OrderLineItemGroupOptionImpl>
    implements _$$OrderLineItemGroupOptionImplCopyWith<$Res> {
  __$$OrderLineItemGroupOptionImplCopyWithImpl(
      _$OrderLineItemGroupOptionImpl _value,
      $Res Function(_$OrderLineItemGroupOptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderLineItem = freezed,
    Object? groupOption = freezed,
    Object? orderLineItemOptions = null,
    Object? groupOptionSubtotal = null,
  }) {
    return _then(_$OrderLineItemGroupOptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderLineItem: freezed == orderLineItem
          ? _value.orderLineItem
          : orderLineItem // ignore: cast_nullable_to_non_nullable
              as OrderLineItem?,
      groupOption: freezed == groupOption
          ? _value.groupOption
          : groupOption // ignore: cast_nullable_to_non_nullable
              as GroupOption?,
      orderLineItemOptions: null == orderLineItemOptions
          ? _value._orderLineItemOptions
          : orderLineItemOptions // ignore: cast_nullable_to_non_nullable
              as List<OrderLineItemOptionItem>,
      groupOptionSubtotal: null == groupOptionSubtotal
          ? _value.groupOptionSubtotal
          : groupOptionSubtotal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderLineItemGroupOptionImpl implements _OrderLineItemGroupOption {
  const _$OrderLineItemGroupOptionImpl(
      {this.id = 0,
      this.orderLineItem,
      this.groupOption,
      final List<OrderLineItemOptionItem> orderLineItemOptions = const [],
      this.groupOptionSubtotal = 0})
      : _orderLineItemOptions = orderLineItemOptions;

  factory _$OrderLineItemGroupOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderLineItemGroupOptionImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final OrderLineItem? orderLineItem;
  @override
  final GroupOption? groupOption;
  final List<OrderLineItemOptionItem> _orderLineItemOptions;
  @override
  @JsonKey()
  List<OrderLineItemOptionItem> get orderLineItemOptions {
    if (_orderLineItemOptions is EqualUnmodifiableListView)
      return _orderLineItemOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderLineItemOptions);
  }

  @override
  @JsonKey()
  final double groupOptionSubtotal;

  @override
  String toString() {
    return 'OrderLineItemGroupOption(id: $id, orderLineItem: $orderLineItem, groupOption: $groupOption, orderLineItemOptions: $orderLineItemOptions, groupOptionSubtotal: $groupOptionSubtotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderLineItemGroupOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderLineItem, orderLineItem) ||
                other.orderLineItem == orderLineItem) &&
            (identical(other.groupOption, groupOption) ||
                other.groupOption == groupOption) &&
            const DeepCollectionEquality()
                .equals(other._orderLineItemOptions, _orderLineItemOptions) &&
            (identical(other.groupOptionSubtotal, groupOptionSubtotal) ||
                other.groupOptionSubtotal == groupOptionSubtotal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderLineItem,
      groupOption,
      const DeepCollectionEquality().hash(_orderLineItemOptions),
      groupOptionSubtotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderLineItemGroupOptionImplCopyWith<_$OrderLineItemGroupOptionImpl>
      get copyWith => __$$OrderLineItemGroupOptionImplCopyWithImpl<
          _$OrderLineItemGroupOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderLineItemGroupOptionImplToJson(
      this,
    );
  }
}

abstract class _OrderLineItemGroupOption implements OrderLineItemGroupOption {
  const factory _OrderLineItemGroupOption(
      {final int id,
      final OrderLineItem? orderLineItem,
      final GroupOption? groupOption,
      final List<OrderLineItemOptionItem> orderLineItemOptions,
      final double groupOptionSubtotal}) = _$OrderLineItemGroupOptionImpl;

  factory _OrderLineItemGroupOption.fromJson(Map<String, dynamic> json) =
      _$OrderLineItemGroupOptionImpl.fromJson;

  @override
  int get id;
  @override
  OrderLineItem? get orderLineItem;
  @override
  GroupOption? get groupOption;
  @override
  List<OrderLineItemOptionItem> get orderLineItemOptions;
  @override
  double get groupOptionSubtotal;
  @override
  @JsonKey(ignore: true)
  _$$OrderLineItemGroupOptionImplCopyWith<_$OrderLineItemGroupOptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

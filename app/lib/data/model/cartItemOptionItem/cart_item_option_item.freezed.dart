// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_option_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartItemOptionItem _$CartItemOptionItemFromJson(Map<String, dynamic> json) {
  return _CartItemOptionItem.fromJson(json);
}

/// @nodoc
mixin _$CartItemOptionItem {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "cartItem_groupOption")
  ItemCartGroupOption? get itemCartGroupOption =>
      throw _privateConstructorUsedError;
  OptionItem? get optionItem => throw _privateConstructorUsedError;
  GroupOption? get groupOption => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartItemOptionItemCopyWith<CartItemOptionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemOptionItemCopyWith<$Res> {
  factory $CartItemOptionItemCopyWith(
          CartItemOptionItem value, $Res Function(CartItemOptionItem) then) =
      _$CartItemOptionItemCopyWithImpl<$Res, CartItemOptionItem>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "cartItem_groupOption")
      ItemCartGroupOption? itemCartGroupOption,
      OptionItem? optionItem,
      GroupOption? groupOption,
      int quantity,
      double price});

  $ItemCartGroupOptionCopyWith<$Res>? get itemCartGroupOption;
  $OptionItemCopyWith<$Res>? get optionItem;
  $GroupOptionCopyWith<$Res>? get groupOption;
}

/// @nodoc
class _$CartItemOptionItemCopyWithImpl<$Res, $Val extends CartItemOptionItem>
    implements $CartItemOptionItemCopyWith<$Res> {
  _$CartItemOptionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemCartGroupOption = freezed,
    Object? optionItem = freezed,
    Object? groupOption = freezed,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      itemCartGroupOption: freezed == itemCartGroupOption
          ? _value.itemCartGroupOption
          : itemCartGroupOption // ignore: cast_nullable_to_non_nullable
              as ItemCartGroupOption?,
      optionItem: freezed == optionItem
          ? _value.optionItem
          : optionItem // ignore: cast_nullable_to_non_nullable
              as OptionItem?,
      groupOption: freezed == groupOption
          ? _value.groupOption
          : groupOption // ignore: cast_nullable_to_non_nullable
              as GroupOption?,
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
  $ItemCartGroupOptionCopyWith<$Res>? get itemCartGroupOption {
    if (_value.itemCartGroupOption == null) {
      return null;
    }

    return $ItemCartGroupOptionCopyWith<$Res>(_value.itemCartGroupOption!,
        (value) {
      return _then(_value.copyWith(itemCartGroupOption: value) as $Val);
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
abstract class _$$CartItemOptionItemImplCopyWith<$Res>
    implements $CartItemOptionItemCopyWith<$Res> {
  factory _$$CartItemOptionItemImplCopyWith(_$CartItemOptionItemImpl value,
          $Res Function(_$CartItemOptionItemImpl) then) =
      __$$CartItemOptionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "cartItem_groupOption")
      ItemCartGroupOption? itemCartGroupOption,
      OptionItem? optionItem,
      GroupOption? groupOption,
      int quantity,
      double price});

  @override
  $ItemCartGroupOptionCopyWith<$Res>? get itemCartGroupOption;
  @override
  $OptionItemCopyWith<$Res>? get optionItem;
  @override
  $GroupOptionCopyWith<$Res>? get groupOption;
}

/// @nodoc
class __$$CartItemOptionItemImplCopyWithImpl<$Res>
    extends _$CartItemOptionItemCopyWithImpl<$Res, _$CartItemOptionItemImpl>
    implements _$$CartItemOptionItemImplCopyWith<$Res> {
  __$$CartItemOptionItemImplCopyWithImpl(_$CartItemOptionItemImpl _value,
      $Res Function(_$CartItemOptionItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemCartGroupOption = freezed,
    Object? optionItem = freezed,
    Object? groupOption = freezed,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_$CartItemOptionItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      itemCartGroupOption: freezed == itemCartGroupOption
          ? _value.itemCartGroupOption
          : itemCartGroupOption // ignore: cast_nullable_to_non_nullable
              as ItemCartGroupOption?,
      optionItem: freezed == optionItem
          ? _value.optionItem
          : optionItem // ignore: cast_nullable_to_non_nullable
              as OptionItem?,
      groupOption: freezed == groupOption
          ? _value.groupOption
          : groupOption // ignore: cast_nullable_to_non_nullable
              as GroupOption?,
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
class _$CartItemOptionItemImpl implements _CartItemOptionItem {
  const _$CartItemOptionItemImpl(
      {this.id = 0,
      @JsonKey(name: "cartItem_groupOption") this.itemCartGroupOption,
      this.optionItem,
      this.groupOption,
      this.quantity = 0,
      this.price = 0});

  factory _$CartItemOptionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemOptionItemImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: "cartItem_groupOption")
  final ItemCartGroupOption? itemCartGroupOption;
  @override
  final OptionItem? optionItem;
  @override
  final GroupOption? groupOption;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final double price;

  @override
  String toString() {
    return 'CartItemOptionItem(id: $id, itemCartGroupOption: $itemCartGroupOption, optionItem: $optionItem, groupOption: $groupOption, quantity: $quantity, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemOptionItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemCartGroupOption, itemCartGroupOption) ||
                other.itemCartGroupOption == itemCartGroupOption) &&
            (identical(other.optionItem, optionItem) ||
                other.optionItem == optionItem) &&
            (identical(other.groupOption, groupOption) ||
                other.groupOption == groupOption) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, itemCartGroupOption,
      optionItem, groupOption, quantity, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemOptionItemImplCopyWith<_$CartItemOptionItemImpl> get copyWith =>
      __$$CartItemOptionItemImplCopyWithImpl<_$CartItemOptionItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemOptionItemImplToJson(
      this,
    );
  }
}

abstract class _CartItemOptionItem implements CartItemOptionItem {
  const factory _CartItemOptionItem(
      {final int id,
      @JsonKey(name: "cartItem_groupOption")
      final ItemCartGroupOption? itemCartGroupOption,
      final OptionItem? optionItem,
      final GroupOption? groupOption,
      final int quantity,
      final double price}) = _$CartItemOptionItemImpl;

  factory _CartItemOptionItem.fromJson(Map<String, dynamic> json) =
      _$CartItemOptionItemImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "cartItem_groupOption")
  ItemCartGroupOption? get itemCartGroupOption;
  @override
  OptionItem? get optionItem;
  @override
  GroupOption? get groupOption;
  @override
  int get quantity;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$CartItemOptionItemImplCopyWith<_$CartItemOptionItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

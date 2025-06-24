// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_cart_group_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemCartGroupOption _$ItemCartGroupOptionFromJson(Map<String, dynamic> json) {
  return _ItemCartGroupOption.fromJson(json);
}

/// @nodoc
mixin _$ItemCartGroupOption {
  int get id => throw _privateConstructorUsedError;
  CartItem? get cartItem => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  GroupOption? get groupOption => throw _privateConstructorUsedError;
  List<CartItemOptionItem> get cartItemOptions =>
      throw _privateConstructorUsedError;
  double get groupOptionSubtotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCartGroupOptionCopyWith<ItemCartGroupOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCartGroupOptionCopyWith<$Res> {
  factory $ItemCartGroupOptionCopyWith(
          ItemCartGroupOption value, $Res Function(ItemCartGroupOption) then) =
      _$ItemCartGroupOptionCopyWithImpl<$Res, ItemCartGroupOption>;
  @useResult
  $Res call(
      {int id,
      CartItem? cartItem,
      Category? category,
      GroupOption? groupOption,
      List<CartItemOptionItem> cartItemOptions,
      double groupOptionSubtotal});

  $CartItemCopyWith<$Res>? get cartItem;
  $CategoryCopyWith<$Res>? get category;
  $GroupOptionCopyWith<$Res>? get groupOption;
}

/// @nodoc
class _$ItemCartGroupOptionCopyWithImpl<$Res, $Val extends ItemCartGroupOption>
    implements $ItemCartGroupOptionCopyWith<$Res> {
  _$ItemCartGroupOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cartItem = freezed,
    Object? category = freezed,
    Object? groupOption = freezed,
    Object? cartItemOptions = null,
    Object? groupOptionSubtotal = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cartItem: freezed == cartItem
          ? _value.cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as CartItem?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      groupOption: freezed == groupOption
          ? _value.groupOption
          : groupOption // ignore: cast_nullable_to_non_nullable
              as GroupOption?,
      cartItemOptions: null == cartItemOptions
          ? _value.cartItemOptions
          : cartItemOptions // ignore: cast_nullable_to_non_nullable
              as List<CartItemOptionItem>,
      groupOptionSubtotal: null == groupOptionSubtotal
          ? _value.groupOptionSubtotal
          : groupOptionSubtotal // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CartItemCopyWith<$Res>? get cartItem {
    if (_value.cartItem == null) {
      return null;
    }

    return $CartItemCopyWith<$Res>(_value.cartItem!, (value) {
      return _then(_value.copyWith(cartItem: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
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
abstract class _$$ItemCartGroupOptionImplCopyWith<$Res>
    implements $ItemCartGroupOptionCopyWith<$Res> {
  factory _$$ItemCartGroupOptionImplCopyWith(_$ItemCartGroupOptionImpl value,
          $Res Function(_$ItemCartGroupOptionImpl) then) =
      __$$ItemCartGroupOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      CartItem? cartItem,
      Category? category,
      GroupOption? groupOption,
      List<CartItemOptionItem> cartItemOptions,
      double groupOptionSubtotal});

  @override
  $CartItemCopyWith<$Res>? get cartItem;
  @override
  $CategoryCopyWith<$Res>? get category;
  @override
  $GroupOptionCopyWith<$Res>? get groupOption;
}

/// @nodoc
class __$$ItemCartGroupOptionImplCopyWithImpl<$Res>
    extends _$ItemCartGroupOptionCopyWithImpl<$Res, _$ItemCartGroupOptionImpl>
    implements _$$ItemCartGroupOptionImplCopyWith<$Res> {
  __$$ItemCartGroupOptionImplCopyWithImpl(_$ItemCartGroupOptionImpl _value,
      $Res Function(_$ItemCartGroupOptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cartItem = freezed,
    Object? category = freezed,
    Object? groupOption = freezed,
    Object? cartItemOptions = null,
    Object? groupOptionSubtotal = null,
  }) {
    return _then(_$ItemCartGroupOptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cartItem: freezed == cartItem
          ? _value.cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as CartItem?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      groupOption: freezed == groupOption
          ? _value.groupOption
          : groupOption // ignore: cast_nullable_to_non_nullable
              as GroupOption?,
      cartItemOptions: null == cartItemOptions
          ? _value._cartItemOptions
          : cartItemOptions // ignore: cast_nullable_to_non_nullable
              as List<CartItemOptionItem>,
      groupOptionSubtotal: null == groupOptionSubtotal
          ? _value.groupOptionSubtotal
          : groupOptionSubtotal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemCartGroupOptionImpl implements _ItemCartGroupOption {
  const _$ItemCartGroupOptionImpl(
      {this.id = 0,
      this.cartItem,
      this.category,
      this.groupOption,
      final List<CartItemOptionItem> cartItemOptions = const [],
      this.groupOptionSubtotal = 0})
      : _cartItemOptions = cartItemOptions;

  factory _$ItemCartGroupOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemCartGroupOptionImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final CartItem? cartItem;
  @override
  final Category? category;
  @override
  final GroupOption? groupOption;
  final List<CartItemOptionItem> _cartItemOptions;
  @override
  @JsonKey()
  List<CartItemOptionItem> get cartItemOptions {
    if (_cartItemOptions is EqualUnmodifiableListView) return _cartItemOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItemOptions);
  }

  @override
  @JsonKey()
  final double groupOptionSubtotal;

  @override
  String toString() {
    return 'ItemCartGroupOption(id: $id, cartItem: $cartItem, category: $category, groupOption: $groupOption, cartItemOptions: $cartItemOptions, groupOptionSubtotal: $groupOptionSubtotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemCartGroupOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cartItem, cartItem) ||
                other.cartItem == cartItem) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.groupOption, groupOption) ||
                other.groupOption == groupOption) &&
            const DeepCollectionEquality()
                .equals(other._cartItemOptions, _cartItemOptions) &&
            (identical(other.groupOptionSubtotal, groupOptionSubtotal) ||
                other.groupOptionSubtotal == groupOptionSubtotal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      cartItem,
      category,
      groupOption,
      const DeepCollectionEquality().hash(_cartItemOptions),
      groupOptionSubtotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemCartGroupOptionImplCopyWith<_$ItemCartGroupOptionImpl> get copyWith =>
      __$$ItemCartGroupOptionImplCopyWithImpl<_$ItemCartGroupOptionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemCartGroupOptionImplToJson(
      this,
    );
  }
}

abstract class _ItemCartGroupOption implements ItemCartGroupOption {
  const factory _ItemCartGroupOption(
      {final int id,
      final CartItem? cartItem,
      final Category? category,
      final GroupOption? groupOption,
      final List<CartItemOptionItem> cartItemOptions,
      final double groupOptionSubtotal}) = _$ItemCartGroupOptionImpl;

  factory _ItemCartGroupOption.fromJson(Map<String, dynamic> json) =
      _$ItemCartGroupOptionImpl.fromJson;

  @override
  int get id;
  @override
  CartItem? get cartItem;
  @override
  Category? get category;
  @override
  GroupOption? get groupOption;
  @override
  List<CartItemOptionItem> get cartItemOptions;
  @override
  double get groupOptionSubtotal;
  @override
  @JsonKey(ignore: true)
  _$$ItemCartGroupOptionImplCopyWith<_$ItemCartGroupOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

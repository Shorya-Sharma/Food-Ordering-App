// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) {
  return _OrderRequest.fromJson(json);
}

/// @nodoc
mixin _$OrderRequest {
  int get user_id => throw _privateConstructorUsedError;
  double get total_price => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  List<int> get voucher_ids => throw _privateConstructorUsedError;
  List<OrderItemRequest> get order_items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderRequestCopyWith<OrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderRequestCopyWith<$Res> {
  factory $OrderRequestCopyWith(
          OrderRequest value, $Res Function(OrderRequest) then) =
      _$OrderRequestCopyWithImpl<$Res, OrderRequest>;
  @useResult
  $Res call(
      {int user_id,
      double total_price,
      String address,
      List<int> voucher_ids,
      List<OrderItemRequest> order_items});
}

/// @nodoc
class _$OrderRequestCopyWithImpl<$Res, $Val extends OrderRequest>
    implements $OrderRequestCopyWith<$Res> {
  _$OrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_id = null,
    Object? total_price = null,
    Object? address = null,
    Object? voucher_ids = null,
    Object? order_items = null,
  }) {
    return _then(_value.copyWith(
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      total_price: null == total_price
          ? _value.total_price
          : total_price // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      voucher_ids: null == voucher_ids
          ? _value.voucher_ids
          : voucher_ids // ignore: cast_nullable_to_non_nullable
              as List<int>,
      order_items: null == order_items
          ? _value.order_items
          : order_items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemRequest>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderRequestImplCopyWith<$Res>
    implements $OrderRequestCopyWith<$Res> {
  factory _$$OrderRequestImplCopyWith(
          _$OrderRequestImpl value, $Res Function(_$OrderRequestImpl) then) =
      __$$OrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int user_id,
      double total_price,
      String address,
      List<int> voucher_ids,
      List<OrderItemRequest> order_items});
}

/// @nodoc
class __$$OrderRequestImplCopyWithImpl<$Res>
    extends _$OrderRequestCopyWithImpl<$Res, _$OrderRequestImpl>
    implements _$$OrderRequestImplCopyWith<$Res> {
  __$$OrderRequestImplCopyWithImpl(
      _$OrderRequestImpl _value, $Res Function(_$OrderRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_id = null,
    Object? total_price = null,
    Object? address = null,
    Object? voucher_ids = null,
    Object? order_items = null,
  }) {
    return _then(_$OrderRequestImpl(
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      total_price: null == total_price
          ? _value.total_price
          : total_price // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      voucher_ids: null == voucher_ids
          ? _value._voucher_ids
          : voucher_ids // ignore: cast_nullable_to_non_nullable
              as List<int>,
      order_items: null == order_items
          ? _value._order_items
          : order_items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemRequest>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderRequestImpl implements _OrderRequest {
  const _$OrderRequestImpl(
      {required this.user_id,
      required this.total_price,
      required this.address,
      required final List<int> voucher_ids,
      required final List<OrderItemRequest> order_items})
      : _voucher_ids = voucher_ids,
        _order_items = order_items;

  factory _$OrderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderRequestImplFromJson(json);

  @override
  final int user_id;
  @override
  final double total_price;
  @override
  final String address;
  final List<int> _voucher_ids;
  @override
  List<int> get voucher_ids {
    if (_voucher_ids is EqualUnmodifiableListView) return _voucher_ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_voucher_ids);
  }

  final List<OrderItemRequest> _order_items;
  @override
  List<OrderItemRequest> get order_items {
    if (_order_items is EqualUnmodifiableListView) return _order_items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_order_items);
  }

  @override
  String toString() {
    return 'OrderRequest(user_id: $user_id, total_price: $total_price, address: $address, voucher_ids: $voucher_ids, order_items: $order_items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderRequestImpl &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.total_price, total_price) ||
                other.total_price == total_price) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._voucher_ids, _voucher_ids) &&
            const DeepCollectionEquality()
                .equals(other._order_items, _order_items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      user_id,
      total_price,
      address,
      const DeepCollectionEquality().hash(_voucher_ids),
      const DeepCollectionEquality().hash(_order_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderRequestImplCopyWith<_$OrderRequestImpl> get copyWith =>
      __$$OrderRequestImplCopyWithImpl<_$OrderRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderRequestImplToJson(
      this,
    );
  }
}

abstract class _OrderRequest implements OrderRequest {
  const factory _OrderRequest(
      {required final int user_id,
      required final double total_price,
      required final String address,
      required final List<int> voucher_ids,
      required final List<OrderItemRequest> order_items}) = _$OrderRequestImpl;

  factory _OrderRequest.fromJson(Map<String, dynamic> json) =
      _$OrderRequestImpl.fromJson;

  @override
  int get user_id;
  @override
  double get total_price;
  @override
  String get address;
  @override
  List<int> get voucher_ids;
  @override
  List<OrderItemRequest> get order_items;
  @override
  @JsonKey(ignore: true)
  _$$OrderRequestImplCopyWith<_$OrderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItemRequest _$OrderItemRequestFromJson(Map<String, dynamic> json) {
  return _OrderItemRequest.fromJson(json);
}

/// @nodoc
mixin _$OrderItemRequest {
  int get dish_id => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get item_price => throw _privateConstructorUsedError;
  List<ItemGroupOptionRequest> get item_group_options =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemRequestCopyWith<OrderItemRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemRequestCopyWith<$Res> {
  factory $OrderItemRequestCopyWith(
          OrderItemRequest value, $Res Function(OrderItemRequest) then) =
      _$OrderItemRequestCopyWithImpl<$Res, OrderItemRequest>;
  @useResult
  $Res call(
      {int dish_id,
      int quantity,
      double item_price,
      List<ItemGroupOptionRequest> item_group_options});
}

/// @nodoc
class _$OrderItemRequestCopyWithImpl<$Res, $Val extends OrderItemRequest>
    implements $OrderItemRequestCopyWith<$Res> {
  _$OrderItemRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dish_id = null,
    Object? quantity = null,
    Object? item_price = null,
    Object? item_group_options = null,
  }) {
    return _then(_value.copyWith(
      dish_id: null == dish_id
          ? _value.dish_id
          : dish_id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      item_price: null == item_price
          ? _value.item_price
          : item_price // ignore: cast_nullable_to_non_nullable
              as double,
      item_group_options: null == item_group_options
          ? _value.item_group_options
          : item_group_options // ignore: cast_nullable_to_non_nullable
              as List<ItemGroupOptionRequest>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemRequestImplCopyWith<$Res>
    implements $OrderItemRequestCopyWith<$Res> {
  factory _$$OrderItemRequestImplCopyWith(_$OrderItemRequestImpl value,
          $Res Function(_$OrderItemRequestImpl) then) =
      __$$OrderItemRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int dish_id,
      int quantity,
      double item_price,
      List<ItemGroupOptionRequest> item_group_options});
}

/// @nodoc
class __$$OrderItemRequestImplCopyWithImpl<$Res>
    extends _$OrderItemRequestCopyWithImpl<$Res, _$OrderItemRequestImpl>
    implements _$$OrderItemRequestImplCopyWith<$Res> {
  __$$OrderItemRequestImplCopyWithImpl(_$OrderItemRequestImpl _value,
      $Res Function(_$OrderItemRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dish_id = null,
    Object? quantity = null,
    Object? item_price = null,
    Object? item_group_options = null,
  }) {
    return _then(_$OrderItemRequestImpl(
      dish_id: null == dish_id
          ? _value.dish_id
          : dish_id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      item_price: null == item_price
          ? _value.item_price
          : item_price // ignore: cast_nullable_to_non_nullable
              as double,
      item_group_options: null == item_group_options
          ? _value._item_group_options
          : item_group_options // ignore: cast_nullable_to_non_nullable
              as List<ItemGroupOptionRequest>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemRequestImpl implements _OrderItemRequest {
  const _$OrderItemRequestImpl(
      {required this.dish_id,
      required this.quantity,
      required this.item_price,
      required final List<ItemGroupOptionRequest> item_group_options})
      : _item_group_options = item_group_options;

  factory _$OrderItemRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemRequestImplFromJson(json);

  @override
  final int dish_id;
  @override
  final int quantity;
  @override
  final double item_price;
  final List<ItemGroupOptionRequest> _item_group_options;
  @override
  List<ItemGroupOptionRequest> get item_group_options {
    if (_item_group_options is EqualUnmodifiableListView)
      return _item_group_options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_item_group_options);
  }

  @override
  String toString() {
    return 'OrderItemRequest(dish_id: $dish_id, quantity: $quantity, item_price: $item_price, item_group_options: $item_group_options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemRequestImpl &&
            (identical(other.dish_id, dish_id) || other.dish_id == dish_id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.item_price, item_price) ||
                other.item_price == item_price) &&
            const DeepCollectionEquality()
                .equals(other._item_group_options, _item_group_options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dish_id, quantity, item_price,
      const DeepCollectionEquality().hash(_item_group_options));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemRequestImplCopyWith<_$OrderItemRequestImpl> get copyWith =>
      __$$OrderItemRequestImplCopyWithImpl<_$OrderItemRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemRequestImplToJson(
      this,
    );
  }
}

abstract class _OrderItemRequest implements OrderItemRequest {
  const factory _OrderItemRequest(
          {required final int dish_id,
          required final int quantity,
          required final double item_price,
          required final List<ItemGroupOptionRequest> item_group_options}) =
      _$OrderItemRequestImpl;

  factory _OrderItemRequest.fromJson(Map<String, dynamic> json) =
      _$OrderItemRequestImpl.fromJson;

  @override
  int get dish_id;
  @override
  int get quantity;
  @override
  double get item_price;
  @override
  List<ItemGroupOptionRequest> get item_group_options;
  @override
  @JsonKey(ignore: true)
  _$$OrderItemRequestImplCopyWith<_$OrderItemRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemGroupOptionRequest _$ItemGroupOptionRequestFromJson(
    Map<String, dynamic> json) {
  return _ItemGroupOptionRequest.fromJson(json);
}

/// @nodoc
mixin _$ItemGroupOptionRequest {
  int get group_option_id => throw _privateConstructorUsedError;
  List<ItemOptionRequest> get item_options =>
      throw _privateConstructorUsedError;
  double get sub_total_price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemGroupOptionRequestCopyWith<ItemGroupOptionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemGroupOptionRequestCopyWith<$Res> {
  factory $ItemGroupOptionRequestCopyWith(ItemGroupOptionRequest value,
          $Res Function(ItemGroupOptionRequest) then) =
      _$ItemGroupOptionRequestCopyWithImpl<$Res, ItemGroupOptionRequest>;
  @useResult
  $Res call(
      {int group_option_id,
      List<ItemOptionRequest> item_options,
      double sub_total_price});
}

/// @nodoc
class _$ItemGroupOptionRequestCopyWithImpl<$Res,
        $Val extends ItemGroupOptionRequest>
    implements $ItemGroupOptionRequestCopyWith<$Res> {
  _$ItemGroupOptionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group_option_id = null,
    Object? item_options = null,
    Object? sub_total_price = null,
  }) {
    return _then(_value.copyWith(
      group_option_id: null == group_option_id
          ? _value.group_option_id
          : group_option_id // ignore: cast_nullable_to_non_nullable
              as int,
      item_options: null == item_options
          ? _value.item_options
          : item_options // ignore: cast_nullable_to_non_nullable
              as List<ItemOptionRequest>,
      sub_total_price: null == sub_total_price
          ? _value.sub_total_price
          : sub_total_price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemGroupOptionRequestImplCopyWith<$Res>
    implements $ItemGroupOptionRequestCopyWith<$Res> {
  factory _$$ItemGroupOptionRequestImplCopyWith(
          _$ItemGroupOptionRequestImpl value,
          $Res Function(_$ItemGroupOptionRequestImpl) then) =
      __$$ItemGroupOptionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int group_option_id,
      List<ItemOptionRequest> item_options,
      double sub_total_price});
}

/// @nodoc
class __$$ItemGroupOptionRequestImplCopyWithImpl<$Res>
    extends _$ItemGroupOptionRequestCopyWithImpl<$Res,
        _$ItemGroupOptionRequestImpl>
    implements _$$ItemGroupOptionRequestImplCopyWith<$Res> {
  __$$ItemGroupOptionRequestImplCopyWithImpl(
      _$ItemGroupOptionRequestImpl _value,
      $Res Function(_$ItemGroupOptionRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group_option_id = null,
    Object? item_options = null,
    Object? sub_total_price = null,
  }) {
    return _then(_$ItemGroupOptionRequestImpl(
      group_option_id: null == group_option_id
          ? _value.group_option_id
          : group_option_id // ignore: cast_nullable_to_non_nullable
              as int,
      item_options: null == item_options
          ? _value._item_options
          : item_options // ignore: cast_nullable_to_non_nullable
              as List<ItemOptionRequest>,
      sub_total_price: null == sub_total_price
          ? _value.sub_total_price
          : sub_total_price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemGroupOptionRequestImpl implements _ItemGroupOptionRequest {
  const _$ItemGroupOptionRequestImpl(
      {required this.group_option_id,
      required final List<ItemOptionRequest> item_options,
      required this.sub_total_price})
      : _item_options = item_options;

  factory _$ItemGroupOptionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemGroupOptionRequestImplFromJson(json);

  @override
  final int group_option_id;
  final List<ItemOptionRequest> _item_options;
  @override
  List<ItemOptionRequest> get item_options {
    if (_item_options is EqualUnmodifiableListView) return _item_options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_item_options);
  }

  @override
  final double sub_total_price;

  @override
  String toString() {
    return 'ItemGroupOptionRequest(group_option_id: $group_option_id, item_options: $item_options, sub_total_price: $sub_total_price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemGroupOptionRequestImpl &&
            (identical(other.group_option_id, group_option_id) ||
                other.group_option_id == group_option_id) &&
            const DeepCollectionEquality()
                .equals(other._item_options, _item_options) &&
            (identical(other.sub_total_price, sub_total_price) ||
                other.sub_total_price == sub_total_price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, group_option_id,
      const DeepCollectionEquality().hash(_item_options), sub_total_price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemGroupOptionRequestImplCopyWith<_$ItemGroupOptionRequestImpl>
      get copyWith => __$$ItemGroupOptionRequestImplCopyWithImpl<
          _$ItemGroupOptionRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemGroupOptionRequestImplToJson(
      this,
    );
  }
}

abstract class _ItemGroupOptionRequest implements ItemGroupOptionRequest {
  const factory _ItemGroupOptionRequest(
      {required final int group_option_id,
      required final List<ItemOptionRequest> item_options,
      required final double sub_total_price}) = _$ItemGroupOptionRequestImpl;

  factory _ItemGroupOptionRequest.fromJson(Map<String, dynamic> json) =
      _$ItemGroupOptionRequestImpl.fromJson;

  @override
  int get group_option_id;
  @override
  List<ItemOptionRequest> get item_options;
  @override
  double get sub_total_price;
  @override
  @JsonKey(ignore: true)
  _$$ItemGroupOptionRequestImplCopyWith<_$ItemGroupOptionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ItemOptionRequest _$ItemOptionRequestFromJson(Map<String, dynamic> json) {
  return _ItemOptionRequest.fromJson(json);
}

/// @nodoc
mixin _$ItemOptionRequest {
  int get option_item_id => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemOptionRequestCopyWith<ItemOptionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemOptionRequestCopyWith<$Res> {
  factory $ItemOptionRequestCopyWith(
          ItemOptionRequest value, $Res Function(ItemOptionRequest) then) =
      _$ItemOptionRequestCopyWithImpl<$Res, ItemOptionRequest>;
  @useResult
  $Res call({int option_item_id, int quantity});
}

/// @nodoc
class _$ItemOptionRequestCopyWithImpl<$Res, $Val extends ItemOptionRequest>
    implements $ItemOptionRequestCopyWith<$Res> {
  _$ItemOptionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? option_item_id = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      option_item_id: null == option_item_id
          ? _value.option_item_id
          : option_item_id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemOptionRequestImplCopyWith<$Res>
    implements $ItemOptionRequestCopyWith<$Res> {
  factory _$$ItemOptionRequestImplCopyWith(_$ItemOptionRequestImpl value,
          $Res Function(_$ItemOptionRequestImpl) then) =
      __$$ItemOptionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int option_item_id, int quantity});
}

/// @nodoc
class __$$ItemOptionRequestImplCopyWithImpl<$Res>
    extends _$ItemOptionRequestCopyWithImpl<$Res, _$ItemOptionRequestImpl>
    implements _$$ItemOptionRequestImplCopyWith<$Res> {
  __$$ItemOptionRequestImplCopyWithImpl(_$ItemOptionRequestImpl _value,
      $Res Function(_$ItemOptionRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? option_item_id = null,
    Object? quantity = null,
  }) {
    return _then(_$ItemOptionRequestImpl(
      option_item_id: null == option_item_id
          ? _value.option_item_id
          : option_item_id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemOptionRequestImpl implements _ItemOptionRequest {
  const _$ItemOptionRequestImpl(
      {required this.option_item_id, required this.quantity});

  factory _$ItemOptionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemOptionRequestImplFromJson(json);

  @override
  final int option_item_id;
  @override
  final int quantity;

  @override
  String toString() {
    return 'ItemOptionRequest(option_item_id: $option_item_id, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemOptionRequestImpl &&
            (identical(other.option_item_id, option_item_id) ||
                other.option_item_id == option_item_id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, option_item_id, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemOptionRequestImplCopyWith<_$ItemOptionRequestImpl> get copyWith =>
      __$$ItemOptionRequestImplCopyWithImpl<_$ItemOptionRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemOptionRequestImplToJson(
      this,
    );
  }
}

abstract class _ItemOptionRequest implements ItemOptionRequest {
  const factory _ItemOptionRequest(
      {required final int option_item_id,
      required final int quantity}) = _$ItemOptionRequestImpl;

  factory _ItemOptionRequest.fromJson(Map<String, dynamic> json) =
      _$ItemOptionRequestImpl.fromJson;

  @override
  int get option_item_id;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$ItemOptionRequestImplCopyWith<_$ItemOptionRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

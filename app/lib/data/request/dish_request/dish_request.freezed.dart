// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DishRequest _$DishRequestFromJson(Map<String, dynamic> json) {
  return _DishRequest.fromJson(json);
}

/// @nodoc
mixin _$DishRequest {
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get restaurantId => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  int get dishTypeId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DishRequestCopyWith<DishRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishRequestCopyWith<$Res> {
  factory $DishRequestCopyWith(
          DishRequest value, $Res Function(DishRequest) then) =
      _$DishRequestCopyWithImpl<$Res, DishRequest>;
  @useResult
  $Res call(
      {String name,
      double price,
      String imageUrl,
      int restaurantId,
      int categoryId,
      int dishTypeId,
      String description});
}

/// @nodoc
class _$DishRequestCopyWithImpl<$Res, $Val extends DishRequest>
    implements $DishRequestCopyWith<$Res> {
  _$DishRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? restaurantId = null,
    Object? categoryId = null,
    Object? dishTypeId = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      dishTypeId: null == dishTypeId
          ? _value.dishTypeId
          : dishTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DishRequestImplCopyWith<$Res>
    implements $DishRequestCopyWith<$Res> {
  factory _$$DishRequestImplCopyWith(
          _$DishRequestImpl value, $Res Function(_$DishRequestImpl) then) =
      __$$DishRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      double price,
      String imageUrl,
      int restaurantId,
      int categoryId,
      int dishTypeId,
      String description});
}

/// @nodoc
class __$$DishRequestImplCopyWithImpl<$Res>
    extends _$DishRequestCopyWithImpl<$Res, _$DishRequestImpl>
    implements _$$DishRequestImplCopyWith<$Res> {
  __$$DishRequestImplCopyWithImpl(
      _$DishRequestImpl _value, $Res Function(_$DishRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? restaurantId = null,
    Object? categoryId = null,
    Object? dishTypeId = null,
    Object? description = null,
  }) {
    return _then(_$DishRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      dishTypeId: null == dishTypeId
          ? _value.dishTypeId
          : dishTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DishRequestImpl implements _DishRequest {
  const _$DishRequestImpl(
      {required this.name,
      required this.price,
      required this.imageUrl,
      required this.restaurantId,
      required this.categoryId,
      required this.dishTypeId,
      required this.description});

  factory _$DishRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DishRequestImplFromJson(json);

  @override
  final String name;
  @override
  final double price;
  @override
  final String imageUrl;
  @override
  final int restaurantId;
  @override
  final int categoryId;
  @override
  final int dishTypeId;
  @override
  final String description;

  @override
  String toString() {
    return 'DishRequest(name: $name, price: $price, imageUrl: $imageUrl, restaurantId: $restaurantId, categoryId: $categoryId, dishTypeId: $dishTypeId, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DishRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.dishTypeId, dishTypeId) ||
                other.dishTypeId == dishTypeId) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, price, imageUrl,
      restaurantId, categoryId, dishTypeId, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DishRequestImplCopyWith<_$DishRequestImpl> get copyWith =>
      __$$DishRequestImplCopyWithImpl<_$DishRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DishRequestImplToJson(
      this,
    );
  }
}

abstract class _DishRequest implements DishRequest {
  const factory _DishRequest(
      {required final String name,
      required final double price,
      required final String imageUrl,
      required final int restaurantId,
      required final int categoryId,
      required final int dishTypeId,
      required final String description}) = _$DishRequestImpl;

  factory _DishRequest.fromJson(Map<String, dynamic> json) =
      _$DishRequestImpl.fromJson;

  @override
  String get name;
  @override
  double get price;
  @override
  String get imageUrl;
  @override
  int get restaurantId;
  @override
  int get categoryId;
  @override
  int get dishTypeId;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$DishRequestImplCopyWith<_$DishRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

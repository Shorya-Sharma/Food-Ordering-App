// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryRequest _$CategoryRequestFromJson(Map<String, dynamic> json) {
  return _CategoryRequest.fromJson(json);
}

/// @nodoc
mixin _$CategoryRequest {
  String get name => throw _privateConstructorUsedError;
  int get dish_quantity => throw _privateConstructorUsedError;
  bool get is_active => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get restaurant_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryRequestCopyWith<CategoryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryRequestCopyWith<$Res> {
  factory $CategoryRequestCopyWith(
          CategoryRequest value, $Res Function(CategoryRequest) then) =
      _$CategoryRequestCopyWithImpl<$Res, CategoryRequest>;
  @useResult
  $Res call(
      {String name,
      int dish_quantity,
      bool is_active,
      String imageUrl,
      int restaurant_id});
}

/// @nodoc
class _$CategoryRequestCopyWithImpl<$Res, $Val extends CategoryRequest>
    implements $CategoryRequestCopyWith<$Res> {
  _$CategoryRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? dish_quantity = null,
    Object? is_active = null,
    Object? imageUrl = null,
    Object? restaurant_id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dish_quantity: null == dish_quantity
          ? _value.dish_quantity
          : dish_quantity // ignore: cast_nullable_to_non_nullable
              as int,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      restaurant_id: null == restaurant_id
          ? _value.restaurant_id
          : restaurant_id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryRequestImplCopyWith<$Res>
    implements $CategoryRequestCopyWith<$Res> {
  factory _$$CategoryRequestImplCopyWith(_$CategoryRequestImpl value,
          $Res Function(_$CategoryRequestImpl) then) =
      __$$CategoryRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int dish_quantity,
      bool is_active,
      String imageUrl,
      int restaurant_id});
}

/// @nodoc
class __$$CategoryRequestImplCopyWithImpl<$Res>
    extends _$CategoryRequestCopyWithImpl<$Res, _$CategoryRequestImpl>
    implements _$$CategoryRequestImplCopyWith<$Res> {
  __$$CategoryRequestImplCopyWithImpl(
      _$CategoryRequestImpl _value, $Res Function(_$CategoryRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? dish_quantity = null,
    Object? is_active = null,
    Object? imageUrl = null,
    Object? restaurant_id = null,
  }) {
    return _then(_$CategoryRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dish_quantity: null == dish_quantity
          ? _value.dish_quantity
          : dish_quantity // ignore: cast_nullable_to_non_nullable
              as int,
      is_active: null == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      restaurant_id: null == restaurant_id
          ? _value.restaurant_id
          : restaurant_id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryRequestImpl implements _CategoryRequest {
  const _$CategoryRequestImpl(
      {this.name = "",
      this.dish_quantity = 0,
      this.is_active = true,
      this.imageUrl = "",
      this.restaurant_id = 0});

  factory _$CategoryRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryRequestImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int dish_quantity;
  @override
  @JsonKey()
  final bool is_active;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final int restaurant_id;

  @override
  String toString() {
    return 'CategoryRequest(name: $name, dish_quantity: $dish_quantity, is_active: $is_active, imageUrl: $imageUrl, restaurant_id: $restaurant_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dish_quantity, dish_quantity) ||
                other.dish_quantity == dish_quantity) &&
            (identical(other.is_active, is_active) ||
                other.is_active == is_active) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.restaurant_id, restaurant_id) ||
                other.restaurant_id == restaurant_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, dish_quantity, is_active, imageUrl, restaurant_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryRequestImplCopyWith<_$CategoryRequestImpl> get copyWith =>
      __$$CategoryRequestImplCopyWithImpl<_$CategoryRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryRequestImplToJson(
      this,
    );
  }
}

abstract class _CategoryRequest implements CategoryRequest {
  const factory _CategoryRequest(
      {final String name,
      final int dish_quantity,
      final bool is_active,
      final String imageUrl,
      final int restaurant_id}) = _$CategoryRequestImpl;

  factory _CategoryRequest.fromJson(Map<String, dynamic> json) =
      _$CategoryRequestImpl.fromJson;

  @override
  String get name;
  @override
  int get dish_quantity;
  @override
  bool get is_active;
  @override
  String get imageUrl;
  @override
  int get restaurant_id;
  @override
  @JsonKey(ignore: true)
  _$$CategoryRequestImplCopyWith<_$CategoryRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

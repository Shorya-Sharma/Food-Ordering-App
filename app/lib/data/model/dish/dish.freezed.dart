// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Dish _$DishFromJson(Map<String, dynamic> json) {
  return _Dish.fromJson(json);
}

/// @nodoc
mixin _$Dish {
  int get id => throw _privateConstructorUsedError;
  Restaurant? get restaurant => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  DishType? get dishType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get restaurantId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DishCopyWith<Dish> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishCopyWith<$Res> {
  factory $DishCopyWith(Dish value, $Res Function(Dish) then) =
      _$DishCopyWithImpl<$Res, Dish>;
  @useResult
  $Res call(
      {int id,
      Restaurant? restaurant,
      Category? category,
      DishType? dishType,
      String name,
      String description,
      String imageUrl,
      String status,
      double price,
      int restaurantId});

  $RestaurantCopyWith<$Res>? get restaurant;
  $CategoryCopyWith<$Res>? get category;
  $DishTypeCopyWith<$Res>? get dishType;
}

/// @nodoc
class _$DishCopyWithImpl<$Res, $Val extends Dish>
    implements $DishCopyWith<$Res> {
  _$DishCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? restaurant = freezed,
    Object? category = freezed,
    Object? dishType = freezed,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? status = null,
    Object? price = null,
    Object? restaurantId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      restaurant: freezed == restaurant
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as Restaurant?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      dishType: freezed == dishType
          ? _value.dishType
          : dishType // ignore: cast_nullable_to_non_nullable
              as DishType?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
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
  $DishTypeCopyWith<$Res>? get dishType {
    if (_value.dishType == null) {
      return null;
    }

    return $DishTypeCopyWith<$Res>(_value.dishType!, (value) {
      return _then(_value.copyWith(dishType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DishImplCopyWith<$Res> implements $DishCopyWith<$Res> {
  factory _$$DishImplCopyWith(
          _$DishImpl value, $Res Function(_$DishImpl) then) =
      __$$DishImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      Restaurant? restaurant,
      Category? category,
      DishType? dishType,
      String name,
      String description,
      String imageUrl,
      String status,
      double price,
      int restaurantId});

  @override
  $RestaurantCopyWith<$Res>? get restaurant;
  @override
  $CategoryCopyWith<$Res>? get category;
  @override
  $DishTypeCopyWith<$Res>? get dishType;
}

/// @nodoc
class __$$DishImplCopyWithImpl<$Res>
    extends _$DishCopyWithImpl<$Res, _$DishImpl>
    implements _$$DishImplCopyWith<$Res> {
  __$$DishImplCopyWithImpl(_$DishImpl _value, $Res Function(_$DishImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? restaurant = freezed,
    Object? category = freezed,
    Object? dishType = freezed,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? status = null,
    Object? price = null,
    Object? restaurantId = null,
  }) {
    return _then(_$DishImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      restaurant: freezed == restaurant
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as Restaurant?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      dishType: freezed == dishType
          ? _value.dishType
          : dishType // ignore: cast_nullable_to_non_nullable
              as DishType?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DishImpl implements _Dish {
  const _$DishImpl(
      {this.id = 0,
      this.restaurant,
      this.category,
      this.dishType,
      this.name = "",
      this.description = "",
      this.imageUrl = "",
      this.status = "",
      this.price = 0,
      this.restaurantId = 4});

  factory _$DishImpl.fromJson(Map<String, dynamic> json) =>
      _$$DishImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final Restaurant? restaurant;
  @override
  final Category? category;
  @override
  final DishType? dishType;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final int restaurantId;

  @override
  String toString() {
    return 'Dish(id: $id, restaurant: $restaurant, category: $category, dishType: $dishType, name: $name, description: $description, imageUrl: $imageUrl, status: $status, price: $price, restaurantId: $restaurantId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DishImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.restaurant, restaurant) ||
                other.restaurant == restaurant) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.dishType, dishType) ||
                other.dishType == dishType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, restaurant, category,
      dishType, name, description, imageUrl, status, price, restaurantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DishImplCopyWith<_$DishImpl> get copyWith =>
      __$$DishImplCopyWithImpl<_$DishImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DishImplToJson(
      this,
    );
  }
}

abstract class _Dish implements Dish {
  const factory _Dish(
      {final int id,
      final Restaurant? restaurant,
      final Category? category,
      final DishType? dishType,
      final String name,
      final String description,
      final String imageUrl,
      final String status,
      final double price,
      final int restaurantId}) = _$DishImpl;

  factory _Dish.fromJson(Map<String, dynamic> json) = _$DishImpl.fromJson;

  @override
  int get id;
  @override
  Restaurant? get restaurant;
  @override
  Category? get category;
  @override
  DishType? get dishType;
  @override
  String get name;
  @override
  String get description;
  @override
  String get imageUrl;
  @override
  String get status;
  @override
  double get price;
  @override
  int get restaurantId;
  @override
  @JsonKey(ignore: true)
  _$$DishImplCopyWith<_$DishImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

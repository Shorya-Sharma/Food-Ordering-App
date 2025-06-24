// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return _Restaurant.fromJson(json);
}

/// @nodoc
mixin _$Restaurant {
  int get id => throw _privateConstructorUsedError; //
  String get name => throw _privateConstructorUsedError; //
  double get rate => throw _privateConstructorUsedError;
  List<Dish> get dishes => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError; //
  String get description => throw _privateConstructorUsedError; //
  String get coverImageUrl => throw _privateConstructorUsedError; //
  String get mainDish => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError; //
  String? get address => throw _privateConstructorUsedError;
  User? get owner => throw _privateConstructorUsedError; //
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  String get locationId => throw _privateConstructorUsedError;
  int get numReviews => throw _privateConstructorUsedError;
  String get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantCopyWith<Restaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantCopyWith<$Res> {
  factory $RestaurantCopyWith(
          Restaurant value, $Res Function(Restaurant) then) =
      _$RestaurantCopyWithImpl<$Res, Restaurant>;
  @useResult
  $Res call(
      {int id,
      String name,
      double rate,
      List<Dish> dishes,
      String imageUrl,
      String description,
      String coverImageUrl,
      String mainDish,
      String status,
      List<Category> categories,
      String? address,
      User? owner,
      String latitude,
      String longitude,
      String locationId,
      int numReviews,
      String rating});

  $UserCopyWith<$Res>? get owner;
}

/// @nodoc
class _$RestaurantCopyWithImpl<$Res, $Val extends Restaurant>
    implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? rate = null,
    Object? dishes = null,
    Object? imageUrl = null,
    Object? description = null,
    Object? coverImageUrl = null,
    Object? mainDish = null,
    Object? status = null,
    Object? categories = null,
    Object? address = freezed,
    Object? owner = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? locationId = null,
    Object? numReviews = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      dishes: null == dishes
          ? _value.dishes
          : dishes // ignore: cast_nullable_to_non_nullable
              as List<Dish>,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mainDish: null == mainDish
          ? _value.mainDish
          : mainDish // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User?,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      locationId: null == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String,
      numReviews: null == numReviews
          ? _value.numReviews
          : numReviews // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get owner {
    if (_value.owner == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.owner!, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RestaurantImplCopyWith<$Res>
    implements $RestaurantCopyWith<$Res> {
  factory _$$RestaurantImplCopyWith(
          _$RestaurantImpl value, $Res Function(_$RestaurantImpl) then) =
      __$$RestaurantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      double rate,
      List<Dish> dishes,
      String imageUrl,
      String description,
      String coverImageUrl,
      String mainDish,
      String status,
      List<Category> categories,
      String? address,
      User? owner,
      String latitude,
      String longitude,
      String locationId,
      int numReviews,
      String rating});

  @override
  $UserCopyWith<$Res>? get owner;
}

/// @nodoc
class __$$RestaurantImplCopyWithImpl<$Res>
    extends _$RestaurantCopyWithImpl<$Res, _$RestaurantImpl>
    implements _$$RestaurantImplCopyWith<$Res> {
  __$$RestaurantImplCopyWithImpl(
      _$RestaurantImpl _value, $Res Function(_$RestaurantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? rate = null,
    Object? dishes = null,
    Object? imageUrl = null,
    Object? description = null,
    Object? coverImageUrl = null,
    Object? mainDish = null,
    Object? status = null,
    Object? categories = null,
    Object? address = freezed,
    Object? owner = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? locationId = null,
    Object? numReviews = null,
    Object? rating = null,
  }) {
    return _then(_$RestaurantImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      dishes: null == dishes
          ? _value._dishes
          : dishes // ignore: cast_nullable_to_non_nullable
              as List<Dish>,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mainDish: null == mainDish
          ? _value.mainDish
          : mainDish // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User?,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      locationId: null == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String,
      numReviews: null == numReviews
          ? _value.numReviews
          : numReviews // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantImpl implements _Restaurant {
  const _$RestaurantImpl(
      {this.id = 0,
      this.name = "",
      this.rate = 0,
      final List<Dish> dishes = const [],
      this.imageUrl = "",
      this.description = "",
      this.coverImageUrl = "",
      this.mainDish = "",
      this.status = "",
      final List<Category> categories = const [],
      this.address,
      this.owner,
      this.latitude = "",
      this.longitude = "",
      this.locationId = "",
      this.numReviews = 0,
      this.rating = "0"})
      : _dishes = dishes,
        _categories = categories;

  factory _$RestaurantImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantImplFromJson(json);

  @override
  @JsonKey()
  final int id;
//
  @override
  @JsonKey()
  final String name;
//
  @override
  @JsonKey()
  final double rate;
  final List<Dish> _dishes;
  @override
  @JsonKey()
  List<Dish> get dishes {
    if (_dishes is EqualUnmodifiableListView) return _dishes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dishes);
  }

  @override
  @JsonKey()
  final String imageUrl;
//
  @override
  @JsonKey()
  final String description;
//
  @override
  @JsonKey()
  final String coverImageUrl;
//
  @override
  @JsonKey()
  final String mainDish;
  @override
  @JsonKey()
  final String status;
  final List<Category> _categories;
  @override
  @JsonKey()
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

//
  @override
  final String? address;
  @override
  final User? owner;
//
  @override
  @JsonKey()
  final String latitude;
  @override
  @JsonKey()
  final String longitude;
  @override
  @JsonKey()
  final String locationId;
  @override
  @JsonKey()
  final int numReviews;
  @override
  @JsonKey()
  final String rating;

  @override
  String toString() {
    return 'Restaurant(id: $id, name: $name, rate: $rate, dishes: $dishes, imageUrl: $imageUrl, description: $description, coverImageUrl: $coverImageUrl, mainDish: $mainDish, status: $status, categories: $categories, address: $address, owner: $owner, latitude: $latitude, longitude: $longitude, locationId: $locationId, numReviews: $numReviews, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            const DeepCollectionEquality().equals(other._dishes, _dishes) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            (identical(other.mainDish, mainDish) ||
                other.mainDish == mainDish) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.numReviews, numReviews) ||
                other.numReviews == numReviews) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      rate,
      const DeepCollectionEquality().hash(_dishes),
      imageUrl,
      description,
      coverImageUrl,
      mainDish,
      status,
      const DeepCollectionEquality().hash(_categories),
      address,
      owner,
      latitude,
      longitude,
      locationId,
      numReviews,
      rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      __$$RestaurantImplCopyWithImpl<_$RestaurantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantImplToJson(
      this,
    );
  }
}

abstract class _Restaurant implements Restaurant {
  const factory _Restaurant(
      {final int id,
      final String name,
      final double rate,
      final List<Dish> dishes,
      final String imageUrl,
      final String description,
      final String coverImageUrl,
      final String mainDish,
      final String status,
      final List<Category> categories,
      final String? address,
      final User? owner,
      final String latitude,
      final String longitude,
      final String locationId,
      final int numReviews,
      final String rating}) = _$RestaurantImpl;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$RestaurantImpl.fromJson;

  @override
  int get id;
  @override //
  String get name;
  @override //
  double get rate;
  @override
  List<Dish> get dishes;
  @override
  String get imageUrl;
  @override //
  String get description;
  @override //
  String get coverImageUrl;
  @override //
  String get mainDish;
  @override
  String get status;
  @override
  List<Category> get categories;
  @override //
  String? get address;
  @override
  User? get owner;
  @override //
  String get latitude;
  @override
  String get longitude;
  @override
  String get locationId;
  @override
  int get numReviews;
  @override
  String get rating;
  @override
  @JsonKey(ignore: true)
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

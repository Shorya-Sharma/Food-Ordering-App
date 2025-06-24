// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DishType _$DishTypeFromJson(Map<String, dynamic> json) {
  return _DishType.fromJson(json);
}

/// @nodoc
mixin _$DishType {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<Dish> get dishes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DishTypeCopyWith<DishType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishTypeCopyWith<$Res> {
  factory $DishTypeCopyWith(DishType value, $Res Function(DishType) then) =
      _$DishTypeCopyWithImpl<$Res, DishType>;
  @useResult
  $Res call({int id, String name, List<Dish> dishes});
}

/// @nodoc
class _$DishTypeCopyWithImpl<$Res, $Val extends DishType>
    implements $DishTypeCopyWith<$Res> {
  _$DishTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dishes = null,
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
      dishes: null == dishes
          ? _value.dishes
          : dishes // ignore: cast_nullable_to_non_nullable
              as List<Dish>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DishTypeImplCopyWith<$Res>
    implements $DishTypeCopyWith<$Res> {
  factory _$$DishTypeImplCopyWith(
          _$DishTypeImpl value, $Res Function(_$DishTypeImpl) then) =
      __$$DishTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, List<Dish> dishes});
}

/// @nodoc
class __$$DishTypeImplCopyWithImpl<$Res>
    extends _$DishTypeCopyWithImpl<$Res, _$DishTypeImpl>
    implements _$$DishTypeImplCopyWith<$Res> {
  __$$DishTypeImplCopyWithImpl(
      _$DishTypeImpl _value, $Res Function(_$DishTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dishes = null,
  }) {
    return _then(_$DishTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dishes: null == dishes
          ? _value._dishes
          : dishes // ignore: cast_nullable_to_non_nullable
              as List<Dish>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DishTypeImpl implements _DishType {
  const _$DishTypeImpl(
      {this.id = 0, this.name = "", final List<Dish> dishes = const []})
      : _dishes = dishes;

  factory _$DishTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DishTypeImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  final List<Dish> _dishes;
  @override
  @JsonKey()
  List<Dish> get dishes {
    if (_dishes is EqualUnmodifiableListView) return _dishes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dishes);
  }

  @override
  String toString() {
    return 'DishType(id: $id, name: $name, dishes: $dishes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DishTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._dishes, _dishes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_dishes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DishTypeImplCopyWith<_$DishTypeImpl> get copyWith =>
      __$$DishTypeImplCopyWithImpl<_$DishTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DishTypeImplToJson(
      this,
    );
  }
}

abstract class _DishType implements DishType {
  const factory _DishType(
      {final int id,
      final String name,
      final List<Dish> dishes}) = _$DishTypeImpl;

  factory _DishType.fromJson(Map<String, dynamic> json) =
      _$DishTypeImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  List<Dish> get dishes;
  @override
  @JsonKey(ignore: true)
  _$$DishTypeImplCopyWith<_$DishTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

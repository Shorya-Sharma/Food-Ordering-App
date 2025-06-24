// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupOption _$GroupOptionFromJson(Map<String, dynamic> json) {
  return _GroupOption.fromJson(json);
}

/// @nodoc
mixin _$GroupOption {
  int get id => throw _privateConstructorUsedError;
  Restaurant? get restaurant => throw _privateConstructorUsedError;
  List<OptionItem> get optionItems => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get minimum => throw _privateConstructorUsedError;
  int get maximum => throw _privateConstructorUsedError;
  bool get optional => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupOptionCopyWith<GroupOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupOptionCopyWith<$Res> {
  factory $GroupOptionCopyWith(
          GroupOption value, $Res Function(GroupOption) then) =
      _$GroupOptionCopyWithImpl<$Res, GroupOption>;
  @useResult
  $Res call(
      {int id,
      Restaurant? restaurant,
      List<OptionItem> optionItems,
      String name,
      int minimum,
      int maximum,
      bool optional});

  $RestaurantCopyWith<$Res>? get restaurant;
}

/// @nodoc
class _$GroupOptionCopyWithImpl<$Res, $Val extends GroupOption>
    implements $GroupOptionCopyWith<$Res> {
  _$GroupOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? restaurant = freezed,
    Object? optionItems = null,
    Object? name = null,
    Object? minimum = null,
    Object? maximum = null,
    Object? optional = null,
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
      optionItems: null == optionItems
          ? _value.optionItems
          : optionItems // ignore: cast_nullable_to_non_nullable
              as List<OptionItem>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minimum: null == minimum
          ? _value.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as int,
      maximum: null == maximum
          ? _value.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as int,
      optional: null == optional
          ? _value.optional
          : optional // ignore: cast_nullable_to_non_nullable
              as bool,
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
}

/// @nodoc
abstract class _$$GroupOptionImplCopyWith<$Res>
    implements $GroupOptionCopyWith<$Res> {
  factory _$$GroupOptionImplCopyWith(
          _$GroupOptionImpl value, $Res Function(_$GroupOptionImpl) then) =
      __$$GroupOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      Restaurant? restaurant,
      List<OptionItem> optionItems,
      String name,
      int minimum,
      int maximum,
      bool optional});

  @override
  $RestaurantCopyWith<$Res>? get restaurant;
}

/// @nodoc
class __$$GroupOptionImplCopyWithImpl<$Res>
    extends _$GroupOptionCopyWithImpl<$Res, _$GroupOptionImpl>
    implements _$$GroupOptionImplCopyWith<$Res> {
  __$$GroupOptionImplCopyWithImpl(
      _$GroupOptionImpl _value, $Res Function(_$GroupOptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? restaurant = freezed,
    Object? optionItems = null,
    Object? name = null,
    Object? minimum = null,
    Object? maximum = null,
    Object? optional = null,
  }) {
    return _then(_$GroupOptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      restaurant: freezed == restaurant
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as Restaurant?,
      optionItems: null == optionItems
          ? _value._optionItems
          : optionItems // ignore: cast_nullable_to_non_nullable
              as List<OptionItem>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minimum: null == minimum
          ? _value.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as int,
      maximum: null == maximum
          ? _value.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as int,
      optional: null == optional
          ? _value.optional
          : optional // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupOptionImpl implements _GroupOption {
  const _$GroupOptionImpl(
      {this.id = 0,
      this.restaurant,
      final List<OptionItem> optionItems = const [],
      this.name = "",
      this.minimum = 0,
      this.maximum = 0,
      this.optional = true})
      : _optionItems = optionItems;

  factory _$GroupOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupOptionImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final Restaurant? restaurant;
  final List<OptionItem> _optionItems;
  @override
  @JsonKey()
  List<OptionItem> get optionItems {
    if (_optionItems is EqualUnmodifiableListView) return _optionItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_optionItems);
  }

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int minimum;
  @override
  @JsonKey()
  final int maximum;
  @override
  @JsonKey()
  final bool optional;

  @override
  String toString() {
    return 'GroupOption(id: $id, restaurant: $restaurant, optionItems: $optionItems, name: $name, minimum: $minimum, maximum: $maximum, optional: $optional)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.restaurant, restaurant) ||
                other.restaurant == restaurant) &&
            const DeepCollectionEquality()
                .equals(other._optionItems, _optionItems) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.minimum, minimum) || other.minimum == minimum) &&
            (identical(other.maximum, maximum) || other.maximum == maximum) &&
            (identical(other.optional, optional) ||
                other.optional == optional));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      restaurant,
      const DeepCollectionEquality().hash(_optionItems),
      name,
      minimum,
      maximum,
      optional);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupOptionImplCopyWith<_$GroupOptionImpl> get copyWith =>
      __$$GroupOptionImplCopyWithImpl<_$GroupOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupOptionImplToJson(
      this,
    );
  }
}

abstract class _GroupOption implements GroupOption {
  const factory _GroupOption(
      {final int id,
      final Restaurant? restaurant,
      final List<OptionItem> optionItems,
      final String name,
      final int minimum,
      final int maximum,
      final bool optional}) = _$GroupOptionImpl;

  factory _GroupOption.fromJson(Map<String, dynamic> json) =
      _$GroupOptionImpl.fromJson;

  @override
  int get id;
  @override
  Restaurant? get restaurant;
  @override
  List<OptionItem> get optionItems;
  @override
  String get name;
  @override
  int get minimum;
  @override
  int get maximum;
  @override
  bool get optional;
  @override
  @JsonKey(ignore: true)
  _$$GroupOptionImplCopyWith<_$GroupOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

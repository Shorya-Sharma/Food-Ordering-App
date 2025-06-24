// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'option_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OptionItem _$OptionItemFromJson(Map<String, dynamic> json) {
  return _OptionItem.fromJson(json);
}

/// @nodoc
mixin _$OptionItem {
  int get id => throw _privateConstructorUsedError;
  GroupOption? get groupOption => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OptionItemCopyWith<OptionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionItemCopyWith<$Res> {
  factory $OptionItemCopyWith(
          OptionItem value, $Res Function(OptionItem) then) =
      _$OptionItemCopyWithImpl<$Res, OptionItem>;
  @useResult
  $Res call(
      {int id,
      GroupOption? groupOption,
      String name,
      double price,
      String description});

  $GroupOptionCopyWith<$Res>? get groupOption;
}

/// @nodoc
class _$OptionItemCopyWithImpl<$Res, $Val extends OptionItem>
    implements $OptionItemCopyWith<$Res> {
  _$OptionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupOption = freezed,
    Object? name = null,
    Object? price = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      groupOption: freezed == groupOption
          ? _value.groupOption
          : groupOption // ignore: cast_nullable_to_non_nullable
              as GroupOption?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
abstract class _$$OptionItemImplCopyWith<$Res>
    implements $OptionItemCopyWith<$Res> {
  factory _$$OptionItemImplCopyWith(
          _$OptionItemImpl value, $Res Function(_$OptionItemImpl) then) =
      __$$OptionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      GroupOption? groupOption,
      String name,
      double price,
      String description});

  @override
  $GroupOptionCopyWith<$Res>? get groupOption;
}

/// @nodoc
class __$$OptionItemImplCopyWithImpl<$Res>
    extends _$OptionItemCopyWithImpl<$Res, _$OptionItemImpl>
    implements _$$OptionItemImplCopyWith<$Res> {
  __$$OptionItemImplCopyWithImpl(
      _$OptionItemImpl _value, $Res Function(_$OptionItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupOption = freezed,
    Object? name = null,
    Object? price = null,
    Object? description = null,
  }) {
    return _then(_$OptionItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      groupOption: freezed == groupOption
          ? _value.groupOption
          : groupOption // ignore: cast_nullable_to_non_nullable
              as GroupOption?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionItemImpl implements _OptionItem {
  const _$OptionItemImpl(
      {this.id = 0,
      this.groupOption,
      this.name = "",
      this.price = 0,
      this.description = ""});

  factory _$OptionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionItemImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final GroupOption? groupOption;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'OptionItem(id: $id, groupOption: $groupOption, name: $name, price: $price, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupOption, groupOption) ||
                other.groupOption == groupOption) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, groupOption, name, price, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionItemImplCopyWith<_$OptionItemImpl> get copyWith =>
      __$$OptionItemImplCopyWithImpl<_$OptionItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionItemImplToJson(
      this,
    );
  }
}

abstract class _OptionItem implements OptionItem {
  const factory _OptionItem(
      {final int id,
      final GroupOption? groupOption,
      final String name,
      final double price,
      final String description}) = _$OptionItemImpl;

  factory _OptionItem.fromJson(Map<String, dynamic> json) =
      _$OptionItemImpl.fromJson;

  @override
  int get id;
  @override
  GroupOption? get groupOption;
  @override
  String get name;
  @override
  double get price;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$OptionItemImplCopyWith<_$OptionItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

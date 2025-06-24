import 'package:food_delivery_app/data/model/role/role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.g.dart';
part 'user.freezed.dart';

@JsonEnum()
enum Gender { male, female, all }

@JsonEnum()
enum UserStatus { inactive, active, all }

@Freezed()
class User with _$User {
  const factory User(
      {@Default(0) int id,
      @Default("") String name,
      @Default("") String fullname,
      @Default("") String avatarUrl,
      @Default(Gender.male) Gender gender,
      @Default("") String username,
      @Default("") String password,
      @Default("") String email,
      @Default(UserStatus.active) UserStatus status,
      @Default([]) List<Role> roles,
      @Default(0) int age,
      @Default(0) int weight,
      @Default(0) int height,
      @Default("") String activity,
      @Default(3) int mealPerDay,
      @Default("") String weightLoss}) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

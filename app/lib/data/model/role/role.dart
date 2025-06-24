import 'package:food_delivery_app/data/model/category/category.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'role.g.dart';
part 'role.freezed.dart';

@Freezed()
class Role with _$Role {
  const factory Role({
    @Default(0) int id, //
    @Default("") String name, //
  }) = _Role;
  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}

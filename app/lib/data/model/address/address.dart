import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_delivery_app/data/model/user/user.dart';
part 'address.g.dart';
part 'address.freezed.dart';

@Freezed()
class Address with _$Address {
  const factory Address({
    required String address,
    @Default([]) List<User> users,
    @Default(0) int id,
  }) = _Address;
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

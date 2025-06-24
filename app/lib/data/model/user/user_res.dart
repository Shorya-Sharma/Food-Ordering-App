import 'package:food_delivery_app/data/model/user/user.dart';

class UserRes {
  final User userInfo;
  final String token;

  UserRes({required this.userInfo, required this.token});

  factory UserRes.fromJson(Map<String, dynamic> json) {
    return UserRes(
      userInfo: User.fromJson(json['user_info']),
      token: json['token'],
    );
  }
}

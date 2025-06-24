import 'package:food_delivery_app/data/model/user/user_res.dart';

import '../data/api/user/auth_api.dart';
import '../data/api/user/user_api.dart';
import '../data/model/user/user.dart';
import '../data/model/user/user_req.dart';

class UserRepository {
  final AuthApi authApi;
  final UserApi userApi;
  UserRepository({required this.authApi, required this.userApi});
  Future<UserRes> login(String username, String password) {
    return authApi.login(username, password);
  }

  Future<User> signUp(UserReq userReq) {
    return userApi.createUser(userReq);
  }

  Future<User> findById(int id) {
    return userApi.findById(id);
  }

  Future<bool> updateUser(User userReq) {
    return userApi.updateInformationUser(userReq);
  }
  Future<User> getUserInformation(int userId){
    return userApi.getuserById(userId);
  }
}

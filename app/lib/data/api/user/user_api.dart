import 'dart:convert';

import 'package:food_delivery_app/common/network/api_helper.dart';
import 'package:food_delivery_app/common/network/dio_client.dart';
import 'package:food_delivery_app/data/model/user/user.dart';
import 'package:food_delivery_app/values/app_config.dart';

import '../../../common/network/dio_client_2.dart';
import '../../model/user/user_req.dart';

class UserApi with ApiHelper<User> {
  final DioClient dioClient;

  UserApi({required this.dioClient});

  Future<User> createUser(UserReq user) async {
    return await makePostObjectRequest(
        DioClient2.dioNotAuth.post(ApiConfig.signUp, data: user),
        User.fromJson);
  }

  Future<User> getuserById(int userId) async {
    return await makeObjectGetRequest(
        DioClient2.dioNotAuth.get("/auth/${userId}"), User.fromJson);
  }

  Future<bool> updateUser(User user) async {
    return await makePutRequest(
        DioClient2.dio.put("${ApiConfig.users}/${user.id}", data: user));
  }

  Future<User> findById(int id) async {
    var res = await DioClient2.dio.get("/auth/${id}");
    var jsonData = jsonDecode(res.data);
    User user = User.fromJson(jsonData);
    return user;
  }

  Future<bool> updateInformationUser(User user) async {
    return await makePutRequest(
        DioClient2.dio.put("${ApiConfig.updateUser}/${user.id}", data: user));
  }

  Future<bool> deleteUser(User user) async {
    return await makeDeleteRequest(
        DioClient2.dio.delete("${ApiConfig.users}/${user.id}"));
  }

  Future<List<User>> getUsers({Gender? gender, UserStatus? status}) async {
    Map<String, String> queryParameters = <String, String>{};

    if (gender != null && gender != Gender.all) {
      queryParameters.addAll({'gender': gender.name});
    }

    if (status != null && status != UserStatus.all) {
      queryParameters.addAll({'status': status.name});
    }

    return await makeGetRequest(
        DioClient2.dio.get(ApiConfig.users, queryParameters: queryParameters),
        User.fromJson);
  }
}

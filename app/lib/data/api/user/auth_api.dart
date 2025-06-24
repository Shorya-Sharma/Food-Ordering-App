import 'package:food_delivery_app/common/network/api_helper.dart';
import 'package:food_delivery_app/data/model/user/user_res.dart';

import '../../../common/network/dio_client.dart';
import '../../../common/network/dio_client_2.dart';
import '../../../values/app_config.dart';

class AuthApi with ApiHelper<UserRes> {
  final DioClient dioClient;

  AuthApi({required this.dioClient});

  Future<UserRes> login(String username, String password) {
    return makePostObjectRequest(
        DioClient2.dioNotAuth.post(ApiConfig.login,
            data: {'username': username, 'password': password}),
        UserRes.fromJson);
  }
}

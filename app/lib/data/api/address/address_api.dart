import 'package:food_delivery_app/common/network/api_helper.dart';
import 'package:food_delivery_app/common/network/dio_client.dart';
import 'package:food_delivery_app/data/model/address/address.dart';
import 'package:food_delivery_app/values/app_config.dart';

import '../../../common/network/dio_client_2.dart';

class AddressApi with ApiHelper<Address> {
  final DioClient dioClient;

  AddressApi({required this.dioClient});

  Future<bool> addAddress(Map<String, dynamic> address) async {
    return await makePostRequest(
        DioClient2.dio.post(ApiConfig.address, data: address));
  }

  Future<List<Address>> getAll(int userId) async {
    return await makeGetRequest(
        DioClient2.dio
            .get(ApiConfig.address, queryParameters: {"userId": userId}),
        Address.fromJson);
  }
}

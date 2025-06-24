import 'package:food_delivery_app/common/network/api_helper.dart';
import 'package:food_delivery_app/common/network/dio_client.dart';
import 'package:food_delivery_app/data/model/groupOption.dart/group_option.dart';
import 'package:food_delivery_app/values/app_config.dart';

class GroupOptionApi with ApiHelper<GroupOption> {
  final DioClient dioClient;

  GroupOptionApi({required this.dioClient});

  Future<List<GroupOption>> getGroupOptionsOfDish(int dishId) async {
    return await makeGetRequest(
        dioClient.dio.get("${ApiConfig.groupOption}/dish/${dishId}"),
        GroupOption.fromJson);
  }

  Future<List<GroupOption>> getGroupOptionsOfRestaurant(int resId) async {
    return await makeGetRequest(
        dioClient.dio.get("${ApiConfig.groupOption}/restaurant/${resId}"),
        GroupOption.fromJson);
  }
}

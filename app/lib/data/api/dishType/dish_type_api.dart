import 'package:food_delivery_app/common/network/api_helper.dart';
import 'package:food_delivery_app/common/network/dio_client.dart';
import 'package:food_delivery_app/data/model/Order/order.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/dishType/dish_type.dart';
import 'package:food_delivery_app/values/app_config.dart';

import '../../../common/network/dio_client_2.dart';

class DishTypeApi with ApiHelper<DishType> {
  final DioClient dioClient;

  DishTypeApi({required this.dioClient});

  Future<bool> create(Order Order) async {
    return await makePostRequest(
        DioClient2.dio.post("${ApiConfig.order}", data: Order));
  }

  Future<List<DishType>> getAll() async {
    print(ApiConfig.dishType);
    return await makeGetRequest(
        DioClient2.dio.get(ApiConfig.dishType), DishType.fromJson);
  }
}

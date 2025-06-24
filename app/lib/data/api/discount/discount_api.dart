import 'package:food_delivery_app/common/network/api_helper.dart';
import 'package:food_delivery_app/common/network/dio_client.dart';
import 'package:food_delivery_app/controller/dish_controller.dart';
import 'package:food_delivery_app/data/model/discountRequest/discount_request.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/product_discount/product_discount.dart';
import 'package:food_delivery_app/data/request/dish_request/dish_request.dart';
import 'package:food_delivery_app/values/app_config.dart';
import 'package:get/get.dart';

import '../../../common/network/dio_client_2.dart';
import '../../../controller/recommend_controller.dart';
import '../../model/user/user.dart';

class DiscountApi with ApiHelper<ProductDiscount> {
  final DioClient dioClient;

  DiscountApi({required this.dioClient});

  Future<ProductDiscount> create(DiscountRequest request) async {
    return await makePostObjectRequest(
        DioClient2.dio.post(ApiConfig.discounts, data: request),
        ProductDiscount.fromJson);
  }

  Future<List<ProductDiscount>> findByRestaurant(int restaurantId) async {
    return await makeGetRequest(
        DioClient2.dio.get(
          "${ApiConfig.discounts}/restaurant/$restaurantId",
        ),
        ProductDiscount.fromJson);
  }
}

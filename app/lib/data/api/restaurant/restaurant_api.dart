import 'dart:convert';

import 'package:food_delivery_app/common/network/api_helper.dart';
import 'package:food_delivery_app/common/network/dio_client.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/data/request/restaurant_request/restaurant_request.dart';
import 'package:food_delivery_app/values/app_config.dart';

import '../../../common/network/dio_client_2.dart';

class RestaurantApi with ApiHelper<Restaurant> {
  final DioClient dioClient;

  RestaurantApi({required this.dioClient});

  Future<List<Restaurant>> search(String keyword) async {
    return await makeGetRequest(
        DioClient2.dio.get("${ApiConfig.restaurant}/search",
            queryParameters: {"keyword": keyword}),
        Restaurant.fromJson);
  }

  Future<List<Restaurant>> findByOwner(int ownerId) async {
    return await makeGetRequest(
        DioClient2.dio.get("${ApiConfig.restaurant}/owner/$ownerId"),
        Restaurant.fromJson);
  }

  Future<List<Restaurant>> getAll({int pageNo = 0, int pageSize = 5}) async {
    return await makeGetRequest(
        DioClient2.dio.get(ApiConfig.restaurant, queryParameters: {
          "pageSize": pageSize,
          "pageNo": pageNo,
        }),
        Restaurant.fromJson);
  }

  Future<Restaurant> getById(int id) async {
    var res = await DioClient2.dio.get("ApiConfig.restaurant/${id}");
    var jsonData = jsonDecode(res.data);
    Restaurant restaurant = Restaurant.fromJson(jsonData);
    return restaurant;
  }

  Future<Restaurant> getRestaurantById(int id) async {
    return await makeObjectGetRequest(
        DioClient2.dio.get("${ApiConfig.restaurant}/$id"), Restaurant.fromJson);
  }

  Future<Restaurant> createRestaurant(
      RestaurantRequest restaurantRequest) async {
    return await makePostObjectRequest(
        DioClient2.dio.post(ApiConfig.restaurant, data: restaurantRequest),
        Restaurant.fromJson);
  }
}

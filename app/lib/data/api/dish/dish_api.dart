import 'dart:convert';

import 'package:food_delivery_app/common/network/api_helper.dart';
import 'package:food_delivery_app/common/network/dio_client.dart';
import 'package:food_delivery_app/controller/dish_controller.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/request/dish_request/dish_request.dart';
import 'package:food_delivery_app/repository/user_repository.dart';
import 'package:food_delivery_app/values/app_config.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/network/dio_client_2.dart';
import '../../../controller/recommend_controller.dart';
import '../../model/user/user.dart';
import '../../model/recommendedDish/recommended_dish.dart';

class DishApi with ApiHelper<Dish> {
  final DioClient dioClient;

  DishApi({required this.dioClient});

  Future<List<Dish>> search(String keyword) async {
    var dishes = await makeGetRequest(
        DioClient2.dio.get(
          "${ApiConfig.dish}/search",
          queryParameters: {"keyword": keyword},
        ),
        Dish.fromJson);
    return dishes;
  }

  Future<List<Dish>> getDishesByDishType(int id) async {
    return await makeGetRequest(
        DioClient2.dio.get("${ApiConfig.dishType}/dishes/$id"), Dish.fromJson);
  }

  Future<List<Dish>> getByListId(List<dynamic> ids) async {
    var dishes = await makeGetRequest(
        DioClient2.dio.get(
          "${ApiConfig.dish}/recommend",
          queryParameters: {"ids": ids},
        ),
        Dish.fromJson);
    return dishes;
  }

  Future<List<Dish>> getByRestaurantId(int restaurantId) async {
    var dishes = await makeGetRequest(
        DioClient2.dio.get(
          "${ApiConfig.dish}/restaurant/$restaurantId",
        ),
        Dish.fromJson);
    return dishes;
  }

  Future<Dish> addNewDish(DishRequest request) async {
    return await makePostObjectRequest(
        DioClient2.dio.post(
          ApiConfig.dish,
          data: request.toJson(),
        ),
        Dish.fromJson);
  }

  Future<List<Dish>> getRecommendedDishes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt("userId") ?? 0;
    var userRes = await DioClient2.dio.get("/auth/${userId}");
    User user = User.fromJson(userRes.data);
    DishController dishController = Get.find();
    List res = await RecommendController.generateRecommendations(user);
    List<RecommendedDish> recommendedDishes = [];
    var ids = res[0].map((e) {
      int id = e["RecipeId"];
      RecommendedDish dish = RecommendedDish.fromJson(e);
      recommendedDishes.add(dish);
      return id;
    }).toList();
    dishController.setRecommendedDishes(recommendedDishes);
    print(ids);

    return await getByListId(ids);
  }

  Future<List<Dish>> getDishesByRestaurantId(int restaurantId) async {
    var dishes = await makeGetRequest(
        DioClient2.dio.get(
          "${ApiConfig.dish}/restaurant/$restaurantId",
        ),
        Dish.fromJson);
    return dishes;
  }

  Future<List<Dish>> getHotdishes(int restaurantId) async {
    var dishes = await makeGetRequest(
        DioClient2.dio.get(
          "${ApiConfig.order}/statistic/$restaurantId",
        ),
        Dish.fromJson);
    return dishes;
  }
}

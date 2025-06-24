import 'package:food_delivery_app/common/repository/repository_helper.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/data/request/restaurant_request/restaurant_request.dart';

import '../data/api/restaurant/restaurant_api.dart';

class RestaurantRepository with RepositoryHelper<Restaurant> {
  final RestaurantApi restaurantApi;

  const RestaurantRepository({required this.restaurantApi});

  Future<List<Restaurant>> search(String keyword) async {
    return restaurantApi.search(keyword);
  }

  Future<List<Restaurant>> findByOwner(int id) async {
    return restaurantApi.findByOwner(id);
  }

  Future<List<Restaurant>> getAll({int pageNo = 0, int pageSize = 5}) async {
    return restaurantApi.getAll(pageNo: pageNo, pageSize: pageSize);
  }

  Future<Restaurant> getById(int id) async {
    return restaurantApi.getById(id);
  }

  Future<Restaurant> createRestaurant(
      RestaurantRequest restaurantRequest) async {
    return restaurantApi.createRestaurant(restaurantRequest);
  }

  Future<Restaurant> getRestaurantById(int id) async {
    return restaurantApi.getRestaurantById(id);
  }
}

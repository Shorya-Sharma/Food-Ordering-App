import 'package:dartz/dartz.dart';
import 'package:food_delivery_app/common/repository/repository_helper.dart';
import 'package:food_delivery_app/data/api/restaurant/restaurant_api.dart';
import 'package:food_delivery_app/data/api/order/order_api.dart';
import 'package:food_delivery_app/data/api/restaurantOfDish/restaurant_of_dish.dart';
import 'package:food_delivery_app/data/model/Order/order.dart' as orderModel;
import 'package:food_delivery_app/data/model/address/address.dart';
import 'package:food_delivery_app/data/model/restaurantOfDish/restaurant_of_dish.dart';

class RestaurantOfDishRepository with RepositoryHelper<RestaurantOfDish> {
  final RestaurantOfDishApi restaurantOfDishApi;

  const RestaurantOfDishRepository({required this.restaurantOfDishApi});

  Future<List<RestaurantOfDish>> getRestaurant(int userId) async {
    return restaurantOfDishApi.getRestaurant(userId);
  }
}

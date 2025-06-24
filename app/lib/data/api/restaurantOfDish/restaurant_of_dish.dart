import 'package:food_delivery_app/common/network/api_helper.dart';
import 'package:food_delivery_app/common/network/dio_client.dart';
import 'package:food_delivery_app/data/model/cartItem/cart_item.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/restaurantOfDish/restaurant_of_dish.dart';

import 'package:food_delivery_app/values/app_config.dart';

import '../../../common/network/dio_client_2.dart';

class RestaurantOfDishApi with ApiHelper<RestaurantOfDish> {
  final DioClient dioClient;

  RestaurantOfDishApi({required this.dioClient});

  Future<List<RestaurantOfDish>> getRestaurant(int userId) async {
    var listCart = await makeGetRequest(
        DioClient2.dio.get("${ApiConfig.cart}/restaurant",
            queryParameters: {"userId": userId}),
        RestaurantOfDish.fromJson);
    return listCart;
  }
}

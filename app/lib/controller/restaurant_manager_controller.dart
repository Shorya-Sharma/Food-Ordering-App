import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/repository/restaurant_repository.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/model/category/category.dart';

class RestaurantManagerController extends GetxController {
  final RestaurantRepository restaurantRepository;

  RestaurantManagerController({required this.restaurantRepository});

  Rx<Restaurant?> restaurant = Rx<Restaurant?>(null);
  RxList<Category> categories = <Category>[].obs;

  void getRestaurant(int restaurantId) {
    restaurantRepository.getRestaurantById(restaurantId).then((value) {
      print("RestaurantManagerController getRestaurant value: ${value.name}");
      restaurant.value = value;
      categories.value = value.categories;
    });
  }
}

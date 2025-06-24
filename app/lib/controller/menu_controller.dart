import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/groupOption.dart/group_option.dart';
import 'package:food_delivery_app/pages/discount/widgets/discount_item.dart';
import 'package:food_delivery_app/pages/discount_manager/new_product_discount.dart';
import 'package:food_delivery_app/repository/menu_repository.dart';
import 'package:food_delivery_app/repository/product_discount_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/model/category/category.dart';
import '../data/model/product_discount/product_discount.dart';
import '../data/model/restaurant/restaurant.dart';
import '../data/model/restaurant_discount/restaurant_discount.dart';
import '../pages/new_food/new_food_page.dart';
import '../repository/discount_repository.dart';
import '../repository/restaurant_repository.dart';

class MenuRestaurantController extends GetxController {
  final MenuRepository menuRepository;
  final ProductDiscountRepository discountRepository;

  MenuRestaurantController(
      {required this.menuRepository,
      required this.discountRepository,
      required this.restaurantRepository});

  RxInt restaurantId = 1.obs;
  int currentTabIndex = 0;
  final RestaurantRepository restaurantRepository;
  Rx<Restaurant?> restaurant = Rx<Restaurant?>(null);
  Rx<Future<List<Category>>> categories = Rx(Future.value([]));

  Stream<List<Map<String, dynamic>>> getReview() {
    Stream<List<Map<String, dynamic>>> reviewStream = Supabase.instance.client
        .from('reviews')
        .select('*, users:user_id(*)')
        .eq('restaurant', restaurantId)
        .asStream();
    print(reviewStream);
    return reviewStream;
  }

  void getRestaurant(int restaurantId) {
    restaurantRepository.getRestaurantById(restaurantId).then((value) {
      print("RestaurantManagerController getRestaurant value: ${value.name}");
      restaurant.value = value;
      categories.value = Future.value(value.categories);
    });
  }

  Rx<Future<List<Dish>>> dishes = Rx(Future.value([]));
  late Future<List<RestaurantDiscount>> discounts;
  List<Dish> resultDishes = [];
  Rx<List<Dish>> filterDishes = Rx<List<Dish>>([]);

  List<RestaurantDiscount> resultRestaurantDiscounts = [];
  Rx<List<RestaurantDiscount>> filterRestaurantDiscounts =
      Rx<List<RestaurantDiscount>>([]);

  final TextEditingController seachController = TextEditingController();

  Future<void> getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    restaurantId.value = prefs.getInt('restaurantId')!;
  }

  void getDishes() {
    dishes.value = menuRepository.getDishes(restaurantId.value);
  }

  Future<List<Dish>> getFutureDishes() {
    return menuRepository.getDishes(restaurantId.value);
  }

  void runFilter(String enteredKeyword) {
    if (currentTabIndex == 0) {
      _runDishFilter(enteredKeyword);
    } else if (currentTabIndex == 1) {
      _runGroupOptionFilter(enteredKeyword);
    }
  }

  void _runDishFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty || enteredKeyword == "") {
      filterDishes.value = resultDishes;
    } else {
      filterDishes.value = resultDishes
          .where((dish) =>
              dish.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    print("filter result with $enteredKeyword is ${filterDishes.value.length}");
  }

  void _runGroupOptionFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty || enteredKeyword == "") {
      filterRestaurantDiscounts.value = resultRestaurantDiscounts;
    } else {
      filterRestaurantDiscounts.value = resultRestaurantDiscounts
          .where((item) =>
              item.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    print(
        "filter result with $enteredKeyword is ${filterRestaurantDiscounts.value.length}");
  }

  void getRestaurantDiscounts() {
    discounts = discountRepository.getRestaurantDiscounts(restaurantId.value);
  }

  void getCategories() async {
    categories.value = menuRepository.getCategories(restaurantId.value);
  }

  void goToNewFoodPage() async {
    var result = await Get.to(NewFoodPage(), arguments: {
      "restaurantId": restaurantId.value,
    });
    if (result == true) {
      getDishes();
      // controller.getDishes();
      print("result is success");
    }
  }

  void goToNewDiscountPage() async {
    var result = await Get.to(NewProductDiscountPage(), arguments: {
      "restaurantId": restaurantId.value,
    });
    if (result == true) {
      getRestaurantDiscounts();
      print("result is success");
      Get.snackbar("Success", "New discount has been added");
    }
  }
}

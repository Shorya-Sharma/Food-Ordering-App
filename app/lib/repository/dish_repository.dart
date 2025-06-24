import 'package:food_delivery_app/common/repository/repository_helper.dart';
import 'package:food_delivery_app/data/model/category/category.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/request/dish_request/dish_request.dart';

import '../data/api/category/category_api.dart';
import '../data/api/dish/dish_api.dart';

class DishRepository with RepositoryHelper<Dish> {
  final DishApi dishApi;
  final CategoryApi categoryApi;
  const DishRepository({required this.dishApi, required this.categoryApi});

  Future<List<Dish>> search(String keyword) async {
    return dishApi.search(keyword);
  }

  Future<List<Dish>> getByRestaurantId(int restaurantId) async {
    return dishApi.getByRestaurantId(restaurantId);
  }

  Future<List<Dish>> getDishesByDishType(int id) async {
    return dishApi.getDishesByDishType(id);
  }

  Future<List<Category>> getCategories(int restaurantId) async {
    return await categoryApi.getCategoriesOfRestaurant(restaurantId);
  }

  Future<Dish> addNewDish(DishRequest request) async {
    return await dishApi.addNewDish(request);
  }

  Future<List<Dish>> getRecommendedDish() async {
    return await dishApi.getRecommendedDishes();
  }

  Future<List<Dish>> getHotDishes(int restaurantId) async {
    return await dishApi.getHotdishes(restaurantId);
  }
}

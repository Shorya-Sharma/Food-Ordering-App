import 'package:food_delivery_app/data/model/category/category.dart';
import 'package:food_delivery_app/data/model/groupOption.dart/group_option.dart';

import '../data/api/category/category_api.dart';
import '../data/api/dish/dish_api.dart';
import '../data/api/groupOption/group_option_api.dart';
import '../data/model/dish/dish.dart';

class MenuRepository {
  final DishApi dishApi;
  final GroupOptionApi groupOptionApi;
  final CategoryApi categoryApi;
  MenuRepository({required this.categoryApi,required this.dishApi, required this.groupOptionApi});
  Future<List<Dish>> getDishes(int restaurantId) {
    return dishApi.getDishesByRestaurantId(restaurantId);
  }

  Future<List<GroupOption>> getGroupOptions(int restaurantId) {
    return groupOptionApi.getGroupOptionsOfRestaurant(restaurantId);
  }
  Future<List<Category>> getCategories(int restaurantId) {
    return categoryApi.getCategoriesOfRestaurant(restaurantId);
  }
}

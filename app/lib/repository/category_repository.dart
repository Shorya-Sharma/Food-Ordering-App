import 'package:food_delivery_app/data/api/category/category_api.dart';
import 'package:food_delivery_app/data/request/category_request/category_request.dart';

import '../common/repository/repository_helper.dart';
import '../data/model/category/category.dart';

class CategoryRepository with RepositoryHelper<Category> {
  final CategoryApi categoryApi;

  CategoryRepository({required this.categoryApi});

  Future<List<Category>> getCategoriesOfRestaurant(int restaurantId)  {
    return categoryApi.getCategoriesOfRestaurant(restaurantId);
  }
  Future<List<Category>> addCategories(List<CategoryRequest> categories) async {
    return categoryApi.addCategories(categories);
  }

}


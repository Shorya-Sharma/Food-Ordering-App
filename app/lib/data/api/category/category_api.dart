import 'package:food_delivery_app/data/request/category_request/category_request.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../common/network/api_helper.dart';
import '../../../common/network/dio_client.dart';
import '../../model/category/category.dart';

class CategoryApi with ApiHelper<Category> {
  final DioClient dioClient;
  CategoryApi({required this.dioClient});
  Future<List<Category>> getCategoriesOfRestaurant(int restaurantId) {
   return Supabase.instance.client.from('categories').select()
    .eq('restaurant_id', restaurantId).then((value)
   {
     List<Category> categories = value.map((e) => Category.fromJson(e)).toList();
     print("category list is" + categories.toString());
     return categories;
   }
    ).catchError((err) {
      print("Error when get categories" + err.toString());
      throw Exception("Error when get categories" + err.toString());
    });
  }
  Future<List<Category>> addCategories(List<CategoryRequest> categories) {
    List<Map<String, dynamic>> data = categories.map((e) => e.toJson()).toList();

    return Supabase.instance.client.from('categories').insert(data).select().then((value) {
      List<Category> categories = value.map((e) => Category.fromJson(e)).toList();
      print("category list is" + categories.toString());
      return categories;
    }).catchError((err) {
      print("Error when add category" + err.toString());
      throw Exception("Error when add category" + err.toString());
    });
  }
}

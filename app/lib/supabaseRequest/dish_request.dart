import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/helper/supabase_helper.dart';

class DishesRequest {
  static Future<List<Dish>> getDishesByCategory(int categoryId) async {
    final response = await SupabaseHelper.supabase
        .from('dishes')
        .select()
        .eq("category_id", categoryId)
        .limit(4);

    return response.map((e) => Dish.fromJson(e)).toList();
  }
}

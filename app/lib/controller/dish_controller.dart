import 'package:food_delivery_app/data/model/recommendedDish/recommended_dish.dart';
import 'package:get/get.dart';

class DishController extends GetxController {
  RxList<RecommendedDish> recommendedDishes = <RecommendedDish>[].obs;
  void setRecommendedDishes(List<RecommendedDish> recommendedDishes) {
    this.recommendedDishes.value = recommendedDishes;
  }
}

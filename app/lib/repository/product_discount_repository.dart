import 'package:food_delivery_app/data/model/restaurant_discount/restaurant_discount.dart';
import 'package:food_delivery_app/data/request/product_discount/create_product_discount.dart';

import '../data/api/product_discount/product_discount_api.dart';
import '../data/model/dish/dish.dart';
import '../data/model/product_discount/product_discount.dart';

class ProductDiscountRepository {
  final ProductDiscountApi productDiscountApi;
  ProductDiscountRepository({required this.productDiscountApi});

  Future<List<ProductDiscount>> getProductDiscounts(
      int restaurantId, String status) async {
    return productDiscountApi.getProductDiscountsByRestaurantId(
        restaurantId, status);
  }
  Future<List<RestaurantDiscount>> getRestaurantDiscounts(
      int restaurantId) async {
    return productDiscountApi.getRestaurantDiscounts(
        restaurantId);
  }

  Future<ProductDiscount> addProductDiscounts(
      CreateProductDiscountRequest createProductDiscountRequest) async {
    return productDiscountApi
        .createProductDiscount(createProductDiscountRequest);
  }
  Future<RestaurantDiscount> addRestaurantDiscount(
      RestaurantDiscount discount, List<Dish> dishes) async {
    return productDiscountApi.createRestaurantDiscount(discount, dishes);
  }
}

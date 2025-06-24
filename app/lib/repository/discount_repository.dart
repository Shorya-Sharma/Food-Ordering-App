import 'package:food_delivery_app/common/repository/repository_helper.dart';
import 'package:food_delivery_app/data/api/discount/discount_api.dart';
import 'package:food_delivery_app/data/model/discountRequest/discount_request.dart';
import 'package:food_delivery_app/data/model/product_discount/product_discount.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/data/model/restaurant_discount/restaurant_discount.dart';
import 'package:food_delivery_app/data/request/restaurant_request/restaurant_request.dart';

import '../data/api/restaurant/restaurant_api.dart';

class DiscountRepository with RepositoryHelper<ProductDiscount> {
  final DiscountApi discountApi;

  const DiscountRepository({required this.discountApi});

  Future<ProductDiscount> createDiscount(DiscountRequest request) async {
    return discountApi.create(request);
  }

  Future<List<ProductDiscount>> findByRestaurant(int restaurantId) async {
    return discountApi.findByRestaurant(restaurantId);
  }
}

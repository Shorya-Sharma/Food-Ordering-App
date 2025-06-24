import 'package:dartz/dartz.dart';
import 'package:food_delivery_app/common/network/api_helper.dart';
import 'package:food_delivery_app/common/network/dio_client.dart';
import 'package:food_delivery_app/data/model/restaurant_discount/restaurant_discount.dart';
import 'package:food_delivery_app/data/request/product_discount/create_product_discount.dart';
import 'package:food_delivery_app/data/request/product_discount/update_product_discount.dart';
import 'package:food_delivery_app/values/app_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../common/network/dio_client_2.dart';
import '../../model/dish/dish.dart';
import '../../model/product_discount/product_discount.dart';

class ProductDiscountApi with ApiHelper<ProductDiscount> {
  final DioClient dioClient;

  ProductDiscountApi({required this.dioClient});

  Future<List<ProductDiscount>> getProductDiscountsByRestaurantId(
      int restaurantId, String status) async {
    var discounts = await makeGetRequest(
        dioClient.dio.get(
          "${ApiConfig.discounts}/restaurant/$restaurantId",
          queryParameters: {"status": status},
        ),
        ProductDiscount.fromJson);
    return discounts;
  }

  Future<List<RestaurantDiscount>> getRestaurantDiscounts(
      int restaurantId) async {
    return Supabase.instance.client
        .from('restaurant_discounts')
        .select()
        .eq("restaurantId", restaurantId)
        .then((value) {
      return value.map((e) => RestaurantDiscount.fromJson(e)).toList();
    }).catchError((err) {
      print("Error when get restaurant discounts" + err.toString());
      throw Exception("Error when get restaurant discounts" + err.toString());
    });
  }

  Future<ProductDiscount> createProductDiscount(
      CreateProductDiscountRequest createProductDiscountRequest) async {
    return await makePostObjectRequest(
        dioClient.dio.post(
          ApiConfig.discounts,
          data: createProductDiscountRequest.toJson(),
        ),
        ProductDiscount.fromJson);
  }

  Future<RestaurantDiscount> createRestaurantDiscount(
      RestaurantDiscount restaurantDiscount, List<Dish> dishes) {
    Map<String, dynamic> newData = restaurantDiscount.toJson();
    newData.remove("id");
    return Supabase.instance.client
        .from('restaurant_discounts')
        .insert(newData)
        .select()
        .then((value) {
      print(value[0]);
      List<Map<String, dynamic>> data = dishes.map((e) {
        ProductDiscount pd = ProductDiscount(
          dish: e,
          discountValue: restaurantDiscount.discountValue ?? 0,
          discountUnit: 1,
          maxUsed: restaurantDiscount.maxUsed,
          validFrom: restaurantDiscount.validFrom,
          validTo: restaurantDiscount.validTo,
          minimumOrderValue: restaurantDiscount.minimumOrderValue,
          maximumDiscountValue:
              restaurantDiscount.maximumDiscountValue ?? e.price,
          discountType: restaurantDiscount.discountType,
          couponCode: restaurantDiscount.couponCode,
          name: restaurantDiscount.name,
          conditions: restaurantDiscount.conditions,
        );
        Map<String, dynamic> map = pd.toJson();
        map.remove("id");
        return map;
      }).toList();
      Supabase.instance.client
          .from('product_discounts')
          .insert(data)
          .select()
          .then((value) {
        return RestaurantDiscount.fromJson(value[0]);
      });
      return RestaurantDiscount.fromJson(value[0]);
    }).catchError((err) {
      print("Error when add restaurant discount" + err.toString());
      throw Exception("Error when add restaurant discount" + err.toString());
    });
  }

  Future<ProductDiscount> updateProductDiscount(
      UpdateProductDiscountRequest updateProductDiscountRequest) async {
    return await makePostObjectRequest(
        dioClient.dio.post(
          ApiConfig.discounts,
          data: updateProductDiscountRequest.toJson(),
        ),
        ProductDiscount.fromJson);
  }
}

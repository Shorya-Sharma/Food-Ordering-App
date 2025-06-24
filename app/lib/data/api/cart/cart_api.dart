import 'package:food_delivery_app/common/network/api_helper.dart';
import 'package:food_delivery_app/common/network/dio_client.dart';
import 'package:food_delivery_app/data/model/cartItem/cart_item.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/restaurantOfDish/restaurant_of_dish.dart';
import '../../../common/network/dio_client_2.dart';
import 'package:food_delivery_app/values/app_config.dart';

class CartApi with ApiHelper<CartItem> {
  final DioClient dioClient;

  CartApi({required this.dioClient});

  Future<bool> addToCart(Map<String, dynamic> data) async {
    var cartItem = await makePostRequest(
      DioClient2.dio.post("${ApiConfig.cart}", data: data),
    );

    return cartItem;
  }

  Future<List<CartItem>> getByUserAndDish(Map<String, dynamic> data) async {
    print(data);
    var listCart = await makeGetRequest(
        DioClient2.dio.get("${ApiConfig.cart}/dish_user",
            data: {"dishId": data["dishId"], "userId": data["userId"]}),
        CartItem.fromJson);
    return listCart;
  }

  Future<List<CartItem>> getByUserAndRestaurant(
      Map<String, dynamic> data) async {
    var listCart = await makeGetRequest(
        DioClient2.dio.get("${ApiConfig.cart}/restaurant_user", data: {
          "restaurantId": data["restaurantId"],
          "userId": data["userId"]
        }),
        CartItem.fromJson);
    return listCart;
  }

  Future<List<CartItem>> getByUser(int userId) async {
    var listCart = await makeGetRequest(
        DioClient2.dio
            .get("${ApiConfig.cart}/user", queryParameters: {"userId": userId}),
        CartItem.fromJson);
    return listCart;
  }

  Future<bool> deleteCart(int id) async {
    var result =
        await makeDeleteRequest(DioClient2.dio.delete("${ApiConfig.cart}/$id"));
    return result;
  }

  Future<bool> updateCart(int id, int quantity) async {
    var result = await makePutRequest(DioClient2.dio
        .put("${ApiConfig.cart}/$id", queryParameters: {"quantity": quantity}));
    return result;
  }
}

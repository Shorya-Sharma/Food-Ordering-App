import 'package:food_delivery_app/common/repository/repository_helper.dart';
import 'package:food_delivery_app/data/api/cart/cart_api.dart';
import 'package:food_delivery_app/data/model/cartItem/cart_item.dart';

class CartRepository with RepositoryHelper<CartItem> {
  final CartApi cartApi;

  const CartRepository({required this.cartApi});

  Future<bool> addToCart(Map<String, dynamic> data) async {
    return cartApi.addToCart(data);
  }

  Future<List<CartItem>> getCartByUserDish(int userId, int dishId) async {
    Map<String, dynamic> data = {"userId": userId, "dishId": dishId};
    return cartApi.getByUserAndDish(data);
  }

  Future<List<CartItem>> getByUserRestaurant(
      int userId, int restaurantId) async {
    Map<String, dynamic> data = {
      "userId": userId,
      "restaurantId": restaurantId
    };
    return cartApi.getByUserAndRestaurant(data);
  }

  Future<List<CartItem>> getCartByUser(int userId) async {
    return cartApi.getByUser(userId);
  }

  Future<bool> deleteCart(int id) async {
    return cartApi.deleteCart(id);
  }

  Future<bool> updateCart(int id, int quantity) async {
    return cartApi.updateCart(id, quantity);
  }
}

import 'package:food_delivery_app/controller/option_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/cartItem/cart_item.dart';
import '../repository/cart_repository.dart';

class CartController extends GetxController {
  CartRepository cartRepository = Get.find();
  RxList<CartItem> cartItems = <CartItem>[].obs;
  RxList<CartItem> myCartItems = <CartItem>[].obs;
  RxDouble total = 0.toDouble().obs;
  RxInt cartsLength = 0.obs;
  RxBool isEdit = false.obs;
  void setEdit(bool value) {
    isEdit.value = value;
  }

  void updateCartItems(int userId, int dishId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("userId") ?? 0;
    // OptionController optionController = Get.find();
    List<CartItem> items = await cartRepository.getCartByUserDish(id, dishId);
    cartItems.value = items;
    int length = 0;
    for (var element in items) {
      length += element.quantity;
    }
    cartsLength.value = length;
    if (length == 0) cartItems.value = [];
    // optionController.setQuantity(length);
  }

  void updateCartOfUser(int userId, int restaurantId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("userId") ?? 0;
    print(id);
    double totalPrice = 0;
    List<CartItem> items =
        await cartRepository.getByUserRestaurant(id, restaurantId);
    items.forEach((element) {
      totalPrice += element.total;
    });
    total.value = totalPrice;
    myCartItems.value = items;
  }
}

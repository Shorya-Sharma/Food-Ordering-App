import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/data/model/cartItem/cart_item.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/restaurantOfDish/restaurant_of_dish.dart';
import 'package:food_delivery_app/pages/cart/widgets/cart_item_widget.dart';
import 'package:food_delivery_app/pages/cart/widgets/restaurant_item_widget.dart';
import 'package:food_delivery_app/repository/cart_repository.dart';
import 'package:food_delivery_app/repository/restaurant_of_dish_repository.dart';
import 'package:food_delivery_app/resources/widgets/back_button_widget.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources/components/my_appbar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartController controller = Get.find();
  CartRepository cartRepository = Get.find();
  RestaurantOfDishRepository restaurantOfDishRepository = Get.find();
  int userId = 0;
  void setUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("userId") ?? 0;
    setState(() {
      userId = id;
    });
  }

  @override
  void initState() {
    setUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Dish dish = Dish(name: 'Burger', price: 10, imageUrl: AppAssets.testUrl);
    bool isEdit = false;
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar:
            MyAppbar(title: "Shopping cart", isShowBack: false, actions: []),
        body: FutureBuilder<List<RestaurantOfDish>>(
            future: restaurantOfDishRepository.getRestaurant(userId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
                  child: ListView.separated(
                      itemBuilder: ((context, index) {
                        return RestaurantItemWidget(
                          item: snapshot.data![index],
                        );
                      }),
                      separatorBuilder: ((context, index) => SizedBox(
                            height: 40,
                          )),
                      itemCount: snapshot.data!.length),
                );
              }
              return Container();
            }));
  }
}

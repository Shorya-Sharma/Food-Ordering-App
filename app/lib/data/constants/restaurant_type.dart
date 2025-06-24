import 'package:food_delivery_app/data/enum/enums.dart';

class RestaurantType {
  RestaurantTypeEnum name;
  String title;
  RestaurantType({required this.name, required this.title});
}

List<RestaurantType> restaurantTypes = [
  RestaurantType(name: RestaurantTypeEnum.fastfood, title: 'Fastfood'),
  RestaurantType(name: RestaurantTypeEnum.restaurant, title: 'Restaurant'),
  RestaurantType(name: RestaurantTypeEnum.cafe, title: 'Cafe'),
  RestaurantType(name: RestaurantTypeEnum.bar, title: 'Bar'),
  RestaurantType(name: RestaurantTypeEnum.pub, title: 'Pub'),
  RestaurantType(name: RestaurantTypeEnum.bakery, title: 'Bakery'),
  RestaurantType(name: RestaurantTypeEnum.foodcourt, title: 'Foodcourt'),
  RestaurantType(name: RestaurantTypeEnum.foodtruck, title: 'Foodtruck'),
];

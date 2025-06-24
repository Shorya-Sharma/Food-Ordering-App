import 'package:dartz/dartz.dart';
import 'package:food_delivery_app/common/repository/repository_helper.dart';
import 'package:food_delivery_app/data/api/dishType/dish_type_api.dart';
import 'package:food_delivery_app/data/api/order/order_api.dart';
import 'package:food_delivery_app/data/model/Order/order.dart' as orderModel;
import 'package:food_delivery_app/data/model/dishType/dish_type.dart';

class DishTypeRepository with RepositoryHelper<DishType> {
  final DishTypeApi dishTypeApi;

  const DishTypeRepository({required this.dishTypeApi});

  Future<List<DishType>> getAll() async {
    return dishTypeApi.getAll();
  }
}

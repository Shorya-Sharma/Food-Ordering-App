import 'package:food_delivery_app/data/model/product_discount/product_discount.dart';
import 'package:food_delivery_app/repository/product_discount_repository.dart';
import 'package:get/get.dart';

class ProductDiscountController extends GetxController {
  final ProductDiscountRepository productDiscountRepository;
  ProductDiscountController({required this.productDiscountRepository});
  late Future<List<ProductDiscount>> activeProductDiscounts;
  late Future<List<ProductDiscount>> inactiveProductDiscounts;
  int currentTabIndex = 0;

  void getActiveProductDiscounts(int restaurantId) {
    activeProductDiscounts =
        productDiscountRepository.getProductDiscounts(restaurantId, "active");
  }
  void getInActiveProductDiscounts(int restaurantId) {
    inactiveProductDiscounts =
        productDiscountRepository.getProductDiscounts(restaurantId, "inactive");
  }
}

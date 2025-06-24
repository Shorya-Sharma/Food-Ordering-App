import 'dart:io';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/restaurant_discount/restaurant_discount.dart';
import 'package:food_delivery_app/data/request/product_discount/create_product_discount.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/dish_repository.dart';
import '../repository/product_discount_repository.dart';

class NewProductDiscountController extends GetxController {
  final ProductDiscountRepository productDiscountRepository;
  final DishRepository dishRepository;
  NewProductDiscountController({required this.productDiscountRepository, required this.dishRepository});
  final TextEditingController productDiscountName = TextEditingController();
  final TextEditingController conditions = TextEditingController();
  final TextEditingController discountValue = TextEditingController();
  final TextEditingController discountUnit = TextEditingController();
  final TextEditingController maxUsed = TextEditingController();
  final TextEditingController minimumOrderValue = TextEditingController();
  final TextEditingController maximumDiscountValue = TextEditingController();
  final TextEditingController discountActiveTimeRange = TextEditingController();
  final TextEditingController couponCode = TextEditingController();
  DateTime? validFrom;
   DateTime? validTo;
  final formProductDiscountKey = GlobalKey<FormState>();
  RxList<Dish> dishes = RxList([]);
  RxList<Dish> restaurantDishes = RxList([]);
  List<DateTime> dates = [];
  Rxn<Dish> selectedDish = Rxn(null);
  void getAllRestaurantDishes() {
    dishRepository.getByRestaurantId(restaurantId).then((value) {
      restaurantDishes.value = value;
    });
  }
  void showDateRangePicker(BuildContext context){
     showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
      calendarType: CalendarDatePicker2Type.range,
      ),
      dialogSize: const Size(325, 400),
      borderRadius: BorderRadius.circular(15),
    ).then((value){
      if(value != null && value.isNotEmpty && value.length == 2){
        validFrom = value[0];
        validTo = value[1];
        discountActiveTimeRange.text = "${value[0]?.day}/${value[0]?.month}/${value[0]?.year} - ${value[1]?.day}/${value[1]?.month}/${value[1]?.year}";
      }
     }
    );
  }
  int dishId = 0;
  int restaurantId = 0;
  Rxn<File> avatar = Rxn<File>(null);
  final ImagePicker _picker = ImagePicker();
  void addDish() {
    if(selectedDish.value != null){
      dishes.add(selectedDish.value!);
      Dish remove = selectedDish.value!;
      selectedDish.value = null;
      restaurantDishes.remove(remove);
    }
  }
  void removeDish(Dish dish) {
      dishes.remove(dish);
      restaurantDishes.add(dish);
  }

  void createProductDiscount() async {
    try {
      if (formProductDiscountKey.currentState!.validate()) {
        RestaurantDiscount restaurantDiscount = RestaurantDiscount(
            name: productDiscountName.text,
            conditions: conditions.text,
            discountValue: double.parse(discountValue.text),
            discountType: 'PERCENTAGE',
            maxUsed: int.parse(maxUsed.text),
            minimumOrderValue: 0,
            couponCode: couponCode.text,
            validFrom: validFrom,
            validTo: validTo,
            restaurantId: restaurantId,
            createdAt: DateTime.now());
        productDiscountRepository
            .addRestaurantDiscount(restaurantDiscount, dishes.toList())
            .then((value) {
          Get.back(result: true);
        });
      }
    } catch (err) {
      print("Error when create product discount" + err.toString());
      Get.snackbar("Error", "Error when create product discount");
    }
  }
}

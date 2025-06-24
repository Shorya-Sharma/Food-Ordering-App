import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/constants/snackbar_type.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/data/model/user/user.dart';
import 'package:food_delivery_app/repository/restaurant_repository.dart';
import 'package:food_delivery_app/resources/snackbar/snackbar_factory.dart';
import 'package:food_delivery_app/routes.dart';
import 'package:food_delivery_app/values/app_config.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/user_repository.dart';
import '../values/app_colors.dart';

class AccountController extends GetxController {
  final RestaurantRepository restaurantRepository;
  final UserRepository userRepository;

  AccountController(
      {required this.restaurantRepository, required this.userRepository});

  bool isIdentity = true;
  RxBool isLoadingLogout = false.obs;
  int servicePack = 1;

  // Rx<List<Restaurant>> restaurants = Rx<List<Restaurant>>([]);
  // @override
  // void onInit() {
  //   getProfile();
  //   super.onInit();
  // }
  late final SharedPreferences prefs;

  // GetProfileUseCase get _getProfileUseCase => sl<GetProfileUseCase>();
  Rx<User?> me = Rx<User?>(null);

  Future<void> getProfile() async {
    prefs = await SharedPreferences.getInstance();
    int userId = await prefs.getInt('userId')!;
    userRepository.getUserInformation(userId).then((value) {
      me.value = value;
      print("username is ${me.value?.username}");
    });
    // me.value = await _getProfileUseCase();
  }

  Future<List<Restaurant>> getMyRestaurants() {
    restaurants.value = restaurantRepository.findByOwner(me.value!.id);
    return restaurants.value;
  }

  Rx<Future<List<Restaurant>>> restaurants = Rx(Future.value([]));

  navigateToProfile() {
    Get.toNamed(Routes.profile, arguments: me.value);
  }

  void changeServicePack(int value) {
    servicePack = value;
    update();
  }

  Future<void> handleSignOut() async {
    try {
      prefs.remove('userId');
      prefs.remove('token');
      ApiConfig.setToken("");
      Get.offAllNamed(Routes.loginPage);
      // Get.snackbar(
      //   'Success',
      //   'Logged out successfully',
      //   backgroundColor: AppColors.green,
      //   colorText: Colors.white,
      // );
      SnackbarFactory.instance.showCustomSnackbar(
          Get.context!, SnackBarType.success, "Logged out successfully");
    } catch (e) {
      SnackbarFactory.instance.showCustomSnackbar(
          Get.context!, SnackBarType.error, "Logout failed");
      // Get.snackbar(
      //   'Logout failed',
      //   e.toString(),
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
      isLoadingLogout.value = false;
    }
  }
}

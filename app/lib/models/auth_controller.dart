import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/model/user/user_req.dart';
import 'package:food_delivery_app/pages/information/gender_screen.dart';
import 'package:food_delivery_app/pages/information/goal_screen.dart';
import 'package:food_delivery_app/repository/user_repository.dart';
import 'package:food_delivery_app/resources/snackbar/snackbar_factory.dart';
import 'package:food_delivery_app/routes.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_config.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/network/dio_client.dart';
import '../common/network/dio_client_2.dart';
import '../data/constants/snackbar_type.dart';
import '../values/app_colors.dart';

class AuthController extends GetxController {
  AuthController(this.userRepository);

  final UserRepository userRepository;

  void sendRequest() async {
    // orderModel.Order order =
    //     orderModel.Order(message: "message", userId: "userId", orderId: "12");
    // Either<String, bool> response = await orderRepository.createOrder(order);
    // print(response.isRight());
  }

  bool _obscureText = true;

  bool get obscureText => _obscureText;

  final RxBool _firstTime = false.obs;

  bool get firstTime => _firstTime.value;

  set setFirstTime(bool newState) {
    _firstTime.value = newState;
  }

  final RxBool _obscurePassword = true.obs;

  bool get obscurePassword => _obscurePassword.value;

  void toggleObscurePassword() {
    _obscurePassword.value = !_obscurePassword.value;
    print(obscurePassword);
  }

  final RxBool _loggedIn = false.obs;

  bool get loggedIn => _loggedIn.value;

  set loggedIn(bool newState) {
    _loggedIn.value = newState;
  }

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set isLoading(bool newState) {
    _isLoading.value = newState;
  }

  final RxBool _isRememberMe = false.obs;

  bool get isRememberMe => _isRememberMe.value;

  void toggleRememberMe() {
    _isRememberMe.value = !_isRememberMe.value;
  }

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    loggedIn = prefs.getBool('loggedIn') ?? false;
    print("username is ${prefs.getString("username")}");
    print("password is #password");
    if (prefs.getString("username") != null &&
        prefs.getString("password") != null) {
      username.text = prefs.getString("username")!;
      password.text = prefs.getString("password")!;
    }
  }

  void login() async {
    isLoading = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userRepository.login(username.text, password.text).then((value) async {
      await prefs.setInt("userId", value.userInfo.id);
      await prefs.setString("user", jsonEncode(value.userInfo.toJson()));
      await prefs.setString("token", value.token);
      ApiConfig.setToken(value.token);
      DioClient2.setHeader();
      if (isRememberMe) {
        await prefs.setString("username", username.text);
        await prefs.setString("password", password.text);
      }
      username.clear();
      password.clear();
      SnackbarFactory.instance.showCustomSnackbar(
          Get.context!, SnackBarType.success, "Sign in successfully");
      // Get.snackbar(
      //   "Sign in successfully",
      //   "Welcome back",
      //   colorText: AppColors.whiteColor,
      //   backgroundColor: Colors.green,
      //   icon: const Icon(Icons.add_alert),
      //   duration: const Duration(seconds: 2),
      // );
      Future.delayed(const Duration(seconds: 1), () {
        if (value.userInfo.height == 0) {
          Get.to(() => GoalScreen());
        } else
          Get.offAndToNamed(Routes.locationPage);
      });
    }).catchError((error) {
      SnackbarFactory.instance.showCustomSnackbar(Get.context!,
          SnackBarType.error, "Sign in failed. Please check your credentials");
    }).whenComplete(() => isLoading = false);
    ;
  }

  void signUp(UserReq userReq) {
    isLoading = true;
    userRepository.signUp(userReq).then((value) {
      Get.snackbar(
        "Sign up successfully",
        "Login now to continue",
        colorText: AppColors.whiteColor,
        backgroundColor: Colors.green,
        icon: const Icon(Icons.add_alert),
        duration: const Duration(seconds: 2),
      );
      Future.delayed(const Duration(seconds: 1), () {
        Get.toNamed(Routes.loginPage);
      });
    }).catchError((error) {
      Get.snackbar(
        "Sign up Failed",
        "Please check your credentials",
        colorText: AppColors.whiteColor,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.add_alert),
      );
      print(error);
    }).whenComplete(() => isLoading = false);
  }

  final updateProfileFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  final signupFormKey = GlobalKey<FormState>();

  validateAndSave() {
    final form = loginFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  void onInit() {
    getPrefs();
    super.onInit();
  }
}

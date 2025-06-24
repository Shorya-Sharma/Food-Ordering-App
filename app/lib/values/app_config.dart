import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiConfig {
  ApiConfig._();

  static void setToken(String token) {
    ApiConfig.token = token;
    header['token'] = 'Bearer $token';
  }

  // static String token = Get.find<SharedPreferences>().getString('token') ?? "";
  static String token = "";

  // "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiaW5oaHUiLCJpYXQiOjE3MTgyMzI0MzAsImV4cCI6MTcxOTQ0MjAzMH0.x9ToDvA9OxqwVDNUsb3ha8_OnaVVVcr5-SV39-3RYoU";
  static String baseUrl = dotenv.env['SERVER_URL'] ?? "";
  static String addressUrl = dotenv.env['ADDRESS_URL'] ?? "";
  static String socketUrl = dotenv.env['SOCKET_URL'] ?? "";
  static const Duration receiveTimeout = Duration(milliseconds: 60 * 1000);
  static const Duration connectionTimeout = Duration(milliseconds: 60 * 1000);
  static const String users = '/users';
  static const String posts = '/posts';
  static const String comments = '/comments';
  static const String order = '/order';
  static const String address = '/address';
  static const String dishType = '/dishType';
  static const String restaurant = '/restaurants';
  static const String dish = '/dishes';
  static const String message = '/messages';
  static const String chat = '/chat';
  static const String login = '/auth/sign-in';
  static const String signUp = '/auth/sign-up';
  static const String updateUser = '/auth/update';
  static const String cart = '/cart';
  static const String groupOption = '/group_options';
  static const String provinces = '/provinces';
  static const String wards = '/wards';
  static const String categories = '/categories';
  static const String vouchers = '/vouchers';
  static const String discounts = '/discounts';
  static var header = {
    'token': 'Bearer $token',
    'content-Type': 'application/json',
  };
}

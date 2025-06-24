import 'package:dio/dio.dart' show Dio, ResponseType;
import 'package:food_delivery_app/common/network/dio_interceptor.dart';
import 'package:food_delivery_app/values/app_config.dart';
import 'package:get/get.dart';

class DioClient2 extends GetxService {
  static Dio dio = Dio()
    ..options.baseUrl = ApiConfig.baseUrl
    ..options.headers = ApiConfig.header
    ..options.connectTimeout = ApiConfig.connectionTimeout
    ..options.receiveTimeout = ApiConfig.receiveTimeout
    ..options.responseType = ResponseType.json
    ..interceptors.add(DioInterceptor());
  static Dio dioNotAuth = Dio()
    ..options.baseUrl = ApiConfig.baseUrl
    ..options.headers = {
      "content-Type": "application/json",
    }
    ..options.connectTimeout = ApiConfig.connectionTimeout
    ..options.receiveTimeout = ApiConfig.receiveTimeout
    ..options.responseType = ResponseType.json
    ..interceptors.add(DioInterceptor());

  static void setHeader() {
    dio.options.headers = ApiConfig.header;
  }
}

import 'package:dio/dio.dart' show Dio, ResponseType;
import 'package:food_delivery_app/common/network/dio_interceptor.dart';
import 'package:food_delivery_app/values/app_config.dart';
import 'package:get/get.dart';

class DioClient extends GetxService {
  final Dio dio;
  final Dio dioNotAuth;
  final Dio dioAddress;

  DioClient(this.dio, this.dioAddress, this.dioNotAuth) {
    dio
      ..options.baseUrl = ApiConfig.baseUrl
      ..options.headers = ApiConfig.header
      ..options.connectTimeout = ApiConfig.connectionTimeout
      ..options.receiveTimeout = ApiConfig.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.add(DioInterceptor());
    dioNotAuth
      ..options.baseUrl = ApiConfig.baseUrl
      ..options.headers = {
        "content-Type": "application/json",
      }
      ..options.connectTimeout = ApiConfig.connectionTimeout
      ..options.receiveTimeout = ApiConfig.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.add(DioInterceptor());
    dioAddress
      ..options.baseUrl = ApiConfig.addressUrl
      ..options.connectTimeout = ApiConfig.connectionTimeout
      ..options.receiveTimeout = ApiConfig.receiveTimeout
      ..options.responseType = ResponseType.json;
  }
}

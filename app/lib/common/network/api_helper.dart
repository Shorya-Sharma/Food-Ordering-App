import 'package:dio/dio.dart';
import 'package:food_delivery_app/common/exception/response_error.dart';
import 'package:food_delivery_app/common/network/dio_exception.dart';
import 'package:food_delivery_app/values/app_extension.dart';

abstract mixin class ApiHelper<T> {
  late T data;

  Future<bool> _requestMethodTemplate(
      Future<Response<dynamic>> apiCallback) async {
    final Response response = await apiCallback;
    if (response.statusCode.success) {
      return true;
    } else {
      throw DioExceptions;
    }
  }

  //Generic method template for create item on server
  Future<bool> makePostRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  Future<T> makePostObjectRequest(Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    final Response response = await apiCallback;
    data = getJsonCallback(response.data);
    if (response.statusCode.success) {
      return data;
    } else {
      throw DioExceptions;
    }
  }
  //Generic method template for update item on server
  Future<bool> makePutRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  //Generic method template for delete item from server
  Future<bool> makeDeleteRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  //Generic method template for getting data from Api
  Future<List<T>> makeGetRequest(Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    final Response response = await apiCallback;

    final List<T> items = List<T>.from(
      (response.data as List)
          .map((item) => getJsonCallback(item as Map<String, dynamic>)),
    );
    if (response.statusCode.success) {
      return items;
    } else {
      throw DioExceptions;
    }
  }

  Future<T> makeObjectGetRequest(Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    try {
      final Response response = await apiCallback;
      data = getJsonCallback(response.data);
      if (response.statusCode.success) {
        return data;
      } else {
        throw ResponseError(
            message: response.data, statusCode: response.statusCode!);
      }
    } catch (e) {
      print("error is  $e");
      rethrow;
    }
  }
}

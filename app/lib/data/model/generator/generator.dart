import 'package:dio/dio.dart';
import 'package:food_delivery_app/values/app_config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_delivery_app/common/network/dio_client.dart';

class Generator {
  late List nutritionInput;
  final dio = Dio();
  List ingredients;
  Map<String, dynamic> params;
  Generator(
      {required this.nutritionInput,
      this.ingredients = const [],
      this.params = const {'n_neighbors': 5, 'return_distance': false}});
  Future<Map<String, dynamic>> generate() async {
    Map<String, dynamic> request = {
      'nutrition_input': nutritionInput,
      'ingredients': ingredients,
      'params': params
    };
    print(request);
    var response = await dio.post(
        "http://rcmf.dev.lumisightemr.datahouse.asia:8888/predict/",
        data: request);
    return response.data;
  }
}

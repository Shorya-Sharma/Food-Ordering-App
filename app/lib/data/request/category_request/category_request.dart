import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_request.g.dart';
part 'category_request.freezed.dart';

@Freezed()
class CategoryRequest with _$CategoryRequest {
  const factory CategoryRequest({
    @Default("") String name,
    @Default(0) int dish_quantity,
    @Default(true) bool is_active,
    @Default("") String imageUrl,
    @Default(0) int restaurant_id,
  }) = _CategoryRequest;
  factory CategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$CategoryRequestFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dish_request.freezed.dart';
part 'dish_request.g.dart';

@Freezed()
class DishRequest with _$DishRequest {
  const factory DishRequest({
    required String name,
    required double price,
    required String imageUrl,
    required int restaurantId,
    required int categoryId,
    required int dishTypeId,
    required String description,
  }) = _DishRequest;
  factory DishRequest.fromJson(Map<String, dynamic> json) =>
      _$DishRequestFromJson(json);
}

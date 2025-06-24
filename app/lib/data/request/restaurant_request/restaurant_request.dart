import 'package:food_delivery_app/data/request/address_request/address_request.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_request.freezed.dart';
part 'restaurant_request.g.dart';

@Freezed()
class RestaurantRequest with _$RestaurantRequest {
  const factory RestaurantRequest(
      {required String imageUrl,
      required String coverImageUrl,
      required String name,
      required String mainDish,
      required int ownerId,
      required String description,
      required String menuImageUrl,
      required String photoUrls,
      required String restaurantType,
      required AddressRequest addressRequest}) = _RestaurantRequest;
  factory RestaurantRequest.fromJson(Map<String, dynamic> json) =>
      _$RestaurantRequestFromJson(json);
}

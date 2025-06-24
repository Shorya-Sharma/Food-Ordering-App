import 'package:food_delivery_app/data/model/product_discount/product_discount.dart';
import 'package:food_delivery_app/data/model/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';

part 'review.g.dart';

@freezed
class Review with _$Review {
  const factory Review(
      {@Default(0) int id,
      User? users,
      @Default(0) double rate,
      @Default('') String comment,
      required DateTime created_at}) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

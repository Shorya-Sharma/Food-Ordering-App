import 'package:food_delivery_app/data/model/product_discount/product_discount.dart';
import 'package:food_delivery_app/data/model/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'voucher.freezed.dart';
part 'voucher.g.dart';

enum VoucherStatus { ACTIVE, INACTIVE, EXPIRED, USED }

@freezed
class Voucher with _$Voucher {
  const factory Voucher({
    @Default(0) int id,
    required User user,
    required ProductDiscount productDiscount,
    required VoucherStatus status,
    @Default(0) int remainingUsage,
  }) = _Voucher;

  factory Voucher.fromJson(Map<String, dynamic> json) =>
      _$VoucherFromJson(json);
}

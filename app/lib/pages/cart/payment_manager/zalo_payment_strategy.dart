import 'package:flutter_zalopay_sdk/flutter_zalopay_sdk.dart';
import 'package:food_delivery_app/data/enum/enums.dart';
import 'package:food_delivery_app/pages/cart/payment_manager/payment_strategy_interface.dart';
import '../../../data/request/order_request/order_request.dart';
import '../../../repository/payment_repository.dart';

class ZaloPayStrategy implements PaymentStrategy {
  String zpTransToken = "";

  @override
  Future<PaymentStatus> executePayment(OrderRequest orderRequest) async {
    int amount = ((orderRequest.total_price / 1000).round() * 1000).toInt();
    var result = await createOrder(amount);
    if (result != null) {
      zpTransToken = result.zptranstoken!;
      var event = await FlutterZaloPaySdk.payOrder(zpToken: zpTransToken);
      switch (event) {
        case FlutterZaloPayStatus.cancelled:
          return PaymentStatus.CANCELED;
        case FlutterZaloPayStatus.success:
          return PaymentStatus.SUCCESS;
        case FlutterZaloPayStatus.failed:
          return PaymentStatus.FAILED;
        default:
          return PaymentStatus.FAILED;
      }
    }
    return PaymentStatus.FAILED;
  }
}

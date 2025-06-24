import 'package:food_delivery_app/data/enum/enums.dart';
import 'package:food_delivery_app/data/request/order_request/order_request.dart';
import 'package:food_delivery_app/pages/cart/payment_manager/payment_strategy_interface.dart';

class VnPayPaymentStrategy extends PaymentStrategy {
  @override
  Future<PaymentStatus> executePayment(OrderRequest orderRequest) {
    throw UnimplementedError();
  }
}
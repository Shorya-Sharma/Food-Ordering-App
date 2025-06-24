import 'package:food_delivery_app/data/request/order_request/order_request.dart';
import 'package:food_delivery_app/pages/cart/payment_manager/payment_strategy_interface.dart';

import '../../../data/model/Order/order.dart';
import 'cash_payment_strategy.dart';

class PaymentContext {
  PaymentStrategy _paymentStrategy = CashPaymentStrategy();
  Future<void> execPayment(OrderRequest order) async{
   await _paymentStrategy.executePayment(order);
  }
  void setStrategy(PaymentStrategy paymentStrategy){
    _paymentStrategy = paymentStrategy;
  }
}
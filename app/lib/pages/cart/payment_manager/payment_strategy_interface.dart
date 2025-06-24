import 'package:food_delivery_app/data/enum/enums.dart';

import '../../../data/request/order_request/order_request.dart';

abstract class PaymentStrategy {
  Future<PaymentStatus> executePayment(OrderRequest orderRequest);
}

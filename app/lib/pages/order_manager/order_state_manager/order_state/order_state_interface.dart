import 'package:food_delivery_app/data/constants/order_status.dart';

class IOrderState {
  void acceptOrder() => null;
  void rejectOrder() => null;
  OrderStatus getStatusName() => OrderStatus.PENDING;
}

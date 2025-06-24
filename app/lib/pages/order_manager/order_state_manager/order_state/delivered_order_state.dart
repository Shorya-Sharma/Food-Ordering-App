import 'package:food_delivery_app/data/constants/order_status.dart';
import '../order_context.dart';
import 'order_state_interface.dart';

class DeliveredOrderState implements IOrderState {
  OrderContext orderContext;
  final OrderStatus statusName = OrderStatus.DELIVERED;
  DeliveredOrderState({required this.orderContext});
  @override
  void acceptOrder() {
  }

  @override
  void rejectOrder() {

  }

  @override
  OrderStatus getStatusName() {
    return statusName;
  }
}

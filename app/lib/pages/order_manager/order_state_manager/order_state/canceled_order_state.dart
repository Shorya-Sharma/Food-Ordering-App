import '../../../../data/constants/order_status.dart';
import '../order_context.dart';
import 'order_state_interface.dart';

class CanceledOrderState implements IOrderState {
  OrderContext orderContext;
  final OrderStatus statusName = OrderStatus.CANCELED;
  CanceledOrderState({required this.orderContext});
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

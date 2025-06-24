import 'package:food_delivery_app/pages/order_manager/order_state_manager/order_state/canceled_order_state.dart';

import '../../../../data/constants/order_status.dart';
import '../order_context.dart';
import 'order_state_interface.dart';

class DeliveringOrderState implements IOrderState {
  OrderContext orderContext;
  final OrderStatus statusName = OrderStatus.DELIVERING;
  DeliveringOrderState({required this.orderContext});
  @override
  void acceptOrder() {
    orderContext.changeOrderState(DeliveringOrderState(orderContext: orderContext));
  }

  @override
  void rejectOrder() {
    orderContext.changeOrderState(CanceledOrderState(orderContext: orderContext));
  }

  @override
  OrderStatus getStatusName() {
    return statusName;
  }
}

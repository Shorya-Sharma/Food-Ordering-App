import 'package:food_delivery_app/data/constants/order_status.dart';
import 'package:food_delivery_app/pages/order_manager/order_state_manager/order_state/canceled_order_state.dart';
import 'package:food_delivery_app/pages/order_manager/order_state_manager/order_state/processing_order_state.dart';
import '../../../../repository/order_repository.dart';
import '../order_context.dart';
import 'order_state_interface.dart';

class PendingOrderState implements IOrderState {
  final OrderStatus statusName = OrderStatus.PENDING;
  OrderContext orderContext;
  PendingOrderState({required this.orderContext});
  @override
  void acceptOrder() {
    orderContext.changeOrderState(ProcessingOrderState(orderContext: orderContext));
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

import 'package:food_delivery_app/controller/order_manager_controller.dart';
import 'package:food_delivery_app/pages/order_manager/order_state_manager/order_state/delivered_order_state.dart';
import 'package:food_delivery_app/pages/order_manager/order_state_manager/order_state/order_state_interface.dart';
import 'package:food_delivery_app/pages/order_manager/order_state_manager/order_state/processing_order_state.dart';
import 'package:food_delivery_app/values/app_extension.dart';
import 'package:get/get.dart';

import '../../../data/constants/order_status.dart';
import '../../../data/model/Order/order.dart';
import 'order_state/canceled_order_state.dart';
import 'order_state/pending_order_state.dart';

class OrderContext {
  Order _order;
  OrderManagerController _controller;
  late IOrderState orderState;
  OrderContext(Order order, OrderManagerController controller) : _order = order, _controller = controller {
    initOrderState();
  }
  // Other objects must be able to switch the order's
  // state.
  void changeOrderState(IOrderState orderState) async {
    bool result = await _controller.changeStatus( this , orderState.getStatusName());
    if(result == true) this.orderState = orderState;
    else {
      Get.snackbar("Error", "Failed to change order status".tr);
    }
  }
  // UI methods delegate execution to the active state.
  void acceptOrder() {
    orderState.acceptOrder();
  }
  void rejectOrder() {
    orderState.rejectOrder();
  }
  // A state may call some service methods on the context.
  void initOrderState() {
    if (_order.orderStatus ==
        OrderStatusType.getStringName(OrderStatus.PENDING)) {
      orderState = PendingOrderState(orderContext: this);
    } else if (_order.orderStatus ==
        OrderStatusType.getStringName(OrderStatus.PROCESSING)) {
      orderState = ProcessingOrderState(orderContext: this);
    } else if (_order.orderStatus ==
        OrderStatusType.getStringName(OrderStatus.DELIVERED)) {
      orderState = DeliveredOrderState(orderContext: this);
    } else if (_order.orderStatus ==
        OrderStatusType.getStringName(OrderStatus.CANCELED)) {
      orderState = CanceledOrderState(orderContext: this);
    }
  }

  Order get order => _order;
}

import 'package:food_delivery_app/pages/cart/payment_manager/payment_context.dart';
import 'package:food_delivery_app/pages/cart/payment_manager/vnpay_payment_strategy.dart';
import 'package:food_delivery_app/pages/cart/payment_manager/zalo_payment_strategy.dart';
import 'package:get/get.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/controller/location_controller.dart';
import 'package:food_delivery_app/controller/order_controller.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/pages/cart/widgets/voucher_sheet.dart';
import 'package:food_delivery_app/repository/cart_repository.dart';
import 'package:food_delivery_app/repository/order_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/enum/enums.dart';
import '../data/request/order_request/order_request.dart';
import '../pages/cart/order_request_builder/order_request_builder.dart';
import '../pages/cart/payment_manager/cash_payment_strategy.dart';
import '../pages/location/add_location_page.dart';

class ConfirmOrderController extends GetxController {
  final LocationController locationController = Get.find();
  final OrderController orderController = Get.find();
  final CartController cartController = Get.find();
  final OrderRepository orderRepository = Get.find();
  final CartRepository cartRepository = Get.find();
  final Restaurant restaurant = Get.arguments;
  final PaymentContext paymentContext = PaymentContext();
  PaymentMethod paymentMethod = PaymentMethod.CASH;
  void setPaymentStrategy(PaymentMethod paymentMethod) {
    switch (paymentMethod) {
      case PaymentMethod.CASH:
        paymentContext.setStrategy(CashPaymentStrategy());
        break;
      case PaymentMethod.ZALO_PAY:
        paymentContext.setStrategy(ZaloPayStrategy());
        break;
      case PaymentMethod.VN_PAY:
        paymentContext.setStrategy(VnPayPaymentStrategy());
        break;
    }
  }

  Future<void> placeOrder() async {
    OrderRequest orderRequest = OrderRequestBuilder()
        .setUserId(5)
        .addVouchers(orderController.vouchers)
        .addItems(cartController.myCartItems)
        .setDeliveryFee(deliveryFee)
        .setAddress(locationController.selectedAddress.value)
        .build();
    await paymentContext.execPayment(orderRequest);
    await orderRepository.createOrder(orderRequest);
    for (var cart in cartController.myCartItems) {
      await cartRepository.deleteCart(cart.id);
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt("userId") ?? 0;
    cartController.updateCartOfUser(userId, restaurant.id);
  }

  double deliveryFee = 0;
  double total = 0;
  List<int> voucherIds = [];

  void init() {
    total = cartController.total.value + deliveryFee;
  }

  void editLocation() {
    Get.to(() => AddLocationPage(canSelect: true));
  }

  void selectVouchers() {
    Get.bottomSheet(VoucherSheet(voucherIds: voucherIds),
        isScrollControlled: true);
  }
}

import 'dart:math';

import '../../../data/model/cartItem/cart_item.dart';
import '../../../data/model/voucher/voucher.dart';
import '../../../data/request/order_request/order_request.dart';
import 'abstract_order_request_builder.dart';
import 'order_item_request_builder.dart';

class OrderRequestBuilder extends OrderRequestBuilderBase {
  int? _userId;
  double? _totalPrice;
  String? _address;
  List<int> _voucherIds = [];
  List<OrderItemRequest> _orderItems = [];
  double _deliveryFee = 0;
  double _discountAmount = 0;

  @override
  OrderRequest build() {
    if (_userId == null || _address == null) {
      throw Exception("Missing required fields to build OrderRequest");
    }
    _totalPrice = _deliveryFee + _orderItems.fold(0, (previousValue, element) => previousValue + element.item_price);
    _totalPrice = max(_totalPrice! - _discountAmount, 0);
    return OrderRequest(
      user_id: _userId!,
      total_price: _totalPrice!,
      address: _address!,
      voucher_ids: _voucherIds,
      order_items: _orderItems,
    );
  }

  @override
  OrderRequestBuilderBase setUserId(int userId) {
    _userId = userId;
    return this;
  }

  @override
  OrderRequestBuilderBase setDeliveryFee(double fee) {
    _deliveryFee = fee;
    return this;
  }

  @override
  OrderRequestBuilderBase setTotalPrice(double totalPrice) {
    _totalPrice = totalPrice;
    return this;
  }

  @override
  OrderRequestBuilderBase setAddress(String address) {
    _address = address;
    return this;
  }

  @override
  OrderRequestBuilderBase addVoucherId(int voucherId) {
    _voucherIds.add(voucherId);
    return this;
  }

  @override
  OrderRequestBuilderBase addVouchers(List<Voucher> vouchers) {
    vouchers.forEach((element) {
      _discountAmount += element.productDiscount.discountValue;
    });
    _voucherIds.addAll(vouchers.map((e) => e.id).toList());
    return this;
  }

  @override
  OrderRequestBuilderBase addItems(List<CartItem> cartItems) {
    _orderItems.addAll(cartItems
        .map((item) => OrderItemRequestBuilder().buildFromCartItems(item).buildOrderItem())
        .toList());
    return this;
  }
}

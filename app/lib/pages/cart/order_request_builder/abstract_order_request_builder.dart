import '../../../data/model/cartItem/cart_item.dart';
import '../../../data/model/voucher/voucher.dart';
import '../../../data/request/order_request/order_request.dart';

abstract class OrderRequestBuilderBase {
  OrderRequest build();
  OrderRequestBuilderBase setUserId(int userId);
  OrderRequestBuilderBase setDeliveryFee(double fee);
  OrderRequestBuilderBase setTotalPrice(double totalPrice);
  OrderRequestBuilderBase setAddress(String address);
  OrderRequestBuilderBase addVoucherId(int voucherId);
  OrderRequestBuilderBase addVouchers(List<Voucher> vouchers);
  OrderRequestBuilderBase addItems(List<CartItem> cartItems);
}

import 'package:food_delivery_app/data/model/voucher/voucher.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  RxList<Voucher> vouchers = <Voucher>[].obs;
  void addVoucher(Voucher voucher) {
    vouchers.add(voucher);
  }
  void removeVoucher(Voucher voucher) {
    vouchers.remove(voucher);
  }
}

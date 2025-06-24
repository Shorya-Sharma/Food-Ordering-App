import '../data/api/voucher/voucher_api.dart';
import '../data/model/voucher/voucher.dart';

class VoucherRepository {
  final VoucherApi voucherApi;
  VoucherRepository({required this.voucherApi});

  Future<List<Voucher>> getVouchers(VoucherStatus status) async {
    print(voucherApi.getVouchersByStatus(status));
    return voucherApi.getVouchersByStatus(status);
  }

  Future<List<Voucher>> getRestaurantVouchers(VoucherStatus status) async {
    return voucherApi.getVouchersByStatus(status);
  }
}

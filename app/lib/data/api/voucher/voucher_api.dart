import 'package:food_delivery_app/common/network/api_helper.dart';
import 'package:food_delivery_app/common/network/dio_client.dart';
import 'package:food_delivery_app/values/app_config.dart';

import '../../../common/network/dio_client_2.dart';
import '../../model/voucher/voucher.dart';

class VoucherApi with ApiHelper<Voucher> {
  final DioClient dioClient;

  VoucherApi({required this.dioClient});

  Future<List<Voucher>> getVouchersByStatus(VoucherStatus status) async {
    var vouchers = await makeGetRequest(
        DioClient2.dio.get(
          ApiConfig.vouchers,
          queryParameters: {"status": status.name},
        ),
        Voucher.fromJson);
    return vouchers;
  }

  Future<Voucher> receiveVoucher(String? code, int? productDiscountId) async {
    return await makePostObjectRequest(
        DioClient2.dio.post(
          ApiConfig.dish,
          data: {
            "code": code,
            "productDiscountId": productDiscountId,
          },
        ),
        Voucher.fromJson);
  }
}

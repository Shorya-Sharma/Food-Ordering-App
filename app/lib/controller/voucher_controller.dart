import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/model/voucher/voucher.dart';
import 'package:food_delivery_app/repository/voucher_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../repository/product_discount_repository.dart';

class VoucherController extends GetxController {
  final VoucherRepository voucherRepository;
  final ProductDiscountRepository productDiscountRepository;

  VoucherController(
      {required this.productDiscountRepository,
      required this.voucherRepository});

  var restaurantId = 1;
  int currentTabIndex = 0;
  late Future<List<Voucher>> activeVouchers;
  late Future<List<Voucher>> inactiveVouchers;

  void getActiveVouchers() {
    activeVouchers = voucherRepository.getVouchers(VoucherStatus.ACTIVE);
  }

  void getInActiveVouchers() {
    inactiveVouchers = voucherRepository.getVouchers(VoucherStatus.INACTIVE);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/controller/order_controller.dart';
import 'package:food_delivery_app/data/model/voucher/voucher.dart';
import 'package:food_delivery_app/pages/cart/widgets/voucher_cart_item.dart';
import 'package:food_delivery_app/repository/voucher_repository.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class VoucherSheet extends StatefulWidget {
  List<int> voucherIds;
  VoucherSheet({super.key, required this.voucherIds});

  @override
  State<VoucherSheet> createState() => _VoucherSheetState();
}

class _VoucherSheetState extends State<VoucherSheet> {
  TextEditingController searchController = TextEditingController();
  OrderController orderController = Get.find();
  VoucherRepository voucherRepository = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select or type your Voucher',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onTap: () async {},
                  controller: searchController,
                  decoration: InputDecoration(
                      filled: true,
                      hintStyle: TextStyle(color: Color(0xff676767)),
                      fillColor: Color(0xfff6f6f6),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Type your voucher code...',
                      prefixIconColor: Color(0xffa0a5ba),
                      prefixIcon: Image.asset(AppAssets.searchIcon)),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Add',
                    style: AppStyles.h4,
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder<List<Voucher>>(
              future: voucherRepository.getVouchers(VoucherStatus.ACTIVE),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return VoucherCartItem(voucher: snapshot.data![index]);
                    },
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                  );
                }
                return Container();
              })
        ],
      ),
    );
  }
}

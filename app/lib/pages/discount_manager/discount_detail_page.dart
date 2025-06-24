import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/voucher_controller.dart';
import 'package:food_delivery_app/data/model/voucher/voucher.dart';
import 'package:food_delivery_app/resources/widgets/back_button_widget.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class VoucherDetailPage extends StatefulWidget {
  const VoucherDetailPage({Key? key}) : super(key: key); // Modify this line
  @override
  State<VoucherDetailPage> createState() => _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends State<VoucherDetailPage> {
  final VoucherController controller = Get.find<VoucherController>();
  Voucher voucher = Get.arguments['voucher'];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    bool isReviewTab = true;
    // Restaurant restaurant = Get.arguments;
    // List<Category> categories = restaurant.categories;

    return Scaffold(
      appBar: AppBar(
        leading: BackButtonWidget(
          () {
            Get.back();
          },
        ),
        title: Text(
          'Voucher Detail',
          style: AppStyles.h4,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 40),
                height: height * 1 / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AppAssets.voucherBanner)),
                ),
              ),
              Text(
                voucher.productDiscount.name,
                style: AppStyles.header.copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Expired at: ${voucher.productDiscount.validTo.toString()}",
                  style: AppStyles.h4.copyWith(color: AppColors.subTextColor),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Gap(20),
              Text(
                "Using conditions",
                style: AppStyles.roboto20semiBold,
              ),
              Gap(5),
              Text(
                voucher.productDiscount.conditions,
                style: AppStyles.roboto12regular,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  OutlinedButton(onPressed: () {}, child: Text('Use Voucher'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailSelection extends StatelessWidget {
  final String text;
  final bool isSelected;

  const DetailSelection(this.text, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      decoration: isSelected
          ? ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  (8.0),
                ),
              ),
              shadows: [
                  BoxShadow(
                    color: AppColors.grey,
                    offset: Offset(0, 3),
                    blurRadius: 8,
                  )
                ])
          : null,
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}

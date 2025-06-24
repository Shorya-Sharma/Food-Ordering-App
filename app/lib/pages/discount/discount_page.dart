import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/model/product_discount/product_discount.dart';
import 'package:food_delivery_app/pages/discount/add_discount_page.dart';
import 'package:food_delivery_app/pages/discount/widgets/discount_item.dart';
import 'package:food_delivery_app/repository/discount_repository.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:get/get.dart';

class DiscountPage extends StatefulWidget {
  const DiscountPage({super.key});

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  DiscountRepository discountRepository = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discount'),
        leading: IconButton(
            icon: Image.asset(AppAssets.backIcon),
            onPressed: () {
              Get.back();
            },
            style: IconButton.styleFrom(
              backgroundColor: AppColors.bgButtonColor,
            )),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: FutureBuilder<List<ProductDiscount>>(
          future: discountRepository.findByRestaurant(8),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return DiscountItem(item: snapshot.data![index]);
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: IconButton(
            icon: Icon(
              size: 30,
              Icons.add,
              color: AppColors.whiteColor,
            ),
            onPressed: () {
              Get.to(() => AddDiscountPage());
            },
            style: IconButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              padding: EdgeInsets.all(0),
            )),
      ),
    );
  }
}

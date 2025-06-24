import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controller/discount_manager_controller.dart';
import 'package:food_delivery_app/controller/menu_controller.dart';
import 'package:food_delivery_app/pages/discount_manager/new_product_discount.dart';
import 'package:food_delivery_app/pages/discount_manager/widgets/restaurant_discount_item.dart';
import 'package:food_delivery_app/values/app_constant.dart';
import 'package:get/get.dart';

import '../../../resources/components/empty_widget.dart';
import '../../../values/app_assets.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_styles.dart';
import 'discount_item.dart';

class TabActiveProductDiscountView extends StatelessWidget {
  const TabActiveProductDiscountView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MenuRestaurantController>();
    // return ConstrainedBox(
    //   constraints: BoxConstraints(
    //
    //     maxHeight: 600.h,
    //   ),
    //   child:
     return FutureBuilder(
                future: controller.discounts,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.data!.isBlank == true) {
                    return EmptyDataWidget(text: "", asset: AppAssets.discountIlus,
                      button: OutlinedButton(
                        onPressed: (){
                          controller.goToNewDiscountPage();
                        },
                        child: Text(
                          "Create new discount",
                          style: AppStyles.roboto14semiBold,
                        ),
                      ),
                    );
                  } else if (snapshot.data!.isNotEmpty) {
                    var activeProductDiscounts = snapshot.data;
                    if(activeProductDiscounts?.length == 0){
                      if(activeProductDiscounts?.length == 0){
                        return EmptyDataWidget(
                          text: "You don't have any active discount yet!",
                          asset: AppAssets.discountIlus,
                          button: OutlinedButton(
                            onPressed: (){
                              controller.goToNewDiscountPage();
                            },
                            child: Text(
                              "Create new discount",
                              style: AppStyles.roboto14semiBold,
                            ),

                          ),
                        );
                      }
                    }
                    return  Column(
                      children:[ListView.builder(
                          padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0),
                          itemCount: activeProductDiscounts?.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var discountItem =
                                activeProductDiscounts![index];
                            return RestaurantDiscountItem(
                                restaurantDiscount: discountItem,);
                          },
                      ),
                        OutlinedButton(
                          onPressed: () async {
                            controller.goToNewDiscountPage();
                          },
                          child: Container(
                            width: double.infinity,
                            child: Center(child: Text("Add New Discount")),),),
                      ],
                    );
                  } else {
                    return Center(
                      child: Text(
                        "Error happened!",
                        style: AppStyles.roboto16semiBold
                            .apply(color: AppColors.primaryColor),
                      ),
                    );
                  }
                },
    );
  }
}

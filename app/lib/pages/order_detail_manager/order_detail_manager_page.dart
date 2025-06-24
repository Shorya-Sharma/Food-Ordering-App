import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controller/order_manager_controller.dart';
import 'package:food_delivery_app/pages/order_detail_manager/widget/order_item_detail.dart';
import 'package:food_delivery_app/pages/order_detail_manager/widget/price_breakdown.dart';
import 'package:food_delivery_app/pages/order_manager/order_state_manager/order_context.dart';
import 'package:food_delivery_app/resources/components/my_appbar.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

import '../../data/model/user/user.dart';
import '../../resources/components/tab_title.dart';
import '../../values/app_colors.dart';

class OrderDetailMangerPage extends StatefulWidget {
  const OrderDetailMangerPage({super.key});

  @override
  State<OrderDetailMangerPage> createState() => _OrderDetailMangerPageState();
}

class _OrderDetailMangerPageState extends State<OrderDetailMangerPage> {
  final OrderManagerController controller = Get.find();
  OrderContext orderContext = Get.arguments['orderContext'];
  @override
  void initState() {
    print(orderContext.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyAppbar(
              title: 'Order Detail',
              actions: [],
            ),
            Expanded(
              child: Column(
                children: [
                  TabTitle(
                    title: 'Destination',
                    actionText: '',
                    seeAll: () {},
                    padding: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: (16.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        orderContext.order.user != null
                            ? DestinationCard(
                                user: orderContext.order.user!,
                                address: orderContext.order.address,
                              )
                            : Container(),
                        Divider(
                          height: (48),
                        ),
                        Text(
                          'Order Items',
                          style: AppStyles.roboto16regular,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 300.h),
                          child: Container(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: orderContext.order.items.length,
                                    itemBuilder: (context, index) {
                                      var item =
                                          orderContext.order.items[index];
                                      return OrderDetailItem(
                                        item: item,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: (56),
                        ),
                        PriceBreakdown(
                          title: 'Sub total Price',
                          price: '\$155',
                        ),
                        PriceBreakdown(
                          title: 'Delivery Fee',
                          price: '\$8',
                        ),
                        PriceBreakdown(
                          title: 'TanahAir Voucher',
                          price: 'None',
                        ),
                        PriceBreakdown(
                          title: 'Total price',
                          price: '\$163',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: (16.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Accept'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Reject'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  final bool isSelected;
  final String title;
  const PaymentCard({super.key, required this.isSelected, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (48),
      padding: EdgeInsets.symmetric(
        horizontal: (8.0),
      ),
      margin: EdgeInsets.only(
        bottom: (16.0),
      ),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          isSelected
              ? BoxShadow(
                  color: AppColors.kShadowColor,
                  offset: Offset(
                    (24),
                    (40),
                  ),
                  blurRadius: 80,
                )
              : BoxShadow(color: Colors.transparent),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: (40),
            height: (40),
            decoration: ShapeDecoration(
              color: AppColors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  (8.0),
                ),
              ),
            ),
          ),
          SizedBox(
            width: (8),
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: (17),
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  const DestinationCard({super.key, required this.user, required this.address});
  final User user;
  final String address;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (96),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80.h,
            width: 80.h,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  80.h,
                ),
              ),
              image: DecorationImage(
                image: AssetImage(AppAssets.avatar),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: (8.0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  user.fullname,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Flexible(
                  child: Text(
                    address,
                    style: AppStyles.roboto16regular,
                  ),
                ),
                Text(
                  '(+84) 0862622563',
                  style: AppStyles.roboto16regular,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

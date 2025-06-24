import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/data/model/Order/order.dart';
import 'package:food_delivery_app/data/model/imageFinder/image_finder.dart';
import 'package:food_delivery_app/resources/widgets/button_widget.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_extension.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:gap/gap.dart';

class OrderItem extends StatelessWidget {
  final Order order;
  final String firstLabel;
  final String secondLabel;
  final VoidCallback onFirstTap;
  final VoidCallback onSecondTap;

  const OrderItem({
    super.key,
    required this.order,
    required this.firstLabel,
    required this.secondLabel,
    required this.onFirstTap,
    required this.onSecondTap,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            FutureBuilder<String>(
                future: ImageFinder.getImagesLinks(order.items[0].dish!.name),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 10),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(snapshot.data!)),
                          borderRadius: BorderRadius.circular(16)),
                    );
                  }
                  return Container();
                }),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            order.items[0].dish!.name,
                            style: AppStyles.h4
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '#232434',
                          style: AppStyles.h4.copyWith(
                            fontSize: 14,
                            color: Color(0xff6B6E82),
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xff6B6E82),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Text(
                            order.price.toStringAsFixed(0) + "d",
                            style: AppStyles.roboto14semiBold.copyWith(
                              color: Color(0xff6B6E82),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: VerticalDivider(
                              color: Color(0xffCACCDA),
                              thickness: 2,
                            ),
                          ),
                          Text(
                            '${order.items.length} items',
                            style: AppStyles.h4.copyWith(
                                fontSize: 12, color: Color(0xff6B6E82)),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: order.deliveryStatus != 'DELIVERING' &&
                          order.deliveryStatus != 'PENDING',
                      child: Text(
                        order.deliveryStatus.toCapital,
                        style: AppStyles.h4.copyWith(
                            fontWeight: FontWeight.bold,
                            color: order.deliveryStatus != 'DELIVERED'
                                ? Colors.red
                                : Colors.green),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            ButtonWidget(
                width: 100.h,
                onPress: onFirstTap,
                text: firstLabel,
                type: firstLabel == 'Track Order' ? 'primary' : 'outline'),
            Gap(10),
            ButtonWidget(
                width: 100.h,
                onPress: onSecondTap,
                text: secondLabel,
                type: firstLabel == 'Track Order' ? 'outline' : 'primary')
          ]),
          SizedBox(
            height: 20,
          ),
          const Divider(
            height: 1,
            thickness: 2,
            color: Color(0xffEEF2F6),
          )
        ],
      ),
    );
  }
}

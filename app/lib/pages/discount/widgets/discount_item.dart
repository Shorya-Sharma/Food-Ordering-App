import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/model/product_discount/product_discount.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DiscountItem extends StatefulWidget {
  final ProductDiscount item;
  const DiscountItem({super.key, required this.item});

  @override
  State<DiscountItem> createState() => _DiscountItemState();
}

class _DiscountItemState extends State<DiscountItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.backgroundColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.item.name.toUpperCase(),
            style: AppStyles.h4,
          ),
          Text(widget.item.conditions, style: AppStyles.subText),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  '${DateFormat('dd/MM/yyyy').format(widget.item.validFrom!)} - ${DateFormat('dd/MM/yyyy').format(widget.item.validTo!)}',
                  style: AppStyles.h4),
              Text("quantity: ${widget.item.discountUnit}", style: AppStyles.h4)
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/option_controller.dart';
import 'package:food_delivery_app/data/model/optionItem/option_item.dart';
import 'package:food_delivery_app/pages/food/detail_food_page.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:get/get.dart';

class OptionItemWidget extends StatelessWidget {
  final OptionItem item;
  final int optionId;
  const OptionItemWidget(
      {super.key, required this.item, required this.optionId});
  bool isChecked(List<Map<String, dynamic>> list) {
    for (var element in list) {
      if (element["optionId"] == optionId) {
        if (element["optionItemIds"]
            .any((map) => map["id"] == item.id && map["price"] == item.price)) {
          return true;
        }
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    OptionController optionController = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            Text(item.price.toStringAsFixed(0),
                style: TextStyle(fontSize: 14, color: AppColors.subTextColor)),
          ],
        ),
        Obx(() {
          return Checkbox(
            checkColor: AppColors.primaryColor,
            value: isChecked(optionController.listChecked),
            onChanged: (bool? value) {
              if (value!) {
                optionController
                    .addChecked(optionId, {"id": item.id, "price": item.price});
              } else {
                optionController.removeChecked(
                    optionId, {"id": item.id, "price": item.price});
              }
            },
          );
        }),
      ],
    );
  }
}

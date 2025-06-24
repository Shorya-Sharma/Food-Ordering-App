import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/model/groupOption.dart/group_option.dart';
import 'package:food_delivery_app/pages/food/widgets/option_item.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';

class OptionsLayout extends StatefulWidget {
  final GroupOption item;
  const OptionsLayout({super.key, required this.item});

  @override
  State<OptionsLayout> createState() => _OptionsLayoutState();
}

class _OptionsLayoutState extends State<OptionsLayout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          color: Color.fromARGB(255, 255, 206, 176),
          width: double.infinity,
          child: Text(
            widget.item.name,
            style: AppStyles.h4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return OptionItemWidget(
                  item: widget.item.optionItems[index],
                  optionId: widget.item.id,
                );
              },
              separatorBuilder: ((context, index) {
                return SizedBox(
                  height: 10,
                );
              }),
              itemCount: widget.item.optionItems.length),
        ),
      ],
    );
  }
}

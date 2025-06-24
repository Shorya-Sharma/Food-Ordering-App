import 'package:flutter/material.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:gap/gap.dart';

class BaseCard extends StatelessWidget {
  const BaseCard(
      {this.title, required this.isvisible, required this.child, super.key});

  final bool isvisible;
  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisible,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title != null
                ? Text(
                    title!,
                    style: AppStyles.h4,
                  )
                : const Gap(0),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }
}

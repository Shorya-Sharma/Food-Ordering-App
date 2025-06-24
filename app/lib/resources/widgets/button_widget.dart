import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  final String type;
  final double width;

  const ButtonWidget(
      {super.key,
      required this.width,
      required this.onPress,
      required this.text,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: GestureDetector(
          onTap: onPress,
          child: Container(
            decoration: BoxDecoration(
              color: type == 'primary'
                  ? AppColors.primaryColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: type != 'primary'
                    ? AppColors.primaryColor
                    : Colors.transparent,
                width: 1, // Adjust the width of the outline as needed
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text(
                text,
                style: AppStyles.roboto12semiBold.copyWith(
                    color: type == 'primary'
                        ? Colors.white
                        : AppColors.primaryColor),
              ),
            ),
          ),
          // style: ButtonStyle(
          //   backgroundColor: MaterialStateProperty.all<Color>(
          //       type == 'primary' ? AppColors.primaryColor : Colors.white),
          //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //     RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //       side: BorderSide(
          //         color: type != 'primary'
          //             ? AppColors.primaryColor
          //             : Colors.transparent,
          //         width: 1, // Adjust the width of the outline as needed
          //       ),
          //     ),
          //   ),
          // ),
        ));
  }
}

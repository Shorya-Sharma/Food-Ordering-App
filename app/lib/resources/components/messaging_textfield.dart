import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';

class MessagingTextField extends StatelessWidget {
  const MessagingTextField(
      {super.key,
      required this.controller,
      this.onChanged,
      this.onEditingComplete,
      this.onSubmitted,
      this.suffixIcon});
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      cursorColor: AppColors.kDarkGrey,
      keyboardType: TextInputType.multiline,
      style: AppStyles.customeText(16, AppColors.kDark, FontWeight.w500),
      decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(6.h),
          filled: true,
          fillColor: AppColors.bgTextField,
          suffixIcon: suffixIcon ??
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.send,
                  color: AppColors.primaryColor,
                ),
              ),
          hintText: "Type your message here",
          hintStyle:
              AppStyles.customeText(14, AppColors.kDarkGrey, FontWeight.normal),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.h),
            borderSide: BorderSide(color: AppColors.kDarkGrey),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),
              borderSide: BorderSide(color: AppColors.kDarkGrey))),
    );
  }
}

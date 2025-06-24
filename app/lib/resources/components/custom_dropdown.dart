import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    this.title,
    this.width,
    this.isSetSelectedItemBuilder = false,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.onSaved,
    this.selectedItemBuilder,
    this.validator,
  });

  final bool isSetSelectedItemBuilder;
  final double? width;
  final Object? value;
  final List<DropdownMenuItem<Object>>? items;
  final String? title;
  final String hint;
  final Function(Object?)? onChanged;
  final Function(Object?)? onSaved;
  final String? Function(Object?)? validator;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: AppColors.subTextColor, width: 0.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent, width: 0.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: isSetSelectedItemBuilder ? 10 : 20, vertical: 15),
        filled: true,
        fillColor: AppColors.bgTextField,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: title,
      ),
      style: AppStyles.customeText(14, AppColors.kDark, FontWeight.w500),
      dropdownColor: AppColors.whiteColor,
      selectedItemBuilder: isSetSelectedItemBuilder
          ? (context) {
              return items!.map<Widget>((item) {
                return SizedBox(
                  width: width != null ? width! - 12.w : null,
                  child: item.child,
                );
              }).toList();
            }
          : null,
      value: value,
      hint: SizedBox(
          width: width != null ? width! - 12.w : null,
          child: Text(
            hint,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
      items: items,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
    );
  }
}

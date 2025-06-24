import 'package:flutter/material.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';

class DateTimePicker extends StatelessWidget {
  const DateTimePicker({
    Key? key,
    required this.selectedDate,
    required this.selectedTime,
    required this.onDateChanged,
    required this.onTimeChanged,
  }) : super(key: key);

  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final ValueChanged<DateTime> onDateChanged;
  final ValueChanged<TimeOfDay> onTimeChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(1900),
              lastDate: DateTime(2101),
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    colorScheme: ColorScheme.light().copyWith(
                      primary: AppColors.primaryColor,
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (pickedDate != null && pickedDate != selectedDate) {
              onDateChanged(pickedDate);
            }
          },
          child: Text(
            'Selected Date: ${selectedDate.toLocal()}'.split(' ')[0],
            style: AppStyles.customeText(
              14,
              AppColors.kDark,
              FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            final TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: selectedTime,
            );
            if (pickedTime != null && pickedTime != selectedTime) {
              onTimeChanged(pickedTime);
            }
          },
          child: Text(
            'Selected Time: ${selectedTime.format(context)}',
            style: AppStyles.customeText(
              14,
              AppColors.kDark,
              FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

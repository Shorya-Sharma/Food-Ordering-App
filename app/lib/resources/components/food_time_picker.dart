import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/resources/components/custom_expand_panel.dart';
import 'package:food_delivery_app/resources/components/custom_textfield.dart';
import 'package:time_range_picker/time_range_picker.dart';

class FoodTimePicker extends StatelessWidget {
  FoodTime foodTime;
  FoodTimePicker({super.key, required this.foodTime});
  TextEditingController startTime = TextEditingController();
  TextEditingController endTime = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      child: Column(
        children: [
          CustomTextField(
            controller: startTime,
            hintText: "Sale time",
            keyboardType: TextInputType.text,
            readOnly: true,
            onTap: () async {
              TimeRange res = await showTimeRangePicker(context: context);
              startTime.text = res.startTime.toString();
              endTime.text = res.endTime.toString();
            },
          )
        ],
      ),
    );
  }
}

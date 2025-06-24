import 'package:enhance_expansion_panel/enhance_expansion_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/resources/components/food_time_picker.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';

class CustomExpandPanel extends StatefulWidget {
  const CustomExpandPanel({super.key});

  @override
  State<CustomExpandPanel> createState() => _CustomExpandPanelState();
}

class FoodTime {
  final String headerValue;
  final Widget expandedWidget;
  final int index;
  bool isExpand = false;
  bool isAllDay = false;
  DateTime? startTime;
  DateTime? endTime;
  FoodTime(
      {required this.headerValue,
      required this.expandedWidget,
      required this.index}) {
    startTime = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 7, 0);
    endTime = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 21, 0);
  }
  getValue() {
    if (isAllDay) {
      return "All Day";
    } else {
      return "${startTime!.hour.toString().padLeft(2, '0')}:${startTime!.minute.toString().padLeft(2, '0')} - ${endTime!.hour.toString().padLeft(2, '0')}:${endTime!.minute.toString().padLeft(2, '0')}";
    }
  }
}

class _CustomExpandPanelState extends State<CustomExpandPanel> {
  @override
  Widget build(BuildContext context) {
    List<FoodTime> _data = [
      FoodTime(headerValue: "Monday", expandedWidget: Container(), index: 0),
      FoodTime(headerValue: "Tuesday", expandedWidget: Container(), index: 1),
      FoodTime(headerValue: "Wednesday", expandedWidget: Container(), index: 2),
      FoodTime(headerValue: "Thursday", expandedWidget: Container(), index: 3),
      FoodTime(headerValue: "Friday", expandedWidget: Container(), index: 4),
      FoodTime(headerValue: "Saturday", expandedWidget: Container(), index: 5),
      FoodTime(headerValue: "Sunday", expandedWidget: Container(), index: 6),
    ];
    return SingleChildScrollView(
      child: Container(
        child: EnhanceExpansionPanelList(
          dividerColor: AppColors.whiteColor,
          // elevation: 4,
          expandedHeaderPadding: EdgeInsets.only(top: 0, bottom: 0),
          expansionCallback: (int index, bool isExpanded) {
            print("call expand");
          },
          children: _data.map<EnhanceExpansionPanel>((item) {
            return EnhanceExpansionPanel(
              isExpanded: item.isExpand,
              canTapOnHeader: true,
              arrowColor: AppColors.subTextColor,
              arrowPosition: EnhanceExpansionPanelArrowPosition.tailing,
              arrowPadding: const EdgeInsets.all(5),
              backgroundColor: AppColors.bgTextField,
              arrow: GestureDetector(
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: AppColors.subTextColor,
                ),
                onTap: () {
                  print("hjeheeh");
                  setState(() {
                    item.isExpand = !item.isExpand;
                  });
                },
              ),

              /// custome wiget by isExpanded
              arrowExpanded: GestureDetector(
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.red,
                ),
                onTap: () {},
              ),

              /// custom property
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Container(
                  // color: Colors.green,
                  child: ListTile(
                    title: Text(
                      item.headerValue,
                    ),
                    subtitle: Text(
                      item.getValue(),
                      style: AppStyles.customeText(
                          14.sp, AppColors.subTextColor, FontWeight.w500),
                    ),
                    // trailing: Icon(isExpanded ? Icons.expand_less : Icons.expand_more, color: Colors.red,),
                    // trailing: Icon(isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right, color: Colors.red,),
                  ),
                );
              },
              body: FoodTimePicker(foodTime: item),
            );
          }).toList(),
        ),
      ),
    );
  }
}

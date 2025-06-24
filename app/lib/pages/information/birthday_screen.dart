import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/information_controller.dart';
import 'package:food_delivery_app/pages/information/activity_screen.dart';
import 'package:food_delivery_app/pages/information/birthday_screen.dart';
import 'package:food_delivery_app/resources/widgets/button_widget.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  int _currentIntValue = 20;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    InformationController informationController = Get.find();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Image.asset(
              AppAssets.age,
              width: 200,
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'What is your age?',
              style: AppStyles.header
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: width * 0.6,
              child: LinearProgressIndicator(
                value: 1,
                backgroundColor: const Color.fromARGB(255, 226, 226, 226),
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8),
                minHeight: 10,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NumberPicker(
                  value: _currentIntValue,
                  minValue: 1,
                  maxValue: 100,
                  step: 1,
                  itemCount: 5,
                  infiniteLoop: true,
                  textStyle: AppStyles.header
                      .copyWith(fontSize: 24, color: AppColors.subTextColor),
                  selectedTextStyle: AppStyles.header
                      .copyWith(fontSize: 32, color: AppColors.primaryColor),
                  decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                          color: AppColors.subTextColor,
                        ),
                        bottom: BorderSide(color: AppColors.subTextColor)),
                  ),
                  haptics: true,
                  onChanged: (value) =>
                      setState(() => _currentIntValue = value),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  'year old',
                  style: TextStyle(fontSize: 32),
                )
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                informationController.setAge(_currentIntValue);
                Get.to(() => ActivityScreen());
              },
              child: Text(
                'Next Step',
                style: AppStyles.h4.copyWith(color: Colors.white),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10), // Adjust padding as needed
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

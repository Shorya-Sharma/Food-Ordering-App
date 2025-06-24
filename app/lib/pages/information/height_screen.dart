import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/information_controller.dart';
import 'package:food_delivery_app/pages/information/birthday_screen.dart';
import 'package:food_delivery_app/resources/widgets/button_widget.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  int _currentIntValue = 150;

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
              AppAssets.height,
              width: 200,
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'What is your height?',
              style: AppStyles.header
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: width * 0.6,
              child: LinearProgressIndicator(
                value: 0.75,
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
                  minValue: 100,
                  maxValue: 200,
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
                  'Cm',
                  style: TextStyle(fontSize: 32),
                )
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                informationController.setHeight(_currentIntValue);
                Get.to(() => AgeScreen());
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

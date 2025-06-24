import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/information_controller.dart';
import 'package:food_delivery_app/controller/recommend_controller.dart';
import 'package:food_delivery_app/data/model/user/user.dart';
import 'package:food_delivery_app/pages/information/gender_screen.dart';
import 'package:food_delivery_app/pages/information/weight_screen.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  List<String> goals = [
    "Maintain weight",
    "Mild weight loss",
    "Weight loss",
    "Extreme weight loss"
  ];
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
            Text(
              'What is your goal?',
              style: AppStyles.header
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: width * 0.6,
              child: LinearProgressIndicator(
                value: 0.25,
                backgroundColor: Colors.white,
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8),
                minHeight: 10,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ElevatedButton(
                      onPressed: () {
                        informationController.setWeightLoss(goals[index]);
                        Get.to(() => GenderScreen());
                      },
                      child: Text(
                        goals[index],
                        style: AppStyles.h4.copyWith(fontSize: 18),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(
                              vertical: 30,
                              horizontal: 40), // Adjust padding as needed
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 30,
                    ),
                itemCount: goals.length)
          ],
        ),
      ),
    );
  }
}

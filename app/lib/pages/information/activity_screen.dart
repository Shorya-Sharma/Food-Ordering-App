import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/information_controller.dart';
import 'package:food_delivery_app/pages/information/confirm.dart';
import 'package:get/get.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  List<String> goals = [
    "Little/no exercise",
    "Light exercise",
    "Moderate exercise (3-5 days/week)",
    "Very active (6-7 days/week)",
    "Extra active (very active day & physical job)"
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    InformationController informationController = Get.find();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'What is your activity level?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              SizedBox(
                height: 40,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ElevatedButton(
                        onPressed: () {
                          informationController.setActivity(goals[index]);
                          Get.to(() => ReviewInformationScreen());
                        },
                        child: Text(
                          goals[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
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
                  itemCount: goals.length),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

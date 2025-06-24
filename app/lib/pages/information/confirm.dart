import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/model/user/user.dart';
import 'package:food_delivery_app/pages/home/navigation_home.dart';
import 'package:food_delivery_app/pages/location/location_page.dart';
import 'package:food_delivery_app/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:food_delivery_app/controller/information_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewInformationScreen extends StatelessWidget {
  const ReviewInformationScreen({Key? key}) : super(key: key);
  static const String routeName = 'review_screen';

  @override
  Widget build(BuildContext context) {
    InformationController informationController = Get.find();
    UserRepository userRepository = Get.find();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Obx(() {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(70.0),
                    child: Text(
                      'Review Your Information',
                      style: TextStyle(fontSize: 32, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8),
                  InfoCard(
                    title: 'WEIGHT',
                    value: informationController.weight.value.toString(),
                    onTap: () {
                      navigateToEditScreen(context, 'WEIGHT');
                    },
                  ),
                  const SizedBox(height: 8),
                  InfoCard(
                    title: 'HEIGHT',
                    value: informationController.height.value.toString(),
                    onTap: () {
                      navigateToEditScreen(context, 'HEIGHT');
                    },
                  ),
                  const SizedBox(height: 8),
                  InfoCard(
                    title: 'AGE',
                    value: informationController.age.value.toString(),
                    onTap: () {
                      navigateToEditScreen(context, 'AGE');
                    },
                  ),
                  const SizedBox(height: 8),
                  InfoCard(
                    title: 'GENDER',
                    value: informationController.gender.value,
                    onTap: () {
                      navigateToEditScreen(context, 'GENDER');
                    },
                  ),
                  const SizedBox(height: 8),
                  // InfoCard(
                  //   title: 'ACTIVITY LEVEL',
                  //   value: informationController.activity.value.toString(),
                  //   onTap: () {
                  //     navigateToEditScreen(context, 'TARGET_WEIGHT');
                  //   },
                  // ),
                  const SizedBox(height: 8),
                  InfoCard(
                    title: 'WEIGHT LOSS',
                    value: informationController.weightLoss.value.toString(),
                    onTap: () {
                      navigateToEditScreen(context, 'TARGET_WEIGHT');
                    },
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        print(informationController.activity.value);
                        print(informationController.weightLoss.value);
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        int userId = prefs.getInt("userId")!;
                        User user = User(
                          id: userId,
                          gender: Gender.values.firstWhere((e) =>
                              e.toString() ==
                              'Gender.${informationController.gender.value}'),
                          activity: informationController.activity.value,
                          weightLoss: informationController.weightLoss.value,
                          age: informationController.age.value,
                          height: informationController.height.value,
                          weight: informationController.weight.value,
                        );
                        prefs.setString("user-info", jsonEncode(user.toJson()));
                        await userRepository.updateUser(user);

                        Get.to(() => LocationPage());
                      },
                      child: const Text('Confirm'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  void navigateToEditScreen(BuildContext context, String infoType) {
    // Depending on the type of information, navigate to the respective screen
    Widget screen;
    switch (infoType) {
      // case 'WEIGHT':
      //   screen = const EditWeightScreen();
      //   break;
      // case 'HEIGHT':
      //   screen = const EditHeightScreen();
      //   break;
      // case 'AGE':
      //   screen = const EditAgeScreen();
      //   break;
      // case 'GENDER':
      //   screen = const EditGenderScreen();
      //   break;
      default:
        return;
    }

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => screen),
    // );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback? onTap;

  const InfoCard({
    Key? key,
    required this.title,
    required this.value,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InformationController informationController = Get.find();
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            Row(
              children: [
                Text(
                  value,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.edit, size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

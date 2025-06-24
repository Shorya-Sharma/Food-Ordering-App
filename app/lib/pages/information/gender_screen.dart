import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/information_controller.dart';
import 'package:food_delivery_app/pages/information/weight_screen.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});
  static const String routeName = 'gender_screen';

  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderScreen> {
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  @override
  Widget build(BuildContext context) {
    InformationController informationController = Get.find();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Image.asset(
            AppAssets.gender,
            width: 200,
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            'What is your gender?',
            style: AppStyles.header
                .copyWith(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: GenderOption(
                    gender: 'Male',
                    icon: Icons.male,
                    isSelected: isMaleSelected,
                    onSelect: () {
                      setState(() {
                        isMaleSelected = true;
                        isFemaleSelected = false;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10), // For spacing between the buttons
                Expanded(
                  child: GenderOption(
                    gender: 'Female',
                    icon: Icons.female,
                    isSelected: isFemaleSelected,
                    onSelect: () {
                      setState(() {
                        isMaleSelected = false;
                        isFemaleSelected = true;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
                top: 60.0), // Adjust the padding as needed
            child: ElevatedButton(
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
              onPressed: () {
                informationController
                    .setGender(isMaleSelected ? "male" : "female");
                Get.to(() => WeightScreen());
              },
            ),
          ),
          // Add other widgets if necessary
        ],
      ),
    );
  }
}

class GenderOption extends StatelessWidget {
  final String gender;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onSelect;

  const GenderOption({
    Key? key,
    required this.gender,
    required this.icon,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.all(50.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange.shade100 : Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: isSelected ? Colors.orange : Colors.grey),
            Text(
              gender,
              style: TextStyle(
                color: isSelected ? Colors.orange : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

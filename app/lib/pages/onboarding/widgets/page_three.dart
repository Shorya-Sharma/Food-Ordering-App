import 'package:flutter/material.dart';
import 'package:food_delivery_app/resources/components/reuseable_text.dart';
import 'package:food_delivery_app/values/app_styles.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        const SizedBox(height: 70),
        // Image.asset("assets/images/page1.png"),
        const SizedBox(height: 40),
        Column(
          children: [
            ReusableText(
                text: "All your favorites",
                style:
                    AppStyles.customeText(30, Colors.black, FontWeight.w500)),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text('''Get all your loved foods in one once place,
                  you just place the orer we do the rest''',
                  textAlign: TextAlign.center,
                  style:
                      AppStyles.customeText(14, Colors.black, FontWeight.w500)),
            ),
          ],
        )
      ]),
    );
  }
}

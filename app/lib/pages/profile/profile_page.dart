import 'package:flutter/material.dart';
import 'package:food_delivery_app/values/app_styles.dart';

import '../../resources/components/image_container.dart';
import '../../resources/components/my_appbar.dart';

class MyProfileScreen extends StatelessWidget {
  static const routeName = 'myProfile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text(
          "My Profile",
          style: AppStyles.roboto20semiBold,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            ImageContainer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                children: [
                  Divider(
                    height: 64,
                  ),
                  InputFormCard(
                    title: 'Full name',
                    value: 'Shoo Phar Nhoe',
                  ),
                  InputFormCard(
                    title: 'Birthdate',
                    value: '29 February 1200',
                  ),
                  InputFormCard(
                    title: 'Gender',
                    value: 'Male',
                  ),
                  InputFormCard(
                    title: 'Email',
                    value: 'shoophar@email.com',
                  ),
                  InputFormCard(
                    title: 'Phone number',
                    value: '(+78) 8989 8787',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputFormCard extends StatelessWidget {
  const InputFormCard({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(title, style: AppStyles.roboto16regular),
        ),
        Flexible(
          child: TextFormField(
            initialValue: value,
            textAlign: TextAlign.right,
            style: AppStyles.roboto16semiBold,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }
}

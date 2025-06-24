import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/constants/snackbar_type.dart';
import 'package:food_delivery_app/models/auth_controller.dart';
import 'package:food_delivery_app/pages/auth/sign_up_page.dart';
import 'package:food_delivery_app/resources/components/custom_button.dart';
import 'package:food_delivery_app/resources/components/reuseable_text.dart';
import 'package:food_delivery_app/resources/snackbar/snackbar_factory.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

import '../../resources/components/custom_textfield.dart';

class LoginPage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    controller.getPrefs();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: Get.height,
            color: Colors.black,
            child: Column(children: [
              SizedBox(
                height: 100,
              ),
              ReusableText(
                  text: "Log In",
                  style:
                      AppStyles.customeText(30, Colors.white, FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              ReusableText(
                  text: "Please sign in your existing account",
                  style:
                      AppStyles.customeText(14, Colors.white, FontWeight.bold)),
              SizedBox(
                height: 50,
              ),
              Container(
                  height: Get.height * 0.70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Form(
                        key: controller.loginFormKey,
                        child: ListView(
                          children: [
                            ReusableText(
                                text: "USERNAME",
                                style: AppStyles.customeText(14,
                                    AppColors.subTextColor, FontWeight.bold)),
                            SizedBox(
                              height: 8,
                            ),
                            CustomTextField(
                                controller: controller.username,
                                hintText: "User name",
                                keyboardType: TextInputType.text,
                                validator: (username) {
                                  if (username!.isEmpty) {
                                    return "Please enter a valid username";
                                  } else {
                                    return null;
                                  }
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            ReusableText(
                                text: "PASSWORD",
                                style: AppStyles.customeText(14,
                                    AppColors.subTextColor, FontWeight.bold)),
                            SizedBox(
                              height: 8,
                            ),
                            Obx(
                              () => CustomTextField(
                                controller: controller.password,
                                hintText: "Password",
                                obscureText: controller.obscurePassword,
                                keyboardType: TextInputType.text,
                                validator: (password) {
                                  if (password!.isEmpty ||
                                      password.length < 4) {
                                    return "Please enter a valid password";
                                  } else {
                                    return null;
                                  }
                                },
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    controller.toggleObscurePassword();
                                  },
                                  child: Icon(
                                    controller.obscurePassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: AppColors.subTextColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Obx(
                                      () => Checkbox(
                                          side: const BorderSide(
                                              color: AppColors.subTextColor,
                                              width: 0.5),
                                          activeColor: AppColors.primaryColor,
                                          value: controller.isRememberMe,
                                          onChanged: (val) =>
                                              controller.toggleRememberMe()),
                                    ),
                                    ReusableText(
                                        text: "Remember me",
                                        style: AppStyles.customeText(
                                            14,
                                            AppColors.subTextColor,
                                            FontWeight.normal)),
                                  ],
                                ),
                                GestureDetector(
                                  child: ReusableText(
                                      text: "Forgot Password",
                                      style: AppStyles.customeText(
                                          14,
                                          AppColors.primaryColor,
                                          FontWeight.bold)),
                                  onTap: () {
                                    print("go to forgot password");
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Obx(
                              () => CustomButton(
                                text: "Login",
                                isLoading: controller.isLoading,
                                onTap: () {
                                  if (controller.validateAndSave()) {
                                    controller.login();
                                  } else {
                                    SnackbarFactory.instance.showCustomSnackbar(
                                        context,
                                        SnackBarType.error,
                                        "Please check your credentials");
                                  }
    }
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ReusableText(
                                    text: "Don't have an account? ",
                                    style: AppStyles.customeText(
                                        14,
                                        AppColors.subTextColor,
                                        FontWeight.normal)),
                                GestureDetector(
                                  child: ReusableText(
                                      text: "SIGN UP",
                                      style: AppStyles.customeText(
                                          14,
                                          AppColors.primaryColor,
                                          FontWeight.bold)),
                                  onTap: () {
                                    print("go to sign up");
                                    Get.to(() => SignUpPage());
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // Row(
                            //   children: [],
                            // )
                          ],
                        ),
                      ))),
            ]),
          ),
        ),
      ),
    );
  }
}

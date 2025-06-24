import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/data/model/user/user_req.dart';
import 'package:food_delivery_app/models/auth_controller.dart';
import 'package:food_delivery_app/resources/components/reuseable_text.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

import '../../resources/components/custom_button.dart';
import '../../resources/components/custom_textfield.dart';
import '../../values/app_colors.dart';

class SignUpPage extends GetView<AuthController> {
  final TextEditingController username = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          color: Colors.black,
          child: Column(children: [
            SizedBox(
              height: 100,
            ),
            ReusableText(
                text: "Sign Up",
                style:
                    AppStyles.customeText(30, Colors.white, FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            ReusableText(
                text: "Please sign up to get started",
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
                        topLeft: Radius.circular(30.h),
                        topRight: Radius.circular(30))),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: controller.signupFormKey,
                      child: ListView(
                        children: [
                          ReusableText(
                              text: "NAME",
                              style: AppStyles.customeText(
                                  14, AppColors.subTextColor, FontWeight.bold)),
                          SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                              controller: fullname,
                              hintText: "John doe",
                              keyboardType: TextInputType.text,
                              validator: (fullname) {
                                if (fullname!.isEmpty) {
                                  return "Please enter a valid email";
                                } else {
                                  return null;
                                }
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          ReusableText(
                              text: "USERNAME",
                              style: AppStyles.customeText(
                                  14, AppColors.subTextColor, FontWeight.bold)),
                          SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                              controller: username,
                              hintText: "User name",
                              keyboardType: TextInputType.emailAddress,
                              validator: (email) {
                                if (email!.isEmpty) {
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
                              style: AppStyles.customeText(
                                  14, AppColors.subTextColor, FontWeight.bold)),
                          SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                            controller: password,
                            hintText: "Password",
                            obscureText: controller.obscurePassword,
                            keyboardType: TextInputType.text,
                            validator: (password) {
                              if (password!.isEmpty || password.length < 7) {
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
                          SizedBox(
                            height: 20,
                          ),
                          ReusableText(
                              text: "RE-TYPE PASSWORD",
                              style: AppStyles.customeText(
                                  14, AppColors.subTextColor, FontWeight.bold)),
                          SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                            controller: password,
                            hintText: "Retype password",
                            obscureText: controller.obscurePassword,
                            keyboardType: TextInputType.text,
                            validator: (password) {
                              if (password!.isEmpty || password.length < 7) {
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
                          SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => CustomButton(
                              text: "SIGN UP",
                              isLoading: controller.isLoading,
                              onTap: () {
                                if (controller.signupFormKey.currentState!
                                    .validate()) {
                                  UserReq userReq = UserReq(
                                      username: username.text,
                                      fullname: fullname.text,
                                      password: password.text,
                                      role: "user");
                                  controller.signUp(userReq);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ))),
          ]),
        ),
      ),
    );
  }
}

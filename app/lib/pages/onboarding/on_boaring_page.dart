import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/on_boarding_controller.dart';
import 'package:food_delivery_app/pages/auth/login_page.dart';
import 'package:food_delivery_app/pages/onboarding/widgets/page_one.dart';
import 'package:food_delivery_app/resources/components/custom_button.dart';
import 'package:food_delivery_app/resources/components/reuseable_text.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_constant.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends GetView<OnBoardingController> {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [PageOne(), PageOne(), PageOne()],
            controller: pageController,
            onPageChanged: (page) {
              controller.isLastPage = page == 2;
            },
          ),
          Positioned(
              bottom: height * 0.05,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  controller.isLastPage
                      ? const SizedBox.shrink()
                      : Center(
                          child: SmoothPageIndicator(
                            controller: pageController,
                            count: 3,
                            effect: WormEffect(
                                dotHeight: 10,
                                dotWidth: 12,
                                spacing: 10,
                                dotColor: AppColors.bgTextField,
                                activeDotColor: AppColors.primaryColor),
                          ),
                        ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        CustomButton(
                          text: "Next",
                          isLoading: false,
                          onTap: () {
                            if (controller.isLastPage == true) {
                              Get.offAll(() => LoginPage());
                            } else {
                              pageController.nextPage(
                                  duration: Duration(microseconds: 300),
                                  curve: Curves.ease);
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: GestureDetector(
                            child: ReusableText(
                                text: "Skip",
                                style: AppStyles.customeText(14,
                                    AppColors.subTextColor, FontWeight.normal)),
                            onTap: () {
                              pageController.jumpToPage(2);
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controller/restaurant_manager_controller.dart';
import 'package:food_delivery_app/resources/widgets/back_button_widget.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

import '../../resources/components/review_card.dart';

class RestaurantManagerPage extends StatefulWidget {
  final int restaurantId; // Add this line

  const RestaurantManagerPage({Key? key, required this.restaurantId})
      : super(key: key); // Modify this line
  @override
  State<RestaurantManagerPage> createState() => _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends State<RestaurantManagerPage> {
  int selectedCategory = 0;
  final RestaurantManagerController controller =
      Get.find<RestaurantManagerController>();
  @override
  void initState() {
    controller.getRestaurant(this.widget.restaurantId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    bool isReviewTab = true;
    return Scaffold(
      // appBar: AppBar(
      //   actions: [],
      //   title: Text(
      //     "Restaurant Manager Page",
      //     style: AppStyles.roboto20semiBold,
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Container(
                  margin: EdgeInsets.only(top: 20, bottom: 40),
                  height: height * 1 / 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(controller
                                .restaurant.value?.imageUrl ??
                            'https://media-cdn.tripadvisor.com/media/photo-m/1280/19/39/15/75/the-lounge.jpg'),
                      )),
                ),
              ),

              Text(
                controller.restaurant.value?.name ?? 'Restaurant Name',
                style: AppStyles.header.copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  controller.restaurant.value?.address ??
                      'Restaurant Address...',
                  style: AppStyles.h4.copyWith(color: AppColors.subTextColor),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(AppAssets.rateIcon),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            controller.restaurant.value?.rating.toString() ??
                                '4.5',
                            style: AppStyles.h4
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(AppAssets.deliveryIcon),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text('free', style: AppStyles.h4),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(AppAssets.clockIcon),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text('20 min', style: AppStyles.h4),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 10,
                child: ListView.separated(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = index;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            decoration: BoxDecoration(
                                color: selectedCategory == index
                                    ? AppColors.primaryColor
                                    : AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                    color: selectedCategory == index
                                        ? AppColors.primaryColor
                                        : Color(0xffededed),
                                    width: 2)),
                            child: Center(
                              child: Obx(
                                () => Text(
                                  controller.categories[index].name,
                                  style: AppStyles.h4.copyWith(
                                      color: selectedCategory == index
                                          ? AppColors.whiteColor
                                          : AppColors.blackColor),
                                ),
                              ),
                            ),
                          ));
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          width: 30,
                        ),
                    itemCount: controller.categories.length),
              ),
              // GridView.builder(
              //     shrinkWrap: true,
              //     physics: NeverScrollableScrollPhysics(),
              //     itemCount:
              //         controller.categories[selectedCategory].dishes.length,
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         crossAxisSpacing: 10,
              //         mainAxisSpacing: 10,
              //         childAspectRatio: 170 / 220),
              //     itemBuilder: ((context, index) {
              //       return Container(
              //           height: 220,
              //           child: DishItemWidget(
              //             item: controller
              //                 .categories[selectedCategory].dishes[index],
              //             showPrice: true,
              //           ));
              //     }))
              // DishesWidget(title: dishes[selectedCategory].name, dishes: dishes)
              Container(
                height: 32.h,
                padding: EdgeInsets.symmetric(
                  vertical: (2),
                  horizontal: (4),
                ),
                decoration: ShapeDecoration(
                  color: AppColors.kShadowColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      (8.0),
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (!isReviewTab) {
                            return;
                          }

                          setState(() {
                            isReviewTab = !isReviewTab;
                          });
                        },
                        child: DetailSelection(
                          'Detail Items',
                          !isReviewTab,
                        ),
                      ),
                    ),
                    VerticalDivider(
                      endIndent: (4),
                      indent: (4),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (isReviewTab) {
                            return;
                          }
                          setState(() {
                            isReviewTab = !isReviewTab;
                          });
                        },
                        child: DetailSelection(
                          'Reviews',
                          isReviewTab,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: (16),
              ),
              !isReviewTab
                  ? Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation',
                      style: AppStyles.roboto12regular,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ReviewCard(),
                        ReviewCard(),
                        OutlinedButton(
                            onPressed: () {}, child: Text('See All Reviews'))
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailSelection extends StatelessWidget {
  final String text;
  final bool isSelected;

  const DetailSelection(this.text, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      decoration: isSelected
          ? ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  (8.0),
                ),
              ),
              shadows: [
                  BoxShadow(
                    color: AppColors.grey,
                    offset: Offset(0, 3),
                    blurRadius: 8,
                  )
                ])
          : null,
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}

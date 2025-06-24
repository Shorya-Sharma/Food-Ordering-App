import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controller/menu_controller.dart';
import 'package:food_delivery_app/controller/restaurant_manager_controller.dart';
import 'package:food_delivery_app/pages/categories/restaurant_categories.dart';
import 'package:food_delivery_app/pages/menu/widget/restaurant_dishes_para.dart';
import 'package:food_delivery_app/resources/widgets/back_button_widget.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_constant.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/model/category/category.dart';
import '../../data/model/review/review.dart';
import '../../resources/components/review_card.dart';
import '../../resources/widgets/dish_item_widget.dart';
import '../menu/widget/restaurant_dishes.dart';
import '../my_order/tracking_order_page.dart';
import '../reviews/widgets/reviews_item.dart';

class RestaurantManagerPage2 extends StatefulWidget {
  final int restaurantId; // Add this line

  const RestaurantManagerPage2({Key? key, required this.restaurantId})
      : super(key: key); // Modify this line
  @override
  State<RestaurantManagerPage2> createState() => _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends State<RestaurantManagerPage2> {
  int selectedCategory = 0;
  final MenuRestaurantController controller =
      Get.find<MenuRestaurantController>();
  double rating = 3;
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    controller.restaurantId.value = this.widget.restaurantId;
    controller.getRestaurant(this.widget.restaurantId);
    controller.getDishes();
    controller.getCategories();
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              // padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          height: height * 1 / 4,
                          decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(controller
                                    .restaurant.value?.imageUrl ??
                                'https://media-cdn.tripadvisor.com/media/photo-m/1280/19/39/15/75/the-lounge.jpg'),
                          )),
                        ),
                        Positioned(
                          top: 40,
                          left: 10,
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: AppColors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Icon(
                                  CupertinoIcons.arrow_left,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          right: 10,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.black.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Icon(
                                CupertinoIcons.share,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.restaurant.value?.name ??
                                'Restaurant Name',
                            style: AppStyles.header
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Gap(4),
                          Row(
                            children: [
                              RatingBar.builder(
                                initialRating:
                                    controller.restaurant.value?.rating != null
                                        ? double.parse(
                                            controller.restaurant.value!.rating)
                                        : 4.5,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemSize: 13,
                                onRatingUpdate: (double value) {},
                              ),
                              Gap(4),
                              Text(
                                controller.restaurant.value?.rating ?? '4.5',
                                style: AppStyles.roboto14regular,
                              ),
                            ],
                          ),
                          Gap(4),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.clock,
                                color: AppColors.primaryColor,
                                size: 15,
                              ),
                              Gap(6),
                              Text(
                                "Opening now",
                                style: AppStyles.roboto14regular
                                    .copyWith(color: AppColors.primaryColor),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: width * 0.89,
                                  child: Text(
                                    controller.restaurant.value?.address ??
                                        'Restaurant Address...',
                                    style: AppStyles.roboto12regular,
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Gap(4),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(TrackingOrderPage(
                                      restaurant: controller.restaurant.value!,
                                    ));
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [],
                                    ),
                                    child: Icon(
                                      CupertinoIcons.location,
                                      color: AppColors.primaryColor,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                // Gap(4),
                                // Container(
                                //   height: 50,
                                //   width: 50,
                                //   decoration: BoxDecoration(
                                //     color: AppColors.primaryColor.withOpacity(0.1),
                                //     borderRadius: BorderRadius.circular(50),
                                //     boxShadow: [],
                                //   ),
                                //   child: Icon(
                                //     CupertinoIcons.phone,
                                //     color: AppColors.primaryColor,
                                //     size: 20,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    height: 1,
                    color: AppColors.grey.withOpacity(0.2),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RestaurantCategories(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Dishes',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RestaurantDishes(isShowAddButton: false),
                        // RestaurantDishesPara(
                        //     isShowAddButton: false,
                        //     dishes: controller.getFutureDishes())
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    //
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reviews',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          StreamBuilder<List<Map<String, dynamic>>>(
                              stream: controller.getReview(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting)
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                else if (snapshot.hasData) {
                                  return ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        print(snapshot.data![index]);
                                        return ReviewItem(
                                            item: Review.fromJson(
                                                snapshot.data![index]));
                                      },
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            height: 20,
                                          ),
                                      itemCount: min(3, snapshot.data!.length));
                                } else if (snapshot.hasError) {
                                  return Text(snapshot.error.toString());
                                }
                                return Container();
                              })
                        ]),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (value) {
                      setState(() {
                        rating = value;
                      });
                    },
                    itemSize: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: commentController,
                            decoration: InputDecoration(
                              hintText: 'Comment here...',
                              hintStyle: AppStyles.h4,
                              prefixIcon: Icon(
                                Icons.chat,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        IconButton(
                            onPressed: () async {
                              try {
                                final SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                int userId = prefs.getInt("userId") ?? 0;
                                await Supabase.instance.client
                                    .from('reviews')
                                    .insert({
                                  'comment': commentController.value.text,
                                  "rate": rating,
                                  "user_id": userId,
                                  "restaurant": this.widget.restaurantId,
                                });
                                commentController.clear();
                              } catch (e) {
                                print(e);
                              }
                            },
                            icon: Icon(
                              Icons.send,
                              color: AppColors.primaryColor,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

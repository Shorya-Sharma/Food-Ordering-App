import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app/controller/location_controller.dart';
import 'package:food_delivery_app/data/model/category/category.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/data/model/review/review.dart';
import 'package:food_delivery_app/pages/restaurant/widgets/dishes_widget.dart';
import 'package:food_delivery_app/pages/reviews/widgets/reviews_item.dart';
import 'package:food_delivery_app/resources/widgets/back_button_widget.dart';
import 'package:food_delivery_app/resources/widgets/dish_item_widget.dart';
import 'package:food_delivery_app/supabaseRequest/dish_request.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DetailRestaurantPage extends StatefulWidget {
  const DetailRestaurantPage({super.key});

  @override
  State<DetailRestaurantPage> createState() => _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends State<DetailRestaurantPage> {
  int selectedCategory = -1;
  final supabase = Supabase.instance.client;
  double rating = 3;
  TextEditingController commentController = TextEditingController();
  Restaurant restaurant = Get.arguments;

  LocationController locationController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    List<Category> categories = restaurant.categories;
    print(categories);
    final reviewStream = supabase
        .from('reviews')
        .select()
        .eq('restaurant', restaurant.id)
        .asStream();
    return Scaffold(
      appBar: AppBar(
        leading: BackButtonWidget(
          () {
            Get.back();
          },
        ),
        title: Text(
          'Restaurant View',
          style: AppStyles.h4,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 40),
                    height: height * 1 / 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(restaurant.imageUrl),
                        )),
                  ),
                  Text(
                    restaurant.name,
                    style:
                        AppStyles.header.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      restaurant.description,
                      style:
                          AppStyles.h4.copyWith(color: AppColors.subTextColor),
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
                                2.3.toStringAsFixed(1),
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
                    height: 50,
                    child: ListView.separated(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  print("hh");
                                  selectedCategory = index;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                child: Center(
                                  child: Text(
                                    categories[index].name,
                                    style: AppStyles.h4.copyWith(
                                        color: selectedCategory == index
                                            ? AppColors.whiteColor
                                            : AppColors.blackColor),
                                  ),
                                ),
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
                              ));
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              width: 30,
                            ),
                        itemCount: categories.length),
                  ),
                  SizedBox(height: 30),
                  selectedCategory >= 0
                      ? FutureBuilder<List<Dish>>(
                          future: DishesRequest.getDishesByCategory(
                              categories[selectedCategory].id),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Center(
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data!.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                            childAspectRatio: 170 / 220),
                                    itemBuilder: ((context, index) {
                                      return Container(
                                          height: 220,
                                          child: DishItemWidget(
                                            item: snapshot.data![index],
                                            showPrice: true,
                                          ));
                                    })),
                              );
                            }
                            return CircularProgressIndicator();
                          })
                      : Container(),
                  SizedBox(
                    height: 20,
                  ),
                  // DishesWidget(title: dishes[selectedCategory].name, dishes: dishes)
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.symmetric(vertical: 20),
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
                              stream: reviewStream,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting)
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                else if (snapshot.hasData) {
                                  return ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) =>
                                          ReviewItem(
                                              item: Review.fromJson(
                                                  snapshot.data![index])),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            height: 20,
                                          ),
                                      itemCount: snapshot.data!.length);
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
                                await supabase.from('reviews').insert({
                                  'comment': commentController.value.text,
                                  "rate": rating,
                                  "user_id": userId,
                                  "restaurant": restaurant.id,
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

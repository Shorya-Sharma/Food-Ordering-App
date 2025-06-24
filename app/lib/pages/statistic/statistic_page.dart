import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/order/order.dart';
import 'package:food_delivery_app/data/model/order/order.dart';
import 'package:food_delivery_app/pages/reviews/reviews_page.dart';
import 'package:food_delivery_app/pages/statistic/widgets/dish_statistic_item.dart';
import 'package:food_delivery_app/pages/statistic/widgets/line_chart_widget.dart';
import 'package:food_delivery_app/repository/dish_repository.dart';
import 'package:food_delivery_app/repository/order_repository.dart';
import 'package:food_delivery_app/resources/widgets/back_button_widget.dart';
import 'package:food_delivery_app/resources/widgets/dish_item_widget.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:food_delivery_app/data/model/Order/order.dart' as orderModel;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  DishRepository dishRepository = Get.find();
  final supabase = Supabase.instance.client;
  OrderRepository orderRepository = Get.find();
  void test() async {
    final supabase = Supabase.instance.client;
    final data = await supabase.from('address').select().eq('id', 15);
    print(data);
  }

  @override
  void initState() {
    test();
    super.initState();
  }

  Future<List<Map<String, dynamic>>> fetchReviews() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt("userId") ?? 0;
    final response = await supabase
        .from('reviews')
        .select('*, restaurants (*)')
        .eq('restaurants.owner_id', userId);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Statistic'),
          leading: BackButtonWidget(
            () {
              Get.back();
            },
          ),
        ),
        body: Container(
            color: Color(0xfff7f8f9),
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FutureBuilder<List<orderModel.Order>>(
                                  future: orderRepository
                                      .getCanceledOrderByRestaurant(1),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        snapshot.data!.length.toString(),
                                        style: TextStyle(fontSize: 40),
                                      );
                                    }
                                    return Container();
                                  }),
                              Text(
                                'RUNNING ORDERS',
                                style: AppStyles.subText.copyWith(fontSize: 14),
                              )
                            ],
                          ),
                        )),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FutureBuilder<List<orderModel.Order>>(
                                  future: orderRepository
                                      .getPendingOrderByRestaurant(1),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        snapshot.data!.length.toString(),
                                        style: TextStyle(fontSize: 40),
                                      );
                                    }
                                    return Container();
                                  }),
                              Text(
                                'ORDER REQUEST',
                                style: AppStyles.subText.copyWith(fontSize: 14),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: LineChartWidget(),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Reviews',
                              style: TextStyle(fontSize: 18),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(() => ReviewsScreen());
                              },
                              child: Text(
                                'See All Reviews',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.primaryColor,
                                    decorationColor: AppColors.primaryColor,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
                        FutureBuilder<List<Map<String, dynamic>>>(
                            future: fetchReviews(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                double average = 0;
                                snapshot.data!.forEach((element) {
                                  average += element['rate'];
                                });
                                average = average / (snapshot.data!.length);
                                return Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: AppColors.primaryColor),
                                    Text(
                                      average.toStringAsFixed(1),
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: AppColors.primaryColor),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Total ${snapshot.data!.length} Reviews',
                                      style: TextStyle(fontSize: 16),
                                    )
                                  ],
                                );
                              }
                              return Container();
                            }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Popular Items This Weeks',
                                style: TextStyle(fontSize: 18)),
                            Text(
                              'See All',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.primaryColor,
                                  decoration: TextDecoration.underline),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FutureBuilder<List<Dish>>(
                            future: dishRepository.getHotDishes(1),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data!.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                            childAspectRatio: 0.9),
                                    itemBuilder: ((context, index) {
                                      return Container(
                                          child: DishStatisticItem(
                                        dish: snapshot.data![index],
                                      ));
                                    }));
                              }
                              return Container();
                            })
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

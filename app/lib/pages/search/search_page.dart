import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/pages/food/detail_food_page.dart';
import 'package:food_delivery_app/pages/search/search_result_page.dart';
import 'package:food_delivery_app/repository/dish_repository.dart';
import 'package:food_delivery_app/repository/restaurant_repository.dart';
import 'package:food_delivery_app/resources/widgets/dish_item_widget.dart';
import 'package:food_delivery_app/resources/widgets/notify_widget.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  bool isHide = true;
  String searchValue = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      searchValue = Get.arguments.toString();
      searchController.text = searchValue;
    });
  }

  Key search = Key('searchTextField');

  @override
  Widget build(BuildContext context) {
    List<String> recentWords = [
      'Bread',
    ];
    List<Dish> dishes = [
      Dish(name: 'Burger', price: 10, imageUrl: AppAssets.testUrl),
      Dish(name: 'Burger', price: 10, imageUrl: AppAssets.testUrl),
      Dish(name: 'Burger', price: 10, imageUrl: AppAssets.testUrl),
      Dish(name: 'Burger', price: 10, imageUrl: AppAssets.testUrl),
    ];
    Dish dish = Dish(name: 'Binh', price: 10, imageUrl: AppAssets.testUrl);
    Restaurant restaurant = new Restaurant(
        imageUrl: "image", name: "Rose Garden Restaurant", dishes: dishes);
    RestaurantRepository restaurantRepository = Get.find();
    DishRepository dishRepository = Get.find();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
              icon: Image.asset(AppAssets.backIcon),
              onPressed: () {
                Get.back(result: "");
              },
              style: IconButton.styleFrom(
                backgroundColor: AppColors.bgButtonColor,
              )),
          title: Text(
            'Search',
            style: AppStyles.roboto18semiBold,
          ),
          actions: [],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    autofocus: true,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          isHide = false;
                          searchValue = value;
                        });
                      } else {
                        setState(() {
                          isHide = true;
                          searchValue = "";
                        });
                      }
                    },
                    controller: searchController,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                        filled: true,
                        hintStyle: TextStyle(color: Color(0xff676767)),
                        fillColor: Color(0xfff6f6f6),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Search dishes, restaurants',
                        suffixIcon: isHide
                            ? null
                            : IconButton(
                                icon: Image.asset(AppAssets.closeIcon),
                                onPressed: () {
                                  searchController.value =
                                      TextEditingValue(text: '');
                                },
                              ),
                        prefixIconColor: Color(0xffa0a5ba),
                        prefixIcon: Image.asset(AppAssets.searchIcon)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                      future: dishRepository.search(searchValue),
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container();
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          return Container(
                            child: ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(() => DetailFoodPage(),
                                          arguments: snapshot.data![index]);
                                    },
                                    child: ListTile(
                                        leading: Icon(
                                          Icons.search,
                                          color: AppColors.subTextColor,
                                        ),
                                        title:
                                            Text(snapshot.data![index].name)),
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 4,
                                    ),
                                itemCount: snapshot.data!.length),
                          );
                        }
                      })),
                  SizedBox(
                    height: 4,
                  ),
                  FutureBuilder(
                      future: restaurantRepository.search(searchValue),
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container();
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          return Container(
                            child: ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return ListTile(
                                      leading: Icon(
                                        Icons.storefront,
                                        color: AppColors.subTextColor,
                                      ),
                                      title: Text(snapshot.data![index].name));
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 4,
                                    ),
                                itemCount: snapshot.data!.length),
                          );
                        }
                      })),
                  Text(
                    'Recent Keywords',
                    style: AppStyles.header,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: ListView.separated(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Get.to(() => SearchResultPage(),
                                    arguments: recentWords[index]);
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                child: Center(
                                  child: Text(
                                    recentWords[index],
                                    style: AppStyles.h4,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(
                                              255, 209, 203, 203),
                                          spreadRadius: 2,
                                          blurRadius: 8)
                                    ]),
                              ));
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              width: 30,
                            ),
                        itemCount: recentWords.length),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Suggested Restaurants',
                      style: AppStyles.header,
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      width: 60,
                      height: 56,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryColor),
                    ),
                    title: Text(
                      'Pansi Restaurant',
                      style: AppStyles.h4,
                    ),
                    subtitle: Row(
                      children: [
                        Image.asset(AppAssets.rateIcon),
                        Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Text(
                            9.8.toStringAsFixed(1),
                            style: AppStyles.h4
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Popular Fast Food',
                    style: AppStyles.header,
                  ),
                  DishItemWidget(item: dish),
                ],
              ),
            ),
          ),
        ));
  }
}

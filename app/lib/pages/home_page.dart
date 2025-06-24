import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/controller/location_controller.dart';
import 'package:food_delivery_app/data/api/dishType/dish_type_api.dart';
import 'package:food_delivery_app/data/model/category/category.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/dishType/dish_type.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/data/request/dish_request/dish_request.dart';
import 'package:food_delivery_app/models/user.dart';
import 'package:food_delivery_app/pages/categories/category_widget.dart';
import 'package:food_delivery_app/pages/homepage/category_widget.dart';
import 'package:food_delivery_app/pages/location/add_location_page.dart';
import 'package:food_delivery_app/pages/menu/widget/dish_card.dart';
import 'package:food_delivery_app/pages/search/search_page.dart';
import 'package:food_delivery_app/repository/dish_repository.dart';
import 'package:food_delivery_app/repository/dish_type_repository.dart';
import 'package:food_delivery_app/repository/restaurant_repository.dart';
import 'package:food_delivery_app/repository/user_repository.dart';
import 'package:food_delivery_app/resources/widgets/categories_item_widget.dart';
import 'package:food_delivery_app/resources/widgets/dish_item_widget.dart';
import 'package:food_delivery_app/resources/widgets/header_widget.dart';
import 'package:food_delivery_app/resources/widgets/notify_widget.dart';
import 'package:food_delivery_app/resources/widgets/restaurant_item_widget.dart';
import 'package:food_delivery_app/services/location_service.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:food_delivery_app/resources/widgets/recommend_dish_item.dart';

import 'homepage/recommend_widget.dart';

class HomePage extends StatefulWidget {
  final AnimationController? animationController;

  const HomePage({super.key, this.animationController});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<CategoryItemWidget> getCategories(categories) {
  return categories.map((category) => CategoryItemWidget(item: category));
}

String getSession() {
  DateTime currentDate = DateTime.now();

  if (currentDate.hour < 12)
    return 'Morning';
  else if (currentDate.hour <= 13)
    return 'Noon';
  else if (currentDate.hour <= 18)
    return 'Afternoon';
  else
    return 'Evening';
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  DishTypeRepository dishTypeRepository = Get.find();
  RestaurantRepository restaurantRepository = Get.find();
  DishRepository dishRepository = Get.find();
  List<Restaurant> restaurants = [];
  int page = 0;
  int limit = 4;
  bool isLoading = false;

  Future refresh() async {
    setState(() {
      restaurants.clear();
    });
    List<Restaurant> result =
        await restaurantRepository.getAll(pageNo: page, pageSize: limit);
    setState(() {
      restaurants = result;
    });
  }

  Future fetch() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {
      isLoading = true;
    });
    List<Restaurant> result =
        await restaurantRepository.getAll(pageNo: page, pageSize: limit);
    setState(() {
      page++;
      isLoading = false;
      restaurants.addAll(result);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  final LocationController locationController = Get.find<LocationController>();

  @override
  void initState() {
    super.initState();
    refresh();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        fetch();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    User user = User(
      name: 'Binh',
      phoneNumber: '097834342',
    );

    List<DishType> categories = [
      DishType(id: 1, name: 'All'),
      DishType(id: 1, name: 'All'),
      DishType(id: 1, name: 'All'),
      DishType(id: 1, name: 'All'),
    ];
    List<Dish> dishes = [
      Dish(name: 'Burger', price: 10, imageUrl: AppAssets.testUrl),
      Dish(name: 'Burger', price: 10, imageUrl: AppAssets.testUrl),
      Dish(name: 'Burger', price: 10, imageUrl: AppAssets.testUrl),
      Dish(name: 'Burger', price: 10, imageUrl: AppAssets.testUrl),
    ];
    Restaurant restaurant = new Restaurant(
        imageUrl: AppAssets.testUrl,
        name: "Rose Garden Restaurant",
        dishes: dishes);

    return Obx(() {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(CupertinoIcons.location_solid),
                color: AppColors.primaryColor,
                onPressed: () {},
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                )),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DELIVER TO',
                  style: AppStyles.h4.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(() => AddLocationPage());
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 200,
                            child: Text(
                              '${locationController.address.value}',
                              overflow: TextOverflow.clip,
                              style: AppStyles.h4.copyWith(
                                  fontSize: 14, color: Color(0xff676767)),
                            ),
                          ),
                        ),
                        Image.asset(
                          AppAssets.polygonIcon,
                          width: 14,
                        )
                      ],
                    ))
              ],
            ),
            actions: [NotifyWidget()],
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Hey ${user.name}, ',
                        style: AppStyles.h4,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Good ${getSession()}!',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      readOnly: true,
                      onTap: () async {
                        var data =
                            await Get.to(() => SearchPage(), arguments: '');
                        if (data == '') {
                          searchController.value = TextEditingValue(text: '');
                        }
                      },
                      controller: searchController,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                          filled: true,
                          hintStyle: TextStyle(color: Color(0xff676767)),
                          fillColor: Color(0xfff6f6f6),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Search dishes, restaurants',
                          prefixIconColor: Color(0xffa0a5ba),
                          prefixIcon: Image.asset(AppAssets.searchIcon)),
                    ),
                    HeaderWidget('All Categories'),
                    SizedBox(
                      height: 20,
                    ),

                    CategoriesWidget(
                      dishTypes: dishTypeRepository.getAll(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    HeaderWidget('Recommended Dishes'),
                    RecommendDishes(
                        dishes: dishRepository.getRecommendedDish()),
                    // FutureBuilder<List<Dish>>(
                    //     future: dishRepository.getRecommendedDish(),
                    //     builder: (context, snapshot) {
                    //       if (snapshot.hasError) {
                    //         print("binh");
                    //         print(snapshot.error);
                    //       }
                    //       if (snapshot.hasData) {
                    //         return Container(
                    //           height: 140,
                    //           child: ListView.separated(
                    //               shrinkWrap: true,
                    //               separatorBuilder: (context, index) =>
                    //                   SizedBox(
                    //                     width: 30,
                    //                   ),
                    //               scrollDirection: Axis.horizontal,
                    //               itemCount: restaurants.length + 1,
                    //               itemBuilder: (context, index) {
                    //                 if (index < restaurants.length) {
                    //                   return RecommendDishItem(
                    //                     item: snapshot.data![index],
                    //                   );
                    //                 } else {
                    //                   return isLoading
                    //                       ? const Padding(
                    //                           padding: EdgeInsets.symmetric(
                    //                               vertical: 16),
                    //                           child: Center(
                    //                             child:
                    //                                 CircularProgressIndicator(),
                    //                           ),
                    //                         )
                    //                       : Container();
                    //                 }
                    //               }),
                    //         );
                    //       }
                    //       return Container();
                    //     }),
                    SizedBox(
                      height: 20,
                    ),
                    HeaderWidget('Open Restaurants'),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => SizedBox(
                              width: 30,
                            ),
                        scrollDirection: Axis.vertical,
                        itemCount: restaurants.length + 1,
                        itemBuilder: (context, index) {
                          if (index < restaurants.length) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: RestaurantItemWidget(
                                item: restaurants[index],
                              ),
                            );
                          } else {
                            return isLoading
                                ? const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : Container();
                          }
                        })
                  ],
                ),
              ),
            ),
          ));
    });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/controller/dish_controller.dart';
import 'package:food_delivery_app/controller/option_controller.dart';
import 'package:food_delivery_app/data/model/cartItem/cart_item.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/groupOption.dart/group_option.dart';
import 'package:food_delivery_app/data/model/imageFinder/image_finder.dart';
import 'package:food_delivery_app/data/model/recommendedDish/recommended_dish.dart';
import 'package:food_delivery_app/pages/food/widgets/edit_widget.dart';
import 'package:food_delivery_app/pages/food/widgets/ingredient_chart.dart';
import 'package:food_delivery_app/pages/food/widgets/options_layout.dart';
import 'package:food_delivery_app/repository/cart_repository.dart';
import 'package:food_delivery_app/repository/group_option_repository.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailFoodPage extends StatefulWidget {
  const DetailFoodPage({super.key});

  @override
  State<DetailFoodPage> createState() => _DetailFoodPageState();
}

class _DetailFoodPageState extends State<DetailFoodPage> {
  Dish dish = Get.arguments;
  CartRepository cartRepository = Get.find();
  OptionController optionController = Get.find();
  CartController cartController = Get.find();
  DishController dishController = Get.find();
  List<String> sizes = ['S', 'M', "L"];
  int selectedSize = -1;
  GroupOptionRepository groupOptionRepository = Get.find();
  int userId = 0;
  void setUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("userId") ?? 0;
    setState(() {
      userId = id;
    });
  }

  @override
  void initState() {
    setUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(userId);
    double height = MediaQuery.of(context).size.height;
    RecommendedDish? recommendedDish = dishController.recommendedDishes
        .firstWhereOrNull((element) => element.RecipeId == dish.id);
    cartController.updateCartItems(userId, dish.id);

    return Scaffold(
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
          'Detail',
          style: AppStyles.h4,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<String>(
                  future: ImageFinder.getImagesLinks(dish.name),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: height * 1 / 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(snapshot.data!),
                            )),
                      );
                    }
                    return Container();
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Container(
                  decoration: AppStyles.boxOutline,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(AppAssets.restaurant),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'House',
                          style: AppStyles.h4,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                dish.name,
                style: AppStyles.header.copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  dish.description,
                  style: AppStyles.h4.copyWith(color: AppColors.subTextColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Price:',
                          style: AppStyles.h4.copyWith(fontSize: 18)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(dish.price.toStringAsFixed(0),
                          style: AppStyles.h4.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 18))
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(() {
                        return cartController.cartItems.isNotEmpty
                            ? IconButton(
                                onPressed: () async {
                                  if (cartController.cartItems.length > 1) {
                                    Get.bottomSheet(
                                        isScrollControlled: true,
                                        EditWidget(userId: userId, dish: dish));
                                  } else {
                                    CartItem cart = cartController.cartItems[0];
                                    await cartRepository.updateCart(
                                        cart.id, cart.quantity - 1);
                                    cartController.updateCartItems(
                                        userId, dish.id);
                                  }
                                },
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                style: IconButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor),
                              )
                            : Container();
                      }),
                      Obx(() {
                        return cartController.cartItems.isNotEmpty
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  cartController.cartsLength.value.toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              )
                            : Container();
                      }),
                      IconButton(
                        onPressed: () {
                          Get.bottomSheet(
                              isScrollControlled: true,
                              cartController.cartItems.length <= 1
                                  ? StatefulBuilder(
                                      builder: (context, setState) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                            top: 20, bottom: 20),
                                        decoration: BoxDecoration(
                                            color: AppColors.bgButton,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                topLeft: Radius.circular(20))),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Center(
                                                        child: Text(
                                                  'Add new dish',
                                                  style: AppStyles.h4
                                                      .copyWith(fontSize: 18),
                                                ))),
                                                IconButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    icon: Icon(
                                                      Icons.close,
                                                      color: AppColors
                                                          .subTextColor,
                                                    ))
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  FutureBuilder<String>(
                                                      future: ImageFinder
                                                          .getImagesLinks(
                                                              dish.name),
                                                      builder:
                                                          (context, snapshot) {
                                                        if (snapshot.hasData) {
                                                          return Image.network(
                                                            snapshot.data!,
                                                            width: 80,
                                                            height: 80,
                                                            fit: BoxFit.fill,
                                                          );
                                                        }
                                                        return Container();
                                                      }),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 16),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(dish.name,
                                                              style: AppStyles
                                                                  .h4
                                                                  .copyWith(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600)),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                dish.price
                                                                    .toStringAsFixed(
                                                                        0),
                                                                style: AppStyles
                                                                    .h4
                                                                    .copyWith(
                                                                        fontSize:
                                                                            18,
                                                                        color: AppColors
                                                                            .subTextColor),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: 30,
                                                                    height: 30,
                                                                    child:
                                                                        IconButton(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              0.0),
                                                                      iconSize:
                                                                          30,
                                                                      onPressed:
                                                                          () {
                                                                        optionController
                                                                            .removeQuantity();
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .remove,
                                                                        size:
                                                                            18,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      style: IconButton.styleFrom(
                                                                          backgroundColor:
                                                                              AppColors.primaryColor),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                    child:
                                                                        Obx(() {
                                                                      return Text(
                                                                        optionController
                                                                            .quantity
                                                                            .toString(),
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                14),
                                                                      );
                                                                    }),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 30,
                                                                    height: 30,
                                                                    child:
                                                                        IconButton(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              0.0),
                                                                      onPressed:
                                                                          () {
                                                                        optionController
                                                                            .addQuantity();
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .add,
                                                                        size:
                                                                            18,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      style: IconButton.styleFrom(
                                                                          backgroundColor:
                                                                              AppColors.primaryColor),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            FutureBuilder<List<GroupOption>>(
                                                future: groupOptionRepository
                                                    .getOptionsByDish(dish.id),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    return ListView.separated(
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return OptionsLayout(
                                                              item: snapshot
                                                                      .data![
                                                                  index]);
                                                        },
                                                        separatorBuilder:
                                                            (context, index) {
                                                          return SizedBox(
                                                            height: 10,
                                                          );
                                                        },
                                                        itemCount: snapshot
                                                            .data!.length);
                                                  }
                                                  return Container();
                                                }),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              width: double.infinity,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 16),
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    addToCartHandler(
                                                        optionController
                                                            .listChecked,
                                                        optionController
                                                            .quantity.value);
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 12),
                                                    child: Text(
                                                      'Add To Card',
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(AppColors
                                                                  .primaryColor),
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )))),
                                            )
                                          ],
                                        ),
                                      );
                                    })
                                  : EditWidget(
                                      dish: dish,
                                      userId: userId,
                                    ));
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        style: IconButton.styleFrom(
                            backgroundColor: AppColors.primaryColor),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              recommendedDish != null
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Nutritional values:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        IngredientChart(
                          dish: recommendedDish,
                        ),
                      ],
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  void addToCartHandler(List<Map<String, dynamic>> data, int quantity) async {
    double subTotalPrice = 0;
    data.forEach((element) {
      for (var item in element["optionItemIds"]) {
        subTotalPrice += item["price"];
      }
    });
    double total = (subTotalPrice + dish.price);
    var itemGroupOptions = data
        .map((e) => {
              "group_option_id": e["optionId"],
              "item_options": e["optionItemIds"]
                  .map((item) => {"option_item_id": item["id"], "quantity": 1})
                  .toList(),
              "sub_total_price": subTotalPrice
            })
        .toList();
    List<int> addedOptionItemIds = [];
    data.forEach((element) {
      element["optionItemIds"].forEach((item) {
        addedOptionItemIds.add(item["id"]);
      });
    });

    Map<String, dynamic> cartData = {
      "dish_id": dish.id,
      "user_id": userId,
      "item_group_options": itemGroupOptions,
      "quantity": quantity,
      "total": total
    };
    List<CartItem> cartItems = cartController.cartItems;

    CartItem? existCartItem;
    cartItems.forEach((element) {
      List<int> optionItemIds = [];
      element.itemCartGroupOptions.forEach((option) {
        option.cartItemOptions.forEach((optionItem) {
          optionItemIds.add(optionItem.optionItem!.id);
        });
      });

      Function eq = const ListEquality().equals;
      if (eq(optionItemIds, addedOptionItemIds)) {
        existCartItem = element;
      }
    });
    if (existCartItem != null) {
      print(quantity);
      print(existCartItem);
      await cartRepository.updateCart(
          existCartItem!.id, existCartItem!.quantity + quantity);
    } else {
      await cartRepository.addToCart(cartData);
    }
    cartController.updateCartItems(userId, dish.id);
    optionController.resetChecked();
    Get.back();
  }
}

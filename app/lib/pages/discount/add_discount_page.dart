import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/data/model/discountRequest/discount_request.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/repository/discount_repository.dart';
import 'package:food_delivery_app/repository/dish_repository.dart';
import 'package:food_delivery_app/repository/restaurant_repository.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class AddDiscountPage extends StatefulWidget {
  const AddDiscountPage({super.key});

  @override
  State<AddDiscountPage> createState() => _AddDiscountPageState();
}

class _AddDiscountPageState extends State<AddDiscountPage> {
  int restaurantId = -1;
  int dishId = -1;
  DiscountRequest discountRequest =
      DiscountRequest(validFrom: DateTime.now(), validTo: DateTime.now());

  TextEditingController nameController = TextEditingController();
  TextEditingController conditionsController = TextEditingController();
  TextEditingController discountValueController = TextEditingController();
  TextEditingController discountTypeController = TextEditingController();
  TextEditingController discountUnitController = TextEditingController();
  TextEditingController couponCodeController = TextEditingController();
  TextEditingController minimumOrderValueController = TextEditingController();
  TextEditingController maximumOrderValueController = TextEditingController();
  TextEditingController maximumDiscountValueController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    RestaurantRepository restaurantRepository = Get.find();
    DishRepository dishRepository = Get.find();
    DiscountRepository discountRepository = Get.find();
    List<DateTime?> _dates = [null, null];
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Discount'),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            style: IconButton.styleFrom(
              backgroundColor: AppColors.backgroundColor,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  'Please choose a restaurant',
                  style: AppStyles.h4,
                ),
              ),
              FutureBuilder<List<Restaurant>>(
                  future: restaurantRepository.findByOwner(2),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Restaurant> _options = snapshot.data!;
                      return Autocomplete<Restaurant>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text.isEmpty) {
                            return const Iterable<Restaurant>.empty();
                          }
                          return _options.where((Restaurant option) {
                            return option.name
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase());
                          });
                        },
                        onSelected: (Restaurant selection) {
                          setState(() {
                            restaurantId = selection.id;
                          });
                        },
                        displayStringForOption: (Restaurant option) =>
                            option.name,
                        fieldViewBuilder: (BuildContext context,
                            TextEditingController textEditingController,
                            FocusNode focusNode,
                            VoidCallback onFieldSubmitted) {
                          return TextField(
                            controller: textEditingController,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              hintText: 'Search for a restaurant',
                              border: OutlineInputBorder(),
                            ),
                          );
                        },
                        optionsViewBuilder: (BuildContext context,
                            AutocompleteOnSelected<Restaurant> onSelected,
                            Iterable<Restaurant> options) {
                          return Align(
                            alignment: Alignment.topLeft,
                            child: Material(
                              elevation: 4.0,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: ListView.builder(
                                  padding: EdgeInsets.all(8.0),
                                  itemCount: options.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final Restaurant option =
                                        options.elementAt(index);
                                    return GestureDetector(
                                      onTap: () {
                                        onSelected(option);
                                      },
                                      child: ListTile(
                                        title: Text(option.name),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  }),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  'Please choose a dish',
                  style: AppStyles.h4,
                ),
              ),
              FutureBuilder<List<Dish>>(
                  future: dishRepository.getByRestaurantId(8),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                    }
                    if (snapshot.hasData) {
                      List<Dish> _options = snapshot.data!;

                      return Autocomplete<Dish>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text.isEmpty) {
                            return const Iterable<Dish>.empty();
                          }
                          return _options.where((Dish option) {
                            return option.name
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase());
                          });
                        },
                        onSelected: (Dish selection) {
                          setState(() {
                            dishId = selection.id;
                          });
                        },
                        fieldViewBuilder: (BuildContext context,
                            TextEditingController textEditingController,
                            FocusNode focusNode,
                            VoidCallback onFieldSubmitted) {
                          return TextField(
                            controller: textEditingController,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              hintText: 'Search for a dish',
                              border: OutlineInputBorder(),
                            ),
                          );
                        },
                        displayStringForOption: (Dish option) => option.name,
                        optionsViewBuilder: (BuildContext context,
                            AutocompleteOnSelected<Dish> onSelected,
                            Iterable<Dish> options) {
                          return Align(
                            alignment: Alignment.topLeft,
                            child: Material(
                              elevation: 4.0,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: ListView.builder(
                                  padding: EdgeInsets.all(8.0),
                                  itemCount: options.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final Dish option =
                                        options.elementAt(index);
                                    return GestureDetector(
                                      onTap: () {
                                        onSelected(option);
                                      },
                                      child: ListTile(
                                        title: Text(option.name),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  }),
              SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Discount Name',
                  hintText: 'Enter discount name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: couponCodeController,
                decoration: InputDecoration(
                  labelText: 'Discount code',
                  hintText: 'Enter discount code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: conditionsController,
                decoration: InputDecoration(
                  labelText: 'Conditions',
                  hintText: 'Enter conditions',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: discountValueController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Discount Amount',
                  hintText: 'Enter discount amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: discountTypeController,
                decoration: InputDecoration(
                  labelText: 'Discount Type',
                  hintText: 'Enter discount type',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: discountUnitController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Discount Unit',
                  hintText: 'Enter discount unit',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: minimumOrderValueController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Minimum Order Amount',
                  hintText: 'Enter minimum order amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: maximumDiscountValueController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Maximum Discount Value',
                  hintText: 'Enter maximum discount value',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Enter the start date and end date',
                style: AppStyles.h4,
              ),
              CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.range,
                ),
                value: _dates,
                onValueChanged: (dates) => _dates = dates,
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      DiscountRequest discountRequest = DiscountRequest(
                          name: nameController.text,
                          conditions: conditionsController.text,
                          discountValue:
                              double.parse(discountValueController.text),
                          discountType: discountTypeController.text,
                          discountUnit: int.parse(discountUnitController.text),
                          couponCode: couponCodeController.text,
                          minimumOrderValue:
                              double.parse(minimumOrderValueController.text),
                          maximumDiscountValue:
                              double.parse(maximumDiscountValueController.text),
                          validFrom: _dates[0]!,
                          validTo: _dates[1]!,
                          dishId: dishId,
                          restaurantId: restaurantId);
                      discountRepository.createDiscount(discountRequest);
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Create discount',
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.primaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

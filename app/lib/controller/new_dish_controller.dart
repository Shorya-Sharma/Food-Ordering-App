import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/data/request/dish_request/dish_request.dart';
import 'package:food_delivery_app/repository/image_storage_repository.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/category/category.dart';
import '../repository/dish_repository.dart';

class NewDishController extends GetxController {
  Rxn<File> imageFile = Rxn<File>(null);
  Rxn<File> categoryImageFile = Rxn<File>(null);
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool newState) {
    _isLoading.value = newState;
  }
  int restaurantId = Get.arguments['restaurantId'];
  Rx<List<Category>> categories = Rx<List<Category>>([]);
  TextEditingController dishName = TextEditingController();
  TextEditingController dishDescription = TextEditingController();
  TextEditingController dishPrice = TextEditingController();
  TextEditingController dishCategory = TextEditingController();
  final formDishKey = GlobalKey<FormState>();
  ImageStorageRepository imageStorageRepository;
  DishRepository dishRepository;
  NewDishController(
      {required this.imageStorageRepository, required this.dishRepository});
  int? selectedCategory;
  final ImagePicker _picker = ImagePicker();
  void avatarFromGallery() async {
    final pickedImages = await _picker.pickMultiImage();
    for (int i = 0; i < pickedImages.length; i++) {
      imageFile.value = File(pickedImages[i].path);
    }
  }

  void avatarFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imageFile.value = File(image.path);
    }
  }

  Future<List<String>> uploadDishImage() async {
    return await imageStorageRepository
        .uploadImages([imageFile.value!], "dish");
  }
  Future<int> getRestaurantId() async {
    final sharedPreference = await SharedPreferences.getInstance();
    int? restaurantId =  sharedPreference.getInt("restaurantId");
    if(restaurantId == null) throw Exception("Restaurant id not found");
    return restaurantId;
  }
  void getCategories() {
    // get categories from database
    dishRepository.getCategories(restaurantId).then((value) {
      categories.value = value;
      print(value);
    }).catchError((err) {
      print("Error when get categories" + err.toString());
    });
  }

  void createDish() {
    try {
      formDishKey.currentState!.validate();
      print(selectedCategory);
      if (imageFile.value != null && formDishKey.currentState!.validate()) {
        uploadDishImage().then((value) {
          isLoading = true;
          DishRequest dishRequest = DishRequest(
              name: dishName.text,
              price: double.parse(dishPrice.text),
              imageUrl: value[0],
              restaurantId: restaurantId,
              categoryId: selectedCategory!,
              dishTypeId: 1,
              description: dishDescription.text);
          dishRepository.addNewDish(dishRequest).then((value) {
            // Get.snackbar("Success", "Create dish successfully").show();
            isLoading = false;
            Get.back(result: true);
          }).catchError(
              (err) {
                isLoading = false;
                Get.snackbar("Error", "Error when create dish");
              }
          );
        });
      } else {
        isLoading = false;
        Get.snackbar("Error", "Please select food image");
      }
    } catch (err) {
      print("Error when create dish" + err.toString());
      isLoading = false;
      Get.snackbar("Error", "Error when create dish");
    }
  }
}

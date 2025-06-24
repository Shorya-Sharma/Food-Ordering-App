import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/repository/province_repository.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../data/model/category/category.dart';
import '../data/request/address_request/address_request.dart';
import '../data/request/category_request/category_request.dart';
import '../data/request/restaurant_request/restaurant_request.dart';
import '../repository/category_repository.dart';
import '../repository/image_storage_repository.dart';
import '../repository/restaurant_repository.dart';

class NewRestaurantController extends GetxController {
  final ProvinceRepository provinceRepository;
  final RestaurantRepository restaurantRepository;
  final ImageStorageRepository imageStorageRepository;
  final CategoryRepository categoryRepository;
  NewRestaurantController(
      {required this.categoryRepository, required this.imageStorageRepository,
      required this.provinceRepository,
      required this.restaurantRepository});
  final TextEditingController restaurantName = TextEditingController();
  final TextEditingController restaurantDescription = TextEditingController();
  final TextEditingController restaurantAddress = TextEditingController();
  final TextEditingController mainDish = TextEditingController();
  final TextEditingController categoryRequest = TextEditingController();


  final ImagePicker _picker = ImagePicker();
  final RxList<File> photo = <File>[].obs;
  final Rx<File?> avatar = Rx<File?>(null);
  final Rx<File?> cover = Rx<File?>(null);
  final Rx<File?> menu = Rx<File?>(null);
  int userId = Get.arguments;
  RxList<CategoryRequest> categories = <CategoryRequest>[].obs;
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool newState) {
    _isLoading.value = newState;
  }

  String? restaurantType;
  final formRestaurantKey = GlobalKey<FormState>();

  void imageFromGallery() async {
    final pickedImages = await _picker.pickMultiImage();
    for (int i = 0; i < pickedImages.length; i++) {
      photo.add(File(pickedImages[i].path));
    }
  }

  void imageFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      photo.add(File(image.path));
    }
  }

  void avatarFromGallery() async {
    final pickedImages = await _picker.pickMultiImage();
    for (int i = 0; i < pickedImages.length; i++) {
      avatar.value = File(pickedImages[i].path);
    }
  }

  void avatarFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      avatar.value = File(image.path);
    }
  }

  void menuFromGallery() async {
    final pickedImages = await _picker.pickMultiImage();
    for (int i = 0; i < pickedImages.length; i++) {
      menu.value = File(pickedImages[i].path);
    }
  }

  void menuFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      menu.value = File(image.path);
    }
  }

  void coverFromGallery() async {
    final pickedImages = await _picker.pickMultiImage();
    for (int i = 0; i < pickedImages.length; i++) {
      cover.value = File(pickedImages[i].path);
    }
  }

  void coverFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      cover.value = File(image.path);
    }
  }

  void createAddress() {
    restaurantAddress.text =
        '${selectedWard.value}, ${selectedDistrict.value}, ${selectedProvince.value}';
    print('Create address');
  }

  int provinceCode = 0;
  int districtCode = 0;
  int wardCode = 0;

  Rxn<String> selectedProvince = Rxn(null);
  Rxn<String> selectedDistrict = Rxn(null);
  Rxn<String> selectedWard = Rxn(null);
  RxList<Map<String, dynamic>> provinceNames = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> districtNames = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> wardNames = <Map<String, dynamic>>[].obs;

  void getProvinceNames() async {
    provinceNames.value = await provinceRepository.getProvinces();
    print(provinceNames.toString());
  }

  void getDistrictNames() async {
    selectedDistrict.value = null;
    districtNames.clear();
    districtNames.value = await provinceRepository.getDistricts(provinceCode);
    districtCode = 0;
    wardCode = 0;
    print(districtNames.toString());
  }

  void getWardNames() async {
    selectedWard.value = null;
    wardNames.clear();
    wardNames.value = await provinceRepository.getWards(districtCode);
    wardCode = 0;
    print(wardNames.toString());
  }

  void changeSelectedDistrict(String value) {
    selectedDistrict.value = value;
    for (Map<String, dynamic> district in districtNames) {
      if ((district['name'] as String).contains(value)) {
        districtCode = district['id'] as int;
        break;
      }
    }
    getWardNames();
  }

  void changeSelectedWard(String value) {
    selectedWard.value = value;
    for (Map<String, dynamic> ward in wardNames) {
      if ((ward['name'] as String).contains(value)) {
        wardCode = ward['id'] as int;
        break;
      }
    }
  }
  Future<void> addCategoryRequest() async{
    if(categoryRequest.text.isNotEmpty && menu.value != null){
      List<String> images =await imageStorageRepository.uploadImages([menu.value!], "restaurant");
      if(images.isNotEmpty){
        categories.add(CategoryRequest(name: categoryRequest.text, imageUrl: images[0]));
        categoryRequest.clear();
        menu.value = null;
      }
      else {
        Get.snackbar("Error", "Error when upload CategoryRequest image");
      }
    }
  }
  void changeSelectedProvince(String value) {
    selectedProvince.value = value;
    // search in provinceNames to get provinceCode
    for (Map<String, dynamic> province in provinceNames) {
      if ((province['name'] as String).contains(value)) {
        provinceCode = province['id'] as int;
        break;
      }
    }
    getDistrictNames();
  }

  List<String> resultPhoto = [];
  List<String> resultAvatar = [];
  List<String> resultMenu = [];
  List<String> resultCover = [];
  Future<bool> uploadRestaurantImages() async {
    try {
      List<Future<List<String>>> uploadFutures = [
        photo.isNotEmpty
            ? imageStorageRepository.uploadImages(photo, "restaurant")
            : Future.value([]),
        (avatar.value != null
            ? imageStorageRepository.uploadImages([avatar.value!], "restaurant")
            : Future.value([])),
        menu.value != null
            ? imageStorageRepository.uploadImages([menu.value!], "restaurant")
            : Future.value([]),
        cover.value != null
            ? imageStorageRepository.uploadImages([cover.value!], "restaurant")
            : Future.value([]),
      ];

      List<List<String>> results = await Future.wait(uploadFutures);
      resultPhoto = results[0];
      resultAvatar = results[1];
      resultMenu = results[2];
      resultCover = results[3];
      return true;
    } catch (err) {
      print("Error when upload images" + err.toString());
      return false;
    }
  }

  void createRestaurant() {
    try {
      formRestaurantKey.currentState!.validate();
      if (avatar.value != null && formRestaurantKey.currentState!.validate()) {
        isLoading = true;
        uploadRestaurantImages().then((value) {
          RestaurantRequest restaurantRequest = RestaurantRequest(
            name: restaurantName.text,
            description: restaurantDescription.text,
            mainDish: mainDish.text,
            imageUrl: resultAvatar.isNotEmpty ? resultAvatar[0] : "",
            coverImageUrl: resultCover.isNotEmpty ? resultCover[0] : "",
            menuImageUrl: resultMenu.isNotEmpty ? resultMenu[0] : "",
            photoUrls: resultPhoto.isNotEmpty ? resultPhoto.toString() : "",
            restaurantType: restaurantType!,
            ownerId: userId,
            addressRequest: AddressRequest(
                address: restaurantAddress.text,
                provinceCode: provinceCode,
                districtCode: districtCode,
                wardCode: wardCode),
          );
          restaurantRepository
              .createRestaurant(restaurantRequest)
              .then((value) {
                if(categories.isNotEmpty){
                var newCategories = categories.map((element) => element.copyWith(restaurant_id: value.id)).toList();
                categoryRepository.addCategories(newCategories).then((value) {
                  if (value.isNotEmpty) {
                    Get.back(result: true);
                    isLoading = false;
                  } else {
                    Get.snackbar("Error", "Error when create categories");
                    isLoading = false;
                  }
                });
                }
                else{
                  Get.back(result: true);
                  isLoading = false;
                }
          });
        });
      } else {
        Get.snackbar("Error", "Please select restaurant image");
        isLoading = false;
      }
    } catch (err) {
      print("Error when create dish" + err.toString());
      Get.snackbar("Error", "Error when create dish");
      isLoading = false;
    }
  }
}

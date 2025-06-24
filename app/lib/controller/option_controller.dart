import 'package:food_delivery_app/repository/cart_repository.dart';
import 'package:get/get.dart';

class OptionController extends GetxController {
  RxList<Map<String, dynamic>> listChecked = <Map<String, dynamic>>[].obs;
  CartRepository cartRepository = Get.find();
  RxInt quantity = 1.obs;
  void addQuantity() {
    quantity++;
  }

  void setQuantity(int number) {
    quantity.value = number;
  }

  void removeQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  void addChecked(int optionId, Map<String, dynamic> optionItemId) {
    int index =
        listChecked.indexWhere((element) => element["optionId"] == optionId);

    if (index != -1) {
      // If optionId already exists in the list
      Map<String, dynamic> updatedOption =
          Map<String, dynamic>.from(listChecked[index]);
      updatedOption["optionItemIds"].add(optionItemId);
      listChecked[index] = updatedOption;
    } else {
      listChecked.add({
        "optionId": optionId,
        "optionItemIds": [optionItemId]
      });
      print(listChecked);
    }
  }

  void resetChecked() {
    quantity.value = 1;
    listChecked = <Map<String, dynamic>>[].obs;
  }

  void removeChecked(int optionId, Map<String, dynamic> optionItemId) {
    int index =
        listChecked.indexWhere((element) => element["optionId"] == optionId);

    if (index != -1) {
      Map<String, dynamic> updatedOption =
          Map<String, dynamic>.from(listChecked[index]);
      updatedOption["optionItemIds"].removeWhere((element) =>
          element["id"] == optionItemId["id"] &&
          element["price"] == optionItemId["price"]);
      if (updatedOption["optionItemIds"].length > 0) {
        listChecked[index] = updatedOption;
      } else {
        listChecked.removeAt(index);
      }
    }
  }

  bool isOptionExist(int optionId) {
    for (var element in listChecked) {
      if (element["optionId"] == optionId) {
        return true;
      }
    }
    return false;
  }
}

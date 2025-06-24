import 'package:get/get.dart';

class InformationController extends GetxController {
  RxInt age = 0.obs;
  RxInt weight = 30.obs;
  RxInt height = 0.obs;
  RxString weightLoss = "".obs;
  RxString activity = "".obs;
  RxString gender = "".obs;
  void setAge(int value) {
    age.value = value;
  }

  void setActivity(String value) {
    activity.value = value;
  }

  void setWeight(int value) {
    weight.value = value;
  }

  void setHeight(int value) {
    height.value = value;
  }

  void setWeightLoss(String value) {
    weightLoss.value = value;
  }

  void setGender(String value) {
    gender.value = value;
  }
}

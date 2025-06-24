import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  bool _isLastPage = false;
  bool get isLastPage => _isLastPage;
  set isLastPage(bool lastpage) {
    _isLastPage = lastpage;
    update();
  }
}

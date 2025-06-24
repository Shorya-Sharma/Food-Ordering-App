import 'package:get/get.dart';

class User extends GetxController {
  String name;
  String? email;
  String phoneNumber;
  User({required this.name, this.email, required this.phoneNumber});
}

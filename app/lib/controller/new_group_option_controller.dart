import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/model/group_option/group_option.dart';

class NewGroupOptionController extends GetxController {
  final TextEditingController optionNameController = TextEditingController();
  final List<GroupOptionItem> optionItems = <GroupOptionItem>[].obs;

  void addOptionItem(double price, String description, String name) {
    final newItem = GroupOptionItem(
      id: optionItems.length + 1,
      price: price,
      description: description,
      name: name,
    );
    optionItems.add(newItem);
  }

  void submit() {
    // Handle form submission here
    final groupName = optionNameController.text;
    final newOption = GroupOption(id: 1, name: groupName, items: optionItems);
    print(newOption.name);
    optionItems.forEach((item) {
      print(item.name);
    });
  }
}

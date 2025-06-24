import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/new_group_option_controller.dart';

class NewGroupOptionPage extends StatelessWidget {
  final NewGroupOptionController controller = Get.put(NewGroupOptionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Group Option'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.optionNameController,
              decoration: InputDecoration(labelText: 'Group Option Name'),
            ),
            SizedBox(height: 20),
            Text('Group Option Items', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: controller.optionItems.length,
                itemBuilder: (context, index) {
                  final item = controller.optionItems[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('Price: \$${item.price.toString()}'),
                    onTap: () {
                      // Add functionality to edit or delete item
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showNewItemDialog(context);
              },
              child: Text('Add Item'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.submit();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _showNewItemDialog(BuildContext context) {
    final priceController = TextEditingController();
    final descriptionController = TextEditingController();
    final nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                controller.addOptionItem(
                  double.parse(priceController.text),
                  descriptionController.text,
                  nameController.text
                );
                Get.back();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

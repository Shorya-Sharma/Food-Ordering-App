import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/data/model/Order/order.dart';
import 'package:food_delivery_app/pages/my_order/tracking_order_page.dart';
import 'package:food_delivery_app/repository/order_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/order_item.dart';

class Ongoing extends StatefulWidget {
  const Ongoing({super.key});

  @override
  State<Ongoing> createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> {
  OrderRepository orderRepository = Get.find();
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
    return Container(
      child: FutureBuilder<List<Order>>(
          future: orderRepository.getByUser(userId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            if (snapshot.hasData) {
              List<Order> data = snapshot.data!
                  .where((element) =>
                      element.deliveryStatus == 'PENDING' ||
                      element.deliveryStatus == 'DELIVERING')
                  .toList();
              return ListView.separated(
                  itemBuilder: (context, index) => OrderItem(
                        order: data[index],
                        firstLabel: 'Track Order',
                        secondLabel: 'Cancel',
                        onFirstTap: () {},
                        onSecondTap: () {},
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: data.length);
            }
            return Container();
          }),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/data/model/Order/order.dart';
import 'package:food_delivery_app/repository/order_repository.dart';
import 'package:get/get.dart';

import '../widgets/order_item.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  OrderRepository orderRepository = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Order>>(
          future: orderRepository.getByUser(5),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Order> data = snapshot.data!
                  .where((element) =>
                      element.deliveryStatus == 'DELIVERED' ||
                      element.deliveryStatus == 'CANCELED')
                  .toList();
              return ListView.separated(
                  itemBuilder: (context, index) => OrderItem(
                        order: data[index],
                        firstLabel: 'Rate',
                        secondLabel: 'Re-Order',
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

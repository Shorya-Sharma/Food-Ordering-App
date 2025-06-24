import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/data/model/orderLineItem/order_line_item.dart';
import 'package:food_delivery_app/values/app_styles.dart';

class OrderDetailItem extends StatelessWidget {
  const OrderDetailItem({super.key, required this.item});
  final OrderLineItem item;
  //row: a name dish
  //row: image, name, price, quantity, total price
  //row: details
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                item.dish?.name ?? '',
                style: AppStyles.roboto14semiBold,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(item.dish?.imageUrl ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.dish?.description ?? '',
                      style: AppStyles.roboto12regular,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${item.quantity} x ${item.dish?.price}',
                      style: AppStyles.roboto12regular,
                    ),
                  ],
                ),
              ),
              Text(
                '\$${item.quantity * item.dish!.price}',
                style: AppStyles.roboto12semiBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

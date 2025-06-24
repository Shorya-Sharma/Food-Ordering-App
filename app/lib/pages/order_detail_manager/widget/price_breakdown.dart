import 'package:flutter/cupertino.dart';

import '../../../values/app_styles.dart';

class PriceBreakdown extends StatelessWidget {
  final String title;
  final String price;

  const PriceBreakdown({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyles.roboto16regular,
        ),
        Spacer(),
        Text(
          price,
          style: AppStyles.roboto16semiBold,
        ),
      ],
    );
  }
}

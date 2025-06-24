import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app/data/model/review/review.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:intl/intl.dart';

class ReviewItem extends StatelessWidget {
  final Review item;

  const ReviewItem({super.key, required this.item});

  Color getRatingBackgroundColor(double rate) {
    if (rate == 1) {
      return Colors.redAccent;
    } else if (rate == 2) {
      return Colors.orangeAccent;
    } else if (rate == 3) {
      return Colors.yellowAccent;
    } else if (rate == 4) {
      return Colors.lightGreenAccent;
    } else if (rate == 5) {
      return Colors.greenAccent;
    } else {
      return Colors.grey; // Default color
    }
  }

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: item.users != null && item.users!.avatarUrl.isNotEmpty
                  ? NetworkImage(
                      item.users!.avatarUrl,
                    )
                  : AssetImage(AppAssets.avatar) as ImageProvider,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.black12.withOpacity(0.02),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.users != null ? item.users!.fullname : "",
                          style: AppStyles.roboto14semiBold),
                      Text(
                        dateFormat.format(item.created_at),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  RatingBar.builder(
                    initialRating: item.rate,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (value) {},
                    ignoreGestures: true,
                    itemSize: 12,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    item.comment,
                    style: AppStyles.roboto16regular,
                  ),
                ],
              )),
        )
      ],
    );
  }
}

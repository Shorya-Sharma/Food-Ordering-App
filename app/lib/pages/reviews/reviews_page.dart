import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/model/review/review.dart';
import 'package:food_delivery_app/pages/reviews/widgets/reviews_item.dart';
import 'package:food_delivery_app/resources/widgets/back_button_widget.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  TextEditingController commentController = TextEditingController();
  final supabase = Supabase.instance.client;
  double rating = 3;
  @override
  Widget build(BuildContext context) {
    final reviewStream = supabase.from('reviews').stream(primaryKey: ['id']);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Reviews'),
          leading: BackButtonWidget(
            () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(20),
            //
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              StreamBuilder<List<Map<String, dynamic>>>(
                  stream: reviewStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    else if (snapshot.hasData) {
                      return ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => ReviewItem(
                              item: Review.fromJson(snapshot.data![index])),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 20,
                              ),
                          itemCount: snapshot.data!.length);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Container();
                  })
            ]),
          ),
        ));
  }
}

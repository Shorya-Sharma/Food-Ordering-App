import 'package:flutter/cupertino.dart';

import '../../data/model/dishType/dish_type.dart';
import '../../resources/widgets/categories_item_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key, required this.dishTypes});

  final Future<List<DishType>> dishTypes;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dishTypes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            print(snapshot.data);
            return Container(
              height: 64,
              child: ListView.separated(
                clipBehavior: Clip.none,
                separatorBuilder: (context, index) => SizedBox(
                  width: 30,
                ),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CategoryItemWidget(item: snapshot.data![index]);
                },
              ),
            );
          }
        });
  }
}

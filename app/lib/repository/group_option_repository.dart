import 'package:food_delivery_app/common/repository/repository_helper.dart';
import 'package:food_delivery_app/data/api/groupOption/group_option_api.dart';
import 'package:food_delivery_app/data/model/groupOption.dart/group_option.dart';
import '../data/api/dish/dish_api.dart';

class GroupOptionRepository with RepositoryHelper<GroupOption> {
  final GroupOptionApi groupOptionApi;

  const GroupOptionRepository({required this.groupOptionApi});

  Future<List<GroupOption>> getOptionsByDish(int dishId) async {
    return groupOptionApi.getGroupOptionsOfDish(dishId);
  }
}

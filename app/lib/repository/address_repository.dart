import 'package:dartz/dartz.dart';
import 'package:food_delivery_app/common/repository/repository_helper.dart';
import 'package:food_delivery_app/data/api/address/address_api.dart';
import 'package:food_delivery_app/data/api/order/order_api.dart';
import 'package:food_delivery_app/data/model/Order/order.dart' as orderModel;
import 'package:food_delivery_app/data/model/address/address.dart';

class AddressRepository with RepositoryHelper<Address> {
  final AddressApi addressApi;

  const AddressRepository({required this.addressApi});

  Future<Either<String, bool>> addAddress(Map<String, dynamic> address) async {
    return checkItemFailOrSuccess(addressApi.addAddress(address));
  }

  Future<List<Address>> getAll(int userId) async {
    return addressApi.getAll(userId);
  }
}

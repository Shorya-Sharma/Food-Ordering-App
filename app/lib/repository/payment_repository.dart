import 'package:food_delivery_app/models/create_order_response.dart';
import 'package:food_delivery_app/resources/utils/endpoints.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:food_delivery_app/resources/utils/util.dart' as utils;
import 'package:sprintf/sprintf.dart';

class ZaloPayRepository {
  static const String appId = "554";
  static const String key1 = "8NdU5pG5R2spGHGhyO99HN1OhD8IQJBn";
  static const String key2 = "uUfsWgfLkRLzq6W2uNXTCxrfxs51auny";

  static const String appUser = "zalopaydemo";
  static int transIdDefault = 1;
}

Future<CreateOrderResponse?> createOrder(int price) async {
  var header = new Map<String, String>();
  header["Content-Type"] = "application/x-www-form-urlencoded";

  var body = new Map<String, String>();
  body["app_id"] = ZaloPayRepository.appId;
  body["app_user"] = ZaloPayRepository.appUser;
  body["app_time"] = DateTime.now().millisecondsSinceEpoch.toString();
  body["amount"] = price.toStringAsFixed(0);
  body["app_trans_id"] = utils.getAppTransId();
  body["embed_data"] = "{}";
  body["item"] = "[]";
  body["bank_code"] = utils.getBankCode();
  body["description"] = utils.getDescription(body["app_trans_id"] ?? '');

  var dataGetMac = sprintf("%s|%s|%s|%s|%s|%s|%s", [
    body["app_id"],
    body["app_trans_id"],
    body["app_user"],
    body["amount"],
    body["app_time"],
    body["embed_data"],
    body["item"]
  ]);
  body["mac"] = utils.getMacCreateOrder(dataGetMac);

  try {
    http.Response response = await http.post(
      Uri.parse(Uri.encodeFull(Endpoints.createOrderUrl)),
      headers: header,
      body: body,
    );

    print("body_request: $body");
    if (response.statusCode != 200) {
      return null;
    }

    var data = jsonDecode(response.body);
    print("data_response: $data}");

    return CreateOrderResponse.fromJson(data);
  } catch (e) {
    print('binh');
    print(e);
  }
}

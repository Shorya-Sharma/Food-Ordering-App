import 'package:food_delivery_app/data/model/message/message.dart';
import 'package:food_delivery_app/data/model/message/message_req.dart';

import '../../../common/network/api_helper.dart';
import '../../../common/network/dio_client.dart';
import '../../../values/app_config.dart';

class MessageApi with ApiHelper<Message> {
  final DioClient dioClient;
  MessageApi({required this.dioClient});

  Future<List<Message>> getMessages(int chatId, int offset) async {
    return await makeGetRequest(
        dioClient.dio
            .get("${ApiConfig.message}?offset=$offset&chatId=$chatId&limit=10"),
        Message.fromJson);
  }
  Future<Message> getMessage(int id) async {
    return await makeObjectGetRequest(
        dioClient.dio
            .get("${ApiConfig.message}/$id"),
        Message.fromJson);
  }

  Future<Message> sendMessage(SendMessage sendMessage) async {
    return await makePostObjectRequest(
        dioClient.dio
            .post(ApiConfig.message, data: sendMessageToJson(sendMessage)),
        Message.fromJson);
  }
}

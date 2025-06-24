import 'package:food_delivery_app/data/model/chat/chat.dart';
import 'package:food_delivery_app/values/app_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../common/network/api_helper.dart';
import '../../../common/network/dio_client.dart';
import '../../../common/network/dio_client_2.dart';

class ChatApi with ApiHelper<Chat> {
  final DioClient dioClient;

  ChatApi({required this.dioClient});

  Future<Chat> getChat(String fieldName, int receiverId) async {
    return await makeObjectGetRequest(
        DioClient2.dio.get("${ApiConfig.chat}/?$fieldName=$receiverId"),
        Chat.fromJson);
  }

  //TODO: Implement markedAsRead and deleteChat method
  Future<void> markedAsRead(int chatId) async {
    throw UnimplementedError();
  }

  Future<void> deleteChat(int chatId) async {
    throw UnimplementedError();
  }

  Future<List<Chat>> getChats(int userId) {
    return makeGetRequest(
        DioClient2.dio.get("${ApiConfig.chat}/user/${userId}"), Chat.fromJson);
  }
}

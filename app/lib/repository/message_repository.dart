import 'package:food_delivery_app/common/repository/repository_helper.dart';
import 'package:food_delivery_app/data/api/message/message_api.dart';
import 'package:food_delivery_app/data/model/message/message.dart';
import 'package:food_delivery_app/data/model/message/message_req.dart';

class MessageRepository with RepositoryHelper<Message> {
  final MessageApi messageApi;
  MessageRepository({required this.messageApi});
  Future<List<Message>> getMessages(int chatId, int offset) async {
    return messageApi.getMessages(chatId, offset);
  }
  Future<Message> getMessageById(int id) async {
    return messageApi.getMessage(id);
  }

  Future<Message> sendMessage(SendMessage message) async {
    return messageApi.sendMessage(message);
  }
}

import 'dart:convert';

import '../../enum/enums.dart';

String sendMessageToJson(SendMessage data) => json.encode(data.toJson());

class SendMessage {
  final int chatId;
  final String message;
  final int senderId;
  final MessageType type;

  SendMessage(
      {required this.chatId,
      required this.message,
      required this.senderId,
      this.type = MessageType.text});

  Map<String, dynamic> toJson() => {
        "chat_id": chatId,
        "message": message,
        "sender_id": senderId,
        "type": type.toString(),
      };
}

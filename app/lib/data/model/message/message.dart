import 'package:food_delivery_app/data/model/user/user.dart';

import '../../enum/enums.dart';

class Message {
  int id;
  User sender;
  String? message;
  List<String>? images;
  String? postID;
  DateTime sentAt;
  bool isMine;
  List<User> readBy;
  MessageType type;

  Message({
    required this.id,
    required this.message,
    required this.images,
    required this.postID,
    required this.sentAt,
    required this.isMine,
    required this.type,
    required this.readBy,
    required this.sender,
  }) : assert(id > 0);

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        id: json['id'],
        sender: User.fromJson(json['sender']),
        message: json['message'],
        images:
            json['images'] != null ? List<String>.from(json['images']) : null,
        postID: json['post_id'],
        sentAt: DateTime.parse(json['sendAt']),
        isMine: true,
        readBy: json['read_by'] != null
            ? List<User>.from(json['read_by'].map((x) => User.fromJson(x)))
            : [],
        type: MessageType.parse(json['message_type'] ?? 'text'));
  }

  @override
  String toString() {
    return 'Message(id: $id, senderID: ${sender.id}, text: $message, images: $images, postId: $postID, sentAt: $sentAt, readBy: $readBy, type: $type)';
  }
}

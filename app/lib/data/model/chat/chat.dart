import 'package:food_delivery_app/data/model/user/user.dart';

import '../message/message.dart';

class Chat {
  final int id;
  final List<User> users;
  final DateTime createdTime;
  final Message? lastMessage;
  final int numOfUnReadMessage;
  Chat({
    required this.id,
    required this.users,
    required this.createdTime,
    required this.lastMessage,
    required this.numOfUnReadMessage,
  });
  factory Chat.fromJson(Map<String, dynamic> json) {
    var userList = json['users'] as List;
    List<User> usersList = userList.map((i) => User.fromJson(i)).toList();

    return Chat(
      id: json['id'],
      users: usersList,
      createdTime: DateTime.parse(json['createdTime']),
      lastMessage: json['lastMessage'] != null ? Message.fromJson(json['lastMessage']): null,
      numOfUnReadMessage: json['numOfUnReadMessage'] != null ? json['numOfUnReadMessage'] : 0,
    );
  }
}

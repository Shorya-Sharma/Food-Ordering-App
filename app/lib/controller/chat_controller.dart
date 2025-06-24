import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/data/model/message/message.dart';
import 'package:food_delivery_app/data/model/message/message_req.dart';
import 'package:food_delivery_app/repository/message_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/model/chat/chat.dart';
import '../repository/chat_repository.dart';
import '../values/app_config.dart';

class ChatController extends GetxController {
  MessageRepository messageRepository;
  ChatRepository chatRepository;

  ChatController(
      {required this.messageRepository, required this.chatRepository});
  int chatId = 1;
  int receiverId = 3;
  late int userId;
  double offset = 0;
  bool fetchNew = false;
  bool isCanFetch = true;
  bool isCanUpdateScroll = false;
  late final Chat chat;
  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();
  RxList messages = [].obs;
  Rx<Future<List<Message>>> msgList = Future.value(<Message>[]).obs;
  void getChat() {
    chatRepository
        .getChatByReceiverId(receiverId)
        .then((value) => chat = value)
        .catchError((e) {});
  }

  void handleNext() {
    scrollController.addListener(() {
      if (scrollController.hasClients) {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          offset = scrollController.position.pixels;
          if (messages.length >= 10 && isCanFetch) {
            getMessage();
          }
        }
      }
    });
  }

  void getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("userId") ?? 0;
    print(userId);
  }

  void getMessage() {
    print("chat Id $chatId");
    msgList.value = messageRepository.getMessages(chatId, messages.length);
    fetchNew = true;
  }

  void sendMessage(String message) {
    SendMessage sendMessage =
        SendMessage(chatId: chatId, message: message, senderId: userId);
    messageRepository.sendMessage(sendMessage).then((value) {
      textController.clear();
      // messages.insert(0, value);
    });
  }

  void onReceiveMessage(PostgresChangePayload payload) {
    print("message ${payload.newRecord}");
    messageRepository.getMessageById(payload.newRecord['id']).then((value) {
      messages.insert(0, value);
    });
  }

  @override
  Future<void> onInit() async {
    Supabase.instance.client
        .channel('messages')
        .onPostgresChanges(
            event: PostgresChangeEvent.insert,
            schema: 'public',
            filter: PostgresChangeFilter(
              type: PostgresChangeFilterType.eq,
              column: 'chat_id',
              value: chatId,
            ),
            callback: (payload) => onReceiveMessage(payload))
        .subscribe();
    final res = await Supabase.instance.client.from('messages').select();
    print("res $res");
    // stompClient = StompClient(
    //   config: StompConfig(
    //     url: ApiConfig.socketUrl,
    //     webSocketConnectHeaders: {
    //       'Connection': 'upgrade',
    //       'Upgrade': 'websocket',
    //       "token": 'Bearer ${ApiConfig.token}',
    //     },
    //     onConnect: (StompFrame frame) {
    //       print("connect to socket");
    //       stompClient.subscribe(
    //         destination: '/user/hien/messages',
    //         callback: onReceiveMessage,
    //       );
    //     },
    //     onWebSocketError: (dynamic error) => print("error $error"),
    //     onStompError: (d) => print("stomp error"),
    //     onDisconnect: (d) => print("disconnect"),
    //   ),
    // );
    getPrefs();
    getMessage();
    handleNext();
    super.onInit();
  }
}

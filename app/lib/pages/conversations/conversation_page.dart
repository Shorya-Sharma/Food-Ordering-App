import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/model/chat/chat.dart';
import 'package:food_delivery_app/pages/conversations/widgets/conversation_item.dart';
import 'package:food_delivery_app/routes.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

import '../../controller/conversation_controller.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  late ConversationController _conversationController;

  @override
  void initState() {
    super.initState();
    _conversationController = Get.find<ConversationController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text(
          "Conversations",
          style: AppStyles.roboto20semiBold,
        ),
      ),
      body: Obx(() {
        if (_conversationController.chats.isEmpty) {
          return _emptyChatWidget();
        } else {
          return ListView.builder(
            itemCount: _conversationController.chats.length,
            itemBuilder: (context, index) {
              final chat = _conversationController.chats[index];
              final user = chat.users.firstWhere((user) => user.id != _conversationController.userId);
              return ConversationRow(
                key: UniqueKey(),
                conversation: chat,
                userInfo: user,
                onTap: () {
                  Get.toNamed(Routes.chat, arguments: chat);
                },
                onLongPress: () {
                  Get.dialog(
                    Dialog(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              _conversationController.markRead(chat);
                              Get.back();
                            },
                            child: Text(
                              "Mark as Read",
                              style: AppStyles.roboto16regular.copyWith(color: AppColors.black),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _conversationController.deleteChat(chat);
                              Get.back();
                            },
                            child: Text(
                              "Delete Chat",
                              style: AppStyles.roboto16regular.copyWith(color: AppColors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        }
      }),
    );
  }

  Widget _emptyChatWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.emptyChat,
            width: 288,
            height: 279,
          ),
          Text(
            "No conversations yet",
            style: AppStyles.roboto16regular.copyWith(
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

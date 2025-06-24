import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/model/chat/chat.dart';
import 'package:food_delivery_app/data/model/user/user.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import '../../../data/enum/enums.dart';
import '../../../resources/components/username_widget.dart';

class ConversationRow extends StatelessWidget {
  final bool isRead;
  Chat conversation;
  User userInfo;
  Function()? onTap, onLongPress;
  final EdgeInsetsGeometry? padding;

  ConversationRow({
    Key? key,
    required this.conversation,
    required this.userInfo,
    this.onTap,
    this.onLongPress,
    this.padding,
    this.isRead = false,
  }) : super(key: key);

  String _getLastMessage() {
    if (conversation.lastMessage == null) {
      return "Start the conversation!";
    } else if (conversation.lastMessage?.type == MessageType.text) {
      return "${userInfo.fullname} has sent image to you.";
    } else if (conversation.lastMessage?.type == MessageType.location) {
      return "${userInfo.fullname} has sent a location to you.";
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      onLongPress: onLongPress,
      contentPadding: const EdgeInsets.all(10),
      leading: userInfo.avatarUrl.isNotEmpty
          ? CircleAvatar(
        //TODO: Add image url
              backgroundImage: CachedNetworkImageProvider( userInfo.avatarUrl),
              radius: 30,
            )
          : const CircleAvatar(
              backgroundImage: AssetImage(AppAssets.avatar),
              radius: 30,
            ),
      title: UsernameWithTickLabel(
        userInfo.fullname,
        uid: userInfo.id,
      ),
      subtitle: Container(
        margin: const EdgeInsets.only(top: 15),
        child: Text(
          _getLastMessage(),
          style: conversation.numOfUnReadMessage != 0
              ? AppStyles.roboto14semiBold.copyWith(color: AppColors.black)
              : AppStyles.roboto14regular.copyWith(color: AppColors.grey),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: Text(
        conversation.lastMessage?.sentAt.toString() ?? "" ,
        style: AppStyles.roboto14semiBold,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

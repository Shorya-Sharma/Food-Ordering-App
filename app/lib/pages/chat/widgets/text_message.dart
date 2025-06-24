import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/data/model/message/message.dart';
import 'package:food_delivery_app/pages/chat/widgets/image_grid.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';

class TextMessage extends StatelessWidget {
  bool isLatest = false;
  final Message message;
  final Function(Message message)? onLocationMessageTap;
  final Function(Message message)? onTextMessageTap;
  final Function(Message message, int index)? onMediaItemInMediaGridTap;
  TextMessage(
      {super.key,
      required this.message,
      this.onLocationMessageTap,
      this.onTextMessageTap,
      this.onMediaItemInMediaGridTap});
  Widget _buildContext() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: message.isMine ? AppColors.primaryColor : Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      child: GestureDetector(
        onTap:
            onTextMessageTap != null ? () => onTextMessageTap!(message) : null,
        child: Text(
          message.message ?? "NULL",
          style: AppStyles.h4,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment:
              message.isMine ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              constraints: BoxConstraints(maxWidth: 75.0.w),
              child: Column(
                children: [
                  _buildContext(),
                  if (message.images != null)
                    Column(
                      children: [
                        ImageGrid(message.images!),
                      ],
                    )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

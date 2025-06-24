import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controller/chat_controller.dart';
import 'package:food_delivery_app/resources/components/custom_appbar.dart';
import 'package:food_delivery_app/utils/date_time_util.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../data/model/message/message.dart';
import '../../resources/components/messaging_textfield.dart';
import '../../resources/components/reuseable_text.dart';
import '../../values/app_constant.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatController _controller = Get.find<ChatController>();
  @override
  void initState() {
    super.initState();
    _controller.onInit();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Scaffold build(BuildContext context) {
    // User? receiver = _controller.chat.users
    //     .where((user) => user.id == _controller.receiverId)
    //     .first;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          actions: const [
            Stack(children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage("https://picsum.photos/200"),
              ),
              Positioned(
                  right: 3,
                  child: CircleAvatar(radius: 5, backgroundColor: Colors.green))
            ])
          ],
          child: GestureDetector(
            onTap: () {
              print("tab on back");
              Get.back();
            },
            child: Padding(
                padding: EdgeInsets.all(12.h),
                child: const Icon(CupertinoIcons.arrow_left)),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(children: [
          Expanded(
            child: Obx(
              () => FutureBuilder(
                future: _controller.msgList.value,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting &&
                      _controller.messages.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError == true) {
                    return const Text("Error in get chat list");
                  } else if (snapshot.data!.isEmpty &&
                      _controller.messages.isEmpty) {
                    return const Text("Chat list is empty");
                  } else {
                    if (snapshot.data!.isEmpty) {
                      _controller.isCanFetch = false;
                    }
                    final msgList = snapshot.data;
                    if (_controller.fetchNew == true &&
                        snapshot.connectionState == ConnectionState.done) {
                      _controller.messages = _controller.messages + msgList!;
                      _controller.fetchNew = false;
                    }
                    return Obx(
                      () => ListView.builder(
                          padding: EdgeInsets.fromLTRB(20.h, 10.h, 20.h, 0),
                          itemCount: _controller.messages.length,
                          reverse: true,
                          controller: _controller.scrollController,
                          itemBuilder: ((context, index) {
                            Message message = _controller.messages[index];
                            bool isSender =
                                message.sender.id == _controller.userId;

                            return Padding(
                              padding: EdgeInsets.only(top: 8.h, bottom: 12.h),
                              child: Column(
                                children: [
                                  ReusableText(
                                    text:
                                        DateTimeUtil.formatTime(message.sentAt),
                                    style: AppStyles.customeText(10.sp,
                                        AppColors.kDark, FontWeight.normal),
                                  ),
                                  Gap(15.h),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      isSender == false
                                          ? CircleAvatar(
                                              radius: 12,
                                              backgroundImage: NetworkImage(
                                                  //get some link on the internet for the image
                                                  "https://picsum.photos/200"),
                                            )
                                          : const SizedBox.shrink(),
                                      Gap(5.w),
                                      Expanded(
                                        child: ChatBubble(
                                          alignment: isSender
                                              ? Alignment.bottomRight
                                              : Alignment.bottomLeft,
                                          elevation: 0,
                                          clipper: ChatBubbleClipper4(
                                              radius: 8,
                                              type: isSender
                                                  ? BubbleType.sendBubble
                                                  : BubbleType.receiverBubble),
                                          backGroundColor: isSender
                                              ? AppColors.kLightGrey
                                              : AppColors.primaryColor,
                                          margin: EdgeInsets.only(bottom: 8.h),
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth: width * 0.7,
                                              maxHeight: 200,
                                            ),
                                            child: ReusableText(
                                              maxLines: 10,
                                              text: message.message ?? "",
                                              style: AppStyles.customeText(
                                                  14.sp,
                                                  isSender
                                                      ? Colors.black
                                                      : Colors.white,
                                                  FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          })),
                    );
                  }
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.h),
            alignment: Alignment.bottomCenter,
            child: MessagingTextField(
              controller: _controller.textController,
              onSubmitted: (_) {},
              onChanged: (value) {
                //config typing event here
              },
              suffixIcon: GestureDetector(
                onTap: () {
                  String msg = _controller.textController.text;
                  _controller.sendMessage(msg);
                },
                child: Icon(
                  Icons.send,
                  size: 24,
                  color: AppColors.kLightGrey,
                ),
              ),
            ),
          )
        ]),
      )),
    );
  }
}

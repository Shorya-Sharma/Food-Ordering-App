import 'package:food_delivery_app/data/model/user/user.dart';
import 'package:food_delivery_app/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/chat/chat.dart';
import '../repository/chat_repository.dart';

class ConversationController extends GetxController {
  final UserRepository userRepository;
  final ChatRepository chatRepository;
  ConversationController({required this.userRepository, required this.chatRepository});

  // RxList to store chats and observe changes
  RxList<Chat> chats = <Chat>[].obs;
  late int userId;

  @override
  void onInit() {
    super.onInit();
    _initializeController();
  }

  Future<void> _initializeController() async {
    await _getPrefs();
    await _loadChats();
  }

  Future<void> _getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = (prefs.getInt("userId")!);
    print("userid is " + userId.toString());
  }

  // Method to load chats initially and add to RxList
  Future<void> _loadChats() async {
    try {
      List<Chat> initialChats = await chatRepository.getUserListChat(userId);
      chats.value = initialChats;
    } catch (e) {
      print('Error loading chats: $e');
    }
  }

  Future<User> getUserInfo(int userId) async {
    try {
      return await userRepository.getUserInformation(userId);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteChat(Chat chat) async {
    chats.remove(chat);
    await chatRepository.deleteChat(chat.id).onError((error, stackTrace) {
      chats.add(chat);
    });
    Get.back();
  }

  void markRead(Chat chat) {
    chatRepository.markedAsRead(chat.id);
    Get.back();
  }
}

import '../common/repository/repository_helper.dart';
import '../data/api/chat/chat_api.dart';
import '../data/model/chat/chat.dart';

class ChatRepository with RepositoryHelper<Chat> {
  final ChatApi chatApi;
  ChatRepository({required this.chatApi});
  Future<Chat> getChatByReceiverId(int receiverId) async {
    return chatApi.getChat("receiverId", receiverId);
  }
  Future<void> markedAsRead(int chatId) async {
    await chatApi.markedAsRead(chatId);
  }
  Future<void> deleteChat(int chatId) async {
    await chatApi.deleteChat(chatId);
  }
  Future<List<Chat>> getUserListChat(int userId) async {
    return chatApi.getChats(userId);
  }
}

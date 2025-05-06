import 'package:get/get.dart';

class ChatConversationController extends GetxController {
  final chats = <Chat>[].obs;
  final selectedChat = Rx<Chat?>(null);
  final messages = <Message>[].obs;
  final newMessage = ''.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadChats();
  }

  void loadChats() {
    // TODO: Load chats from API
    chats.value = [
      Chat(
        id: '1',
        name: 'Sarah',
        lastMessage: 'Hey, how are you?',
        time: '10:30 AM',
        unreadCount: 2,
        avatar: 'https://randomuser.me/api/portraits/women/1.jpg',
      ),
      Chat(
        id: '2',
        name: 'Mike',
        lastMessage: 'Let\'s meet tomorrow',
        time: 'Yesterday',
        unreadCount: 0,
        avatar: 'https://randomuser.me/api/portraits/men/1.jpg',
      ),
    ];
  }

  void selectChat(Chat chat) {
    selectedChat.value = chat;
    loadMessages(chat.id);
  }

  void loadMessages(String chatId) {
    // TODO: Load messages from API
    messages.value = [
      Message(
        id: '1',
        text: 'Hey there!',
        time: '10:00 AM',
        isMe: false,
      ),
      Message(
        id: '2',
        text: 'Hi! How are you?',
        time: '10:05 AM',
        isMe: true,
      ),
      Message(
        id: '3',
        text: 'I\'m good, thanks!',
        time: '10:30 AM',
        isMe: false,
      ),
    ];
  }

  void sendMessage() {
    if (newMessage.value.trim().isEmpty) return;
    
    final message = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: newMessage.value,
      time: 'Now',
      isMe: true,
    );
    
    messages.add(message);
    newMessage.value = '';
    
    // TODO: Send message to API
  }
}

class Chat {
  final String id;
  final String name;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final String avatar;

  Chat({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
    required this.avatar,
  });
}

class Message {
  final String id;
  final String text;
  final String time;
  final bool isMe;

  Message({
    required this.id,
    required this.text,
    required this.time,
    required this.isMe,
  });
}

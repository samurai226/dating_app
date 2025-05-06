import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_conversation_controller.dart';

class ChatConversationView extends GetView<ChatConversationController> {
  const ChatConversationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
          controller.selectedChat.value?.name ?? 'Chats',
        )),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.selectedChat.value == null) {
          return _buildChatList();
        } else {
          return _buildMessageList();
        }
      }),
    );
  }

  Widget _buildChatList() {
    return ListView.builder(
      itemCount: controller.chats.length,
      itemBuilder: (context, index) {
        final chat = controller.chats[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(chat.avatar),
          ),
          title: Text(chat.name),
          subtitle: Text(
            chat.lastMessage,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                chat.time,
                style: const TextStyle(fontSize: 12),
              ),
              if (chat.unreadCount > 0)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    chat.unreadCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
          onTap: () => controller.selectChat(chat),
        );
      },
    );
  }

  Widget _buildMessageList() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            padding: const EdgeInsets.all(16),
            itemCount: controller.messages.length,
            itemBuilder: (context, index) {
              final message = controller.messages[index];
              return Align(
                alignment: message.isMe
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: message.isMe ? Colors.blue : Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.text,
                        style: TextStyle(
                          color: message.isMe ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        message.time,
                        style: TextStyle(
                          color: message.isMe
                              ? Colors.white70
                              : Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: TextEditingController(
                    text: controller.newMessage.value,
                  ),
                  onChanged: (value) => controller.newMessage.value = value,
                  decoration: const InputDecoration(
                    hintText: 'Type a message...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: controller.sendMessage,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:get/get.dart';

import '../controllers/chat_conversation_controller.dart';

class ChatConversationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatConversationController>(
      () => ChatConversationController(),
    );
  }
}

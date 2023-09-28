import 'package:badaro_test/application/controllers/chat/chat_screen_controller.dart';
import 'package:badaro_test/domain/models/message_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

class TesterChatScreenController {
  late ChatScreenController _chatScreenController;

  TesterChatScreenController() {
    final getIt = GetIt.instance;
    _chatScreenController = getIt<ChatScreenController>();
  }

  void doTest() async {
    _chatScreenController.init();

    test('ChatController - Clear', () async {
      _chatScreenController.sendMessage("Mensagem teste");

      final List<MessageModel>? _messages =
          _chatScreenController.chatMessagesStreamValue.value;

      expect(_messages?.length, 2);
      expect(_messages?.first.contentValue.value,
          "☺️ Como posso ajudar você? Estou pronta para cuidar da sua saúde e da sua família!");
      expect(_messages?.last.contentValue.value, "Mensagem teste");
    });

    test('ChatController - Clear', () async {
      _chatScreenController.clear();

      final List<MessageModel>? _messages =
          _chatScreenController.chatMessagesStreamValue.value;

      expect(_messages?.length, 1);
      expect(_messages?.first.contentValue.value,
          "☺️ Como posso ajudar você? Estou pronta para cuidar da sua saúde e da sua família!");
    });
  }
}

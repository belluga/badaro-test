import 'package:badaro_test/domain/models/message_model.dart';
import 'package:badaro_test/domain/repository/chat_repository_contract.dart';
import 'package:badaro_test/domain/repository/user_repository_contract.dart';
import 'package:badaro_test/domain/value_objects/message/message_content_value.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

class TesterChatRepository {
  late ChatRepositoryContract _chatRepository;

  TesterChatRepository() {
    final getIt = GetIt.instance;
    _chatRepository = getIt<ChatRepositoryContract>();
  }

  void doTest() async {
    _chatRepository.init();

    test('First Message - OK', () async {
      final List<MessageModel>? _messages =
          _chatRepository.chatMessagesStream.value;

      expect(_messages?.length, 1);
      expect(_messages?.first.contentValue.value,
          "☺️ Como posso ajudar você? Estou pronta para cuidar da sua saúde e da sua família!");
    });

    test('Send Message - OK', () async {
      final getIt = GetIt.instance;
      final UserRepositoryContract _userRepository =
          getIt<UserRepositoryContract>();

      final _message = MessageModel(
        contentValue: MessageContentValue()..parse("Mensagem qualquer"),
        user: _userRepository.userStream.value,
      );

      _chatRepository.sendMessage(_message);

      final List<MessageModel>? _messages =
          _chatRepository.chatMessagesStream.value;

      expect(_messages?.length, 2);
      expect(_messages?.first.contentValue.value,
          "☺️ Como posso ajudar você? Estou pronta para cuidar da sua saúde e da sua família!");
      expect(_messages?.last.contentValue.value, "Mensagem qualquer");
    });
  }
}

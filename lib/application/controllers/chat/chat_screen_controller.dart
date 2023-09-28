import 'package:badaro_test/domain/models/message_model.dart';
import 'package:badaro_test/domain/repository/chat_repository_contract.dart';
import 'package:badaro_test/domain/repository/user_repository_contract.dart';
import 'package:badaro_test/domain/value_objects/message/message_content_value.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:stream_value/core/stream_value.dart';

class ChatScreenController {
  final _chatRepository = Inject.get<ChatRepositoryContract>()!;
  final _userRepository = Inject.get<UserRepositoryContract>()!;

  StreamValue<List<MessageModel>?> get chatMessagesStreamValue =>
      _chatRepository.chatMessagesStream;

  Future<void> init() async => await _chatRepository.init();

  void sendMessage(String messageContent) {
    final _message = MessageModel(
      contentValue: MessageContentValue()..parse(messageContent),
      user: _userRepository.userStream.value,
    );

    _chatRepository.sendMessage(_message);
  }

  void clear() => _chatRepository.clear();
}

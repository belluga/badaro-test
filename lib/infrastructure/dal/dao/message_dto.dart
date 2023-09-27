import 'package:badaro_test/domain/models/message_model.dart';
import 'package:badaro_test/domain/value_objects/message/message_content_value.dart';
import 'package:badaro_test/infrastructure/dal/dao/chat_agent_dto.dart';
import 'package:badaro_test/infrastructure/dal/dao/user_dto.dart';

class MessageDTO {
  final String content;
  final ChatAgentDTO? chatAgentDTO;
  final UserDTO? userDTO;

  MessageDTO({
    required this.content,
    this.chatAgentDTO,
    this.userDTO,
  }) : assert(
          chatAgentDTO != null || userDTO != null,
          "Either userDTO or chatAgentDTO shouldn't be null.",
        );

  MessageModel toDomain() {
    return MessageModel(
      contentValue: MessageContentValue()..parse(content),
      chatAgent: chatAgentDTO?.toDomain(),
      user: userDTO?.toDomain(),
    );
  }

  factory MessageDTO.fromJson(Map<String, dynamic> json) {
    final String _content = json["content"];
    final ChatAgentDTO? _chatAgentDTO =
        ChatAgentDTO.fromJsonTry(json["chat_agent"]);
    final UserDTO? _userDTO = UserDTO.fromJsonTry(json["user"]);

    return MessageDTO(
      content: _content,
      chatAgentDTO: _chatAgentDTO,
      userDTO: _userDTO,
    );
  }
}

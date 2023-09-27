import 'package:badaro_test/infrastructure/dal/dao/chat_agent_dto.dart';
import 'package:badaro_test/infrastructure/dal/dao/user_dto.dart';

class MessageDTO {
  final String content;
  final ChatAgentDTO? chatAgentDTO;
  final UserDTO? userDTO;

  MessageDTO({
    required this.content,
    required this.chatAgentDTO,
    required this.userDTO,
  }) : assert(
          chatAgentDTO != null || userDTO != null,
          "Either userDTO or chatAgentDTO shouldn't be null.",
        );
}

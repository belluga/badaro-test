import 'package:badaro_test/domain/models/chat_agent_model.dart';
import 'package:badaro_test/domain/models/user_model.dart';
import 'package:badaro_test/domain/value_objects/message/message_content_value.dart';

class MessageModel {
  final MessageContentValue contentValue;
  final ChatAgentModel? chatAgent;
  final UserModel? user;

  MessageModel({
    required this.contentValue,
    required this.chatAgent,
    required this.user,
  });
}

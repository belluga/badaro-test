import 'package:badaro_test/domain/value_objects/chat_agent/chat_agent_name_value.dart';
import 'package:badaro_test/domain/value_objects/chat_agent/chat_agent_profile_photo_uri_value.dart';

class ChatAgentModel {
  final ChatAgentNameValue nameValue;
  final ChatAgentPhotoUriValue photoUriValue;

  ChatAgentModel({
    required this.nameValue,
    required this.photoUriValue,
  });
}

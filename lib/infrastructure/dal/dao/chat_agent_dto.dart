import 'package:badaro_test/domain/models/chat_agent_model.dart';
import 'package:badaro_test/domain/value_objects/chat_agent/chat_agent_name_value.dart';
import 'package:badaro_test/domain/value_objects/chat_agent/chat_agent_profile_photo_uri_value.dart';
import 'package:flutter/material.dart';

class ChatAgentDTO {
  final String profilePhotoUrl;
  final String name;

  ChatAgentDTO({
    required this.profilePhotoUrl,
    required this.name,
  });

  ChatAgentModel toDomain() {
    return ChatAgentModel(
      nameValue: ChatAgentNameValue()..parse(name),
      photoUriValue: ChatAgentPhotoUriValue()..parse(profilePhotoUrl),
    );
  }

  factory ChatAgentDTO.fromJson(Map<String, dynamic> json) {
    final String _profilePhotoUrl = json["profile_photo_url"];
    final String _name = json["name"];

    return ChatAgentDTO(
      name: _name,
      profilePhotoUrl: _profilePhotoUrl,
    );
  }

  static ChatAgentDTO? fromJsonTry(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    try {
      return ChatAgentDTO.fromJson(json);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return null;
    }
  }
}

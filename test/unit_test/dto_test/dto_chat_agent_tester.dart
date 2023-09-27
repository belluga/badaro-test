// ignore_for_file: unused_local_variable

import 'package:badaro_test/infrastructure/dal/dao/chat_agent_dto.dart';
import 'package:flutter_test/flutter_test.dart';

class ChatAgentDTOTester {
  void doTest() async {
    test('ChatAgentDTO - OK', () async {
      final Map<String, dynamic> _json = {
        "name": "Test Agent",
        "profile_photo_url": "https://google.com"
      };
      final _chatAgentDTO = ChatAgentDTO.fromJson(_json);

      expect(_chatAgentDTO.name, "Test Agent");
    });

    test('ChatAgentDTO - Null Name', () async {
      final Map<String, dynamic> _json = {
        "profile_photo_url": "https://google.com",
      };

      try {
        final _chatAgentDTO = ChatAgentDTO.fromJson(_json);
      } catch (e) {
        expect(e.toString(), "type 'Null' is not a subtype of type 'String'");
      }
    });

    test('ChatAgentDTO - Null URL', () async {
      final Map<String, dynamic> _json = {
        "name": "Test Agent",
      };

      try {
        final _chatAgentDTO = ChatAgentDTO.fromJson(_json);
      } catch (e) {
        expect(e.toString(), "type 'Null' is not a subtype of type 'String'");
      }
    });

    test('ChatAgentDTO - Empty Name', () async {
      final Map<String, dynamic> _json = {
        "name": "",
        "profile_photo_url": "https://google.com",
      };

      try {
        final _chatAgentDTO = ChatAgentDTO.fromJson(_json);
      } catch (e) {
        expect(e.toString(), "type 'Null' is not a subtype of type 'String'");
      }
    });
  }
}

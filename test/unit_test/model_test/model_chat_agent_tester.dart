// ignore_for_file: unused_local_variable

import 'package:badaro_test/domain/models/chat_agent_model.dart';
import 'package:badaro_test/infrastructure/dal/dao/chat_agent_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:value_objects/domain/exceptions/value_exceptions.dart';

class ModelChatAgentTester {
  void doTest() async {
    test('ChatAgentDTO - OK', () async {
      final Map<String, dynamic> _json = {
        "name": "Test Agent",
        "profile_photo_url": "https://google.com"
      };
      final _chatAgentDTO = ChatAgentDTO.fromJson(_json);
      final ChatAgentModel _model = _chatAgentDTO.toDomain();

      expect(_model.nameValue.value, "Test Agent");
    });

    test('ChatAgentDTO - Empty Name', () async {
      final Map<String, dynamic> _json = {
        "name": "",
        "profile_photo_url": "https://google.com",
      };

      try {
        final _chatAgentDTO = ChatAgentDTO.fromJson(_json);
        final ChatAgentModel _model = _chatAgentDTO.toDomain();
      } catch (e) {
        expect(e.runtimeType, InvalidValueException<String?>);
      }
    });

    test('ChatAgentDTO - Empty URL', () async {
      final Map<String, dynamic> _json = {
        "name": "Test Agent",
        "profile_photo_url": "",
      };

      try {
        final _chatAgentDTO = ChatAgentDTO.fromJson(_json);
        final ChatAgentModel _model = _chatAgentDTO.toDomain();
      } catch (e) {
        expect(e.runtimeType, RequiredValueException);
      }
    });
  }
}

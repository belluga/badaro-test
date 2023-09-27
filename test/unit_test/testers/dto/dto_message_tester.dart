// ignore_for_file: unused_local_variable

import 'package:badaro_test/domain/models/message_model.dart';
import 'package:badaro_test/infrastructure/dal/dao/message_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:value_objects/domain/exceptions/value_exceptions.dart';

class DtoMessageTester {
  void doTest() async {
    test('MessageDTO - OK', () async {
      final Map<String, dynamic> _json = {
        "content": "Mensagem teste.",
        "chat_agent": {
          "name": "Robot With Surname",
          "profile_photo_url":
              "https://i.pinimg.com/originals/21/ec/cb/21eccb24383e57eaa502652a02d689fb.jpg"
        }
      };
      final MessageModel _message = MessageDTO.fromJson(_json).toDomain();

      expect(_message.contentValue.value, "Mensagem teste.");
    });

    test('MessageDTO - OK', () async {
      try {
        final Map<String, dynamic> _json = {
          "content": "Mensagem teste.",
          "chat_agent": {
            "name": "Robot",
            "profile_photo_url":
                "https://i.pinimg.com/originals/21/ec/cb/21eccb24383e57eaa502652a02d689fb.jpg"
          }
        };
        final MessageModel _message = MessageDTO.fromJson(_json).toDomain();
      } catch (e) {
        expect(e.runtimeType, InvalidValueException<String>);
      }
    });
  }
}

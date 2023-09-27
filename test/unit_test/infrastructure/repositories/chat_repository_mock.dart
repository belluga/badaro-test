import 'dart:convert';

import 'package:badaro_test/domain/models/message_model.dart';
import 'package:badaro_test/domain/repository/chat_repository_contract.dart';
import 'package:badaro_test/infrastructure/dal/dao/message_dto.dart';

class ChatRepositoryMock extends ChatRepositoryContract {
  @override
  Future<void> init() async {
    await _retrieveMessages();

    return Future.value();
  }

  Future<void> _retrieveMessages() async {
    final String _json = _messagesJson;
    final List _list = jsonDecode(_json);
    final List<MessageModel> _messagesList = _list
        .map((e) => MessageDTO.fromJson(e as Map<String, dynamic>).toDomain())
        .toList();
    chatMessagesStream.addValue(_messagesList);
  }


  String get _messagesJson => '[{"content":"☺️ Como posso ajudar você? Estou pronta para cuidar da sua saúde e da sua família!", "chat_agent":{"name" :"Robot With Surname", "profile_photo_url":"https://i.pinimg.com/originals/21/ec/cb/21eccb24383e57eaa502652a02d689fb.jpg"}}]';  
  @override
  Future<void> sendMessage(MessageModel message) {
    final List<MessageModel> _listOld = chatMessagesStream.value ?? [];
    _listOld.add(message);
    chatMessagesStream.addValue(_listOld);

    return Future.value();
  }

  @override
  Future<void> clear() {
    chatMessagesStream.addValue([]);
    _retrieveMessages();

    return Future.value();
  }
}

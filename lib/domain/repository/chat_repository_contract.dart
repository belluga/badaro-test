import 'package:badaro_test/domain/models/message_model.dart';
import 'package:badaro_test/domain/repository/repository_contract.dart';
import 'package:stream_value/core/stream_value.dart';

abstract class ChatRepositoryContract implements RepositoryContract {
  final chatMessagesStream = StreamValue<List<MessageModel>?>();

  Future<void> sendMessage(MessageModel message);
  Future<void> clear();

  @override
  void dispose() {
    chatMessagesStream.dispose();
  }
}

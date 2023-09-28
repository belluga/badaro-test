import 'package:badaro_test/application/controllers/contracts/disposable_controller.dart';
import 'package:badaro_test/domain/models/message_model.dart';
import 'package:badaro_test/domain/repository/chat_repository_contract.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:stream_value/core/stream_value.dart';

class ChatScreenController extends DisposableController {
  final chatRepository = Inject.get<ChatRepositoryContract>()!;

  StreamValue<List<MessageModel>?> get chatMessagesStreamValue =>
      chatRepository.chatMessagesStream;

  Future<void> init() async => await chatRepository.init();

  void clear() => chatRepository.clear();

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

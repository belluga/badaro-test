import 'package:badaro_test/application/controllers/chat/chat_screen_controller.dart';
import 'package:badaro_test/domain/repository/chat_repository_contract.dart';
import 'package:badaro_test/domain/repository/news_respository_contract.dart';
import 'package:badaro_test/domain/repository/user_repository_contract.dart';
import 'package:badaro_test/infrastructure/repositories/chat_repository_mock.dart';
import 'package:badaro_test/infrastructure/repositories/news_repository_mock.dart';
import 'package:badaro_test/infrastructure/repositories/user_repository_mock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'testers/controllers/tester_chat_screen_controller.dart';
import 'testers/dto/dto_chat_agent_tester.dart';
import 'testers/dto/dto_message_tester.dart';
import 'testers/model/model_chat_agent_tester.dart';
import 'testers/repositories/tester_chat_repository.dart';
import 'testers/repositories/tester_news_repository.dart';
import 'testers/repositories/tester_user_repository.dart';

void main() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<UserRepositoryContract>(UserRepostoryMock());
  getIt.registerSingleton<NewsRepositoryContract>(NewsRepositoryMock());
  getIt.registerSingleton<ChatRepositoryContract>(ChatRepositoryMock());
  getIt.registerLazySingleton<ChatScreenController>(
      () => ChatScreenController());

  final _dtoChatAgentTester = ChatAgentDTOTester();
  final _dtoMessageTester = DtoMessageTester();
  final _modelChatAgentTester = ModelChatAgentTester();
  final _testerUserRepository = TesterUserRepository();
  final _testerNewsRepository = TesterNewsRepository();
  final _testerChatRepository = TesterChatRepository();
  final _testerChatScreenController = TesterChatScreenController();
  group("DTO", () {
    _dtoChatAgentTester.doTest();
    _dtoMessageTester.doTest();
  });

  group("Model", () {
    _modelChatAgentTester.doTest();
  });

  group("Repository", () {
    _testerUserRepository.doTest();
    _testerNewsRepository.doTest();
    _testerChatRepository.doTest();
  });

  group("Controller", () {
    _testerChatScreenController.doTest();
  });
}

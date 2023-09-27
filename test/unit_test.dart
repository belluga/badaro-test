import 'package:badaro_test/domain/repository/user_repository_contract.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'unit_test/lib/infrastructure/repositories/user_repository_mock.dart';
import 'unit_test/testers/dto/dto_chat_agent_tester.dart';
import 'unit_test/testers/model/model_chat_agent_tester.dart';
import 'unit_test/testers/repositories/tester_user_repository.dart';

void main() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<UserRepositoryContract>(UserRepostoryMock());

  final _dtoChatAgentTester = ChatAgentDTOTester();
  final _modelChatAgentTester = ModelChatAgentTester();
  final _testerUserRepository = TesterUserRepository();
  group("DTO", () {
    _dtoChatAgentTester.doTest();
  });

  group("Model", () {
    _modelChatAgentTester.doTest();
  });

  group("Repository", () {
    _testerUserRepository.doTest();
  });
}

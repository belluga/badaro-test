import 'package:flutter_test/flutter_test.dart';

import 'dto_test/dto_chat_agent_tester.dart';
import 'model_test/model_chat_agent_tester.dart';

void main() {
  final _dtoChatAgentTester = ChatAgentDTOTester();
  final _modelChatAgentTester = ModelChatAgentTester();
  group("DTO", () {
    _dtoChatAgentTester.doTest();
  });

  group("Model", () {
    _modelChatAgentTester.doTest();
  });
}

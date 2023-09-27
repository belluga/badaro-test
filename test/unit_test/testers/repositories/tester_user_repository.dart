import 'package:badaro_test/domain/models/user_model.dart';
import 'package:badaro_test/domain/repository/user_repository_contract.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

class TesterUserRepository {
  late UserRepositoryContract _userRepository;

  TesterUserRepository() {
    final getIt = GetIt.instance;
    _userRepository = getIt<UserRepositoryContract>();
  }

  void doTest() async {
    _userRepository.init();

    test('ChatAgentDTO - OK', () async {
      final UserModel? _user = _userRepository.userStream.value;

      expect(_user?.fullName.value, "Roberta Miranda");
    });
  }
}

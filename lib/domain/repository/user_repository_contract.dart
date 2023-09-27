import 'package:badaro_test/domain/models/user_model.dart';
import 'package:badaro_test/domain/repository/repository_contract.dart';
import 'package:stream_value/core/stream_value.dart';

abstract class UserRepositoryContract implements RepositoryContract {
  final userStream = StreamValue<UserModel?>();

  @override
  void dispose() {
    userStream.dispose();
  }
}

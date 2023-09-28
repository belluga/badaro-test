import 'package:badaro_test/application/controllers/contracts/disposable_controller.dart';
import 'package:badaro_test/domain/models/news_model.dart';
import 'package:badaro_test/domain/models/user_model.dart';
import 'package:badaro_test/domain/repository/news_respository_contract.dart';
import 'package:badaro_test/domain/repository/user_repository_contract.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:stream_value/core/stream_value.dart';

class HomeScreenController extends DisposableController {
  final _userRepository = Inject.get<UserRepositoryContract>()!;
  final _newsRepository = Inject.get<NewsRepositoryContract>()!;

  StreamValue<List<NewsModel>?> get newsStreamValue =>
      _newsRepository.newsStream;
      
  StreamValue<UserModel?> get userStreamValue => _userRepository.userStream;

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

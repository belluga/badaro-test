import 'package:badaro_test/application/controllers/contracts/disposable_controller.dart';
import 'package:badaro_test/domain/repository/news_respository_contract.dart';
import 'package:badaro_test/domain/repository/user_repository_contract.dart';
import 'package:moduler_route/moduler_route.dart';

class SplashScreenController extends DisposableController {
  final _userRepository = Inject.get<UserRepositoryContract>()!;
  final _newsRepository = Inject.get<NewsRepositoryContract>()!;

  Future<void> initializeData() async {
    await _userRepository.init();
    await _newsRepository.init();

    await Future.delayed(Duration(seconds: 2));
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

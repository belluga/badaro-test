import 'package:badaro_test/application/controllers/chat/chat_screen_controller.dart';
import 'package:badaro_test/domain/repository/chat_repository_contract.dart';
import 'package:badaro_test/infrastructure/repositories/chat_repository_mock.dart';
import 'package:badaro_test/presentation/chat/chat_screen.dart';
import 'package:moduler_route/moduler_route.dart';

class ChatModule extends Module {
  @override
  String get path => routePaths.path;

  static final routePaths = _RouteNames();

  @override
  bool get allowAnonymous => true;

  @override
  List<ModuleRoute> get routes => [
        ModuleRoute(
          path: routePaths.home,
          builder: (_) => const ChatScreen(),
          transitionType: RouteTransitionType.downToUp,
        ),
      ];

  @override
  List<Injector> get injections => [
        Injector<ChatRepositoryContract>(
          inject: (arguments) => ChatRepositoryMock(),
        ),
        Injector<ChatScreenController>(
          inject: (arguments) => ChatScreenController(),
        ),
      ];
}

class _RouteNames {
  String get path => "chat";
  String get home => path;
}

import 'package:badaro_test/application/modules/chat/chat_module.dart';
import 'package:badaro_test/application/modules/home/home_module.dart';
import 'package:badaro_test/domain/repository/news_respository_contract.dart';
import 'package:badaro_test/domain/repository/user_repository_contract.dart';
import 'package:badaro_test/infrastructure/repositories/news_repository_mock.dart';
import 'package:badaro_test/infrastructure/repositories/user_repository_mock.dart';
import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';

class Application extends StatelessWidget with Moduler {
  Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Badaró',
      initialRoute: initialRoute(() => HomeModule.routePaths.splash),
      onGenerateRoute: routeTo,
      onUnknownRoute: unknownRoute,
      navigatorObservers: [modulerRouteObserver],
    );
  }

  @override
  List<Module> get modules => [
        HomeModule(),
        ChatModule(),
      ];

  @override
  List<Injector> get globalInjections => [
        Injector<UserRepositoryContract>(
          inject: (arguments) => UserRepostoryMock(),
        ),
        Injector<NewsRepositoryContract>(
          inject: (arguments) => NewsRepositoryMock(),
        ),
      ];
}

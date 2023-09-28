import 'package:badaro_test/application/modules/chat/chat_module.dart';
import 'package:badaro_test/application/modules/home/home_module.dart';
import 'package:badaro_test/application/view_model/theme_view_model.dart';
import 'package:badaro_test/domain/repository/news_respository_contract.dart';
import 'package:badaro_test/domain/repository/user_repository_contract.dart';
import 'package:badaro_test/infrastructure/repositories/news_repository_mock.dart';
import 'package:badaro_test/infrastructure/repositories/user_repository_mock.dart';
import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:stream_value/core/stream_value_builder.dart';

class Application extends StatelessWidget with Moduler {
  final _themeViewModel = ThemeViewModel();

  Application({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamValueBuilder<ThemeData>(
        streamValue: _themeViewModel.themeDataStreamValue,
        builder: (context, theme) {
          return MaterialApp(
            title: 'Badaró',
            theme: theme,
            initialRoute: initialRoute(() => HomeModule.routePaths.splash),
            onGenerateRoute: routeTo,
            onUnknownRoute: unknownRoute,
            navigatorObservers: [modulerRouteObserver],
          );
        });
  }

  @override
  List<Module> get modules => [
        HomeModule(),
        ChatModule(),
      ];

  @override
  List<Injector> get globalInjections => [
        Injector<ThemeViewModel>(
          inject: (arguments) => _themeViewModel,
        ),
        Injector<UserRepositoryContract>(
          inject: (arguments) => UserRepostoryMock(),
        ),
        Injector<NewsRepositoryContract>(
          inject: (arguments) => NewsRepositoryMock(),
        ),
      ];
}

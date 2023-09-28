import 'package:badaro_test/application/controllers/home/home_screen_controller.dart';
import 'package:badaro_test/application/controllers/home/splash_screen_controller.dart';
import 'package:badaro_test/presentation/home/home_screen.dart';
import 'package:badaro_test/presentation/home/splash/splash_screen.dart';
import 'package:moduler_route/moduler_route.dart';

class HomeModule extends Module {
  @override
  String get path => routePaths.path;

  static final routePaths = _RouteNames();

  @override
  bool get allowAnonymous => true;

  @override
  List<ModuleRoute> get routes => [
        ModuleRoute(
          path: routePaths.home,
          builder: (_) => HomeScreen(),
        ),
        ModuleRoute(
          path: routePaths.splash,
          builder: (_) => SplashScreen(),
        ),
      ];

  @override
  List<Injector> get injections => [
        Injector<HomeScreenController>(
          inject: (args) => HomeScreenController(),
        ),
        Injector<SplashScreenController>(
          inject: (args) => SplashScreenController(),
        ),
      ];
}

class _RouteNames {
  String get path => "home";
  String get home => path;
  String get splash => "$path/splash";
}

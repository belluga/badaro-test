import 'package:badaro_test/application/controllers/home/splash_screen_controller.dart';
import 'package:badaro_test/application/modules/home/home_module.dart';
import 'package:badaro_test/presentation/home/widgets/logo_splash.dart';
import 'package:badaro_test/presentation/home/widgets/progress_indicator_custom.dart';
import 'package:badaro_test/presentation/home/widgets/splash_screen_note.dart';
import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _controller = Inject.get<SplashScreenController>()!;

  @override
  void initState() {
    super.initState();
    _controller.initializeData().then((value) => _navigateToHome());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: const SafeArea(
        child: Column(
          children: [
            LogoSplash(),
            Expanded(
                child: Center(
              child: ProgressIndicatorCustom(),
            )),
            SpplashScreenNote(noteText: "Aplicativo esclusivo"),
          ],
        ),
      ),
    );
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacementNamed(HomeModule.routePaths.home);
  }
}

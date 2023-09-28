import 'package:badaro_test/application/controllers/home/splash_screen_controller.dart';
import 'package:badaro_test/application/modules/home/home_module.dart';
import 'package:badaro_test/presentation/home/widgets/main_logo.dart';
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
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            MainLogo(),
            Expanded(
                child: Center(
              child: CircularProgressIndicator(),
            )),
            Container(
              child: Text("Aplicativo Exclusivo", style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacementNamed(HomeModule.routePaths.home);
  }
}

import 'package:badaro_test/application/controllers/contracts/disposable_controller.dart';

class SplashScreenController extends DisposableController {

  SplashScreenController(){

  }

  Future<void> initializeData()async {
    
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

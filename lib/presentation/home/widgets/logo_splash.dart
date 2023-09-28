import 'package:badaro_test/application/view_model/assets_view_model.dart';
import 'package:flutter/material.dart';

class LogoSplash extends StatelessWidget {
  const LogoSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Image.asset(AssetsViewModel.logoWhiteDotPurple),
    );
  }
}
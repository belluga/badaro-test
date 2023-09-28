import 'package:badaro_test/application/view_model/assets_view_model.dart';
import 'package:flutter/material.dart';

class MainLogo extends StatelessWidget {
  final double height;
  const MainLogo({super.key, this.height = 20});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height, child: Image.asset(AssetsViewModel.logoBackDotWhite));
  }
}

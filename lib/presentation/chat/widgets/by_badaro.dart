import 'package:badaro_test/application/view_model/assets_view_model.dart';
import 'package:flutter/material.dart';

class ByBadaro extends StatelessWidget {
  const ByBadaro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.24,
      margin: const EdgeInsets.all(32),
      child: Image.asset(AssetsViewModel.byBadaro),
    );
  }
}

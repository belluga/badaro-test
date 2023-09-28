import 'package:flutter/material.dart';

class ProgressIndicatorCustom extends StatelessWidget {
  const ProgressIndicatorCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 60,
          width: 60,
          child: CircularProgressIndicator(
            strokeCap: StrokeCap.square,
            color: Theme.of(context).colorScheme.primary,
            strokeWidth: 12,
          ),
        ),
        SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(
            strokeCap: StrokeCap.square,
            color: Theme.of(context).colorScheme.onPrimary,
            strokeWidth: 6,
          ),
        ),
      ],
    );
  }
}
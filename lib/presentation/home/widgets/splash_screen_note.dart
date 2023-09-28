import 'package:flutter/material.dart';

class SpplashScreenNote extends StatelessWidget {
  final String noteText;

  const SpplashScreenNote({
    super.key,
    required this.noteText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Text(
        noteText.toUpperCase(),
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}

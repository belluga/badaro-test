import 'package:flutter/material.dart';

class AppBarFake extends StatelessWidget {
  final Widget child;
  final AppBar appBar;
  final double contentMargin;

  const AppBarFake({
    super.key,
    required this.appBar,
    required this.child,
    this.contentMargin = 56,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ),
        appBar,
        SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: contentMargin),
            child: child,
          ),
        ),
      ],
    );
  }
}

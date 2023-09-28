import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final Uri? avatarUrl;

  const UserAvatar({super.key, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 36,
          backgroundImage: NetworkImage(avatarUrl.toString()),
        ),
        SizedBox(
          height: 72,
          width: 72,
          child: CircularProgressIndicator(
            strokeWidth: 5,
            color: Theme.of(context).colorScheme.secondary,
            value: 1,
          ),
        ),
        const SizedBox(
          height: 82,
          width: 82,
          child: CircularProgressIndicator(
            strokeWidth: 5,
            value: 0.75,
          ),
        ),
      ],
    );
  }
}

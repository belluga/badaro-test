import 'package:badaro_test/domain/models/message_model.dart';
import 'package:flutter/material.dart';

class MessageCardOther extends StatelessWidget {
  final MessageModel messageModel;

  const MessageCardOther({
    super.key,
    required this.messageModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(),
        Expanded(
          child: Container(
            child: Text(messageModel.contentValue.value),
          ),
        ),
        SizedBox(
          width: 72,
        ),
      ],
    );
  }
}

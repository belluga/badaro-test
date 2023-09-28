import 'package:badaro_test/domain/models/message_model.dart';
import 'package:flutter/material.dart';

class MessageCardOwn extends StatelessWidget {
  final MessageModel messageModel;

  const MessageCardOwn({
    super.key,
    required this.messageModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 72,),
        Expanded(
          child: Container(
            child: Text(messageModel.contentValue.value),
          ),
        ),
        CircleAvatar(),
      ],
    );
  }
}

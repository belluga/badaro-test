import 'package:badaro_test/domain/models/message_model.dart';
import 'package:badaro_test/presentation/chat/widgets/message_card_other.dart';
import 'package:badaro_test/presentation/chat/widgets/message_card_own.dart';
import 'package:flutter/material.dart';

class MessagesListView extends StatelessWidget {
  final List<MessageModel> messagesList;

  const MessagesListView({
    super.key,
    required this.messagesList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: messagesList.length,
      itemBuilder: (context, i) {
        final _messageModel = messagesList[i];

        if (_messageModel.user != null) {
          return MessageCardOwn(
            messageModel: messagesList[i],
          );
        }

        return MessageCardOther(
          messageModel: messagesList[i],
        );
      },
    );
  }
}

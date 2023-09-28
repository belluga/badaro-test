import 'package:badaro_test/application/controllers/chat/chat_screen_controller.dart';
import 'package:badaro_test/domain/models/message_model.dart';
import 'package:badaro_test/presentation/chat/widgets/messages_list_view.dart';
import 'package:badaro_test/presentation/home/widgets/app_bar_fake.dart';
import 'package:badaro_test/presentation/home/widgets/main_logo.dart';
import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:stream_value/core/stream_value_builder.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = Inject.get<ChatScreenController>()!;

  @override
  void initState() {
    super.initState();
    _controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarFake(
            contentMargin: 26,
            appBar: AppBar(
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.help_center),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 32),
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: Text("reiniciar")),
                      SizedBox(
                        width: 64,
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: Text("mais sobre")),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 32,
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamValueBuilder<List<MessageModel>>(
              streamValue: _controller.chatMessagesStreamValue,
              onNullWidget: const CircularProgressIndicator(),
              builder: (context, messagesList) {
                return MessagesListView(messagesList: messagesList,);
              }
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
        children: [
          TextField(),
          MainLogo(),
        ],
      )),
    );
  }
}

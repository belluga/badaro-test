import 'package:badaro_test/application/controllers/home/home_screen_controller.dart';
import 'package:badaro_test/application/modules/chat/chat_module.dart';
import 'package:badaro_test/domain/models/news_model.dart';
import 'package:badaro_test/domain/models/user_model.dart';
import 'package:badaro_test/presentation/home/widgets/app_bar_fake.dart';
import 'package:badaro_test/presentation/home/widgets/main_logo.dart';
import 'package:badaro_test/presentation/home/widgets/news_highlight.dart';
import 'package:badaro_test/presentation/home/widgets/news_personalized.dart';
import 'package:badaro_test/presentation/home/widgets/user_main_card.dart';
import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:stream_value/core/stream_value_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Inject.get<HomeScreenController>()!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarFake(
            appBar: AppBar(
              elevation: 0,
              title: MainLogo(),
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.alarm)),
                IconButton(onPressed: () {}, icon: Icon(Icons.help_center))
              ],
            ),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(25),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: StreamValueBuilder<UserModel>(
                    streamValue: _controller.userStreamValue,
                    onNullWidget: const CircularProgressIndicator(),
                    builder: (context, userModel) {
                      return UserMainCard(
                        userModel: userModel,
                      );
                    }),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text("Acesso Rápido"),
                        Container(
                          height: 80,
                          child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, i) => Container(
                              height: 50,
                              width: 50,
                              color: Colors.amber,
                            ),
                            itemCount: 10,
                            separatorBuilder: (_, i) => SizedBox(
                              width: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        children: [
                          CircleAvatar(),
                          Text("Quer o que?"),
                          ElevatedButton(
                              onPressed: _navigateToChat, child: Text("Inciar"))
                        ],
                      ),
                    ),
                    StreamValueBuilder<List<NewsModel>>(
                      streamValue: _controller.newsStreamValue,
                      onNullWidget: const SizedBox.shrink(),
                      builder: (context, newsList) {
                        return NewsHighlight(
                          newsModel: newsList.last,
                        );
                      },
                    ),
                    StreamValueBuilder<UserModel?>(
                      streamValue: _controller.userStreamValue,
                      builder: (context, user) {
                        return Text(
                            "Só para você, ${user?.fullName.firstName ?? ""}");
                      },
                    ),
                    StreamValueBuilder<List<NewsModel>>(
                        streamValue: _controller.newsStreamValue,
                        onNullWidget: CircularProgressIndicator(),
                        builder: (context, newsList) {
                          return NewsPersonalized(newsList: newsList);
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(label: "Início", icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: "Agenda", icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: "Pagamento", icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: "Senhas", icon: Icon(Icons.home)),
      ]),
    );
  }

  void _navigateToChat() {
    Navigator.of(context).pushNamed(ChatModule.routePaths.home);
  }
}

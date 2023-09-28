import 'package:badaro_test/application/modules/chat/chat_module.dart';
import 'package:badaro_test/presentation/home/widgets/app_bar_fake.dart';
import 'package:badaro_test/presentation/home/widgets/main_logo.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 4,
                          height: 100,
                          // height: double.infinity,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              "Olá, Nome",
                            ),
                            Text(
                              "Empresa",
                            ),
                            Text(
                              "Endereço",
                            ),
                          ],
                        )),
                        Column(
                          children: [
                            CircleAvatar(),
                            Text(
                              "name",
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 4,
                          height: 50,
                          // height: double.infinity,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        Expanded(
                          child: Text(
                            "Endereço",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {}, child: Text("Meus dados"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Column(
                    children: [
                      Text("Acesso Rápido"),
                      Container(
                        height: 80,
                        child: ListView.separated(
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
                  )),
                  Container(child: Text("Notícias em destaque")),
                  Column(
                    children: [
                      Text("Acesso Rápido"),
                      Container(
                        height: 80,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, i) => Container(
                            height: 50,
                            width: 150,
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
                ],
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

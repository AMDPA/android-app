import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:solotec/stores/auth_store.dart';
import 'package:solotec/stores/configuracoes_store.dart';

class ConfiguracoesPage extends StatelessWidget {
  const ConfiguracoesPage(this.store, {Key key}) : super(key: key);

  final ConfiguracoesStore store;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Observer(
                  builder: (_) {
                    if (this.store.imagem != null) {
                      return CircleAvatar(
                        backgroundImage: NetworkImage(this.store.imagem),
                        radius: 60,
                      );
                    } else {
                      return CircleAvatar(
                        radius: 60,
                        child: (this.store.anonymous
                            ? Text('U', style: TextStyle(fontSize: 50))
                            : (this.store.imagem != null
                                ? Container()
                                : Text(
                                    this
                                        .store
                                        .nome
                                        .characters
                                        .characterAt(0)
                                        .toString(),
                                    style: TextStyle(fontSize: 50)))),
                      );
                    }
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Observer(
                  builder: (_) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: this.store.anonymous
                          ? [
                              Text('Usuário Anônimo',
                                  style: TextStyle(fontSize: 20)),
                            ]
                          : [
                              Text('${store.nome}',
                                  style: TextStyle(fontSize: 20)),
                              Text('${store.email}',
                                  style: TextStyle(fontSize: 15))
                            ],
                    );
                  },
                )
              ],
            ),
            Consumer<AuthStore>(builder: (_, authStore, __) {
              return IconButton(
                tooltip: 'Sair',
                icon: Icon(
                  Icons.logout,
                  size: 30,
                ),
                onPressed: () {
                  authStore.logout();
                },
              );
            }),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          thickness: 1.5,
        ),
        ListTile(
          leading: Icon(
            Icons.precision_manufacturing_sharp,
            color: Color(0xff612B02),
          ),
          title: Text("Gerenciar Estações"),
          subtitle: Text("Adicione, remova e edite estações"),
          onTap: () => store.openGerenciarEstacoes(context),
        ),
        ListTile(
          leading: Icon(
            Icons.analytics,
            color: Color(0xff612B02),
          ),
          title: Text("Relatórios"),
          subtitle: Text("Crie, baixe e gerencie relatórios"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.person,
            color: Color(0xff612B02),
          ),
          title: Text("Perfil"),
          subtitle: Text("Modifique seu perfil"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.notifications,
            color: Color(0xff612B02),
          ),
          title: Text("Notificações"),
          subtitle: Text("Habilite e desabilite notificações"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.data_usage,
            color: Color(0xff612B02),
          ),
          title: Text("Armazenamento e dados"),
          subtitle: Text("Visualize usos do aplicativo"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.info,
            color: Color(0xff612B02),
          ),
          title: Text("Sobre o aplicativo"),
          subtitle: Text("Saiba mais"),
          onTap: () {},
        ),
        SizedBox(
          height: 45,
        ),
        Image.asset(
          'assets/icons/ifes.png',
          height: 70,
        ),
      ],
    );
  }
}

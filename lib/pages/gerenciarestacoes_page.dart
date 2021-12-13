import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:solotec/stores/estacoes_store.dart';

class GerenciarEstacoesPage extends StatefulWidget {
  const GerenciarEstacoesPage({Key? key}) : super(key: key);

  @override
  _GerenciarEstacoesPageState createState() => _GerenciarEstacoesPageState();
}

class _GerenciarEstacoesPageState extends State<GerenciarEstacoesPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xffffffff),
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Color(0xff612B02),
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light),
      child: Provider<EstacoesStore>(
        create: (_) => EstacoesStore(),
        child: Consumer<EstacoesStore>(builder: (context, store, _) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Color(0xff612B02),
              title: Text(
                "Gerenciar estações",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () => store.openAddEstacoes(context),
                )
              ],
            ),
            body: Observer(
              builder: (_) {
                return store.atuali
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                          ],
                        ),
                      )
                    : Observer(
                        builder: (_) {
                          // ignore: unnecessary_null_comparison
                          if (store.estat == null) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [Text('Nenhuma estação cadastrada')],
                              ),
                            );
                          }
                          return store.estat.length != 0
                              ? ListView.builder(
                                  padding: EdgeInsets.all(15),
                                  itemCount: store.estat.length,
                                  itemBuilder: (context, i) {
                                    return Observer(
                                      builder: (_) {
                                        return ListTile(
                                          title: Text(store.estat[i].name!),
                                          subtitle:
                                              Text(store.estat[i].description!),
                                          onTap: () =>
                                              store.openVerEstacoes(context, i),
                                        );
                                      },
                                    );
                                  },
                                )
                              : Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text('Nenhuma estação cadastrada')
                                    ],
                                  ),
                                );
                        },
                      );
              },
            ),
          );
        }),
      ),
    );
  }
}

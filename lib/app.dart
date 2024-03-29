import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:solotec/includes/appbartitle_include.dart';
import 'package:solotec/includes/bottomnavigationbar_include.dart';
import 'package:solotec/stores/destination_store.dart';
import 'package:solotec/stores/resumo_store.dart';
import 'package:solotec/stores/configuracoes_store.dart';
import 'package:solotec/stores/dados_store.dart';
import 'package:solotec/stores/relatorios_store.dart';
import 'package:solotec/includes/pagecontainer_include.dart';

class App extends StatelessWidget {
  App({scaffold, Key? key}) : super(key: key);
  final scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DestinationStore>(
          create: (_) => DestinationStore(),
        ),
        Provider<ResumoStore>(
          create: (_) => ResumoStore(),
        ),
        Provider<DadosStore>(
          create: (_) => DadosStore(),
        ),
        Provider<RelatoriosStore>(
          create: (_) => RelatoriosStore(),
        ),
        Provider<ConfiguracoesStore>(
          create: (_) => ConfiguracoesStore(),
        )
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
              systemNavigationBarColor: Color(0xff612B02),
              systemNavigationBarDividerColor: Colors.transparent,
              systemNavigationBarIconBrightness: Brightness.light,
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light),
          child: Consumer<DestinationStore>(
            builder: (context, store, _) {
              return Observer(
                builder: (_) {
                  return Scaffold(
                      key: scaffold,
                      backgroundColor: Colors.white,
                      appBar: AppBar(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        title: AppBarTitle(store.selectedDestination),
                        centerTitle: false,
                      ),
                      body: SafeArea(
                        child: PageContainerInclude(store.selectedDestination),
                      ),
                      floatingActionButtonLocation:
                          FloatingActionButtonLocation.centerDocked,
                      floatingActionButton: /*FloatingActionButton(
                        child: Icon(Icons.arrow_downward),
                        onPressed: () {
                          showModalBottomSheet(
                              enableDrag: false,
                              isDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                    padding: EdgeInsets.all(15),
                                    height:
                                        (MediaQuery.of(context).size.height /
                                            2),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Atualizar Dados',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16)),
                                          ],
                                        ),
                                        Divider(),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Icon(
                                          Icons.wifi,
                                          size: 150,
                                        ),
                                        Text(
                                            'Atualmente o sistema só comporta atualizações automaticas atraves da rede.')
                                      ],
                                    ));
                              });
                        },
                      ),*/
                          Container(
                        decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        width: 60,
                        child: Image.asset('assets/icons/app_pb.png'),
                      ),
                      bottomNavigationBar: ButtonNavigationBarWidget(store));
                },
              );
            },
          )),
    );
  }
}

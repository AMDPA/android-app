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
import 'package:solotec/stores/historico_store.dart';
import 'package:solotec/includes/pagecontainer_include.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

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
        Provider<HistoricoStore>(
          create: (_) => HistoricoStore(),
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
          ),
          child: Consumer<DestinationStore>(
            builder: (context, store, _) {
              return Observer(
                builder: (_) {
                  return Scaffold(
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
                      floatingActionButton: FloatingActionButton(
                        child: Icon(Icons.arrow_downward),
                        onPressed: () {},
                      ),
                      bottomNavigationBar: ButtonNavigationBarWidget(store));
                },
              );
            },
          )),
    );
  }
}
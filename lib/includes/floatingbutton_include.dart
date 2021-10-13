import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solotec/constants/enuns.dart';
import 'package:solotec/stores/dados_store.dart';
import 'package:solotec/stores/destination_store.dart';
import 'package:solotec/stores/relatorios_store.dart';

class FloatingButtonInclude extends StatelessWidget {
  const FloatingButtonInclude(this.store, {Key key}) : super(key: key);
  final DestinationStore store;
  @override
  Widget build(BuildContext context) {
    switch (store.selectedDestination) {
      case Destination.Resumo:
        return Container();
        break;
      case Destination.Dados:
        return Consumer<DadosStore>(builder: (context, store2, _) {
          return FloatingActionButton(
            child: Icon(Icons.arrow_downward),
            onPressed: () {},
          );
        });
        break;
      case Destination.Relatorios:
        return Consumer<RelatoriosStore>(builder: (context, store2, _) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => store2.criarRelatorio(context),
          );
        });
        break;
      case Destination.Configuracoes:
        return Container();
        break;
      default:
        return Container();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solotec/constants/enuns.dart';
import 'package:solotec/pages/configuracoes_page.dart';
import 'package:solotec/pages/dados_page.dart';
import 'package:solotec/pages/historico_page.dart';
import 'package:solotec/pages/resumo_page.dart';
import 'package:solotec/stores/configuracoes_store.dart';
import 'package:solotec/stores/dados_store.dart';
import 'package:solotec/stores/historico_store.dart';
import 'package:solotec/stores/resumo_store.dart';

class PageContainerInclude extends StatelessWidget {
  const PageContainerInclude(this.destination, {Key key}) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    switch (destination) {
      case Destination.Resumo:
        return Consumer<ResumoStore>(
          builder: (_, store, __) => ResumoPage(store),
        );
        break;
      case Destination.Dados:
        return Consumer<DadosStore>(
          builder: (_, store, __) => DadosPage(store),
        );
        break;
      case Destination.Historico:
        return Consumer<HistoricoStore>(
          builder: (_, store, __) => HistoricoPage(store),
        );
        break;
      case Destination.Configuracoes:
        return Consumer<ConfiguracoesStore>(
          builder: (_, store, __) => ConfiguracoesPage(store),
        );
        break;
      default:
        return Consumer<ResumoStore>(
          builder: (_, store, __) => ResumoPage(store),
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:solotec/stores/relatorios_store.dart';

class RelatoriosPage extends StatelessWidget {
  const RelatoriosPage(this.store, {Key? key}) : super(key: key);

  final RelatoriosStore store;
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (store.modelR.length != 0) {
          return Observer(
            builder: (_) {
              return ListView.builder(
                  itemCount: store.modelR.length,
                  padding: EdgeInsets.all(15),
                  itemBuilder: (ctx, i) {
                    DateTime ini = DateTime.fromMillisecondsSinceEpoch(
                        store.modelR[i].dataInicial! * 1000);
                    DateTime fim = DateTime.fromMillisecondsSinceEpoch(
                        store.modelR[i].dataFinal! * 1000);

                    final df = new DateFormat('dd/MM/yyyy HH:mm ');
                    return ListTile(
                        title: Text(
                            "${store.modelR[i].descri}, Relatório de ${fim.difference(ini).inDays} dias"),
                        subtitle:
                            Text('De ${df.format(ini)} até ${df.format(fim)}'),
                        onTap: () => store.openRelatorio(i, context),
                        trailing: Observer(
                          builder: (_) {
                            if (store.modelD[i] == -1) {
                              return Icon(
                                Icons.open_in_new,
                                color: Colors.brown,
                              );
                            } else {
                              return Icon(
                                Icons.download_sharp,
                                color: Colors.brown,
                              );
                            }
                          },
                        ));
                  });
            },
          );
        } else if (store.load) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [CircularProgressIndicator()],
            ),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text('Nenhum Relatório gerado')],
            ),
          );
        }
      },
    );
  }
}

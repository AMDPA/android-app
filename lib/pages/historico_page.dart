import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:solotec/stores/historico_store.dart';

class HistoricoPage extends StatelessWidget {
  const HistoricoPage(this.store, {Key key}) : super(key: key);

  final HistoricoStore store;
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListView.builder(
            itemCount: 10,
            padding: EdgeInsets.all(15),
            itemBuilder: (ctx, i) {
              return ListTile(
                title: Text("Atualização de dados - EST01"),
                subtitle: Text(
                    "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} às ${DateTime.now().hour}:${DateTime.now().minute}"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              );
            });
      },
    );
  }
}

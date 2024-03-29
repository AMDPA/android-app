import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:solotec/constants/enuns.dart';
import 'package:solotec/stores/relatorios_store.dart';
import 'package:solotec/stores/resumo_store.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle(this.destination, {Key? key}) : super(key: key);
  final Destination destination;

  @override
  Widget build(BuildContext context) {
    switch (destination) {
      case Destination.Resumo:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Resumo',
              style: TextStyle(
                color: Color(0xff612B02),
                fontSize: 20,
              ),
            ),
            Consumer<ResumoStore>(builder: (_, store, __) {
              return Observer(builder: (_) {
                return Text(
                  'Atualizado: ${store.atualizado}',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                );
              });
            })
          ],
        );

      case Destination.Dados:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Dados',
              style: TextStyle(
                color: Color(0xff612B02),
                fontSize: 20,
              ),
            ),
            /*Consumer<ResumoStore>(builder: (_, store, __) {
              return Observer(builder: (_) {
                return DropdownButton<String>(
                    onChanged: (String? a) {},
                    value: 'est01',
                    items: [
                      DropdownMenuItem<String>(
                        value: 'est01',
                        child: Text('est01'),
                      ),
                      DropdownMenuItem<String>(
                        value: "est02",
                        child: Text('est02'),
                      ),
                    ]);
              });
            })*/
          ],
        );

      case Destination.Relatorios:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Relatórios',
              style: TextStyle(
                color: Color(0xff612B02),
                fontSize: 20,
              ),
            ),
            Consumer<RelatoriosStore>(builder: (_, store, __) {
              return IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.brown,
                  ),
                  onPressed: () => store.criarRelatorio(context));
            })
          ],
        );
      case Destination.Configuracoes:
        return Text(
          'Configurações',
          style: TextStyle(
            color: Color(0xff612B02),
            fontSize: 20,
          ),
        );
      default:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Resumo',
              style: TextStyle(
                color: Color(0xff612B02),
                fontSize: 20,
              ),
            ),
            Consumer<ResumoStore>(builder: (_, store, __) {
              return Observer(builder: (_) {
                return Text(
                  'Atua.: ${store.atualizado}',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                );
              });
            })
          ],
        );
    }
  }
}

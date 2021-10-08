import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:solotec/stores/destination_store.dart';

class ButtonNavigationBarWidget extends StatelessWidget {
  const ButtonNavigationBarWidget(this.store, {Key key}) : super(key: key);
  final DestinationStore store;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xff612B02),
      shape: CircularNotchedRectangle(),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            Observer(builder: (_) {
              return IconButton(
                  tooltip: 'Resumo',
                  iconSize: 30,
                  icon: Icon(
                    Icons.home,
                    color: (store.selectedDestinationIndex == 0
                        ? Colors.white
                        : Colors.white70),
                  ),
                  onPressed: () => store.selectDestination(0));
            }),
            Spacer(),
            IconButton(
                tooltip: 'Dados',
                iconSize: 30,
                icon: Icon(
                  Icons.bar_chart,
                  color: (store.selectedDestinationIndex == 1
                      ? Colors.white
                      : Colors.white70),
                ),
                onPressed: () => store.selectDestination(1)),
            Spacer(
              flex: 4,
            ),
            IconButton(
                iconSize: 30,
                tooltip: 'Histórico',
                icon: Icon(
                  Icons.history,
                  color: (store.selectedDestinationIndex == 2
                      ? Colors.white
                      : Colors.white70),
                ),
                onPressed: () => store.selectDestination(2)),
            Spacer(),
            IconButton(
                iconSize: 30,
                tooltip: 'Configurações',
                icon: Icon(
                  Icons.settings,
                  color: (store.selectedDestinationIndex == 3
                      ? Colors.white
                      : Colors.white70),
                ),
                onPressed: () => store.selectDestination(3)),
            Spacer(),
          ]),
    );
  }
}

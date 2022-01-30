import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:solotec/includes/home_icons_solo_tec_icons.dart';
import 'package:solotec/stores/resumo_store.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ResumoPage extends StatelessWidget {
  const ResumoPage(this.store, {Key? key}) : super(key: key);

  final ResumoStore store;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => store.getData(),
      child: Observer(
        builder: (_) {
          if (store.ultimasMedicoes.length != 0) {
            return ListView(
              padding: EdgeInsets.all(15),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Ambiente',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Observer(builder: (_) {
                          return CardO1(
                            title: 'Temperatura',
                            icon: HomeIconsSoloTec.bi_thermometer_half,
                            data:
                                '${store.ambienteTemperatura?.toStringAsFixed(1)}ºC',
                          );
                        }),
                        Observer(builder: (_) {
                          return CardO1(
                            title: 'Umidade',
                            icon: HomeIconsSoloTec.bi_moistureumidade_icon,
                            data:
                                '${store.ambienteUmidade?.toStringAsFixed(1)}%',
                          );
                        }),
                        Observer(
                          builder: (_) {
                            return CardO1(
                              title: 'Sensação',
                              icon: HomeIconsSoloTec.layer1sensacao_icon,
                              data:
                                  '${store.ambienteSensacao?.toStringAsFixed(1)}ºC',
                            );
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Solo',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Observer(builder: (_) {
                          return CardO1(
                            title: 'Temperatura',
                            icon: HomeIconsSoloTec.bi_thermometer_half,
                            data:
                                '${store.soloTemperatura?.toStringAsFixed(1)}ºC',
                          );
                        }),
                        Observer(builder: (_) {
                          return CardO1(
                            title: 'Umidade',
                            icon: HomeIconsSoloTec.bi_moistureumidade_icon,
                            data: '${store.soloUmidade?.toStringAsFixed(1)}%',
                          );
                        }),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Gazes',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Card(
                      elevation: 10,
                      child: Container(
                          height: 250,
                          width: 350,
                          child: Observer(
                            builder: (_) {
                              return charts.TimeSeriesChart(
                                store.series,
                                animate: true,
                                dateTimeFactory:
                                    const charts.LocalDateTimeFactory(),
                              );
                            },
                          )),
                    )
                  ],
                )
              ],
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
                children: [Text('Ainda não há dados')],
              ),
            );
          }
        },
      ),
    );
  }
}

class CardO1 extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final String? data;

  CardO1({this.title, this.icon, this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 5,
      child: Container(
        height: 120,
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              this.title!,
              style: TextStyle(color: Color(0xff612B02)),
            ),
            SizedBox(
              height: 5,
            ),
            Icon(
              this.icon,
              size: 35,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              this.data!,
              style: TextStyle(color: Color(0xff612B02), fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

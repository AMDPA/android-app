import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:solotec/stores/dados_store.dart';

class DadosPage extends StatelessWidget {
  const DadosPage(this.store, {Key? key}) : super(key: key);

  final DadosStore store;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: Stack(
          children: [
            Positioned(
              child: Observer(
                builder: (_) {
                  if (store.dados.length != 0) {
                    return ListView(
                      padding: EdgeInsets.fromLTRB(15, 100, 15, 15),
                      shrinkWrap: true,
                      children: [
                        Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Temperatura do Solo",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.brown),
                              ),
                              Divider(
                                thickness: 2,
                                color: Colors.brown,
                              ),
                              Container(
                                height: 250,
                                child: Observer(
                                  builder: (_) {
                                    return charts.TimeSeriesChart(
                                      store.temperaturaSoloSeries,
                                      animate: true,
                                      dateTimeFactory:
                                          const charts.LocalDateTimeFactory(),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "pH",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.brown),
                              ),
                              Divider(
                                thickness: 2,
                                color: Colors.brown,
                              ),
                              Container(
                                height: 250,
                                child: Observer(
                                  builder: (_) {
                                    return charts.TimeSeriesChart(
                                      store.pHSeries,
                                      animate: true,
                                      dateTimeFactory:
                                          const charts.LocalDateTimeFactory(),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Temperatura Ambiente",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.brown),
                              ),
                              Divider(
                                thickness: 2,
                                color: Colors.brown,
                              ),
                              Container(
                                height: 250,
                                child: Observer(
                                  builder: (_) {
                                    return charts.TimeSeriesChart(
                                      store.tempAmbSeries,
                                      animate: true,
                                      dateTimeFactory:
                                          const charts.LocalDateTimeFactory(),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Gás Carbônico",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.brown),
                              ),
                              Divider(
                                thickness: 2,
                                color: Colors.brown,
                              ),
                              Container(
                                height: 250,
                                child: Observer(
                                  builder: (_) {
                                    return charts.TimeSeriesChart(
                                      store.co2,
                                      animate: true,
                                      dateTimeFactory:
                                          const charts.LocalDateTimeFactory(),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Umidade Solo",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.brown),
                              ),
                              Divider(
                                thickness: 2,
                                color: Colors.brown,
                              ),
                              Container(
                                height: 250,
                                child: Observer(
                                  builder: (_) {
                                    return charts.TimeSeriesChart(
                                      store.umidSolo,
                                      animate: true,
                                      dateTimeFactory:
                                          const charts.LocalDateTimeFactory(),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Umidade Ambiente",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.brown),
                              ),
                              Divider(
                                thickness: 2,
                                color: Colors.brown,
                              ),
                              Container(
                                height: 250,
                                child: Observer(
                                  builder: (_) {
                                    return charts.TimeSeriesChart(
                                      store.umidAmb,
                                      animate: true,
                                      dateTimeFactory:
                                          const charts.LocalDateTimeFactory(),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
            ),
            Positioned(
              child: ListTile(
                selected: true,
                selectedTileColor: Colors.brown,
                leading: Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
                title: Observer(builder: (_) {
                  return Text(
                    "${store.pNome}",
                    style: TextStyle(color: Colors.white),
                  );
                }),
                subtitle: Observer(builder: (_) {
                  return Text(
                    "${store.periodo}",
                    style: TextStyle(color: Colors.white70),
                  );
                }),
                onTap: () => store.setPeriodo(context),
              ),
            ),
          ],
        ),
        onRefresh: () => store.getData());
  }
}

import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter/material.dart';
import 'package:solotec/stores/dados_store.dart';

class DadosPage extends StatelessWidget {
  const DadosPage(this.store, {Key? key}) : super(key: key);

  final DadosStore store;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        ListTile(
          selected: true,
          selectedTileColor: Colors.brown,
          leading: Icon(
            Icons.calendar_today,
            color: Colors.white,
          ),
          title: Text(
            "Últimas 24h",
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            "03/10/2021 - 04/10/2021",
            style: TextStyle(color: Colors.white70),
          ),
        ),
        ListView(
          padding: EdgeInsets.all(15),
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
                    "Umidade do Ar",
                    style: TextStyle(fontSize: 20, color: Colors.brown),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.brown,
                  ),
                  SimpleTimeSeriesChart.withSampleData(),
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
                    style: TextStyle(fontSize: 20, color: Colors.brown),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.brown,
                  ),
                  SimpleTimeSeriesChart.withSampleData(),
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool? animate;

  SimpleTimeSeriesChart(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory SimpleTimeSeriesChart.withSampleData() {
    return new SimpleTimeSeriesChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      child: new charts.TimeSeriesChart(
        seriesList as List<charts.Series<dynamic, DateTime>>,
        animate: animate,
        // Optionally pass in a [DateTimeFactory] used by the chart. The factory
        // should create the same type of [DateTime] as the data provided. If none
        // specified, the default creates local date time.
        dateTimeFactory: const charts.LocalDateTimeFactory(),
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2017, 9, 19), 5),
      new TimeSeriesSales(new DateTime(2017, 9, 26), 25),
      new TimeSeriesSales(new DateTime(2017, 10, 3), 100),
      new TimeSeriesSales(new DateTime(2017, 10, 10), 75),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.brown),
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}

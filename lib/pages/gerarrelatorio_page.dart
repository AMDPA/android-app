import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:solotec/stores/gerarrelatorio_store.dart';

class GerarRelatorioPage extends StatelessWidget {
  const GerarRelatorioPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            systemNavigationBarColor: Color(0xffffffff),
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarColor: Color(0xff612B02),
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light),
        child: Provider<GerarRelatorioStore>(
          create: (_) => GerarRelatorioStore(),
          child: Consumer<GerarRelatorioStore>(
            builder: (context, store, _) {
              return Scaffold(
                  key: store.scaffold,
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Color(0xff612B02),
                    title: Text(
                      "Novo Relatório",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  body: ListView(
                    padding: EdgeInsets.all(15),
                    children: [
                      Form(
                          key: store.form,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: store.desc,
                                decoration:
                                    InputDecoration(labelText: 'Descrição'),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Preencha esse campo";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              Observer(builder: (_) {
                                return TextFormField(
                                  onTap: () async {
                                    store.getI = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        initialDatePickerMode:
                                            DatePickerMode.day,
                                        firstDate: DateTime(2020),
                                        lastDate: DateTime.now());
                                    if (store.getI != null) {
                                      final df = new DateFormat('dd/MM/yyyy');
                                      store.dataI.text = df.format(store.getI);
                                    }
                                  },
                                  enabled: true,
                                  controller: store.dataI,
                                  decoration: InputDecoration(
                                      labelText: 'Data Inicial'),
                                  validator: (value) {
                                    if (store.getI == null) {
                                      return 'Preencha esse campo';
                                    } else if (store.getI != null) {
                                      if (store.getI.isAfter(store.getF)) {
                                        return 'A data inicial deve ser menor que a data final';
                                      }
                                    }
                                    return null;
                                  },
                                );
                              }),
                              Observer(builder: (_) {
                                return TextFormField(
                                  onTap: () async {
                                    store.hhoraI = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    );
                                    if (store.hhoraI != null) {
                                      store.horaI.text =
                                          "${store.hhoraI.hour}:${store.hhoraI.minute}";
                                    }
                                  },
                                  controller: store.horaI,
                                  decoration: InputDecoration(
                                      labelText: 'Hora Inicial'),
                                  validator: (value) {
                                    if (store.hhoraI == null) {
                                      return 'Preencha esse campo';
                                    }
                                    return null;
                                  },
                                );
                              }),
                              Observer(builder: (_) {
                                return TextFormField(
                                  onTap: () async {
                                    store.getF = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        initialDatePickerMode:
                                            DatePickerMode.day,
                                        firstDate: DateTime(2020),
                                        lastDate: DateTime.now());
                                    if (store.getF != null) {
                                      final df = new DateFormat('dd/MM/yyyy');
                                      store.dataF.text = df.format(store.getF);
                                    }
                                  },
                                  controller: store.dataF,
                                  decoration:
                                      InputDecoration(labelText: 'Data final'),
                                  validator: (value) {
                                    if (store.getF == null) {
                                      return 'Preencha esse campo';
                                    } else if (store.getF != null) {
                                      if (store.getF.isBefore(store.getI)) {
                                        return 'A data final deve ser maior que a data inicial';
                                      }
                                    }
                                    return null;
                                  },
                                );
                              }),
                              Observer(builder: (_) {
                                return TextFormField(
                                  onTap: () async {
                                    store.hhoraF = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    );
                                    if (store.hhoraF != null) {
                                      store.horaF.text =
                                          "${store.hhoraF.hour}:${store.hhoraF.minute}";
                                    }
                                  },
                                  controller: store.horaF,
                                  decoration:
                                      InputDecoration(labelText: 'Hora final'),
                                  validator: (value) {
                                    if (store.hhoraF == null) {
                                      return 'Preencha esse campo';
                                    }

                                    return null;
                                  },
                                );
                              }),
                            ],
                          )),
                      ElevatedButton(
                          onPressed: () {
                            if (store.form.currentState.validate()) {
                              store.gerar();
                            }
                          },
                          child: Text('GERAR')),
                    ],
                  ));
            },
          ),
        ));
  }
}

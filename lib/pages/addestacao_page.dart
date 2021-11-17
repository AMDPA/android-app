import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:solotec/constants/enuns.dart';
import 'package:solotec/stores/addestacao_store.dart';

class AddEstacaoPage extends StatelessWidget {
  const AddEstacaoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xffffffff),
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light),
      child: Provider<AddEstacaoStore>(
        create: (_) => AddEstacaoStore(),
        child: Consumer<AddEstacaoStore>(
          builder: (context, store, _) {
            return Scaffold(
              key: store.scaffold,
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text(
                  "Nova Estação",
                  style: TextStyle(color: Colors.brown),
                ),
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.of(context).pop()),
              ),
              body: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Observer(builder: (_) {
                        return Stepper(
                            type: StepperType.vertical,
                            physics: ScrollPhysics(),
                            currentStep: store.currentStep,
                            onStepTapped: (step) => store.tapped(step),
                            onStepContinue: store.continued,
                            onStepCancel: store.cancel,
                            controlsBuilder: (context,
                                {onStepCancel, onStepContinue}) {
                              return Observer(builder: (_) {
                                return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: store.currentStep == 0
                                        ? [
                                            Container(
                                              width: 10,
                                            ),
                                            ElevatedButton(
                                                onPressed: onStepContinue,
                                                child: Text('PRÓXIMO')),
                                          ]
                                        : (store.currentStep == 1
                                            ? [
                                                OutlinedButton(
                                                    onPressed: onStepCancel,
                                                    child: Text('ANTERIOR')),
                                                Container(
                                                  width: 10,
                                                )
                                              ]
                                            : [
                                                OutlinedButton(
                                                    onPressed: onStepCancel,
                                                    child: Text('ANTERIOR')),
                                                Observer(builder: (_) {
                                                  return ElevatedButton(
                                                      onPressed: onStepContinue,
                                                      child:
                                                          store.currentStep == 3
                                                              ? Text(
                                                                  'FINALIZAR')
                                                              : Text(
                                                                  'PRÓXIMO'));
                                                }),
                                              ]));
                              });
                            },
                            steps: [
                              Step(
                                  isActive: store.currentStep >= 0,
                                  state: store.currentStep >= 0
                                      ? StepState.complete
                                      : StepState.disabled,
                                  title: Text('Info'),
                                  content: ListView(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    children: [
                                      Text(
                                          'Bem vindo a configuração de estações.\nO processo de adição é bem prático!'),
                                      Text(
                                          'Para configurar o dispositivo, primeiro precisamos nos conectar a ele. Para isso: '),
                                      ListTile(
                                        leading: Text('1.'),
                                        title: Text(
                                          'Certifique-se de estar próximo a estação. ',
                                        ),
                                        subtitle: Text(
                                            'É necessário para manipular o dispositivo.'),
                                      ),
                                      ListTile(
                                        leading: Text('2.'),
                                        title: Text(
                                            'Pressione o botão de inicialização AP e aguarde 30 segundos'),
                                        subtitle: Text(
                                            'Isso permite a conexão com o dispositivo.'),
                                      ),
                                    ],
                                  )),
                              Step(
                                  isActive: store.currentStep >= 0,
                                  state: store.currentStep >= 1
                                      ? StepState.complete
                                      : StepState.disabled,
                                  title: Text('Conectando'),
                                  content: ListView(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    children: [
                                      Observer(
                                        builder: (_) {
                                          return (!store.redeSel
                                              ? Column(children: [
                                                  Text(
                                                      'Abra as configurações de Wi-Fi do dispositivo e conecte-se a rede referente a estação.'),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () =>
                                                          store.configTappet(),
                                                      child: Text(
                                                          "IR PARA CONFIGURAÇÕES")),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ])
                                              : Container());
                                        },
                                      ),
                                      Observer(
                                        builder: (_) {
                                          return store.redeSel
                                              ? Column(children: [
                                                  Text(
                                                      'Antes de prosseguir vamos validar a rede:'),
                                                  ListTile(
                                                    title: Text(store
                                                        .redeModel!.wifiName!),
                                                    subtitle: Text(store
                                                        .redeModel!
                                                        .wifiGateway!),
                                                  ),
                                                  CircularProgressIndicator(),
                                                ])
                                              : Container();
                                        },
                                      ),
                                    ],
                                  )),
                              Step(
                                  isActive: store.currentStep >= 0,
                                  state: store.currentStep >= 2
                                      ? StepState.complete
                                      : StepState.disabled,
                                  title: Text('Customizando'),
                                  content: ListView(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    children: [
                                      Text(
                                          'Agora vamos deixar a estação pronta para uso'),
                                      Divider(),
                                      Form(
                                          key: store.form,
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                controller: store.nomeEstacao,
                                                decoration: InputDecoration(
                                                    labelText:
                                                        'Nome para a estação'),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Preencha esse campo';
                                                  }
                                                  return null;
                                                },
                                              ),
                                              TextFormField(
                                                controller: store.descEstacao,
                                                decoration: InputDecoration(
                                                    labelText:
                                                        'Descrição da estação'),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Preencha esse campo';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ],
                                          ))
                                    ],
                                  )),
                              Step(
                                  isActive: store.currentStep >= 0,
                                  state: store.currentStep >= 3
                                      ? StepState.complete
                                      : StepState.disabled,
                                  title: Text('Configurando'),
                                  content: ListView(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    children: [
                                      Text('Modo operacional'),
                                      ListTile(
                                        enabled: false,
                                        onTap: () => store.modoOpTapped(
                                            ModoOperacionalEstacao.Local),
                                        leading: Observer(builder: (_) {
                                          return Radio<ModoOperacionalEstacao>(
                                              value: ModoOperacionalEstacao
                                                  .Local,
                                              groupValue: store.operacEstacao,
                                              onChanged:
                                                  (ModoOperacionalEstacao?
                                                          value) =>
                                                      store
                                                          .modoOpTapped(value));
                                        }),
                                        title: Text('Local'),
                                        subtitle: Text(
                                            'Nesse modo, a estação é executada localmente e é necessario ativar o AP toda vez que quiser transmitir informações. Ideal para locais sem acesso a rede WiFi.'),
                                      ),
                                      ListTile(
                                        onTap: () => store.modoOpTapped(
                                            ModoOperacionalEstacao.Remoto),
                                        leading: Observer(builder: (_) {
                                          return Radio<ModoOperacionalEstacao>(
                                              value: ModoOperacionalEstacao
                                                  .Remoto,
                                              groupValue: store.operacEstacao,
                                              onChanged:
                                                  (ModoOperacionalEstacao?
                                                          value) =>
                                                      store
                                                          .modoOpTapped(value));
                                        }),
                                        title: Text('Remoto'),
                                        subtitle: Text(
                                            'Nesse modo, a estação é executada remotamente submetendo informações sempre que necessário. É Preciso uma conectiviade ativa com a internet atráves de uma rede WiFi'),
                                      ),
                                      Divider(),
                                      Text('Informações de rede'),
                                      Observer(
                                        builder: (_) {
                                          return (store.operacEstacao ==
                                                  ModoOperacionalEstacao.Remoto)
                                              ? Form(
                                                  key: store.form1,
                                                  child: Column(
                                                    children: [
                                                      Observer(builder: (_) {
                                                        return TextFormField(
                                                          controller:
                                                              store.ssidEstacao,
                                                          decoration: InputDecoration(
                                                              labelText: (store
                                                                          .operacEstacao ==
                                                                      ModoOperacionalEstacao
                                                                          .Remoto
                                                                  ? 'Digite o Nome da sua rede WiFi'
                                                                  : 'Digite o Nome para o AP')),
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Preencha esse campo';
                                                            }
                                                            return null;
                                                          },
                                                        );
                                                      }),
                                                      Observer(builder: (_) {
                                                        return TextFormField(
                                                          controller:
                                                              store.passEstacao,
                                                          decoration: InputDecoration(
                                                              labelText: (store
                                                                          .operacEstacao ==
                                                                      ModoOperacionalEstacao
                                                                          .Remoto
                                                                  ? 'Digite a Senha da sua rede WiFi'
                                                                  : 'Digite a Senha para o AP')),
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Preencha esse campo';
                                                            } else if (value
                                                                        .length <
                                                                    8 ||
                                                                value.length >
                                                                    15) {
                                                              return 'Insira uma senha com 08 a 15 caracteres';
                                                            }
                                                            return null;
                                                          },
                                                        );
                                                      }),
                                                    ],
                                                  ))
                                              : Container();
                                        },
                                      ),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ))
                            ]);
                      }),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:solotec/app.dart';
import 'package:solotec/pages/auth_page.dart';
import 'package:solotec/services/permissoes.dart';
import 'package:solotec/stores/auth_store.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PermissoesManage().verifiquePermission();
    return MultiProvider(
      providers: [
        Provider<AuthStore>(
          create: (_) => AuthStore(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [const Locale('pt', 'BR')],
        title: 'SoloTech',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: Consumer<AuthStore>(
          builder: (context, store, _) {
            return Observer(
              builder: (_) {
                if (store.autenticated!) {
                  return App();
                } else {
                  return AuthPage();
                }
              },
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:solotec/stores/perfil_store.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);

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
        child: Provider<PerfilStore>(
          create: (_) => PerfilStore(),
          child: Consumer<PerfilStore>(
            builder: (context, store, _) {
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Color(0xff612B02),
                  title: Text(
                    "Perfil",
                    style: TextStyle(color: Colors.white),
                  ),
                  /* actions: [
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],*/
                ),
                body: ListView(
                  padding: EdgeInsets.all(15),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    ListTile(
                      title: Text(store.nome!),
                      subtitle: Text('Nome'),
                    ),
                    ListTile(
                      title: Text(store.email!),
                      subtitle: Text('E-mail'),
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}

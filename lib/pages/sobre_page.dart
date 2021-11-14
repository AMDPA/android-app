import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({Key? key}) : super(key: key);

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
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff612B02),
          title: Text(
            "Sobre o aplicativo",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            ListTile(
              leading: Image.asset(
                "assets/icons/app.png",
              ),
              title: Text(
                "SoloTech",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              subtitle: Text(
                "Versão: 1.0.0",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "O SoloTech é um aplicativo indispensável para comunicação com a mine estação desenvolvida num projeto de Iniciação Cientifíca pelo Instituto Federal do Espirito Santo, Campus de Alegre, em parceria com a FAPES. O mesmo que foi desenvolvido como Projeto Integrador sendo parte do requisito para finalização do curso Técnico em Informática.",
              style: TextStyle(
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              title: Text("Contrato de licença usuario final"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Politica de privacidade"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Códigos de terceiros"),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}

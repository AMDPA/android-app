import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solotec/models/estacao_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solotec/pages/addestacao_page.dart';
import 'package:solotec/services/firestore.dart';

class VerEstacaoPage extends StatelessWidget {
  const VerEstacaoPage(this.model, {Key? key}) : super(key: key);

  final EstacaoModel model;

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
            "Ver Estação",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => AddEstacaoPage(estModel: model)),
                );
                Navigator.of(context).pop();
              },
            ),
            /*IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content:
                          Text("Tem certeza que deseja remover essa estação? "),
                      actions: [
                        ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('NÃO')),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              FirestoreManage.deleteEstacao(model);
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            child: Text('SIM')),
                      ],
                    );
                  },
                );
              },
            )*/
          ],
        ),
        body: ListView(
          children: [
            Container(
              height: 200,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                      model.local!.latitude ?? 0, model.local!.longitude ?? 0),
                  zoom: 20.0,
                ),
                compassEnabled: false,
                mapToolbarEnabled: false,
                rotateGesturesEnabled: false,
                scrollGesturesEnabled: false,
                zoomControlsEnabled: false,
                zoomGesturesEnabled: false,
                myLocationButtonEnabled: false,
                mapType: MapType.satellite,
                markers: {
                  Marker(
                      markerId: MarkerId(model.local!.altitute.toString()),
                      position: LatLng(model.local!.latitude ?? 0,
                          model.local!.longitude ?? 0),
                      infoWindow: InfoWindow(
                          title: model.name, snippet: model.description),
                      icon: BitmapDescriptor.defaultMarker)
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              title: Text(model.name as String),
              subtitle: Text("Nome da Estação"),
            ),
            ListTile(
              title: Text(model.description as String),
              subtitle: Text("Descrição da Estação"),
            ),
            ListTile(
              title: Text((model.isRemote as bool) ? "Remoto" : "Local"),
              subtitle: Text("Modo Operacional"),
            ),
            (model.isRemote as bool)
                ? ListTile(
                    title: Text(model.localRede!.ssid as String),
                    subtitle: Text("Rede Conectada"),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

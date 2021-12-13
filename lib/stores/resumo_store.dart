import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:solotec/models/medicoes_model.dart';
import 'package:solotec/services/firestore.dart';
part 'resumo_store.g.dart';

class ResumoStore = _ResumoStoreBase with _$ResumoStore;

abstract class _ResumoStoreBase with Store {
  _ResumoStoreBase() {
    getData();
  }
  @observable
  bool load = false;

  @observable
  String? atualizado = "Nunca";

  @observable
  double? ambienteTemperatura = 0;

  @observable
  double? ambienteUmidade = 0;

  @observable
  double? ambienteSensacao = 0;

  @observable
  double? soloTemperatura = 0;

  @observable
  double? soloUmidade = 0;

  @observable
  List<MedicoesModel> ultimasMedicoes = <MedicoesModel>[];

  getData() async {
    load = true;
    ultimasMedicoes = <MedicoesModel>[];
    await FirestoreManage.getUltimaMedicao()
        .then((value) => ultimasMedicoes.addAll(value));

    ambienteTemperatura = ultimasMedicoes[0].dht11Temperatura;
    ambienteUmidade = ultimasMedicoes[0].dht11Umidade;
    ambienteSensacao = ultimasMedicoes[0].dht11IndiceCalor;

    soloTemperatura = ultimasMedicoes[0].a18b20Temperatura;
    soloUmidade = ultimasMedicoes[0].soilmoistureUmidade;
    int h = ultimasMedicoes[0].hora! * 1000;

    DateTime data = DateTime.fromMillisecondsSinceEpoch(h);
    final df = new DateFormat('dd/MM/yyyy HH:mm ');
    atualizado = df.format(data);

    load = false;
  }
}

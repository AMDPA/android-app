import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solotec/models/estacao_model.dart';

class FirestoreManage {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  CollectionReference<EstacaoModel> getC(
      String usuarioUiid, String doc, String colection) {
    return _db
        .collection(usuarioUiid)
        .doc(doc)
        .collection(colection)
        .withConverter(
            fromFirestore: (json, _) => EstacaoModel.fromJson(json.data()),
            toFirestore: (EstacaoModel json, _) => json.toJson());
  }
}

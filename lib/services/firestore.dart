import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solotec/models/estacao_model.dart';

class FirestoreManage {
  FirestoreManage._();
  static FirebaseFirestore _db = FirebaseFirestore.instance;
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> setEstacao(EstacaoModel model) async {
    await _db
        .collection(_auth.currentUser.uid)
        .doc('Estacoes')
        .collection('itens')
        .withConverter(
            fromFirestore: (json, _) => EstacaoModel.fromJson(json.data()),
            toFirestore: (EstacaoModel json, _) => json.toJson())
        .doc()
        .set(model);
  }

  static Future<List<EstacaoModel>> getEstacao() async {
    List<EstacaoModel> modelList = <EstacaoModel>[];
    await _db
        .collection(_auth.currentUser.uid)
        .doc('Estacoes')
        .collection('itens')
        .withConverter(
            fromFirestore: (json, _) => EstacaoModel.fromJson(json.data()),
            toFirestore: (EstacaoModel json, _) => json.toJson())
        .get()
        .then((value) {
      for (QueryDocumentSnapshot item in value.docs) {
        EstacaoModel m = item.data() as EstacaoModel;
        modelList.add(m);
      }
    });

    return modelList;
  }
}

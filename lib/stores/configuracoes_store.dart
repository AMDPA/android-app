import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:solotec/pages/gerenciarestacoes_page.dart';
part 'configuracoes_store.g.dart';

class ConfiguracoesStore = _ConfiguracoesStoreBase with _$ConfiguracoesStore;

abstract class _ConfiguracoesStoreBase with Store {
  _ConfiguracoesStoreBase() {
    this.anonymous = _auth.currentUser.isAnonymous;
    this.email = _auth.currentUser.email;
    var n = _auth.currentUser.displayName.split(" ").length;
    this.nome = _auth.currentUser.displayName.split(" ")[0] +
        " " +
        _auth.currentUser.displayName.split(" ")[n - 1];
    this.imagem = _auth.currentUser.photoURL;
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  bool anonymous;

  @observable
  String nome;

  @observable
  String email;

  @observable
  String imagem;

  @action
  Future<void> openGerenciarEstacoes(BuildContext context) async {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => GerenciarEstacoesPage()));
  }
}

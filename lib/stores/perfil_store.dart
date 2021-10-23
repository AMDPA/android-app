import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'perfil_store.g.dart';

class PerfilStore = _PerfilStoreBase with _$PerfilStore;

abstract class _PerfilStoreBase with Store {
  _PerfilStoreBase() {
    this.anonymous = _auth.currentUser!.isAnonymous;
    this.email = _auth.currentUser!.email;
    this.nome = _auth.currentUser!.displayName;
    this.imagem = _auth.currentUser!.photoURL;
  }
  FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  bool? anonymous;

  @observable
  String? nome;

  @observable
  String? email;

  @observable
  String? imagem;
}

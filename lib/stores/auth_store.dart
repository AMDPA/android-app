import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/material.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  _AuthStoreBase() {
    _auth.currentUser != null ? autenticated = true : autenticated = false;
  }

  final form = GlobalKey<FormState>();
  final scaffold = GlobalKey<ScaffoldState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  UserCredential? userCredential;

  @observable
  TextEditingController email = TextEditingController();

  @observable
  TextEditingController password = TextEditingController();

  @observable
  String erro = "null";

  @observable
  bool login = true;
  @observable
  bool? autenticated;

  @action
  Future<bool> logout() async {
    //_loadDialog();
    await _auth.signOut().then((_) => autenticated = false);
    if (_auth.currentUser == null) {
      //Navigator.of(scaffold.currentContext).pop();

      return true;
    }

    //Navigator.of(scaffold.currentContext).pop();

    return false;
  }

  @action
  Future<bool> signInEmail(String email, String password) async {
    erro = "null";
    _loadDialog();

    try {
      userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      Navigator.of(scaffold.currentContext!).pop();
      return true;
    } on FirebaseAuthException catch (e) {
      print("ALERT: Auth(13): " + e.code);
      if (e.code == 'user-not-found') {
        erro = "Usuario não encontrado. Tente registrar-se";
      } else if (e.code == 'wrong-password') {
        erro = "Senha incorreta. Tente novamente";
      } else if (e.code == 'unknown') {
        erro = "Erro desconhecido";
      } else {
        erro = "Estamos com problemas. Tente novamente mais tarde";
      }

      Navigator.of(scaffold.currentContext!).pop();
      return false;
    }
  }

  @action
  Future<bool> sigInGoogle() async {
    erro = "null";
    _loadDialog();

    GoogleSignInAccount? googleUser;
    GoogleSignInAuthentication googleAuth;
    var credential;

    try {
      googleUser = await GoogleSignIn().signIn();
      googleAuth = await googleUser!.authentication;
      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      userCredential = await _auth.signInWithCredential(credential);
      Navigator.of(scaffold.currentContext!).pop();
      return true;
    } catch (e) {
      print("ERR: Auth(42): " + e.toString());
      erro = "Não foi possivel autenticar-se com Google. Tente novamente";

      Navigator.of(scaffold.currentContext!).pop();
      return false;
    }
  }

  @action
  Future<bool> registerEmail(String email, String password) async {
    erro = "null";
    _loadDialog();
    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return signInEmail(email, password);
    } on FirebaseAuthException catch (e) {
      print("ALERT: Auth(13): " + e.code);

      if (e.code == 'email-already-in-use') {
        erro = "Usuario já registrado. Tente entrar";
      } else if (e.code == 'weak-password') {
        erro = "Senha muito fraca. Tente novamente";
      } else if (e.code == 'unknown') {
        erro = "Erro desconhecido";
      } else {
        erro = "Estamos com problemas. Tente novamente mais tarde";
      }

      Navigator.of(scaffold.currentContext!).pop();
      return false;
    }
  }

  Future<bool> signAnonimous() async {
    _loadDialog();

    try {
      userCredential = await _auth.signInAnonymously();
      Navigator.of(scaffold.currentContext!).pop();
      return true;
    } on FirebaseAuthException catch (e) {
      erro = "Não foi possível prosseguir";
      print(e.code);

      Navigator.of(scaffold.currentContext!).pop();
      return false;
    }
  }

/*
*
*
*
*
*/
  /// COMPLEMENTO DE NAVEGAÇÃO
  _loadDialog() {
    showDialog(
      barrierDismissible: false,
      context: scaffold.currentContext!,
      builder: (BuildContext context) {
        return LoadingDialog();
      },
    );
  }
}

class LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 6,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 10,
            ),
            Text(
              'Carregando \nPor favor aguarde.',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

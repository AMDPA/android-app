// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  final _$emailAtom = Atom(name: '_AuthStoreBase.email');

  @override
  TextEditingController get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(TextEditingController value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_AuthStoreBase.password');

  @override
  TextEditingController get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(TextEditingController value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$erroAtom = Atom(name: '_AuthStoreBase.erro');

  @override
  String get erro {
    _$erroAtom.reportRead();
    return super.erro;
  }

  @override
  set erro(String value) {
    _$erroAtom.reportWrite(value, super.erro, () {
      super.erro = value;
    });
  }

  final _$loginAtom = Atom(name: '_AuthStoreBase.login');

  @override
  bool get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(bool value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  final _$autenticatedAtom = Atom(name: '_AuthStoreBase.autenticated');

  @override
  bool get autenticated {
    _$autenticatedAtom.reportRead();
    return super.autenticated;
  }

  @override
  set autenticated(bool value) {
    _$autenticatedAtom.reportWrite(value, super.autenticated, () {
      super.autenticated = value;
    });
  }

  final _$logoutAsyncAction = AsyncAction('_AuthStoreBase.logout');

  @override
  Future<bool> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$signInEmailAsyncAction = AsyncAction('_AuthStoreBase.signInEmail');

  @override
  Future<bool> signInEmail(String email, String password) {
    return _$signInEmailAsyncAction
        .run(() => super.signInEmail(email, password));
  }

  final _$sigInGoogleAsyncAction = AsyncAction('_AuthStoreBase.sigInGoogle');

  @override
  Future<bool> sigInGoogle() {
    return _$sigInGoogleAsyncAction.run(() => super.sigInGoogle());
  }

  final _$registerEmailAsyncAction =
      AsyncAction('_AuthStoreBase.registerEmail');

  @override
  Future<bool> registerEmail(String email, String password) {
    return _$registerEmailAsyncAction
        .run(() => super.registerEmail(email, password));
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
erro: ${erro},
login: ${login},
autenticated: ${autenticated}
    ''';
  }
}

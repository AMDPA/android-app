// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilStore on _PerfilStoreBase, Store {
  final _$anonymousAtom = Atom(name: '_PerfilStoreBase.anonymous');

  @override
  bool get anonymous {
    _$anonymousAtom.reportRead();
    return super.anonymous;
  }

  @override
  set anonymous(bool value) {
    _$anonymousAtom.reportWrite(value, super.anonymous, () {
      super.anonymous = value;
    });
  }

  final _$nomeAtom = Atom(name: '_PerfilStoreBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$emailAtom = Atom(name: '_PerfilStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$imagemAtom = Atom(name: '_PerfilStoreBase.imagem');

  @override
  String get imagem {
    _$imagemAtom.reportRead();
    return super.imagem;
  }

  @override
  set imagem(String value) {
    _$imagemAtom.reportWrite(value, super.imagem, () {
      super.imagem = value;
    });
  }

  @override
  String toString() {
    return '''
anonymous: ${anonymous},
nome: ${nome},
email: ${email},
imagem: ${imagem}
    ''';
  }
}

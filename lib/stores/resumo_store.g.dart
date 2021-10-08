// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resumo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResumoStore on _ResumoStoreBase, Store {
  final _$atualizadoAtom = Atom(name: '_ResumoStoreBase.atualizado');

  @override
  String get atualizado {
    _$atualizadoAtom.reportRead();
    return super.atualizado;
  }

  @override
  set atualizado(String value) {
    _$atualizadoAtom.reportWrite(value, super.atualizado, () {
      super.atualizado = value;
    });
  }

  @override
  String toString() {
    return '''
atualizado: ${atualizado}
    ''';
  }
}

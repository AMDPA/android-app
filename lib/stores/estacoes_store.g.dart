// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estacoes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EstacoesStore on _EstacoesStoreBase, Store {
  final _$estatAtom = Atom(name: '_EstacoesStoreBase.estat');

  @override
  List<EstacaoModel> get estat {
    _$estatAtom.reportRead();
    return super.estat;
  }

  @override
  set estat(List<EstacaoModel> value) {
    _$estatAtom.reportWrite(value, super.estat, () {
      super.estat = value;
    });
  }

  final _$atualiAtom = Atom(name: '_EstacoesStoreBase.atuali');

  @override
  bool get atuali {
    _$atualiAtom.reportRead();
    return super.atuali;
  }

  @override
  set atuali(bool value) {
    _$atualiAtom.reportWrite(value, super.atuali, () {
      super.atuali = value;
    });
  }

  final _$getEstacoesAsyncAction =
      AsyncAction('_EstacoesStoreBase.getEstacoes');

  @override
  Future getEstacoes() {
    return _$getEstacoesAsyncAction.run(() => super.getEstacoes());
  }

  final _$openAddEstacoesAsyncAction =
      AsyncAction('_EstacoesStoreBase.openAddEstacoes');

  @override
  Future openAddEstacoes(BuildContext context) {
    return _$openAddEstacoesAsyncAction
        .run(() => super.openAddEstacoes(context));
  }

  final _$openVerEstacoesAsyncAction =
      AsyncAction('_EstacoesStoreBase.openVerEstacoes');

  @override
  Future openVerEstacoes(BuildContext context, int i) {
    return _$openVerEstacoesAsyncAction
        .run(() => super.openVerEstacoes(context, i));
  }

  @override
  String toString() {
    return '''
estat: ${estat},
atuali: ${atuali}
    ''';
  }
}

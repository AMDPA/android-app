// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addestacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddEstacaoStore on _AddEstacaoStoreBase, Store {
  final _$currentStepAtom = Atom(name: '_AddEstacaoStoreBase.currentStep');

  @override
  int get currentStep {
    _$currentStepAtom.reportRead();
    return super.currentStep;
  }

  @override
  set currentStep(int value) {
    _$currentStepAtom.reportWrite(value, super.currentStep, () {
      super.currentStep = value;
    });
  }

  final _$redesAtom = Atom(name: '_AddEstacaoStoreBase.redes');

  @override
  List<WifiNetwork> get redes {
    _$redesAtom.reportRead();
    return super.redes;
  }

  @override
  set redes(List<WifiNetwork> value) {
    _$redesAtom.reportWrite(value, super.redes, () {
      super.redes = value;
    });
  }

  final _$nomeEstacaoAtom = Atom(name: '_AddEstacaoStoreBase.nomeEstacao');

  @override
  TextEditingController get nomeEstacao {
    _$nomeEstacaoAtom.reportRead();
    return super.nomeEstacao;
  }

  @override
  set nomeEstacao(TextEditingController value) {
    _$nomeEstacaoAtom.reportWrite(value, super.nomeEstacao, () {
      super.nomeEstacao = value;
    });
  }

  final _$descEstacaoAtom = Atom(name: '_AddEstacaoStoreBase.descEstacao');

  @override
  TextEditingController get descEstacao {
    _$descEstacaoAtom.reportRead();
    return super.descEstacao;
  }

  @override
  set descEstacao(TextEditingController value) {
    _$descEstacaoAtom.reportWrite(value, super.descEstacao, () {
      super.descEstacao = value;
    });
  }

  final _$ssidEstacaoAtom = Atom(name: '_AddEstacaoStoreBase.ssidEstacao');

  @override
  TextEditingController get ssidEstacao {
    _$ssidEstacaoAtom.reportRead();
    return super.ssidEstacao;
  }

  @override
  set ssidEstacao(TextEditingController value) {
    _$ssidEstacaoAtom.reportWrite(value, super.ssidEstacao, () {
      super.ssidEstacao = value;
    });
  }

  final _$passEstacaoAtom = Atom(name: '_AddEstacaoStoreBase.passEstacao');

  @override
  TextEditingController get passEstacao {
    _$passEstacaoAtom.reportRead();
    return super.passEstacao;
  }

  @override
  set passEstacao(TextEditingController value) {
    _$passEstacaoAtom.reportWrite(value, super.passEstacao, () {
      super.passEstacao = value;
    });
  }

  final _$operacEstacaoAtom = Atom(name: '_AddEstacaoStoreBase.operacEstacao');

  @override
  ModoOperacionalEstacao get operacEstacao {
    _$operacEstacaoAtom.reportRead();
    return super.operacEstacao;
  }

  @override
  set operacEstacao(ModoOperacionalEstacao value) {
    _$operacEstacaoAtom.reportWrite(value, super.operacEstacao, () {
      super.operacEstacao = value;
    });
  }

  final _$posiEstacaoAtom = Atom(name: '_AddEstacaoStoreBase.posiEstacao');

  @override
  Position get posiEstacao {
    _$posiEstacaoAtom.reportRead();
    return super.posiEstacao;
  }

  @override
  set posiEstacao(Position value) {
    _$posiEstacaoAtom.reportWrite(value, super.posiEstacao, () {
      super.posiEstacao = value;
    });
  }

  final _$redeTappedAsyncAction =
      AsyncAction('_AddEstacaoStoreBase.redeTapped');

  @override
  Future redeTapped(int t) {
    return _$redeTappedAsyncAction.run(() => super.redeTapped(t));
  }

  final _$_AddEstacaoStoreBaseActionController =
      ActionController(name: '_AddEstacaoStoreBase');

  @override
  dynamic modoOpTapped(ModoOperacionalEstacao op) {
    final _$actionInfo = _$_AddEstacaoStoreBaseActionController.startAction(
        name: '_AddEstacaoStoreBase.modoOpTapped');
    try {
      return super.modoOpTapped(op);
    } finally {
      _$_AddEstacaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic tapped(int steep) {
    final _$actionInfo = _$_AddEstacaoStoreBaseActionController.startAction(
        name: '_AddEstacaoStoreBase.tapped');
    try {
      return super.tapped(steep);
    } finally {
      _$_AddEstacaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic continued() {
    final _$actionInfo = _$_AddEstacaoStoreBaseActionController.startAction(
        name: '_AddEstacaoStoreBase.continued');
    try {
      return super.continued();
    } finally {
      _$_AddEstacaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic cancel() {
    final _$actionInfo = _$_AddEstacaoStoreBaseActionController.startAction(
        name: '_AddEstacaoStoreBase.cancel');
    try {
      return super.cancel();
    } finally {
      _$_AddEstacaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentStep: ${currentStep},
redes: ${redes},
nomeEstacao: ${nomeEstacao},
descEstacao: ${descEstacao},
ssidEstacao: ${ssidEstacao},
passEstacao: ${passEstacao},
operacEstacao: ${operacEstacao},
posiEstacao: ${posiEstacao}
    ''';
  }
}

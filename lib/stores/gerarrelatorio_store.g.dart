// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gerarrelatorio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GerarRelatorioStore on _GerarRelatorioStoreBase, Store {
  final _$progressAtom = Atom(name: '_GerarRelatorioStoreBase.progress');

  @override
  double get progress {
    _$progressAtom.reportRead();
    return super.progress;
  }

  @override
  set progress(double value) {
    _$progressAtom.reportWrite(value, super.progress, () {
      super.progress = value;
    });
  }

  final _$dataIAtom = Atom(name: '_GerarRelatorioStoreBase.dataI');

  @override
  TextEditingController get dataI {
    _$dataIAtom.reportRead();
    return super.dataI;
  }

  @override
  set dataI(TextEditingController value) {
    _$dataIAtom.reportWrite(value, super.dataI, () {
      super.dataI = value;
    });
  }

  final _$dataFAtom = Atom(name: '_GerarRelatorioStoreBase.dataF');

  @override
  TextEditingController get dataF {
    _$dataFAtom.reportRead();
    return super.dataF;
  }

  @override
  set dataF(TextEditingController value) {
    _$dataFAtom.reportWrite(value, super.dataF, () {
      super.dataF = value;
    });
  }

  final _$horaIAtom = Atom(name: '_GerarRelatorioStoreBase.horaI');

  @override
  TextEditingController get horaI {
    _$horaIAtom.reportRead();
    return super.horaI;
  }

  @override
  set horaI(TextEditingController value) {
    _$horaIAtom.reportWrite(value, super.horaI, () {
      super.horaI = value;
    });
  }

  final _$horaFAtom = Atom(name: '_GerarRelatorioStoreBase.horaF');

  @override
  TextEditingController get horaF {
    _$horaFAtom.reportRead();
    return super.horaF;
  }

  @override
  set horaF(TextEditingController value) {
    _$horaFAtom.reportWrite(value, super.horaF, () {
      super.horaF = value;
    });
  }

  final _$gerarAsyncAction = AsyncAction('_GerarRelatorioStoreBase.gerar');

  @override
  Future gerar() {
    return _$gerarAsyncAction.run(() => super.gerar());
  }

  @override
  String toString() {
    return '''
progress: ${progress},
dataI: ${dataI},
dataF: ${dataF},
horaI: ${horaI},
horaF: ${horaF}
    ''';
  }
}

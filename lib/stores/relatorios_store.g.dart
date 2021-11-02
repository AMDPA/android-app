// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relatorios_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RelatoriosStore on _RelatoriosStoreBase, Store {
  final _$loadAtom = Atom(name: '_RelatoriosStoreBase.load');

  @override
  bool get load {
    _$loadAtom.reportRead();
    return super.load;
  }

  @override
  set load(bool value) {
    _$loadAtom.reportWrite(value, super.load, () {
      super.load = value;
    });
  }

  final _$modelRAtom = Atom(name: '_RelatoriosStoreBase.modelR');

  @override
  List<RelatoriosModel> get modelR {
    _$modelRAtom.reportRead();
    return super.modelR;
  }

  @override
  set modelR(List<RelatoriosModel> value) {
    _$modelRAtom.reportWrite(value, super.modelR, () {
      super.modelR = value;
    });
  }

  final _$modelDAtom = Atom(name: '_RelatoriosStoreBase.modelD');

  @override
  List<int> get modelD {
    _$modelDAtom.reportRead();
    return super.modelD;
  }

  @override
  set modelD(List<int> value) {
    _$modelDAtom.reportWrite(value, super.modelD, () {
      super.modelD = value;
    });
  }

  final _$progressAtom = Atom(name: '_RelatoriosStoreBase.progress');

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

  final _$criarRelatorioAsyncAction =
      AsyncAction('_RelatoriosStoreBase.criarRelatorio');

  @override
  Future criarRelatorio(BuildContext context) {
    return _$criarRelatorioAsyncAction.run(() => super.criarRelatorio(context));
  }

  final _$openRelatorioAsyncAction =
      AsyncAction('_RelatoriosStoreBase.openRelatorio');

  @override
  Future openRelatorio(int i, BuildContext ctx) {
    return _$openRelatorioAsyncAction.run(() => super.openRelatorio(i, ctx));
  }

  @override
  String toString() {
    return '''
load: ${load},
modelR: ${modelR},
modelD: ${modelD},
progress: ${progress}
    ''';
  }
}

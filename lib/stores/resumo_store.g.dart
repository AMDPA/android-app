// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resumo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResumoStore on _ResumoStoreBase, Store {
  final _$loadAtom = Atom(name: '_ResumoStoreBase.load');

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

  final _$atualizadoAtom = Atom(name: '_ResumoStoreBase.atualizado');

  @override
  String? get atualizado {
    _$atualizadoAtom.reportRead();
    return super.atualizado;
  }

  @override
  set atualizado(String? value) {
    _$atualizadoAtom.reportWrite(value, super.atualizado, () {
      super.atualizado = value;
    });
  }

  final _$ambienteTemperaturaAtom =
      Atom(name: '_ResumoStoreBase.ambienteTemperatura');

  @override
  double? get ambienteTemperatura {
    _$ambienteTemperaturaAtom.reportRead();
    return super.ambienteTemperatura;
  }

  @override
  set ambienteTemperatura(double? value) {
    _$ambienteTemperaturaAtom.reportWrite(value, super.ambienteTemperatura, () {
      super.ambienteTemperatura = value;
    });
  }

  final _$ambienteUmidadeAtom = Atom(name: '_ResumoStoreBase.ambienteUmidade');

  @override
  double? get ambienteUmidade {
    _$ambienteUmidadeAtom.reportRead();
    return super.ambienteUmidade;
  }

  @override
  set ambienteUmidade(double? value) {
    _$ambienteUmidadeAtom.reportWrite(value, super.ambienteUmidade, () {
      super.ambienteUmidade = value;
    });
  }

  final _$ambienteSensacaoAtom =
      Atom(name: '_ResumoStoreBase.ambienteSensacao');

  @override
  double? get ambienteSensacao {
    _$ambienteSensacaoAtom.reportRead();
    return super.ambienteSensacao;
  }

  @override
  set ambienteSensacao(double? value) {
    _$ambienteSensacaoAtom.reportWrite(value, super.ambienteSensacao, () {
      super.ambienteSensacao = value;
    });
  }

  final _$soloTemperaturaAtom = Atom(name: '_ResumoStoreBase.soloTemperatura');

  @override
  double? get soloTemperatura {
    _$soloTemperaturaAtom.reportRead();
    return super.soloTemperatura;
  }

  @override
  set soloTemperatura(double? value) {
    _$soloTemperaturaAtom.reportWrite(value, super.soloTemperatura, () {
      super.soloTemperatura = value;
    });
  }

  final _$soloUmidadeAtom = Atom(name: '_ResumoStoreBase.soloUmidade');

  @override
  double? get soloUmidade {
    _$soloUmidadeAtom.reportRead();
    return super.soloUmidade;
  }

  @override
  set soloUmidade(double? value) {
    _$soloUmidadeAtom.reportWrite(value, super.soloUmidade, () {
      super.soloUmidade = value;
    });
  }

  final _$ultimasMedicoesAtom = Atom(name: '_ResumoStoreBase.ultimasMedicoes');

  @override
  List<MedicoesModel> get ultimasMedicoes {
    _$ultimasMedicoesAtom.reportRead();
    return super.ultimasMedicoes;
  }

  @override
  set ultimasMedicoes(List<MedicoesModel> value) {
    _$ultimasMedicoesAtom.reportWrite(value, super.ultimasMedicoes, () {
      super.ultimasMedicoes = value;
    });
  }

  final _$seriesAtom = Atom(name: '_ResumoStoreBase.series');

  @override
  List<charts.Series<MedicoesModel, DateTime>> get series {
    _$seriesAtom.reportRead();
    return super.series;
  }

  @override
  set series(List<charts.Series<MedicoesModel, DateTime>> value) {
    _$seriesAtom.reportWrite(value, super.series, () {
      super.series = value;
    });
  }

  @override
  String toString() {
    return '''
load: ${load},
atualizado: ${atualizado},
ambienteTemperatura: ${ambienteTemperatura},
ambienteUmidade: ${ambienteUmidade},
ambienteSensacao: ${ambienteSensacao},
soloTemperatura: ${soloTemperatura},
soloUmidade: ${soloUmidade},
ultimasMedicoes: ${ultimasMedicoes},
series: ${series}
    ''';
  }
}

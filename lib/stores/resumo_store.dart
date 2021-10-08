import 'package:mobx/mobx.dart';
part 'resumo_store.g.dart';

class ResumoStore = _ResumoStoreBase with _$ResumoStore;

abstract class _ResumoStoreBase with Store {
  @observable
  String atualizado = "Hoje";
}

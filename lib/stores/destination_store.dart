import 'package:mobx/mobx.dart';
import 'package:solotec/constants/enuns.dart';
part 'destination_store.g.dart';

class DestinationStore = DestinationStoreBase with _$DestinationStore;

abstract class DestinationStoreBase with Store {
  static const List<Destination> destinations = Destination.values;

  @observable
  int selectedDestinationIndex = destinations.indexOf(Destination.Resumo);

  @computed
  Destination get selectedDestination => destinations[selectedDestinationIndex];

  @action
  void selectDestination(int index) {
    selectedDestinationIndex = index;
  }
}

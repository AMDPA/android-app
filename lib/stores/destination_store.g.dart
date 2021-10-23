// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DestinationStore on DestinationStoreBase, Store {
  Computed<Destination>? _$selectedDestinationComputed;

  @override
  Destination get selectedDestination => (_$selectedDestinationComputed ??=
          Computed<Destination>(() => super.selectedDestination,
              name: 'DestinationStoreBase.selectedDestination'))
      .value;

  final _$selectedDestinationIndexAtom =
      Atom(name: 'DestinationStoreBase.selectedDestinationIndex');

  @override
  int get selectedDestinationIndex {
    _$selectedDestinationIndexAtom.reportRead();
    return super.selectedDestinationIndex;
  }

  @override
  set selectedDestinationIndex(int value) {
    _$selectedDestinationIndexAtom
        .reportWrite(value, super.selectedDestinationIndex, () {
      super.selectedDestinationIndex = value;
    });
  }

  final _$DestinationStoreBaseActionController =
      ActionController(name: 'DestinationStoreBase');

  @override
  void selectDestination(int index) {
    final _$actionInfo = _$DestinationStoreBaseActionController.startAction(
        name: 'DestinationStoreBase.selectDestination');
    try {
      return super.selectDestination(index);
    } finally {
      _$DestinationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedDestinationIndex: ${selectedDestinationIndex},
selectedDestination: ${selectedDestination}
    ''';
  }
}

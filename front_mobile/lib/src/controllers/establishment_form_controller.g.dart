// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'establishment_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EstablishmentFormController on _EstablishmentFormControllerBase, Store {
  final _$nameAtom = Atom(name: '_EstablishmentFormControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$latAtom = Atom(name: '_EstablishmentFormControllerBase.lat');

  @override
  String get lat {
    _$latAtom.reportRead();
    return super.lat;
  }

  @override
  set lat(String value) {
    _$latAtom.reportWrite(value, super.lat, () {
      super.lat = value;
    });
  }

  final _$lngAtom = Atom(name: '_EstablishmentFormControllerBase.lng');

  @override
  String get lng {
    _$lngAtom.reportRead();
    return super.lng;
  }

  @override
  set lng(String value) {
    _$lngAtom.reportWrite(value, super.lng, () {
      super.lng = value;
    });
  }

  final _$newEstablishmentAtom =
      Atom(name: '_EstablishmentFormControllerBase.newEstablishment');

  @override
  bool get newEstablishment {
    _$newEstablishmentAtom.reportRead();
    return super.newEstablishment;
  }

  @override
  set newEstablishment(bool value) {
    _$newEstablishmentAtom.reportWrite(value, super.newEstablishment, () {
      super.newEstablishment = value;
    });
  }

  final _$_EstablishmentFormControllerBaseActionController =
      ActionController(name: '_EstablishmentFormControllerBase');

  @override
  dynamic createNewEstablishment() {
    final _$actionInfo =
        _$_EstablishmentFormControllerBaseActionController.startAction(
            name: '_EstablishmentFormControllerBase.createNewEstablishment');
    try {
      return super.createNewEstablishment();
    } finally {
      _$_EstablishmentFormControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateStablishment({Establishment newEstablishment}) {
    final _$actionInfo =
        _$_EstablishmentFormControllerBaseActionController.startAction(
            name: '_EstablishmentFormControllerBase.updateStablishment');
    try {
      return super.updateStablishment(newEstablishment: newEstablishment);
    } finally {
      _$_EstablishmentFormControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic clear() {
    final _$actionInfo = _$_EstablishmentFormControllerBaseActionController
        .startAction(name: '_EstablishmentFormControllerBase.clear');
    try {
      return super.clear();
    } finally {
      _$_EstablishmentFormControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
lat: ${lat},
lng: ${lng},
newEstablishment: ${newEstablishment}
    ''';
  }
}

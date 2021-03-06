// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'establishments_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EstablishmentsController on _EstablishmentsControllerBase, Store {
  final _$allAtom = Atom(name: '_EstablishmentsControllerBase.all');

  @override
  List<Establishment> get all {
    _$allAtom.reportRead();
    return super.all;
  }

  @override
  set all(List<Establishment> value) {
    _$allAtom.reportWrite(value, super.all, () {
      super.all = value;
    });
  }

  final _$getListAsyncAction =
      AsyncAction('_EstablishmentsControllerBase.getList');

  @override
  Future getList() {
    return _$getListAsyncAction.run(() => super.getList());
  }

  final _$createAsyncAction =
      AsyncAction('_EstablishmentsControllerBase.create');

  @override
  Future create({Establishment establishment}) {
    return _$createAsyncAction
        .run(() => super.create(establishment: establishment));
  }

  final _$updateAsyncAction =
      AsyncAction('_EstablishmentsControllerBase.update');

  @override
  Future update({Establishment establishment}) {
    return _$updateAsyncAction
        .run(() => super.update(establishment: establishment));
  }

  final _$deleteAsyncAction =
      AsyncAction('_EstablishmentsControllerBase.delete');

  @override
  Future delete({int id}) {
    return _$deleteAsyncAction.run(() => super.delete(id: id));
  }

  final _$_EstablishmentsControllerBaseActionController =
      ActionController(name: '_EstablishmentsControllerBase');

  @override
  dynamic clear() {
    final _$actionInfo = _$_EstablishmentsControllerBaseActionController
        .startAction(name: '_EstablishmentsControllerBase.clear');
    try {
      return super.clear();
    } finally {
      _$_EstablishmentsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
all: ${all}
    ''';
  }
}

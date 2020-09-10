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

  @override
  String toString() {
    return '''
all: ${all}
    ''';
  }
}

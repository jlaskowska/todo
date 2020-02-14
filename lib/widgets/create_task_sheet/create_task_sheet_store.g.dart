// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task_sheet_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateTaskSheetStore on _CreateTaskSheetStore, Store {
  final _$titleAtom = Atom(name: '_CreateTaskSheetStore.title');

  @override
  String get title {
    _$titleAtom.context.enforceReadPolicy(_$titleAtom);
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.context.conditionallyRunInAction(() {
      super.title = value;
      _$titleAtom.reportChanged();
    }, _$titleAtom, name: '${_$titleAtom.name}_set');
  }

  final _$descriptionAtom = Atom(name: '_CreateTaskSheetStore.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$validTitleAtom = Atom(name: '_CreateTaskSheetStore.validTitle');

  @override
  bool get validTitle {
    _$validTitleAtom.context.enforceReadPolicy(_$validTitleAtom);
    _$validTitleAtom.reportObserved();
    return super.validTitle;
  }

  @override
  set validTitle(bool value) {
    _$validTitleAtom.context.conditionallyRunInAction(() {
      super.validTitle = value;
      _$validTitleAtom.reportChanged();
    }, _$validTitleAtom, name: '${_$validTitleAtom.name}_set');
  }

  final _$_CreateTaskSheetStoreActionController =
      ActionController(name: '_CreateTaskSheetStore');

  @override
  void _validateTitle(String value) {
    final _$actionInfo = _$_CreateTaskSheetStoreActionController.startAction();
    try {
      return super._validateTitle(value);
    } finally {
      _$_CreateTaskSheetStoreActionController.endAction(_$actionInfo);
    }
  }
}

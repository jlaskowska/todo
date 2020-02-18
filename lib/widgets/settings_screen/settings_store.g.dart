// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStore, Store {
  Computed<bool> _$isDarkModeComputed;

  @override
  bool get isDarkMode =>
      (_$isDarkModeComputed ??= Computed<bool>(() => super.isDarkMode)).value;
  Computed<String> _$languageComputed;

  @override
  String get language =>
      (_$languageComputed ??= Computed<String>(() => super.language)).value;

  final _$_isDarkModeAtom = Atom(name: '_SettingsStore._isDarkMode');

  @override
  bool get _isDarkMode {
    _$_isDarkModeAtom.context.enforceReadPolicy(_$_isDarkModeAtom);
    _$_isDarkModeAtom.reportObserved();
    return super._isDarkMode;
  }

  @override
  set _isDarkMode(bool value) {
    _$_isDarkModeAtom.context.conditionallyRunInAction(() {
      super._isDarkMode = value;
      _$_isDarkModeAtom.reportChanged();
    }, _$_isDarkModeAtom, name: '${_$_isDarkModeAtom.name}_set');
  }

  final _$_languageAtom = Atom(name: '_SettingsStore._language');

  @override
  String get _language {
    _$_languageAtom.context.enforceReadPolicy(_$_languageAtom);
    _$_languageAtom.reportObserved();
    return super._language;
  }

  @override
  set _language(String value) {
    _$_languageAtom.context.conditionallyRunInAction(() {
      super._language = value;
      _$_languageAtom.reportChanged();
    }, _$_languageAtom, name: '${_$_languageAtom.name}_set');
  }
}

import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  final Box _box;

  _SettingsStore(this._box) {
    _isDarkMode = _box.get('isDarkMode') ?? false;
  }

  @observable
  bool _isDarkMode;

  @computed
  bool get isDarkMode => _isDarkMode;

  set isDarkMode(bool value) {
    _isDarkMode = value;
    _box.put('isDarkMode', value);
  }
}

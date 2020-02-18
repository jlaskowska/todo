import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:todo/services/task_service.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  final Box _box = Hive.box('settings');

  _SettingsStore() {
    _isDarkMode = _box.get('isDarkMode') ?? false;
    _language = _box.get('language') ?? 'en'; //TODO choose system language
  }

  @observable
  bool _isDarkMode;

  @computed
  bool get isDarkMode => _isDarkMode;

  set isDarkMode(bool value) {
    _isDarkMode = value;
    _box.put('isDarkMode', value);
  }

  @observable
  String _language;

  @computed
  String get language => _language;

  set language(String value) {
    _language = value;
    _box.put('language', value);
  }

  void deleteAllTasks() {
    TaskService().deleteAll();
  }
}

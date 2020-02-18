import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'createTaskSheetTextFieldTitle': 'Title',
      'createTaskSheetTextFieldDescription': 'Description',
      'createTaskSheetButton': 'Create Task',
      'settingsScreenButtonDeleteAll': 'Delete All Tasks',
      'taskScreenSnackbarTaskDeleted': 'Task deleted.',
      'taskScreenTodaysTaskText': "Today's Tasks",
      'taskScreenGreetingMorning': 'Good Morning',
      'taskScreenGreetingAfternoon': 'Good Afternoon',
      'taskScreenGreetingEvening': 'Good Evening'
    },
    'de': {
      'createTaskSheetTextFieldTitle': 'Titel',
      'createTaskSheetTextFieldDescription': 'Beschreibung',
      'createTaskSheetButton': 'Aufgabe erstellen',
      'settingsScreenButtonDeleteAll': 'Alle Aufgaben Löschen',
      'taskScreenSnackbarTaskDeleted': 'Aufgabe gelöscht.',
      'taskScreenTodaysTaskText': 'Heutige Aufgaben',
      'taskScreenGreetingMorning': 'Guten Morgen',
      'taskScreenGreetingAfternoon': 'Guten Tag',
      'taskScreenGreetingEvening': 'Guten Abend'
    },
    'pl': {
      'createTaskSheetTextFieldTitle': 'Tytuł',
      'createTaskSheetTextFieldDescription': 'Opis',
      'createTaskSheetButton': 'Utwórz zadanie',
      'settingsScreenButtonDeleteAll': 'Usuń wszystko',
      'taskScreenSnackbarTaskDeleted': 'Zadanie usunięte.',
      'taskScreenTodaysTaskText': 'Zadania na dziś',
      'taskScreenGreetingMorning': 'Dzień Dobry',
      'taskScreenGreetingAfternoon': 'Dzień Dobry',
      'taskScreenGreetingEvening': 'Dobry wieczór'
    },
  };

  String get createTaskSheetTextFieldTitle {
    return _localizedValues[locale.languageCode]['createTaskSheetTextFieldTitle'];
  }

  String get createTaskSheetTextFieldDescription {
    return _localizedValues[locale.languageCode]['createTaskSheetTextFieldDescription'];
  }

  String get createTaskSheetButton {
    return _localizedValues[locale.languageCode]['createTaskSheetButton'];
  }

  String get settingsScreenButtonDeleteAll {
    return _localizedValues[locale.languageCode]['settingsScreenButtonDeleteAll'];
  }

  String get taskScreenSnackbarTaskDeleted {
    return _localizedValues[locale.languageCode]['taskScreenSnackbarTaskDeleted'];
  }

  String get taskScreenTodaysTaskText {
    return _localizedValues[locale.languageCode]['taskScreenTodaysTaskText'];
  }

  String get taskScreenGreeting {
    int hour = DateTime.now().hour;
    if (hour < 12) {
      return _localizedValues[locale.languageCode]['taskScreenGreetingMorning'];
    } else if (hour > 12 && hour < 17) {
      return _localizedValues[locale.languageCode]['taskScreenGreetingAfternoon'];
    } else {
      return _localizedValues[locale.languageCode]['taskScreenGreetingEvening'];
    }
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  static final Set<Locale> supportedLocals = {
    Locale('en'),
    Locale('de'),
    Locale('pl'),
  };

  @override
  bool isSupported(Locale locale) => supportedLocals.contains(locale);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

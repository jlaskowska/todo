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
    },
    'de': {
      'createTaskSheetTextFieldTitle': 'Titel',
      'createTaskSheetTextFieldDescription': 'Beschreibung',
      'createTaskSheetButton': 'Create Task',
    },
    'pl': {
      'createTaskSheetTextFieldTitle': 'Tytuł',
      'createTaskSheetTextFieldDescription': 'Opis',
      'createTaskSheetButton': 'Create Task',
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

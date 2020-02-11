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
      'title': 'Hello, World!',
    },
    'de': {
      'title': 'Hallo, Welt!',
    },
    'pl': {
      'title': 'Witaj, świecie!',
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
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

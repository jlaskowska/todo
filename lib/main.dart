import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:todo/localizations.dart';
import 'package:todo/widgets/home_screen.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:todo/widgets/settings_screen/settings_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize hive
  final applicationDocumentsDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(applicationDocumentsDirectory.path);

  // open hive boxes
  await Hive.openBox('settings');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsStore = SettingsStore();

    return MultiProvider(
      providers: [
        Provider.value(value: settingsStore),
      ],
      child: Observer(
        builder: (_) => MaterialApp(
          theme: settingsStore.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          localizationsDelegates: [
            const AppLocalizationsDelegate(),
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizationsDelegate.supportedLocals,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
